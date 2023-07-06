pway(a, b, 10).
pway(b, c, 15).
pway(d, c, 5).
pway(d, b, 10).

connected(X, Y, N) :- pway(X, Y, N).
connected(X, Y, N) :- pway(Y, X, N).

solve(Y, X, P, N) :- solve2(X, Y, [X], 0, P, N).
solve2(X, X, Visitado, Tamanho, Visitado, Tamanho). 
solve2(X, Y, Visitado, Tamanho, P, N) :-
    connected(X, A, Distancia),                     
    \+ member(A, Visitado),                         
    TamanhoTotal is Tamanho + Distancia,           
    solve2(A, Y, [A|Visitado], TamanhoTotal, P, N). 