<!--
.. title: A Pythonic 'switch' statement
.. slug: a-pythonic-switch-statement
.. date: 2009-08-05 08:59:53-05:00
.. tags: geek,software,python
.. link: 
.. description: 
.. type: text
-->


I've recently had the pleasure of providing some assistance to my lovely
wife through her first serious Python coding, and one of many things she
expressed surprise at was the lack of a '*switch*' statement. At the
time, I advised her that such a statement is superfluous, and that she
should simply use an *if...elif...else* instead. I then forgot all about
it.

Until today, when I found myself refactoring a Pythonic kind of *switch*
into my own code.

I started with this ugly little lump:

``` python
def convert(self, params):
    action = params[0]
    if action == 'M':
        x, y = self.get_point(params)
        current_path = [(x, y)]
    elif action == 'L':
        x, y = self.get_point(params)
        current_path.append((x, y))
    elif action in 'zZ':
        if current_path[0] == current_path[-1]:
            current_path = current_path[:-1]
        if len(current_path) < 3:
            raise ParseError('loop needs 3 or more verts')
        loops.append(current_path)
        current_path = None
    else:
        msg = 'unsupported svg path command: %s' % (action,)
        raise ParseError(msg)
```

This is from the guts of an SVG parsing module I was hacking up, but
what it actually does isn't important. Its only salient feature for
today is that it consists of a big switch-like *if...elif...else*
statement. I was going to be adding plenty more cases to this logic, and
it was sure going to get ugly. How can we make it better?

First, I extract the logic from each branch of the *if* into functions.
In this case, I chose to make them methods of the current class.
Standalone functions (outside the class, without a '*self*' parameter)
would also work, if they didn't need access to shared state.

``` python
def onMove(self, params):
    x, y = self.get_point(params)
    self.current_path = [(x, y)]

def onLine(self, params):
    x, y = self.get_point(params)
    self.current_path.append((x, y))

def onClose(self, params):
    if self.current_path[0] == self.current_path[-1]:
        self.current_path = self.current_path[:-1]
    if len(self.current_path) < 3:
        raise ParseError('loop needs 3 or more verts')
    self.loops.append(self.current_path)
    self.current_path = None

def onBadCommand(self, action):
    msg = 'unsupported svg path command: %s' % (action,)
    raise ParseError(msg)
```

Again, don't worry too much about what these functions actually do. Just
note that I've pulled the logic out of each branch of the
*if...elif...else* statement into separate handler functions.

Second, I define a dictionary which maps action characters to one of the
new handler functions:

``` python
def convert(self):
    lookup = {
        'M': self.onMove,
        'L': self.onLine,
        'Z': self.onClose,
        'z': self.onClose,
    }
```

Notice how the methods are bound to self, so they operate on the current
object as you would expect. If you used stand-alone functions instead,
they would not need any '*self*.' qualifier here.

Third, use the dictionary to lookup the function we want to call, and
then call the returned function:

``` python
handler = lookup[action]
handler(params)
```

These two lines can be tidily combined into one:

``` python
loopup[action](params)
```

Note that this is pleasantly succinct, but still very explicit about
what's going on. We're looking up a value in a dictionary, using the
**d\[key\]** syntax. The returned value is a function, and we are
calling it, passing 'params', using the **f()** syntax.

Python tries very hard to always clearly expose the details of what is
happening to the reader like this. Nothing magically happens behind the
scenes. And yet, by the good judgement of Guido and the healthy process
that surrounds the language's evolving design, the code remains concise,
without becoming verbose or cluttered with obfuscating punctuation.

We haven't yet handled the final '*else*' clause from the original code.
It can't simply become another entry in our lookup dictionary, since
it's unclear what key (left-hand value) would go into the lookup to
correspond to this case. We're really talking about the case when the
'action' character can't be found in the lookup dictionary at all. The
most explicit and readable way to handle this case is to modify the
above line of code:

``` python
if action in lookup:
    lookup[action](params)
else:
    self.onBadCommand(action)
```

Saving these changes, running the tests shows it behaves identically to
the original version. (Hint: Tests don't make code harder to change.
Quite the opposite - tests *enable* more frequent and more intrusive
change, by giving you the freedom to dabble with refactoring while
remaining dead certain you aren't introducing new bugs.)

Let's take a look at the final code all together:

``` python
def convert(self, params):
    lookup = {
        'M': self.onMove,
        'L': self.onLine,
        'Z': self.onClose,
        'z': self.onClose,
    }
    action = params[0]
    if action in lookup:
        lookup[action](params)
    else:
        self.onBadCommand(action)
```

Including the new handler functions, this is considerably longer than
the original version (19 vs 32 lines). However, it qualifies as
preferable and 'more Pythonic' for a couple of reasons:

1.  It's much clearer in intent. Greater readability is introduced by
    separating out the code which chooses what to do (the lookup dict)
    from the actual doing (the new handler functions.) The naming of the
    new handler functions brings enormous clarity at a stroke. Of
    course, this could also be done with a switch statement, and
    frequently should be.
2.  It's easily extendible. The if..elif...else construct of the first
    version would soon have bloated to over a screen-full of garbled
    code when we added a few more cases. The new version could add 100
    or so new cases without really becoming much less comprehensible.
3.  It's data-driven. The lookup structure could be generated by other
    means than simply hard-coding it locally like this. We could merge
    several dictionaries depending on context, or create it on the fly
    from application configuration.

This isn't very Earth shattering, and of course the idea that I should
be preferring polymorphism over switch-statements tickling the back of
my mind, but hopefully someone finds it useful.

**Update:** Wow! What a flurry of completely brilliant comments - every
single one contains something of real merit. I feel compelled to rummage
through for a sort-of best of breed conclusion based on all of them...

``` python
lookup = {
    'M': self.on_move,
    'L': self.on_line,
    'Z': self.on_close,
    'z': self.on_close,
}

def convert(self, params):
    action = params[0]
    handler = self.lookup.get(action, self.on_bad_command)
    handler(params)

# or alternatively
def convert(self, params):
    self.lookup.get(params[0], self.on_bad_command)(params)
```

I marginally prefer the first version - the second alternative is a
smidgeon too compact for my taste. I respect the idea to use exceptions,
that makes a lot of sense too. Thanks for all the great ideas, everyone.
