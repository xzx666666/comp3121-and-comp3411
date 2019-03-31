% Program:  family.pl.solution
% Source:   Prolog
%
% Purpose:  This is the sample program for the Prolog Lab in COMP9414.
%           It is a simple Prolog program to demonstrate how prolog works.
%           See lab.html for a full description.
%
% History:  Original code by Barry Drake, adapted to SWI-Prolog by Bill Wilson


% parent(Parent, Child)
%
parent(albert, jim).
parent(albert, peter).
parent(jim, brian).
parent(john, darren).
parent(peter, lee).
parent(peter, sandra).
parent(peter, james).
parent(peter, kate).
parent(peter, kyle).
parent(brian, jenny).
parent(irene, jim).
parent(irene, peter).
parent(pat, brian).
parent(pat, darren).
parent(amanda, jenny).


% female(Person)
%
female(irene).
female(pat).
female(lee).
female(sandra).
female(jenny).
female(amanda).
female(kate).

% male(Person)
%
male(albert).
male(jim).
male(peter).
male(brian).
male(john).
male(darren).
male(james).
male(kyle).


% yearOfBirth(Person, Year).
%
yearOfBirth(irene, 1923).
yearOfBirth(pat, 1954).
yearOfBirth(lee, 1970).
yearOfBirth(sandra, 1973).
yearOfBirth(jenny, 2004).
yearOfBirth(amanda, 1979).
yearOfBirth(albert, 1926).
yearOfBirth(jim, 1949).
yearOfBirth(peter, 1945).
yearOfBirth(brian, 1974).
yearOfBirth(john, 1955).
yearOfBirth(darren, 1976).
yearOfBirth(james, 1969).
yearOfBirth(kate, 1975).
yearOfBirth(kyle, 1976).



% ----------------------
%  Solutions Start Here
% ----------------------


% grandparent(Grandparent, Grandchild)
% means Grandparent is a grandparent of Grandchild
%
grandparent(Grandparent, Grandchild) :-
	parent(Grandparent, Child),
	parent(Child, Grandchild).


% older(A,B)
% means A is older than B
%
older(A,B) :- yearOfBirth(A, Y1),
              yearOfBirth(B, Y2),
              Y2 > Y1.


% siblings(A,B)
% means A and B are siblings
%
siblings(A,B) :-
    parent(X, A),       % A & B share a common parent
    parent(X,B),         %
    A \== B.             % A is different from B  (Bratko, p175)



% sibling_list(Child, Siblings)
% Siblings is a list of Child's brothers and sisters
%
sibling_list(Child, Siblings) :-
	findall(Sibling, siblings(Child, Sibling), List),
	remove_duplicates(List, Siblings).
	

% remove_duplicates(List, Result)
%
% Removes duplicate entries in a list
%
remove_duplicates([], []).

remove_duplicates([X|Rest], Result) :-
	member(X, Rest),
	remove_duplicates(Rest, Result).
	
remove_duplicates([X|Rest], [X|Result]) :-
	% X is not a member of Rest as
	% the above clause has a cut in it.
	remove_duplicates(Rest, Result).

	

% olderBrother(A,B)
% means A is an older brother of B
%
olderBrother(A,B) :- siblings(A, B), male(A), older(A, B).


% descendant(Person, Descendant)
% means Descendant is a descendant of Person.
%
descendant(Person, Descendant) :-
        parent(Person, Descendant).
descendant(Person, Descendant) :-
        parent(Person, Child),
        descendant(Child, Descendant).


% ancestor(Person, Ancestor)
% means Ancestor is an ancestor of Person.
%
% This is functionally equivalent to descendant(Ancestor, Person).
%
ancestor(Person, Ancestor) :-
        parent(Ancestor, Person).
ancestor(Person, Ancestor) :-
        parent(Parent, Person),
        ancestor(Parent, Ancestor).


% children(Parent, ChildList)
% ChildList is bound to a list of the children of Parent.
%
children(Parent, ChildList) :-
    findall(Child, parent(Parent,Child), ChildList).


% listCount(List, Count)
% Count is bound to the number of elements in List.
%
listCount([], 0).
listCount([_|Tail], Count) :-
    listCount(Tail, TailCount),
    Count is TailCount + 1.


% countDescendants(Person, Count)
% Count is bound to the number of descentants of Person.
%
countDescendants(Person, Count) :-
    findall(Decendant, descendant(Person,Decendant), List),
    listCount(List, Count).

% Base Case
insert(New,[],[New]).

% New node goes at front of list
insert(New,[Head|Tail],[New,Head|Tail]) :-
New =< Head.

% New node is inserted into existing list
insert(New,[Head|Tail],[Head|Tail1]) :-
New > Head,
insert(New,Tail,Tail1).


% Base Case
isort([],[]).

% Sort the Tail and then insert the Head
isort([Head|Tail],List) :-
isort(Tail,Tail_Sorted),
insert(Head,Tail_Sorted,List).


% Base Case 0: empty list
split([],[],[]).

% Base Case 1: list with one item
split([A],[A],[]).

% Assign first item to first list, second item to second list
% and recursively split the rest of the list.
split([A,B|T],[A|R],[B|S]) :-
split(T,R,S).


% If one list is empty, return the other list
merge(A,[],A).
merge([],B,B).

% If first item of first list is smaller,
% it becomes first item of the merged list
merge([A|R],[B|S],[A|T]) :-
A =< B,
merge(R,[B|S],T).

% If first item of second list is smaller,
% it becomes first item of the merged list
merge([A|R],[B|S],[B|T]) :-
A > B,
merge([A|R],S,T).


% Base Cases: empty list or list with one item
mergesort([],[]).
mergesort([A],[A]).

% If the list has more than one item,
% split it into two lists of (nearly) equal size,
% sort the two smaller lists, and merge them.
mergesort([A,B|T],S) :-
split([A,B|T],L1,L2),
mergesort(L1,S1),
mergesort(L2,S2),
merge(S1,S2,S).

member([],[]).

member(Item, Item).

member(Item, [First|Tail]):-
    Item is First.

member(Item, [First|Tail]):-
    member(Item,Tail).

remove_dup([],[]).

remove_dup([First|Rest], NewRest):-
    member(First, Rest),
    !,
    remove_dup(Rest,NewRest ).

remove_dup([First|Rest], [First|NewRest]):-
    not(member(First, Rest)),
    remove_dup(Rest, NewRest).

