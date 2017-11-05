
nums(0). nums(1). nums(2). nums(3). nums(4).
nums(5). nums(6). nums(7). nums(8). nums(9).
alldiff([]).
alldiff([H|L]):- not(member(H,L)), alldiff(L).

/*
A few Notes about this program
use the predicate print_solution.

-The variables CO are the carry overs from multiplying by O
-The variables CT are the carry overs from multiplying by T
-The variables CA are the carry overs from adding, 1 starting at t+w
carry over corresponding to R+A+CA1

-The total cpu time for the G&T is 61.15625
-The total cpu time for the integrated G&T is 0.0.

Method
- we only assigned a value to a number when nessacary
- assigning O after W was stragical since more variables depend on
O than W.
- we went in order of the multiplication to make the carry over easier
*/
print_solution:-
solve([S,T,R,A,W,O,C,H,I]),
write('   '),write(S),write(T),write(R),write(A),write(W), nl,
write('*'),write('     '),write(T),write(O), nl ,
write('   -------'), nl,
write('   '),write(W),write(A),write(R),write(T),write(S), nl,
write('+ '),write(S),write(T),write(R),write(A),write(W), nl,
write('   -------'), nl,
write('  '),write(C),write(H),write(A),write(I),write(R),write(S), nl
.

solve([S,T,R,A,W,O,C,H,I]):-
nums(W), nums(O),
S is mod(W*O,10), CO1 is W*O//10,
nums(A),
T is mod((A*O)+CO1,10), CO2 is  (A*O+CO1)//10,
nums(R),
R is mod((R*O)+CO2,10), CO3 is (R*O + CO2)//10,
A is mod((T*O)+CO3,10),
S \= 0, CO4 is (T*O+CO3)//10,
W is (S*O) + CO4, W \= 0,

W is mod(T*W,10), CT1 is T*W//10,
A is mod((T*A)+CT1, 10), CT2 is T*A//10,
R is mod((T*R)+CT2, 10), CT3 is T*R//10,
T is mod((T*T)+CT3, 10), CT4 is T*T//10,
S is mod((T*S)+CT4, 10),

R is mod(T+W,10), CA1 is (T+W)//10,
I is mod(R+A+CA1,10), CA2 is (R+A+CA1)//10,
A is mod(A+R+CA2,10), CA3 is (A+R+CA2)//10,
H is mod(W+T+CA3,10), CA4 is (W+T+CA3)//10,
C is mod(S+CA4,10),
alldiff([S,T,R,A,W,O,C,H,I]).


/*
solveslow([S,T,R,A,W,O,C,H,I]):-
nums(S),nums(T), nums(R), nums(A), nums(W), nums(O), nums(C), nums(H), nums(I),

S is mod(W*O,10), CO1 is W*O//10,
T is mod((A*O)+CO1,10), CO2 is  (A*O+CO1)//10,
R is mod((R*O)+CO2,10), CO3 is (R*O + CO2)//10,
A is mod((T*O)+CO3,10),
S \= 0, CO4 is (T*O+CO3)//10,
W is (S*O) + CO4, W \= 0,

W is mod(T*W,10), CT1 is T*W//10,
A is mod((T*A)+CT1, 10), CT2 is T*A//10,
R is mod((T*R)+CT2, 10), CT3 is T*R//10,
T is mod((T*T)+CT3, 10), CT4 is T*T//10,
S is mod((T*S)+CT4, 10),

R is mod(T+W,10), CA1 is (T+W)//10,
I is mod(R+A+CA1,10), CA2 is (R+A+CA1)//10,
A is mod(A+R+CA2,10), CA3 is (A+R+CA2)//10,
H is mod(W+T+CA3,10), CA4 is (W+T+CA3)//10,
C is mod(S+CA4,10),
alldiff([S,T,R,A,W,O,C,H,I]).

*/
