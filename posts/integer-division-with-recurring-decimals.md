<!--
.. title: Integer Division With Recurring Decimals
.. slug: integer-division-with-recurring-decimals
.. date: 2025-03-03 12:42:50 UTC-06:00
.. tags: geek,software,python,math
-->

I've been doing some programming tests and puzzles while job hunting lately. One
quick challenge was quite nice, reminding me a bit of [Project
Euler](https://projecteuler.net/) questions, and I nerd sniped myself into doing
a 2nd pass at it here.

## Question

Produce a Python function which takes two integers, `numerator` and
`denominator`, and returns the result of their division as a decimal fraction in
a string. E.g:

```python
divide(1, 4) -> "0.25"
```

If the decimal places contain an infinite recurring pattern of digits, then
enclose the recurring digits in parentheses. E.g:

```python
divide(1, 3) -> "0.(3)"
divide(1, 7) -> "0.(142857)"
```

## Wrong approaches

Evaluating the division using normal floats is going to trip you up in several
ways with the limited precision.

For one, a large enough denominator might have a recurring sequence which is
longer than the number of decimal places you have available (more on this
later), which makes it impossible to detect recurring sequences by examining the
division's decimal digits.

Worse, the inherent imprecision of floating point, e.g. if a simple division
like 10/3 comes back as 3.3333333333333335, then examining the trailing digits
of this looking for recurring digits is going to be problematic.

Using the `decimal` module does markedly improve precision and control. But
infinitely repeating sequences are still going to return results like
`Decimal(20) / Decimal(3) -> Decimal('6.666666666666666666666666667')`, which is
going to trip us up.

We can sidestep all these complexities if we see that the question is asking us
to perform this division ourselves, longhand. We are going back to elementary
school! Wheee!

## Better

Let's just do basic division first, ignoring infinite or recurring digits:

```python
def divide(numerator: int, denominator:int) -> str:
    # Accumulate parts of our result here
    results = []
    while True:
        int_part = str(numerator // denominator)
        remainder = numerator % denominator
        numerator = remainder * 10
        results.append(int_part)

        # If there is no remainder, we are done
        if remainder == 0:
            break

        # Add a decimal point after our first integer part
        if len(results) == 1:
            results.append(".")

    return ''.join(results)
```

The only confusing parts of this are that `int_part` might contain several
digits on the first iteration, but is only ever one decimal digit thereafter.
Plus we have to be careful to get the ordering right for our checks to exit
the loop, versus appending the decimal point to the output, to avoid weird
looking outputs like `divide(6, 2) -> "3."`.

Trying this out:

```python
>>> divide(1, 4)
'0.25'
```

It works! But we haven't yet handled infinite decimals, they result in an
infinite loop:

```python
>>> divide(1, 3) # Hangs!
```

## Recurring digits

Because we're dividing integers, we cannot get infinitely varying decimal
places. If we have an infinite number of decimal places, it must be because
of a cycle of one or more recurring digits. To detect such a cycle we have to
notice a couple of things.

First, simply seeing a digit in the output which we have seen before is not
enough. Looking at the three assignments at the start of the above while-loop,
which capture our state:

```python
int_part = str(numerator // denominator)
remainder = numerator % denominator
numerator = remainder * 10
```

Here, `int_part` gets the value of each successive decimal digit. However
if it takes on the same value as in a previous iteration, the accompanying
remainder might be different, and it is the remainder which is used to
generate the numerator for the next iteration, and hence generate the
sequence of digits after this.

So, as we already knew from common sense, two iterations with the same
`int_part` may go on to produce different sequences of subsequent digits.
However, The value of `remainder` is the only thing which determines the inputs
to our next iteration:

* `int_part` depends on `numerator` and on `denominator` (which is constant)
* `numerator` depends on `remainder`.

Hence, two iterations might produce different digits, but produce the same
remainder, and from that point onwards, they will be in lockstep. If we find two
such iterations, then we have detected an infinite recurring cycle of digits.

So, before the loop begins, initialize a dict:

```python
# Remainders seen to date, mapped to their position in the result
remainders = {}
```

Then inside the loop, after everything else, use our new dict to detect if we
have seen the current remainder before:

```python
# If we have seen this remainder before, we are now in exactly the
# same state as then, so we have found a recurring digit sequence.
if remainder in remainders:
    # We have found a cycle of decimal digits! Insert parens into our results,
    # from the last seen position of this remainder, up to the current digit.
    last_pos = remainders[remainder]
    results = (
        results[:last_pos] +
        ["("] +
        results[last_pos:] +
        [")"]
    )
    break
# Remember the position at which we saw this remainder
remainders[remainder] = len(results)
```

Trying this out:

```python
>>> divide(1, 3)
0.(3)
>>> divide(1, 7)
0.(142857)
```

OMG it works!

## Defensive coding

We're putatively done, but the grumpy old dev in me is uncomfortable leaving
that `while True` in there. By deduction, we always must eventually hit the `if
<condition>: break` to escape from it, so ostensibly it's fine. But if I have a
bug in the code or my reasoning, then it might lead to an infinite loop, in some
scenario I'm not thinking of. Can we limit the number of iterations in some
other, foolproof way? Turns out we can.

We've seen already that a repeated value of `remainder` means we can break
from the loop. Also, notice that `remainder`, given by:

```python
remainder = numerator % denominator
```

can only take values from `0` to `denominator - 1`. So it can have `denominator`
possible values, and this is the maximum number of iterations we will ever need.

Hence, we can safely replace the `while(True)` with:

```python
for _ in range(denominator):
    ...
```

Splendid! Much less anxiety-inducing

The source is on [github](https://github.com/tartley/division).

