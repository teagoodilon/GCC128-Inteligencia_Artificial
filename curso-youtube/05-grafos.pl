conectado(a, b, 2).
conectado(a, c, 3).
conectado(c, d, 1).
conectado(a, d, 7).
conectado(d, b, 5).

caminho(X, Y, P) :- conectado(X, Y, P).
caminho(X, Y, P) :-
  conectado(X, A, P1),
  caminho(A, Y, P2),
  P is P1+P2.