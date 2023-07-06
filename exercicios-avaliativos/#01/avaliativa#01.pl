% Predicado caso eles já estejam conectados e vice-versa
connected(X, Y, N) :- pway(X, Y, N).
connected(X, Y, N) :- pway(Y, X, N).

solve(Y, X, P, N) :- solve2(X, Y, [X], 0, P, N).
solve2(X, X, Visited, Lenght, Visited, Lenght).         % Caso base
solve2(X, Y, Visited, Lenght, P, N) :-
    connected(X, A, Distance),                          % Encontra uma passagem de X para A com determinada Distancia
    visited(A, Visited),                                % O visited faz faz a pesquisa evitando se o A já foi visitado
    LenghtAll is Lenght + Distance,                     % Aumenta o comprimento acumulado
    solve2(A, Y, [A|Visited], LenghtAll, P, N).         % Chame recursivamente solve com A fazendo a prox busca

visited(_, []).
visited(A, [C|R]) :-
    A \= C,
    visited(A, R).

% Predicado para ordenar os caminhos pelo menor ao maior
solve_order(X, Y, Path) :-
    bagof([P, N], solve(X, Y, P, N ), AllPaths),       % Predicado que irá pegar todas as soluções possíveis
    paths(AllPaths, Path).                             % Predicado auxiliar que será usado para pegar todas soluções possíveis, 
                                                       % ordená-las e colocar na variável TodosCaminhos  
paths(Path, PathsOrd) :-
    map_list_to_pairs(length_path, Path, Pairs),       % Predicado que irá mapear a lista de pares (chaves-valor) e guardalas em Pares
    sort(Pairs, PairsOrd),                             % Predicado que irá ordenar os pares do menor elemento ao maior elemento
    pairs_values(PairsOrd, PathsOrd).                  % Predicado que irá extrair os resultados ordenados

length_path([_, N], N).                                % Predicado que irá imprimir na tela os valores