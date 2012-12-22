%known gates
andgate(g3).
andgate(g4).
orgate(g5).
xorgate(g1).
xorgate(g2).

%known relationships
%g1
input1(g1, 1).
input2(g1, 0).
%g2
input1(g2, I1) :-
	output(g1, I1).
input2(g2, 1).
%g3
input1(g3, 1).
input2(g3, I2) :-
	output(g1, I2).
%g4
input1(g4, 1).
input2(g4, 0).
%g5
input1(g5, I1) :-
	output(g3, I1).
input2(g5, I2) :-
	output(g4, I2).

%output for XOR gates
%true if one of the inputs is true
output(G, 1) :-
	input1(G, 1),
	input2(G, 0),
	xorgate(G).
output(G, 1) :-
	input1(G, 0),
	input2(G, 1),
	xorgate(G).
%not true if both are
output(G, 0) :-
	input1(G, 1),
	input2(G, 1),
	xorgate(G).
output(G, 0) :-
	input1(G, 0),
	input2(G, 0),
	xorgate(G).

%output for AND gates
%true if both inputs are true
output(G, 1) :-
	input1(G, 1),
	input2(G, 1),
	andgate(G).
%false otherwise
output(G, 0) :-
	input1(G, 1),
	input2(G, 0),
	andgate(G).
output(G, 0) :-
	input1(G, 0),
	input2(G, 1),
	andgate(G).
output(G, 0) :-
	input1(G, 0),
	input2(G, 0),
	andgate(G).

%output for OR gates
%false if both inputs are false
output(G, 0) :-
	input1(G, 0),
	input2(G, 0),
	orgate(G).
%true otherwise
output(G, 1) :-
	input1(G, 1),
	input2(G, 0),
	orgate(G).
output(G, 1) :-
	input1(G, 0),
	input2(G, 1),
	orgate(G).
output(G, 1) :-
	input1(G, 1),
	input2(G, 1),
	orgate(G).