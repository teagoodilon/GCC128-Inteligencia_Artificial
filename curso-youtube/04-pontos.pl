position(a, 5, 5).
position(b, 7, 5).
position(c, 2, 3).
position(d, 1, 1).
position(e, 6, 5).
position(f, 12, 7).
position(g, 8, 4).
position(h, 5, 6).
position(i, 10, 9).

distance(J, K, D) :-
  position(J, Xj, Yj),
  position(K, Xk, Yk),
  D is sqrt((Xj-Xk)**2 + (Yj-Yk)**2).