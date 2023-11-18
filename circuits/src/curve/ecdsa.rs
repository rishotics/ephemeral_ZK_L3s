use plonky2::field::types::{Field, Sample};
use serde::{Deserialize, Serialize};
use std::str::FromStr;
use crate::curve::curve_msm::msm_parallel;
use crate::curve::curve_types::{base_to_scalar, AffinePoint, Curve, CurveScalar};

#[derive(Copy, Clone, Debug, Deserialize, Eq, Hash, PartialEq, Serialize)]
pub struct ECDSASignature<C: Curve> {
    pub r: C::ScalarField,
    pub s: C::ScalarField,
}

#[derive(Copy, Clone, Debug, Deserialize, Eq, Hash, PartialEq, Serialize)]
pub struct ECDSASecretKey<C: Curve>(pub C::ScalarField);

impl<C: Curve> ECDSASecretKey<C> {
    pub fn to_public(&self) -> ECDSAPublicKey<C> {
        ECDSAPublicKey((CurveScalar(self.0) * C::GENERATOR_PROJECTIVE).to_affine())
    }
}

#[derive(Copy, Clone, Debug, Deserialize, Eq, Hash, PartialEq, Serialize)]
pub struct ECDSAPublicKey<C: Curve>(pub AffinePoint<C>);

pub fn sign_message<C: Curve>(msg: C::ScalarField, sk: ECDSASecretKey<C>) -> ECDSASignature<C> {
    let (k, rr) = {
        let mut k = C::ScalarField::rand();
        let mut rr = (CurveScalar(k) * C::GENERATOR_PROJECTIVE).to_affine();
        while rr.x == C::BaseField::ZERO {
            k = C::ScalarField::rand();
            rr = (CurveScalar(k) * C::GENERATOR_PROJECTIVE).to_affine();
        }
        (k, rr)
    };
    let r = base_to_scalar::<C>(rr.x);

    let s = k.inverse() * (msg + r * sk.0);

    ECDSASignature { r, s }
}

pub fn verify_message<C: Curve>(
    msg: C::ScalarField,
    sig: ECDSASignature<C>,
    pk: ECDSAPublicKey<C>,
) -> bool {
    let ECDSASignature { r, s } = sig;

    assert!(pk.0.is_valid());

    let c = s.inverse();
    let u1 = msg * c;
    let u2 = r * c;

    let g = C::GENERATOR_PROJECTIVE;
    let w = 5; // Experimentally fastest
    let point_proj = msm_parallel(&[u1, u2], &[g, pk.0.to_projective()], w);
    let point = point_proj.to_affine();

    let x = base_to_scalar::<C>(point.x);
    r == x
}

#[cfg(test)]
mod tests {
    use std::str::FromStr;

    use num::{BigUint, Num};
    use plonky2::field::secp256k1_base::Secp256K1Base;
    use plonky2::field::secp256k1_scalar::Secp256K1Scalar;
    use plonky2::field::types::{Sample, Field};

    use crate::curve::curve_types::{Curve, AffinePoint};
    use crate::curve::ecdsa::{sign_message, verify_message, ECDSASecretKey, ECDSASignature, ECDSAPublicKey};
    use crate::curve::secp256k1::Secp256K1;

    #[test]
    fn test_ecdsa_native() {
        type C = Secp256K1;

        let msg_ = BigUint::from_str_radix("06bc8aa481ac0a28fc084d3649be7d745c2eb0d57842409c51c3dd2c11d22e02", 16).unwrap();
        let msg = Secp256K1Scalar::from_noncanonical_biguint(msg_);

        let pk_hex = "048318535b54105d4a7aae60c08fc45f9687181b4fdfc625bd1a753fa7397fed753547f11ca8696646f2f3acb08e31016afac23e630c5d11f59f61fef57b0d2aa5";
        let x = &pk_hex[2..66];
        let y = &pk_hex[66..];


        let x_bu = BigUint::from_str_radix(&x, 16).unwrap();
        let y_bu = BigUint::from_str_radix(&y, 16).unwrap();

        let pk_point = AffinePoint::<C>{
            x: Secp256K1Base::from_noncanonical_biguint(x_bu),
            y: Secp256K1Base::from_noncanonical_biguint(y_bu),
            zero: false
        };
        let pk = ECDSAPublicKey(pk_point);
        
        let sig_hex = "4d88432ba123c71e0c3e267050d611d430441709ff3a7cd8717d902541f4fb215f1b010d813ee5e78fc4e2cb28616ce0fbd594ea5d5154332c3a658cda8bac3c1c";
        let eth_signature_bytes = hex::decode(sig_hex).expect("Invalid hexadecimal signature");
        let r_bytes = &eth_signature_bytes[0..32];
        let s_bytes = &eth_signature_bytes[32..64];
        let r = BigUint::from_bytes_be(r_bytes);
        let s = BigUint::from_bytes_be(s_bytes);
        let sig_ = ECDSASignature::<Secp256K1>{
            r: Secp256K1Scalar::from_noncanonical_biguint(r),
            s: Secp256K1Scalar::from_noncanonical_biguint(s)
        };

        let result = verify_message(msg, sig_, pk);
        assert!(result);
    }
}
