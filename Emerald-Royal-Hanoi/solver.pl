% Emerald Royal Hanoi — SWI-Prolog solver
% hanoi(+N, +From, +To, +Via, -Moves)
% Moves is an ordered list of move(From, To) terms.

hanoi(N, From, To, Via, Moves) :-
    integer(N),
    N >= 0,
    From \= To,
    From \= Via,
    To \= Via,
    hanoi_moves(N, From, To, Via, Moves).

hanoi_moves(0, _, _, _, []) :- !.
hanoi_moves(N, From, To, Via, Moves) :-
    N > 0,
    N1 is N - 1,
    hanoi_moves(N1, From, Via, To, First),
    hanoi_moves(N1, Via, To, From, Third),
    append(First, [move(From, To)|Third], Moves).

% Convenience predicate: print the solution in a readable form.
solve_hanoi(N, From, To, Via) :-
    hanoi(N, From, To, Via, Moves),
    length(Moves, Count),
    format('Minimum moves: ~w~n', [Count]),
    forall(member(Move, Moves), writeln(Move)).

% Example:
% ?- hanoi(3, a, c, b, Moves).
% Moves = [move(a,c), move(a,b), move(c,b), move(a,c),
%          move(b,a), move(b,c), move(a,c)].
