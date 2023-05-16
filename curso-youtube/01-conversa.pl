fala(maria, espanhol).
fala(joao, ingles).
fala(joao, espanhol).
fala(jose, ingles).

conversa(X, Y) :- fala(X, L), fala(Y, L), X \= Y.