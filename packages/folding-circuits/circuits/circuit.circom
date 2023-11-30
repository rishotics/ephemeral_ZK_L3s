pragma circom 2.0.0;

include "../../../node_modules/circomlib/circuits/comparators.circom";
include "./eff_ecdsa_membership/eff_ecdsa_to_addr.circom";
// This circuit returns the sum of the inputs.
// n must be greater than 0.
template CalculateTotal(n) {
    signal input nums[n];
    signal output sum;

    signal sums[n];
    sums[0] <== nums[0];

    for (var i=1; i < n; i++) {
        sums[i] <== sums[i - 1] + nums[i];
    }

    sum <== sums[n - 1];
}

template SafeLessThan(n) {
    assert(n <= 252);
    signal input in[2];
    signal output out;

    component n2b1 = Num2Bits(n);
    n2b1.in  <== in[0];
    component n2b2 = Num2Bits(n);
    n2b2.in  <== in[1];

    component n2b = Num2Bits(n+1);

    n2b.in <== in[0]+ (1<<n) - in[1];

    out <== 1-n2b.out[n];
}
/*
 * Given a list of items and an index, output the item at the position denoted
 * by the index. The number of items must be less than 8, and the index must
 * be less than the number of items.
 */
template QuinSelector(choices) {
    signal input in[choices];
    signal input index;
    signal output out;
    
    // Ensure that index < choices
    component lessThan = SafeLessThan(3);
    lessThan.in[0] <== index;
    lessThan.in[1] <== choices;
    lessThan.out === 1;

    component calcTotal = CalculateTotal(choices);
    component eqs[choices];

    // For each item, check whether its index equals the input index.
    for (var i = 0; i < choices; i ++) {
        eqs[i] = IsEqual();
        eqs[i].in[0] <== i;
        eqs[i].in[1] <== index;

        // eqs[i].out is 1 if the index matches. As such, at most one input to
        // calcTotal is not 0.
        calcTotal.nums[i] <== eqs[i].out * in[i];
    }

    // Returns 0 + 0 + ... + item
    out <== calcTotal.sum;
}


template Main(nTurns){

    // private_inputs:
    // numbers_chosen_by_A : vec [ ],
    // numbers_guessed_by_B : vec [ ],

    signal input step_in[3]; //state of the game [counter, times A won, times B won]

    signal output step_out[3];

    signal input numbers_chosen_by_A[nTurns];
    signal input numbers_guessed_by_B[nTurns];

    signal input s;
    signal input Tx;
    signal input Ty;
    signal input Ux;
    signal input Uy;
    // signal input addr_B;

    // signal input signatures_B[nTurns];
    // signal input public_key_B;

    component checkEqual = IsEqual();

    component quin[2];
    
    quin[0] = QuinSelector(nTurns);
    for(var j=0; j<nTurns; j++){
        quin[0].in[j] <== numbers_chosen_by_A[j];
    }
    quin[0].index <== step_in[0];

    quin[1] = QuinSelector(nTurns);
    for(var j=0; j<nTurns; j++){
        quin[1].in[j] <== numbers_guessed_by_B[j];
    }
    quin[1].index <== step_in[0];
    

    checkEqual.in[0] <== quin[0].out;
    checkEqual.in[1] <== quin[1].out;

    component sig = EfficientECDSA();

    sig.s <== s;
    sig.Tx <== Tx;
    sig.Ty <== Ty;
    sig.Ux <==  Ux;
    sig.Uy <== Uy;

    // addr_B === sig.addr;

    step_out[0] <== step_in[0] + 1;
    step_out[1] <== step_in[1] - checkEqual.out + 1; 
    step_out[2] <== step_in[2] + checkEqual.out; 

}

component main { public [step_in] } = Main(5);

// template Example () {
//     signal input step_in[2];

//     signal output step_out[2];

//     signal input adder;

//     step_out[0] <== step_in[0] + adder;
//     step_out[1] <== step_in[0] + step_in[1];
// }

// component main { public [step_in] } = Example();