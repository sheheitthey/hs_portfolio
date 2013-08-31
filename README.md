hs_portfolio
============

An investment portfolio calculator in Haskell.

I created this as an exercise for myself to learn Haskell because I was
interested in its rich type system. The idea is to calculate the value of
certain positions based on underlying security value, transaction costs, and
optionally applicable things for specific instruments like option strike
price. This would help figure out the total value of a combined position with
multiple different instruments on the same underlying security.

In the process, I did achieve my goal of learning more about Haskell's type
system, especially type classes. However, I was getting frustrated with
Haskell's approach to data encapsulation being different from what I was used
to, and I hadn't found time to revisit this and satisfactorily finish the
functionality. As it is, the tool works, but I consider it only a prototype.
