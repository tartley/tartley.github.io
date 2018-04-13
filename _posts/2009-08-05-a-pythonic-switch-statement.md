---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Pekka Kl&Atilde;&curren;rck, author_email: peke@iki.fi, author_url: 'http://eliga.fi',
  content: I've used this approach too and like it a lot. Another way to handle the
    final else is using dictionary's get method and its default value., date: '2009-08-05
    13:31:11 -0500', date_gmt: '2009-08-05 13:31:11 -0500', id: 22492}
- {author: 'NexNova &raquo; Blog Archive &raquo; Links del giorno: August 5, 2009',
  author_email: '', author_url: 'http://www.nexnova.net/links/2009/08/05/links-del-giorno-august-5-2009/',
  content: '[...] tartley.com : A Pythonic &acirc;&euro;&trade;switch&acirc;&euro;&trade;
    statement [...]', date: '2009-08-05 13:42:46 -0500', date_gmt: '2009-08-05 13:42:46
    -0500', id: 22494}
- {author: Steve Johnson, author_email: steve.johnson.public@gmail.com, author_url: 'http://www.steveasleep.com',
  content: "I've always been a fan of this style of switch statement. One question:\
    \ why didn't you just use defaultdict instead of the if/else block?\r\n\r\nfrom\
    \ collections import defaultdict\r\n...\r\n    def convert(self, params):\r\n\
    \        lookup = defaultdict(self.onBadCommand)\r\n        lookup.update({\r\n\
    \            'M': self.onMove,\r\n            'L': self.onLine,\r\n          \
    \  'Z': self.onClose,\r\n            'z': self.onClose,\r\n        })\r\n    \
    \    action = params[0]\r\n        lookup[action](params)", date: '2009-08-05
    13:45:05 -0500', date_gmt: '2009-08-05 13:45:05 -0500', id: 22495}
- {author: den-sh, author_email: umaefx@gmail.com, author_url: '', content: Creating
    lookup object every other time you run your method may slow down your code. Easy
    solution &acirc;&euro;&rdquo;&Acirc;&nbsp;make lookup a class variable., date: '2009-08-05
    13:56:53 -0500', date_gmt: '2009-08-05 13:56:53 -0500', id: 22497}
- {author: Masklinn, author_email: m@masklinn.com, author_url: '', content: "(not\
    \ sure how to format comments on your blog, so it'll probably look craptastic)\r\
    \n\r\n    if action in lookup:\r\n        lookup[action](params)\r\n    else:\r\
    \n        self.onBadCommand(action)\r\n\r\nThat might not be the most pythonic\
    \ way to express this, especially if you don't expect any (or many) bad commands\
    \ if we go by the EAFP principle, this should probably be written\r\n\r\n    try:\r\
    \n        lookup[action](params)\r\n    except KeyError:\r\n        self.onBadCommand(action)\r\
    \n\r\nIf we don't have any exception the try:except: is essentially free, and\
    \ it expresses more clearly that the onBadCommand call only happens on, well,\
    \ bad things.", date: '2009-08-05 14:15:11 -0500', date_gmt: '2009-08-05 14:15:11
    -0500', id: 22498}
- {author: Pete, author_email: pete@shinners.org, author_url: 'http://shredwheat.blogspot.com/',
  content: "It sounds like this switch will be in a highly called function for SVG\
    \ parsing. A couple code changes will make this perform infinitely better, while\
    \ maintaining readability. (I've got a bad feeling about my whitespace...)\r\n\
    \r\nconvertCases = {\r\n    'M': self.onMove,\r\n    'L': self.onLine,\r\n   \
    \ 'Z': self.onClose,\r\n    'z': self.onClose,\r\n}\r\n\r\ndef convert(self, params):\r\
    \n    command = params[0]\r\n    action = convertCases.get(command)\r\n    if\
    \ action:\r\n        action(params)\r\n    else:\r\n       self.onBadCommand(command)\r\
    \n\r\nIf this code remains readable it will win in several ways. First, the lookup\
    \ dictionary will not be created at runtime for every action that is processed.\
    \ Second, we are making only a single lookup into the dictionary, instead of two.\r\
    \n\r\nBenchmarks would be interesting. This code could be simpler if the onBadCommand\
    \ took the entire params as an argument.\r\n\r\ndef convert(self, params):\r\n\
    \    command = params[0]\r\n    action = convertCases.get(command)\r\n    if not\
    \ action:\r\n        action = self.onBadCommand\r\n    action(params)\r\n\r\n\
    You could move the self.onBadCommand as the second argument to the get method,\
    \ but then we would be looking up the onBadCommand method for every action, which\
    \ should be an uncommon case. But, that would eliminate the conditional in the\
    \ python code. Hmmm...", date: '2009-08-05 14:58:28 -0500', date_gmt: '2009-08-05
    14:58:28 -0500', id: 22499}
- {author: Mike B, author_email: mike.tartley@daboyz.org, author_url: '', content: "You\
    \ could also use the 'get' method of dict() for your else.  IE:\r\n\r\nhandler\
    \ = lookup.get(action, None)\r\nif handler:\r\n    handler(params)\r\n\r\nJust\
    \ another way to do it- the way that I've grown used to.", date: '2009-08-05 16:22:44
    -0500', date_gmt: '2009-08-05 16:22:44 -0500', id: 22502}
- {author: David, author_email: kemayo@gmail.com, author_url: 'http://davidlynch.org/blog',
  content: "Your solution also contains a useful piece of behavior that switch statements\
    \ have and the if/elif/else approach doesn't:\r\n\r\nIt can \"fall through\" from\
    \ one case to another, which is pretty handy when you find cases that are very\
    \ similar to one another apart from a few tweaks. So \"onMove\" could be called\
    \ from the \"onTeleport\" handler, say.", date: '2009-08-05 16:31:52 -0500', date_gmt: '2009-08-05
    16:31:52 -0500', id: 22503}
- {author: Sebastian Rittau, author_email: srittau@jroger.in-berlin.de, author_url: 'http://www.rittau.org/',
  content: "I'd actually recommend to change the lookup function to use get like this:\r\
    \n\r\nfunc = lookup.get(params[0], self.onBadCommand)\r\nfunc(params)\r\n\r\n\
    (With a slight change to onBadCommand, of course.) This way you save one conditional,\
    \ one variable assignment, three lines, and I personally find this even more readable.",
  date: '2009-08-05 18:08:45 -0500', date_gmt: '2009-08-05 18:08:45 -0500', id: 22506}
- {author: Damien, author_email: dinoboff@hotmail.com, author_url: '', content: "You\
    \ use collections.defaultdict for the \"else\" part:\r\n\r\nfrom collections import\
    \ defaultdict\r\n...\r\n\r\nlookup = defaultdict(\r\n  default_factory=lambda:\
    \ self.onBadCommand,\r\n  M=self.onMove,\r\n  ...\r\n  )\r\nlookup[params[0]](params)",
  date: '2009-08-05 19:41:42 -0500', date_gmt: '2009-08-05 19:41:42 -0500', id: 22510}
- {author: Damien, author_email: dinoboff@hotmail.com, author_url: '', content: "You\
    \ could use collections.defaultdict and its \"default_factory\" for the &acirc;&euro;&oelig;else&acirc;&euro;\x9D\
    \ part:\r\n\r\nfrom collections import defaultdict\r\n&acirc;&euro;&brvbar;\r\n\
    \r\nlookup = defaultdict(\r\ndefault_factory=lambda: self.onBadCommand,\r\nM=self.onMove,\r\
    \n&acirc;&euro;&brvbar;\r\n)\r\nlookup[params[0]](params)", date: '2009-08-05
    19:42:53 -0500', date_gmt: '2009-08-05 19:42:53 -0500', id: 22511}
- {author: Anonymoose, author_email: super.clever.name@gmail.com, author_url: '',
  content: "Wouldn't `self.on_close` be more Pythonic, or is it just me that thinks\
    \ that's the modern/preferred way to spell method/function names in Python?\r\n\
    \r\nCan't lines 9-12 be rewritten as `lookup.get(action, self.on_bad_command)(params)`?\
    \ It's shorter, still readable, and avoids a usually pointless comparison (assuming\
    \ a bad action being passed is a rare occurrence).\r\n\r\nShouldn't the lookup\
    \ dict be created at the class level or at least just once in `__init__`?", date: '2009-08-05
    19:48:47 -0500', date_gmt: '2009-08-05 19:48:47 -0500', id: 22512}
- {author: Tim White, author_email: timwhite@rogers.com, author_url: '', content: "Nice\
    \ blog on \"A Pythonic &acirc;&euro;&trade;switch&acirc;&euro;&trade; statement\"\
    .\r\nHow about\r\n\r\ntry:\r\n    lookup[action](params)\r\nexcept KeyError:\r\
    \n    self.onBadCommand(action)\r\n\r\nIt doesn't lookup the action twice (and\
    \ is slightly fewer keystrokes).\r\n\r\nTim", date: '2009-08-05 20:01:11 -0500',
  date_gmt: '2009-08-05 20:01:11 -0500', id: 22513}
- {author: Andr&Atilde;&copy; Roberge, author_email: andre.roberge@gmail.com, author_url: 'http://aroberge.blogspot.com',
  content: "I agree with you about how cleaner this look and how much easier it is\
    \ to extend it.\r\n\r\nI believe that you have made inconsequential typo (loopup\
    \ instead of lookup) in your explanation.\r\n\r\nI also believe that there is\
    \ a slight error in the last code snippet: shouldn't it be\r\nlookup[action](params(1:))\
    \ instead of lookup[action](params)  ?", date: '2009-08-05 20:41:28 -0500', date_gmt: '2009-08-05
    20:41:28 -0500', id: 22514}
- {author: Nobody, author_email: nobody@127.0.0.1, author_url: '', content: easy_install
    PEAK-Rules, date: '2009-08-05 21:47:28 -0500', date_gmt: '2009-08-05 21:47:28
    -0500', id: 22516}
- {author: D'gou, author_email: dgou@mac.com, author_url: '', content: "lookup.get(action,\
    \ onBadCommand)(params) may be even more Pythonic.\r\nSince action is part of\
    \ params, it would require change onBadCommand though.", date: '2009-08-05 23:09:02
    -0500', date_gmt: '2009-08-05 23:09:02 -0500', id: 22521}
- {author: Farzad, author_email: farzadb82@gmail.com, author_url: '', content: "Also,\
    \ don't forget that if your \"switch\" operation returns simple static values\
    \ based on a key, then you can also use the .get method of the dictionary to return\
    \ a default value if there are no other matches.\r\n\r\nie.\r\nlookup = {\r\n\
    \  'M': 'Minute',\r\n  'H': 'Hour',\r\n}.get(value, 'Second')\r\n\r\nWhere if\
    \ value matches 'M' or 'H' then 'Minute' or 'Hour' will be returned, respectively,\
    \ otherwise 'Second' will be returned for any other value.", date: '2009-08-06
    00:56:54 -0500', date_gmt: '2009-08-06 00:56:54 -0500', id: 22524}
- {author: Ben, author_email: deisum@gmail.com, author_url: '', content: "Using a\
    \ dictionary as a faux-case syntax is something that's been discussed many times\
    \ over.  However, I still think elif statements are more readable, intuitive and\
    \ straight-forward.  As such, I and many others would disagree with your assertion\
    \ that it's more Pythonic.  Using a dictionary to implement non-existent syntax\
    \ is far from the obvious way of doing things.\r\n\r\nAlso, your 'if action in\
    \ lookup' construct is far from elegant.  Since you're using a dictionary, you\
    \ 'should' be using the get(key[, default]) method.  But in general, you should\
    \ use the try/except construct and keep the error handling in that code block,\
    \ particularly since you are raising an exception anyway.", date: '2009-08-06
    00:58:05 -0500', date_gmt: '2009-08-06 00:58:05 -0500', id: 22525}
- {author: James Thiele, author_email: james.thiele@gmail.com, author_url: '', content: "Your\
    \ example is a way I sometimes simulate switch statements. An alternate form of\
    \ your last four lines is: \r\n\r\ntry:\r\n        lookup[action](params)\r\n\
    except KeyError:\r\n        self.onBadCommand(action)\r\n\r\nWhich version to\
    \ use is mostly a matter of taste,", date: '2009-08-06 13:50:18 -0500', date_gmt: '2009-08-06
    13:50:18 -0500', id: 22542}
- {author: DoNotFoldSpindleOrMutilate, author_email: Annon0m0s@gmail.com, author_url: '',
  content: "My knowledge of Python is not large but perhaps one of these suggestions\
    \ would help create a dictionary which allows \"else\" part:\r\n1) Use dict.__missing__\
    \  An example from http://www.devx.com/opensource/Article/33480/0/page/3\r\nis\
    \ a sparse matrix \r\nclass SparseDict(dict):\r\n    def __missing__(self, key):\r\
    \n        return 0\r\n2) Use defaultdict(set) An example from http://jtauber.com/blog/2008/02/27/evolution_of_default_dictionaries_in_python/\r\
    \nSee also http://www.python.org/doc/2.5.2/lib/defaultdict-objects.html\r\ndict_set\
    \ = defaultdict(set)\r\nThe examples defaults had integers and sets so perhaps\
    \ it could be a function call but might take a bit more coding.\r\n\r\nI'm not\
    \ sure if the defaultdict will create an entry in the dictionary everytime a new\
    \ item has a look up. In some circumstances the dictionary would grow in an unbounded\
    \ manner if there was too many \"else\" type of look ups.\r\n\r\nI used the defaultdict\
    \ for a small python program and it worked perfectly.", date: '2009-08-06 15:07:14
    -0500', date_gmt: '2009-08-06 15:07:14 -0500', id: 22543}
date: 2009-08-05 08:59:53 -0500
date_gmt: 2009-08-05 08:59:53 -0500
layout: post
published: true
status: publish
tags: []
title: A Pythonic 'switch' statement
wordpress_id: 805
wordpress_url: http://www.tartley.com/?p=805
...
---

I've recently had the pleasure of providing some assistance to my lovely
wife through her first serious Python coding, and one of many things she
expressed surprise at was the lack of a '*switch*' statement. At the
time, I advised her that such a statement is superfluous, and that she
should simply use an *if...elif...else* instead. I then forgot all about
it.

Until today, when I found myself refactoring a Pythonic kind of *switch*
into my own code.

I started with this ugly little lump:

``` {lang="Python"}
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

``` {lang="Python"}
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

``` {lang="Python"}
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

``` {lang="Python"}
        handler = lookup[action]
        handler(params)
```

These two lines can be tidily combined into one:

``` {lang="Python"}
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

``` {lang="Python"}
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

``` {lang="Python"}
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

``` {lang="Python"}
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
