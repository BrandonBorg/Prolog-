nums(0). nums(1). nums(2). nums(3). nums(4).
nums(5). nums(6). nums(7). nums(8). nums(9).
carry(0). carry(1).

alldiff([]).
alldiff([H|L]):- not(member(H,L)), alldiff(L).

/*
A few Notes about this program
use the predicate print_solution.

-The variables CO are the carry overs from multiplying by O
-The variables CT are the carry overs from multiplying by T
-The variables CA are the carry overs from adding, 1 starting at t+w
carry over corresponding to R+A+CA1

-The total cpu time for the integrated G&T is 0.03125.

*/
print_solution:-
solve([S,T,R,A,W,O,C,H,I]),
write('   '),write(S),write(T),write(R),write(A),write(W), nl,
write('*'),write('     '),write(T),write(O), nl ,
write('   -----'), nl,
write('   '),write(W),write(A),write(R),write(T),write(S), nl,
write('+ '),write(S),write(T),write(R),write(A),write(W), nl,
write('   -----'), nl,
write('  '),write(C),write(H),write(A),write(I),write(R),write(S), nl
.

solve([S,T,R,A,W,O,C,H,I]):-
nums(CO2), nums(R), nums(O), /*Introduce vars:CO2, R, 0*/
R is mod((R*O)+CO2,10),

nums(S), S \= 0, nums(W), /*Introduce vasrs: S, W*/
S is mod(W*O,10),

nums(CO4),  /*Introduce var: CO4*/
W is (S*O) + CO4,

nums(T), T \= 0, /*Introduce var: T*/
W is mod(T*W,10),

nums(CT4),  /*Introduce var: CT4*/
S is mod((T*S)+CT4, 10),

nums(CO1), nums(A),     /*Introduce varS: CO1 A*/
T is mod((A*O)+CO1,10),

nums(CT3),/*Introduce var:CT3*/
T is mod((T*T)+CT3, 10),

nums(CT2), /*Introduce var: CT2*/
R is mod((T*R)+CT2, 10),
R is mod(T+W,10),

nums(CO3),/*Introduce var: CO3*/
A is mod((T*O)+CO3,10),

nums(CT1),/*Introduce var: CT1*/
A is mod((T*A)+CT1, 10),

carry(CA2),/*Introduce var: CA2*/
A is mod(A+R+CA2,10),

carry(CA1), nums(I),/*Introduce vars: CA1, I*/
I is mod(R+A+CA1,10),

carry(CA3), nums(H),/*Introduce vars: CA3, H*/
H is mod(W+T+CA3,10),

carry(CA4),   nums(C), C \= 0, /*Introduce vars: CA4, C*/
C is mod(S+CA4,10),
alldiff([S,T,R,A,W,O,C,H,I]).


