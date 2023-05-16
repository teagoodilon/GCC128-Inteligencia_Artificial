parent(carl, john).
parent(mary, john).
parent(john, lisa).
parent(susan, lisa).
parent(joe, carl).
parent(gertie, carl).
parent(joe, allan).
parent(allan, mike).
parent(judith, joe).
male(carl).
male(john).
male(joe).
male(allan).
female(mary).
female(lisa).
female(susan).
female(judith).

grandparent(X, Y) :- parent(X, A),  parent(A, Y). % se X for pai/mae de A e A for pai/mae de Y
grandfather(X, Y) :- parent(X, A), parent(A, Y), male(X). % se X for pai de A e A for pai/mae de Y
grandmother(X, Y) :- parent(X, A), parent(A, Y), female(X). % se X for mae de A e A for pai/mae de Y
mother(X, Y) :- parent(X,Y), female(X). % se X for mae de Y e X for mulher
father(X, Y) :- parent(X,Y), male(X). % se X for pai de Y e X for homem
sibling(X, Y) :- parent(A, X), parent(A, Y), X \= Y. % se A for pai/mae de X e Y e X != Y
uncle(X, Y) :- parent(A, Y), sibling(A, X), male(X). % se A for pai/mae de Y, A for irmao de X e ser homem
aint(X, Y) :- parent(A, Y), sibling(A, X), female(X).% se A for pai/mae de Y, A for irmao de X e ser mulher

ancestor(X, Y) :- parent(X, Y). % caso base
ancestor(X, Y) :- parent(X, A), ancestor(A, Y). % caso base