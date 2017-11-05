treePosNeg(void,[],[],[]).
treePosNeg(tree(Left, Root, Right), P, N, O):- not(number(Root)), treePosNeg(Left, P1, N1, L1), treePosNeg(Right,P2,N2,L2),
append([Root],L1,Z) , append(Z,L2,O), append(P1,P2,P), append(N1,N2,N). 

treePosNeg(tree(Left, Root, Right), P, N, O):- number(Root),Root > -1, treePosNeg(Left, L1,N1,O1), treePosNeg(Right,L2,N2,O2),
append([Root],L1,Z) , append(Z,L2,P),append(N1,N2,N), append(O1,O2,O). 

treePosNeg(tree(Left, Root, Right), P, N, O):- number(Root),Root < 0, treePosNeg(Left, P1,L1,O1), treePosNeg(Right,P2,L2,O2),
append([Root],L1,Z) , append(Z,L2,N),append(P1,P2,P),append(O1,O2,O). 
