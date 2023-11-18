use num::{BigUint, Num};
use plonky2::{plonk::{config::{PoseidonGoldilocksConfig, GenericConfig, self, Hasher}, circuit_builder::CircuitBuilder, circuit_data::CircuitConfig}, iop::{witness::{PartialWitness, WitnessWrite}, target::Target}, field::{secp256k1_scalar::Secp256K1Scalar, types::{Sample, Field}, secp256k1_base::Secp256K1Base, extension::Extendable, goldilocks_field::GoldilocksField}, hash::{hash_types::{RichField, HashOutTarget, HashOut}, keccak::{self, KeccakHash}, poseidon::{self, PoseidonHash}, hashing::{hash_n_to_m_no_pad, hash_n_to_hash_no_pad}}};
use plonky2_ecdsa::{curve::{secp256k1::Secp256K1, ecdsa::{ECDSASecretKey, ECDSAPublicKey, sign_message, ECDSASignature}, curve_types::{CurveScalar, AffinePoint}}, gadgets::{nonnative::CircuitBuilderNonNative, ecdsa::{ECDSAPublicKeyTarget, ECDSASignatureTarget, verify_message_circuit}, curve::CircuitBuilderCurve, biguint::CircuitBuilderBiguint}};
use plonky2_u32::witness::WitnessU32;
use std::{str::FromStr, time::Instant};


pub fn secp256k1Verification() {
    const D: usize = 2;
    type C = PoseidonGoldilocksConfig;
    type F = <C as GenericConfig<D>>::F;

    type Curve = Secp256K1;

    // hex values from server
    let msg_ = BigUint::from_str_radix("06bc8aa481ac0a28fc084d3649be7d745c2eb0d57842409c51c3dd2c11d22e02", 16).unwrap();
    let sig_hex = "4d88432ba123c71e0c3e267050d611d430441709ff3a7cd8717d902541f4fb215f1b010d813ee5e78fc4e2cb28616ce0fbd594ea5d5154332c3a658cda8bac3c1c";
    let pk_hex = "048318535b54105d4a7aae60c08fc45f9687181b4fdfc625bd1a753fa7397fed753547f11ca8696646f2f3acb08e31016afac23e630c5d11f59f61fef57b0d2aa5";

    // Construct message (hash of actual msg)
    let msg = Secp256K1Scalar::from_noncanonical_biguint(msg_);

    // Construct public key
    let x = &pk_hex[2..66];
    let y = &pk_hex[66..];


    let x_bu = BigUint::from_str_radix(&x, 16).unwrap();
    let y_bu = BigUint::from_str_radix(&y, 16).unwrap();

    let pk_point = AffinePoint::<Curve>{
        x: Secp256K1Base::from_noncanonical_biguint(x_bu),
        y: Secp256K1Base::from_noncanonical_biguint(y_bu),
        zero: false
    };
    let pk = ECDSAPublicKey(pk_point);

    // Construct signature
    let eth_signature_bytes = hex::decode(sig_hex).expect("Invalid hexadecimal signature");
    let r_bytes = &eth_signature_bytes[0..32];
    let s_bytes = &eth_signature_bytes[32..64];
    let r = BigUint::from_bytes_be(r_bytes);
    let s = BigUint::from_bytes_be(s_bytes);
    let sig_ = ECDSASignature::<Secp256K1>{
        r: Secp256K1Scalar::from_noncanonical_biguint(r),
        s: Secp256K1Scalar::from_noncanonical_biguint(s)
    };

    let config = CircuitConfig::standard_ecc_config();

    let pw = PartialWitness::new();
    let mut builder = CircuitBuilder::<F, D>::new(config);

    let msg_target = builder.constant_nonnative(msg);

    let pk_target = ECDSAPublicKeyTarget(builder.constant_affine_point(pk.0));

    let ECDSASignature { r, s } = sig_;
    let r_target = builder.constant_nonnative(r);
    let s_target = builder.constant_nonnative(s);
    let sig_target = ECDSASignatureTarget {
        r: r_target,
        s: s_target,
    };

    verify_message_circuit(&mut builder, msg_target, sig_target, pk_target);

    dbg!(builder.num_gates());
    println!("--- Starting ---");
    let mut s0 = Instant::now();
    let data = builder.build::<C>();
    println!("Time taken to build the circuit {:?}", s0.elapsed());
    s0 = Instant::now();
    let proof = data.prove(pw).unwrap();
    println!("Time taken to generate proof {:?}", s0.elapsed());
    data.verify(proof);
}

