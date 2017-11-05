print_solution:-
solve([Cows, Farmers, Distance, Excuses]),
Cown=[flossie, elise, daisy, bossie, maybelle],
Farmern=[brown, jones, smith, nelson, ford],
Excusen= [slipped, gravity, sore, moon_moved, headache],
 make(Cows, Cown, CowL),
 make(Farmers, Farmern, FarmerL),
 make(Excuses, Excusen, ExcuseL),
 solution(2, FarmerL, CowL ,ExcuseL), solution(5, FarmerL, CowL ,ExcuseL), solution(6, FarmerL, CowL ,ExcuseL), solution(7, FarmerL, CowL ,ExcuseL),solution(8, FarmerL, CowL ,ExcuseL).

make([],[],[]).
make([H1|L1],[H2|L2], List):-
make(L1,L2,List1),
append([H1,H2],List1, List).


solution(N, FarmerL, CowL ,ExcuseL):-
write('Matching '), write(N), write(' feet : '),
match(N, FarmerL), match(N,CowL), match(N, ExcuseL),
nl.

match(N,[N,Name|_]):- write(Name), write(', ').
match(N,[A,_|L]):- N \= A, match(N,L).

solve([Cows, Farmers, Distance, Excuses]):-
    Cows = [Flossie, Elise, Daisy, Bossie, Maybelle],
    Farmers = [Brown, Jones, Smith, Nelson, Ford],
    Distance = [Ft8, Ft7, Ft6, Ft5, Ft2],
    Excuses = [Slipped, Gravity, Sore, Moon, Headache],
    Ft8=8, Ft7=7, Ft6=6, Ft5=5, Ft2=2,
    Slipped = Ft5,
    Smith= Slipped,
    Headache= Ft6,
    Ford = Ft2,
    Brown = Moon,
    Nelson = Maybelle,
    Jones = Daisy,

    distinct_Distance(Cows),
    distinct_Distance(Farmers),
    distinct_Distance(Excuses),
    distinct_Distance(Distance),


    Ford\=(Maybelle), Ford \=(Elise),
    Bossie\=(Headache), Flossie\=(Headache), Elise\=(Headache),
    Flossie\=(Smith), Flossie\=(Ford), Flossie\=(Nelson), Flossie\=(Jones),
    Maybelle\=(Jones), Maybelle\=(Gravity), Flossie\=(Gravity),
    Nelson \=(Moon),
    Moon > Headache,
    Headache > Gravity
    .

dis(8). dis(7). dis(6). dis(5). dis(2).

distinct_Distance([]).
distinct_Distance([H|L]):-
    dis(H),
    distinct_Distance(L),
    not(member(H,L)).
