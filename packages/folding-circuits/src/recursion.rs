use std::{
    collections::HashMap,
    env::current_dir,
    fs::File,
    io::{BufReader, BufWriter, Write},
    time::Instant,
};

use serde::{Deserialize, Serialize};


use ff::PrimeField;
use nova_scotia::{
    circom::reader::load_r1cs, create_public_params, create_recursive_circuit, FileLocation, F1,
    G2, S1, S2
};
use nova_snark::{traits::Group, CompressedSNARK, provider, PublicParams};
use serde_json::{from_reader, Value};

#[derive(Serialize, Deserialize)]
#[allow(non_snake_case)]
struct EffSig {
    start_pub_input: [String; 10],
}
pub fn main() {
    // type G1 = provider::bn256_grumpkin::bn256::Point;
    // type G2 = provider::bn256_grumpkin::grumpkin::Point;
    
    let iteration_count = 5;
    let root = current_dir().unwrap();
    println!("root: {:?}", root);

    let x = 30;
    let y = 30;
    let n_filters = 2;
    let sigs: EffSig = serde_json::from_str(include_str!("/Users/rishabh/projects/blockchain/ephemeral_ZK_L3s/packages/folding-circuits/src/batch.json"))
    .unwrap();

    // let mut start_public_input = [F1::from_str_vartime("0").unwrap(), F1::from_str_vartime("0").unwrap(), F1::from_str_vartime("0").unwrap()];
    let start_public_input = vec![
        F1::from_str_vartime(&sigs.start_pub_input[0]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[1]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[2]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[3]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[4]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[5]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[6]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[7]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[8]).unwrap(),
        F1::from_str_vartime(&sigs.start_pub_input[9]).unwrap(),
    ];
    // for _i in 0..(x * y * n_filters) {
    //     start_public_input.push(F1::from_str_vartime("0").unwrap());
    // }
    // println!("start_public_input: {:?}", start_public_input);
//     let circuit_filepath = format!("packages/folding-circuits/circuits/circuit.r1cs", group_name);
//     for witness_gen_filepath in [
//         format!("packages/folding-circuits/circuits/circuit_cpp/circuit", group_name),
//         format!("packages/folding-circuits/circuits/circuit_js/circuit.wasm", group_name),
//     ] {
    // let circuit_file = root.join("./src/recursion_test.r1cs");
    let circuit_file = root.join("./circuits/circuit.r1cs");
    let r1cs = load_r1cs(&FileLocation::PathBuf(circuit_file));
    let witness_generator_wasm = root.join("./circuits/circuit_js/circuit.wasm");

    let json_filename = root.join("src/input.json");
    let json_file = File::open(json_filename).unwrap();
    let json_reader = BufReader::new(json_file);
    let json: HashMap<String, Value> = from_reader(json_reader).unwrap();
    println!("json: {:?}", json);

    // // println!("json: {:?}", json);

    let mut private_inputs = Vec::new();
    for _i in 0..iteration_count {
        private_inputs.push(json.clone());
    }

    let start = Instant::now();
    let pp = create_public_params(r1cs.clone());

    println!("PublicParams creation took {:?}", start.elapsed());

    println!(
        "Number of constraints per step (primary circuit): {}",
        pp.num_constraints().0
    );
    println!(
        "Number of constraints per step (secondary circuit): {}",
        pp.num_constraints().1
    );

    println!(
        "Number of variables per step (primary circuit): {}",
        pp.num_variables().0
    );
    println!(
        "Number of variables per step (secondary circuit): {}",
        pp.num_variables().1
    );

    println!("Creating a RecursiveSNARK...");
    let start = Instant::now();
    let recursive_snark = create_recursive_circuit(
        FileLocation::PathBuf(witness_generator_wasm),
        r1cs,
        private_inputs,
        start_public_input.to_vec(),
        &pp,
    )
    .unwrap();
    println!("RecursiveSNARK creation took {:?}", start.elapsed());

    // TODO: empty?
    let z0_secondary = vec![<G2 as Group>::Scalar::zero()];

    // verify the recursive SNARK
    println!("Verifying a RecursiveSNARK...");
    // println!("z0_primary: {:?}", start_public_input);
    // println!("z0_secondary: {:?}", z0_secondary);
    let start = Instant::now();
    let res = recursive_snark.verify(
        &pp,
        iteration_count,
        start_public_input.to_vec(),
        z0_secondary.clone(),
    );
    println!(
        "RecursiveSNARK::verify: {:?}, took {:?}",
        res.is_ok(),
        start.elapsed()
    );
    assert!(res.is_ok());

    // let result = res.unwrap().0;
    // // println!("result: {:?}", result);

    // // check output
    // let out_filename = root.join("src/conv2d/output.json");
    // let out_file = File::open(out_filename).unwrap();
    // let out_reader = BufReader::new(out_file);
    // let out_json: Vec<Value> = from_reader(out_reader).unwrap();
    // // println!("out_json: {:?}", out_json);

    // for _i in 0..(x * y * n_filters) {
    //     // println!("out_json: {:?}", out_json[_i]);
    //     let out_num = out_json[_i].as_i64().unwrap();
    //     let out;
    //     if out_num < 0 {
    //         let out_str = (-out_num).to_string();
    //         let zero = F1::from(0);
    //         out = zero.sub(&F1::from_str_vartime(&out_str).unwrap());
    //     } else {
    //         let out_str = out_num.to_string();
    //         out = F1::from_str_vartime(&out_str).unwrap();
    //     }
    //     let mut diff = out.sub(&result[_i]).to_repr();
    //     if diff[31] > 0 {
    //         diff = result[_i].sub(&out).to_repr();
    //     }
    //     // println!("diff: {:?}", diff);
    //     for _i in 0..diff.len() {
    //         if _i > 1 {
    //             assert_eq!(diff[_i], 0);
    //         }
    //     }
    // }

    // // write results to file
    // let result_filename = root.join("src/conv2d/result.json");
    // let result_file = File::create(result_filename).unwrap();
    // let mut writer = BufWriter::new(result_file);
    // serde_json::to_writer(&mut writer, &result).unwrap();
    // writer.flush().unwrap();

    // // produce a compressed SNARK
    // println!("Generating a CompressedSNARK using Spartan with IPA-PC...");
    // let start = Instant::now();
    // let (pk, vk) = CompressedSNARK::<_, _, _, _, S1, S2>::setup(&pp).unwrap();
    // let res = CompressedSNARK::<_, _, _, _, S1, S2>::prove(&pp, &pk, &recursive_snark);
    // println!(
    //     "CompressedSNARK::prove: {:?}, took {:?}",
    //     res.is_ok(),
    //     start.elapsed()
    // );
    // assert!(res.is_ok());
    // let compressed_snark = res.unwrap();

    // // verify the compressed SNARK
    // println!("Verifying a CompressedSNARK...");
    // // println!("z0_primary: {:?}", start_public_input);
    // // println!("z0_secondary: {:?}", z0_secondary);
    // let start = Instant::now();
    // let res = compressed_snark.verify(
    //     &vk,
    //     iteration_count,
    //     start_public_input.clone(),
    //     z0_secondary,
    // );
    // println!(
    //     "CompressedSNARK::verify: {:?}, took {:?}",
    //     res.is_ok(),
    //     start.elapsed()
    // );
    // assert!(res.is_ok());
}

// fn main() {
//     let group_name = "pasta";

//     let circuit_filepath = format!("packages/folding-circuits/circuits/circuit.r1cs", group_name);
//     for witness_gen_filepath in [
//         format!("packages/folding-circuits/circuits/circuit_cpp/circuit", group_name),
//         format!("packages/folding-circuits/circuits/circuit_js/circuit.wasm", group_name),
//     ] {
//         run_test(circuit_filepath.clone(), witness_gen_filepath);
//     }
// }