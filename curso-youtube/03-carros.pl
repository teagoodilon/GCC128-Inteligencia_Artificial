speed(ford, 100).
speed(chevy, 105).
speed(dodge, 95).
speed(volvo, 80).
time(ford, 20).
time(chevy, 20).
time(dodge, 20).
time(volvo, 20).

distance(X, Y) :-
  speed(X, Veloc),
  time(X, Temp),
  Y is Veloc*Temp.