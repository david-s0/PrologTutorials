%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Module 518 Logic and AI Programming
%% trade.pl - provided file for Tutorial 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sells(usa, grain, mexico).
sells(S, P, R) :- 
  produces(S, P), 
  needs(R, P).
  
produces(oman, oil).
produces(iraq, oil).
produces(japan, cameras).
produces(germany, pork).
produces(france, wine).

needs(britain, cars).
needs(japan, cars).
needs(france, pork).
needs(southAfrica, cameras).
needs(C, oil) :-
  needs(C, cars).
needs(britain, coal).
needs(japan, coal).
needs(holland, diamonds).
needs(japan, diamonds).

bilateral_traders(X, Y) :-
	sells(X, _, Y),
	sells(Y, _, Y),
	(X \== Y).

nat_res(southAfrica, diamonds).
nat_res(britain, coal).
nat_res(germany, coal).

ce(germany, coal).
ce(southAfrica, diamonds).

mines(C, I) :-
	nat_res(C, I),
	ce(C, I).

exports(C1, I, C2) :-
	produces(C1, I),
	needs(C2, I).
exports(C1, I, C2) :-
	mines(C1, I),
	needs(C2, I).

in_competition(C1,C2,I) :-
	exports(C1, I, _),
	exports(C2, I, _),
	(C1 \== C2).

lower_price(I) :-
	in_competition(_, _, I).