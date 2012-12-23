%unfortunately I still remember the solution quite well, a bit too easy
%1
%mysort
%after a quicksort attempt (almost there...) I remembered this can be done just using setof...
mysort(L, SL) :-
	setof(Element, member(Element, L), SL).

%rev
rev([], []).
rev([H|L], RevL) :-
	rev(L, RevLTail), append(RevLTail, [H], RevL).

%followedBy
followedBy(X, Y, L) :-
	\+member(X, L),
	fail.
followedBy(X, Y, L) :-
	\+member(Y, L),
	fail.
followedBy(X, Y, []) :-
	fail.
followedBy(X, Y, [H|T]) :-
	X \== H,
	followedBy(X, Y, T).
followedBy(X, Y, [H1, H2|T]) :-
	  (X == H1),
	  (Y == H2).

%nextTo
nextTo(X,Y,L) :-
	append(_, [X, Y|_], L).
nextTo(X, Y, L) :-
	append(_, [Y, X|_], L).

%sumList
sumList([], 0).
sumList([H|L], S) :-
	sumList(L, S1),
	S is (S1 + H).

%2
last(H, [H|[]]).
last(E, [H|L]) :-
	last(E, L).

%3
%a
edge(a, b).
edge(a, e).
edge(b, c).
edge(e, f).
edge(f, c).
edge(c, d).
edge(f, d).

%b
%WHY DID I NOT USE EDGE BETTER???????????????? The whole comparison thing could have been avoided.
path(X, Y) :-
	X == Y.
path(X, Y) :-
	X \== Y,
	edge(X, Z),
	path(Z, Y).

%c
path(X, Y, [X, Y]) :-
	edge(X, Y).
path(X, Y, [X|P]) :-
	path(X, Y),
	edge(X, Z),
	path(Z, Y, P).

%4
max(E, [E]).
max(E, [H1, H2|T]) :-
	H1 >= H2,
	max(E, [H1|T]).
max(E, [H1, H2|T]) :-
	H1 =< H2,
	max(E, [H2|T]).

%5
%I should have probably created a different predicate instead of overloading max_of_all, the program would have been clearer
%base case
max_of_all(E, [], E).
%one list left
max_of_all(E, [H|[]], E) :-
	max(Max, H),
	max(RealMax, [Max, E]),
	max_of_all(RealMax, [], E).
%many lists
max_of_all(E, [H1, H2|Ls]) :-
	max(E1, H1),
	max(E2, H2),
	max(E3, [E1, E2]),
	max_of_all(E3, Ls, E).