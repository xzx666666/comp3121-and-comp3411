
% Name:XiaoZixin      Zid:z5125746
% Assignment 1 - Prolog Programming
% Date compelete is 20 Mar

% Question 1
% Basecase for sumsq_even
% stop the recurrent if sequence is empty and sum will be palce in 0
sumsq_even([],0).

%condition for sequence is even number
%square the even number and sum it
sumsq_even([Head|Tail], Sum):-

    sumsq_even(Tail, SumRest),
    number(Head),
    0 is mod(Head,2),
    square(Head,Res),
    Sum is  SumRest + Res.

%condition for this sequence is odd number
% just loop it and check next number
sumsq_even([_|Tail], Sum):-
    sumsq_even(Tail, Sum).

% function for square the head with output in Res
square(Head,Res):-
    Res is Head * Head.


%Question 2
%Basecase for same_name if Person1 euqal with Person2 for male
same_name(Person1,Person1).

%Check the Person1 ancestor and it is related to Person2
same_name(Person1,Person2):-

    parent(Parent,Person1),
    male(Parent),
    same_name(Parent,Person2).

%check the person2 ancestor and it is related to Person1
same_name(Person1,Person2):-

    parent(Parent,Person2),
    male(Parent),
    same_name(Parent,Person1).


%Question 3
%Bacsecase
% stop if list is empty
sqrt_list([], []).

%for the list with more one element
%sqrt the list

sqrt_list([Head|Tail], [[Head,Sqrt]|Rest]):-
    number(Head),
    Sqrt is sqrt(Head),
    sqrt_list(Tail, Rest).


% Question 4
%sign_runs is order to separte positive and negative integer
%Basecase to cutting the output if it is empty list
sign_runs([], []).

% For the list with more than 1 element, get the tail T of the list and put it
% into list T1, and then use the defined predicate ins to combine the head
% and the tail of the list into RunList output in the format and constraints
% created in the ins predicate recursively

sign_runs([H|T], RunList):-
    sign_runs(T, T1),
    ins(H, T1, RunList).

% Uses cut to stop the program from backtracking if head is variable A, tail is
% an empty list, and RunList output will be the variable A placed inside an
% empty list in the list
ins(A, [], [[A]]).

% Combine the elements of the list into a sublist as long as the next element in
% the two list first element mutiple greater or less than 0 in the sublist

ins(A, [[H|T]|T2], [[A, H|T]|T2]):-
    same(H,A),
    ins(A, T2, [[A]|T2]).

% create a new sublist after the initial sublist recursively in the list
ins(A, List, [[A]|List]).

% two element is both grater or equal than 0
same(H,A):-
    H>=0,
    A>=0.
% two element is both less than 0
same(H,A):-
    H<0,
    A<0.


%Question 5
%BaseCase empty right node and left node
is_heap(tree(empty,_,empty)).

%Case 1, empty on the right side, then the lfet must bigger than the element.
is_heap(tree(Left,Num,empty)) :-
    Left = tree(_,Number_Left,_),
    Number_Left >= Num,
    is_heap(Left).

%Case 2, empty on the left side, then the right must bigger than the element.
is_heap(tree(empty,Num,Right)) :-
    Right = tree(_,Number_Right,_),
    Number_Right >= Num,
    is_heap(Right).

%Case 3, both left and right must bigger than the element.
is_heap(tree(Left,Num,Right)) :-
    Left = tree(_,Number_Left,_),
    Right = tree(_,Number_Right,_),
    Number_Left >= Num,
    Number_Right >= Num,
    is_heap(Left),
    is_heap(Right).



