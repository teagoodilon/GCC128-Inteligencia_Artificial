comprimento([], 0).
comprimento([_|Tail], C) :-
  comprimento(Tail, C1),
  C is C1 + 1.

inserir(Lista, Elem,[Elem|Lista]).

concatena([], Lista, Lista) :- !.
concatena([H1|T1], Lista2, [H1|T2]) :-
  concatena(T1, Lista2, T2).

enesimo([X|_], 1, X) :- !.
enesimo([_|Tail], N, X) :-
  N1 is N - 1,
  enesimo(Tail, N1, X).

somatorio([], 0) :- !.
somatorio([Head|Tail], X) :-
  somatorio(Tail, XP),
  X is Head + XP.

substitui([], _, _, []) :- !.
substitui([Atual|T1], Atual, Sub, [Sub|T2]) :- !,
  substitui(T1, Atual, Sub, T2).
substitui([H1|T1], Atual, Sub, [H1|T2]) :-
  substitui(T1, Atual, Sub, T2).