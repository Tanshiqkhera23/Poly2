pragma circom 2.0.0;

template Circuit () {
    signal input a;
    signal input b;

    signal x;
    signal y;
    signal output q;
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();
    andGate.a <== a;
    andGate.b <== b;
    x <== andGate.out;

    notGate.in <== b;
    y <== notGate.out;

    orGate.c <== x;
    orGate.d <== y;
    q <== orGate.out;
}

template AND() {

    signal input x;
    signal input y;
    signal output out;

    // AND gate
    out <== x * y;
}

template NOT() {
    signal input in;
    signal output out;

    // NOT gate 
    out <== 1 + in - 2 * in;
}

template OR() {
    signal input x;
    signal input y;
    signal output out;

    // OR gate 
    out <== x + y - x * y;
}

component main = Circuit();
