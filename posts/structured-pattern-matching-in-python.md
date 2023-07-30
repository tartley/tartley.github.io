<!--
.. title: Structured Pattern Matching in Python
.. slug: structured-pattern-matching-in-python
.. date: 2023-07-29 18:15:26 UTC-05:00
.. tags: geek, python, software
-->

I read through descriptions of
[structured pattern matching](https://docs.python.org/3.11/reference/compound_stmts.html#the-match-statement)
when it was added in Python 3.10 a couple of years ago, and have studiously
avoided it ever since. It seemed like a language feature that's amazingly
useful in one or two places, like writing a parser, say, and is a horrifically
over-complicated mis-step just about everywhere else.

> **Update:** A day after writing this I see that Guido van
> Rossum wrote exactly that,
> [a parser](https://github.com/gvanrossum/patma/blob/master/examples/expr.py),
> to showcase the feature. I'm guessing he writes a lot of parsers. I definitely
> don't write enough of them to think this language feature is worth the extra
> complexity it brings.

Regardless, I really ought to remember how it works, so this is my attempt to
make the details stick, by writing about it.

If you're not me, you really ought to be reading about it from the source instead:

* [PEP 643](https://peps.python.org/pep-0634/): Specification.
* [PEP 635](https://peps.python.org/pep-0635/): Motivation and rationale.
* [PEP 636](https://peps.python.org/pep-0636/): A tutorial.

# Basic structure

```python
match EXPRESSION:
    case PATTERN1:
        ...
    case PATTERN2:
        ...
    case _:
        ...
```

This evaluates the `match` EXPRESSION, then tries to match it against each
`case` PATTERN, executing the body of the first case that matches, falling back
to the optional final `_` default case. (`match` and `case` are not keywords,
except in the context of a match...case block, so you can continue using them
as variable names elsewhere.)

But what are PATTERNs, and how are they tested for a match?

# Patterns

Patterns can be any of the following. As becomes increasingly obvious down the
list, the real power of this feature comes from composing each of these
patterns with the others. For complicated patterns, parentheses can be used to
indicate order of operations.

## Literals

Like other languages' traditional `switch` statement:

```python
match mycommand:
    case 'start':
        ...
    case 'stop':
        ...
    case _:
        raise CommandNotFoundError(mycommand)
```

Such literal case patterns may be strings (including raw and byte-strings, but
not f-strings), numbers, booleans or None.

Such cases are compared with equality:

```python
match 123:
    case 123.0:
        # matches!
```

except for booleans and None, which are compared using `is`:

```python
class Any:
    def __eq__(self, _):
        return True

myfalse = Any()

match myfalse:
    case False:
        # Doesn't match, even though myfalse == False
        assert False
```

## Variable names

We can replace a literal with a variable name, to capture the value of the match
expression.

```python
match command:
    case 'start':
        ...
    case 'stop':
        ...
    case unknown:
        # New variable 'unknown' is assigned the value of command
```

The 'default' case pattern `_` is just a special case variable name which
binds no name.

Beware the common error of using "constants" as the case pattern:

```python
NOT_FOUND = 404

match error:
    case NOT_FOUND: # bad
        handle_404()
```

The above case is intended to test for `error == NOT_FOUND`, but instead
assigns the variable `NOT_FOUND = error`. The best defense is to always include
a default catch-all case at the end, which causes the above `NOT_FOUND` case to
produce a SyntaxError:

```python
NOT_FOUND = 404

match error:
    case NOT_FOUND:
        handle_404()
    case _:
        pass
```

```
SyntaxError: name capture 'NOT_FOUND' makes remaining patterns unreachable
```

To use a 'constant' in a case pattern like this, qualify it with a dotted name,
such as by using an `enum.Enum`:

```python
match error
    case errors.NOT_FOUND:
        # correctly matches
```

## Sequences

Using a list-like or tuple-like syntax, matches must have the right number of
items. Like Python's existing iterable unpacking feature. Use `*` to match the
rest of a sequence. Included variable names are set if a case matches by all
other criteria.

```python
match command:
    case ('start', name):
        # New variable name=command[1]
    case ('stop', name):
        # New variable name=command[1]
    case ('stop', name, delay):
        # New variables name=command[1], delay=command[2]
    case ('stop', name, delay, *extra):
        # New variables name=command[1], delay=command[2] & extra=command[3:]
    case _:
        raise BadCommand(command)
```

## Mappings

Using a dict-like syntax. The match expression must must contain a
corresponding mapping, and can contain other keys, too. Use `**` to match the
rest of a mapping.

```python
match config:
    case {'host': hostname}:
        # 'config' must contain key 'host'. New variable hostname=config['host']
    case {'port': portnumber}:
        # 'config' must contain key 'port'. New variable portnumber=config['port']
        # Remember we only use the first matching case.
        # If 'config' contains 'host', then this 'port' case will not match.
    case {'scheme': scheme, **extras}:
        # new variables 'scheme' and 'extras' are assigned.
```

Case patterns may contain more than one key-value pair. The match expression must
contain all of them to match.

```python
    case {
        'host': hostname,
        'port': portnumber,
    }:
        ...
```

## Objects and their attributes

Using class syntax, the value must match an isinstance check with the given class:

```python
match event:
    case Click():
        # handle click
        ...
    case KeyPress():
        # handle key press
        ...
```

Beware the common error of omitting the parentheses:

```python
match myval:
    case Click: # bad
        # handle clicks
```

The above case is intended to test for `isinstance(myval, Click)`, but instead
creates a new var, `Click = myval`. The best defence against this error is to
always include a default catch-all at the end, which makes the `Click` catch-all
produce an error by making subsequent patterns unreachable.

Attribute values for the class can be given, which must also match.

```python
match event:
    case KeyPress(key_name='q', release=False):
        game.quit()
    case KeyPress():
        handle_keypress(event)
```

Values can also be passed as positional args to the class-like case syntax:

```python
    case KeyPress('q', True)
        ...
```

If the class is a namedtuple or dataclass, then positional args to a class-like
case pattern can automatically be handled using the unambiguous ordering of its
attributes:

```python
@dataclass
class Dog:
    name: str
    color: str

d = Dog('dash', 'golden')

match d:
    case Dog('dash', 'golden'):
        # matches
```

But for regular classes, the ordering of the class attributes is ambiguous.
To fix this, add a `__match_args__` attribute on the class, a tuple which
specifies which class attributes, in which order, can be specified in a case
pattern:

```python
class KeyPress:
    __match_args__ = ('key_name', 'release')

event = KeyPress(key_name='q', release=False)

match event:
    case KeyPress('q', False):
        # matches!
```

As you might expect, the literal positional args can be replaced with variable
names to capture attribute values instead:

```python
match event:
    case KeyPress(k, r): # names unimportant, order matters
        handle_keypress(k, r)
```

Positional sub-patterns behave slightly differently for builtins `bool`,
`bytearray`, `bytes`, `dict`, `float`, `frozenset`, `int`, `list`, `set`,
`str`, and `tuple`. A positional value is matched by equality against the match
expression itself, rather than an attribute on it:

```python
match 123:
    case int(123):
        # matches
    case int(123.0):
        # would also match if it wasn't shadowed
```

Similarly, a positional variable is assigned the value of the match expression
itself, not an attribute on that value:

```python
match 123:
   case int(value):
        ...

assert value == 123
```

The values passed as keyword or positional args to class-like case patterns can
be more than just literals or variable names. In fact they can use *any* of the
listed pattern types. For example, they could be a nested instance of this
class-like syntax:

```python
class Location:
    def __init__(self, x, y):
        self.x = x
        self.y = y

class Car:
    def __init__(self, location):
        self.location = location

mycar = Car(Location(11, 22))

match mycar:
    case Car(location=(Location(x=x, y=y))):
        # matches, and captures 'x' and 'y'

assert x == 11
assert y == 22
```

## Combine patterns using `|`

To match either one pattern or another:

```python
    case 1 | True | 'true' | 'on' | 'yes':
        # matches any of those values
```

## Capture sub-patterns using `as`

We've seen how we can either match against a value, or capture the value using
a variable name. We can do both using `as`:

```python
    case 'a' | 'b' as ab:
        # matches either value, captures what the value actually was
```

This might not be much use when capturing the whole match expression like that.
If the match expression is just a variable, then we could instead simply refer
to that variable. But using `as` can be useful when the match expression is
lengthy or has side-effects:

```python
match events.get_next():
    case KeyDown() as key_event:
        ...
```

or to capture just a component of the whole expression. Contrived example:

```python
    case ('a' | 'b' as ab, 'c'):
        # matchs ['a', 'c'] or ['b', 'c'], and captures the first letter in 'ab'
```

### An `if` guard clause

Add arbitrary conditions to the match:

```python
    case int(i) if i < 100:
        # matches integers less than 100
```

Or, alternatively:

```python
    case int() as i if i < 100:
        # matches integers less than 100
```

# Complications

This feature seems rife with complexity. The flexible syntax of case patterns
forms a new mini-language, embedded within Python. It has many similarities to
Python, but also many initially unintuitive differences.

For example, a class-like case pattern such as `case Click():`. Anywhere else
in the language, the expression like `Click(...)` would create an instance of the
`Click` class. In a case statement, it instead is doing things like
`isinstance` and `hasattr` checks.

Similarly, including variable names doesn't return the variable value as in
ordinary Python. Instead it binds a value as that name. This is the source of
the annoying gotcha described above, that bare "constants" like `NOT_FOUND`
behave very unexpectedly when used as case expressions.

There are a few places in real-world code where structured pattern matching
will produce nicer code than the equivalent using nested `elif`s. But equally,
there are a lot of places where the `elif`s are a more natural match.
Developers now get to choose which they're going to use, and then later
disagree with each other about it, or simply change their mind, and end up
converting code from one to the other.

If this was a simple feature, with low overheads, then I'd forgive its
inclusion in the language, accepting the costs in return for the marginal and
unevenly distributed benefits.

But it's really not simple. In addition to Python programmers all having to
do an exercise like this post just to add it to their mental toolbox, it needs
maintenance effort, not just in CPython but in other implementations too, and
needs handling by tools such as syntax highlighters, type checkers. It really
doesn't seem like a net win to me, *unless* you're writing way more parsers
than the average programmer, which no doubt the champions of this feature are.

