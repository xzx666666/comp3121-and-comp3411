write('*** Question 1 Tests ***'), nl, nl,

write('T1: sumsq_even([1,3,5,2,-4,6,8,-7], Sum).'), nl,
write('Sum = 120. (Expected Answer)'), nl,
sumsq_even([1,3,5,2,-4,6,8,-7], Sum), !.

write('T2: sumsq_even([], Sum).'), nl,
write('Sum = 0. (Expected Answer)'), nl,
sumsq_even([], Sum), !.

write('T3: sumsq_even([0], Sum).'), nl,
write('Sum = 0. (Expected Answer)'), nl,
sumsq_even([0], Sum), !.

write('T4: sumsq_even([1], Sum).'), nl,
write('Sum = 0. (Expected Answer)'), nl,
sumsq_even([1], Sum), !.

write('T5: sumsq_even([-1], Sum).'), nl,
write('Sum = 0. (Expected Answer)'), nl,
sumsq_even([-1], Sum), !.

write('T6: sumsq_even([2], Sum).'), nl,
write('Sum = 4. (Expected Answer)'), nl,
sumsq_even([2], Sum), !.

write('T7: sumsq_even([-2], Sum).'), nl,
write('Sum = 4. (Expected Answer)'), nl,
sumsq_even([-2], Sum), !.

write('T8: sumsq_even([0,0,0], Sum).'), nl,
write('Sum = 0. (Expected Answer)'), nl,
sumsq_even([0,0,0], Sum), !.

write('T9: sumsq_even([-5,-4,-3,-2,-1,0,1,2,3,4,5], Sum).'), nl,
write('Sum = 40. (Expected Answer)'), nl,
sumsq_even([-5,-4,-3,-2,-1,0,1,2,3,4,5], Sum), !.

write('T10: sumsq_even([-1,-6,-16], Sum).'), nl,
write('Sum = 292. (Expected Answer)'), nl,
sumsq_even([-1,-6,-16], Sum), !.