pub struct GameTargets {
    playerA_choices: Vec<Target>,
    playerB_choices: Vec<Target>,
    playerA_hash_ip: HashOutTarget,
    playerB_hash_ip: HashOutTarget
}

pub fn make_game_circuit<F: RichField + Extendable<D>, const D: usize>(
    builder: &mut CircuitBuilder<F, D>,
    rounds: usize,
) -> GameTargets {
    let mut playerA_choices: Vec<Target> = Vec::new();
    let mut playerB_choices: Vec<Target> = Vec::new();

    for i in 0..rounds {
        playerA_choices.push(builder.add_virtual_target());
        playerB_choices.push(builder.add_virtual_target());
    }

    let mut playerA_hash_ip: HashOutTarget = builder.add_virtual_hash();
    let mut playerB_hash_ip: HashOutTarget = builder.add_virtual_hash();

    builder.register_public_inputs(&playerA_hash_ip.elements);
    builder.register_public_inputs(&playerB_hash_ip.elements);

    let mut playerA_hash = builder.hash_n_to_hash_no_pad::<PoseidonHash>(playerA_choices.clone());
    let mut playerB_hash = builder.hash_n_to_hash_no_pad::<PoseidonHash>(playerB_choices.clone());

    // Skipping Hash Verification for now
    // builder.connect_hashes(playerA_hash_ip, playerA_hash);
    // builder.connect_hashes(playerB_hash_ip, playerB_hash);


    let mut result = builder.zero();
    for i in 0..rounds {
        let x = builder.is_equal(playerA_choices[i], playerB_choices[i]);
        result = builder.add(result, x.target);
    }

    let mut A_won = builder.zero();
    for i in 0..rounds/2 {
        let i_ = builder.constant(F::from_canonical_usize(i));
        let x = builder.is_equal(result, i_);
        builder.add(A_won, x.target);
    }
    builder.assert_zero(A_won);
    GameTargets { 
        playerA_choices,
        playerB_choices,
        playerA_hash_ip,
        playerB_hash_ip
     }
}

pub fn fill_circuits<F: RichField + Extendable<D>, const D: usize>(
    pw: &mut PartialWitness<F>,
    num_rounds: usize,
    playerA_choices: Vec<u32>,
    playerB_choices: Vec<u32>,
    playerA_hash_ip: HashOut<F>,
    playerB_hash_ip: HashOut<F>,
    targets: &GameTargets
){
    let GameTargets {
        playerA_choices: playerA_targets,
        playerB_choices: playerB_targets,
        playerA_hash_ip: HashOutATarget,
        playerB_hash_ip: HashOutBTarget
    } = targets;
    println!("a:{:?}", playerA_choices);
    println!("b:{:?}", playerB_choices);
    for i in 0..num_rounds {
        pw.set_target(playerA_targets[i], F::from_canonical_u32(playerA_choices[i]));
        pw.set_target(playerB_targets[i], F::from_canonical_u32(playerB_choices[i]));
    }
    pw.set_hash_target(HashOutATarget.clone(), playerA_hash_ip);
    pw.set_hash_target(HashOutBTarget.clone(), playerA_hash_ip);
}

pub fn main() {
    const D: usize = 2;
    type C = PoseidonGoldilocksConfig;
    type F = <C as GenericConfig<D>>::F;
    let mut builder = CircuitBuilder::<F, D>::new(CircuitConfig::wide_ecc_config());
    let num_rounds = 10;

    let targets = make_game_circuit(&mut builder, num_rounds);
    let mut pw = PartialWitness::<F>::new();

    let playerA_choices = Vec::from([1,2,3,4,5,6,7,8,9,10]);
    let playerB_choices = Vec::from([1,2,3,4,5,6,7,4,4,4]);

    let playerA_hash_ip = HashOut::<GoldilocksField>::rand();
    let playerB_hash_ip = HashOut::<GoldilocksField>::rand();

    fill_circuits::<F,D>(&mut pw, num_rounds, playerA_choices, playerB_choices, playerA_hash_ip, playerB_hash_ip, &targets);

    let data = builder.build::<C>();
    let proof = data.prove(pw).unwrap();
    data.verify(proof.clone()).expect("verify error");
}