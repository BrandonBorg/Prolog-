art([1,[m, 10], [w, 10], [f,10]]).
art([2,[m, 11], [w, 11], [f,11]]).
dance([1,[f,13], [f,14], [f,15]]).
math([1,[m,11],[w,15],[f,15]]).
math([2,[m,14],[w,14],[f,11]]).
cps([1,[m,11],[w,11],[f,12]]).
cps([2,[m,12], [w,12], [w,15]]).


checklunch([], _).
checklunch([H|L], List):- not(lunchtaken(H,List)), checklunch(L, List).

lunchtaken(D,List):-
member([D,12], List),
member([D,13], List).

nonConflicting([], _).
nonConflicting([H|L1], L):- not(H is 1), not(H is 2), not(member(H, L)), nonConflicting(L1, L).
nonConflicting([H|L1], L):- not(H = [_,_]), nonConflicting(L1, L).


solve:-
timetable([[A|_], [D|_], [M|_], [C|_]]),
write('Art section: '), write(A), nl,
write('Dance section: '), write(D), nl,
write('Math section: '), write(M), nl,
write('CPS section: '), write(C), nl.


timetable([A, D, M, C]):-
art(A),dance(D),
nonConflicting(A, D),

math(M),
nonConflicting(A, M),
nonConflicting(D, M),

cps(C),
nonConflicting(A, C),
nonConflicting(D, C),
nonConflicting(C, M),

append(A, D, L1),
append(L1, C, L2),
append(L2,M, L3),
checklunch([m,w,f], L3).
