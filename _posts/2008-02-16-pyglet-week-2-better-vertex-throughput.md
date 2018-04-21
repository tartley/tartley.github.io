---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Graphics]
comments:
- {author: tartley.com &raquo; 2D Graphics With Pyglet and OpenGL, author_email: '',
  author_url: 'http://tartley.com/?p=250', content: '[...] On to part 2&#8230;   -
    Tartley, 00:57 GMT Wed 6 Feb 2008 | Filed under: Graphics, Python | [...]', date: '2008-02-16
    06:37:54 -0600', date_gmt: '2008-02-16 06:37:54 -0600', id: 8050}
- {author: Dave, author_email: jc112573@jcu.edu.au, author_url: '', content: "Have\
    \ you looked at the OpenGL Programming guide (the red book)?\r\n\r\nhttp://opengl.org/documentation/red_book/\r\
    \n\r\nThere's probably a few other ways to allow more triangles - it's been a\
    \ while, but off the top of my head you could use GL_TRIANGLES for all of the\
    \ entities, or you could set it up to work with vertex arrays, or, depending on\
    \ what you want from the code, with display lists.\r\n\r\nA bit more work, but\
    \ probably necessary if you're trying to benchmark Pyglet.  I've been meaning\
    \ to have a bit of play with Pyglet myself, so the throughput is a data point\
    \ I'm interested in.", date: '2008-02-16 15:38:14 -0600', date_gmt: '2008-02-16
    15:38:14 -0600', id: 8061}
- {author: Ezequiel, author_email: ezequiel.pozzo@gmail.com, author_url: '', content: "I'll\
    \ add you to my rss reader.\r\n\r\nI'd like to read more about pyglet and python\
    \ in general. And specially this kind of \"performance investigations\"", date: '2008-02-16
    16:37:35 -0600', date_gmt: '2008-02-16 16:37:35 -0600', id: 8062}
- {author: Nixta, author_email: nfurness@nixta.com, author_url: 'http://nixtasinks.nixta.com',
  content: "I am clearly not suited to this industry.\r\n\r\nI must leave.\r\n\r\n\
    I'm going to be a dustman, or sell hotdogs on the corner.", date: '2008-02-16
    18:26:12 -0600', date_gmt: '2008-02-16 18:26:12 -0600', id: 8065}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@Nick: God, it''s about time you realised it. I''ve been biting my tongue
    for <i>years</i> now. Don''t let the door hit you on the way out.', date: '2008-02-16
    20:02:36 -0600', date_gmt: '2008-02-16 20:02:36 -0600', id: 8067}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "@Dave: Thanks! I owned a copy of the red book years ago, when I was young\
    \ and dynamic, but I've forgotten it all now, so I just purchased a copy of the\
    \ shiny new edition. As far as I know, the technique above *does* use vertex arrays\
    \ (or at least arrays of vertices.) Have I misconstrued something?\r\n\r\nI chose\
    \ to draw fans using GL_TRIANGLE_FANS, instead of GL_TRIANGLES, since it can draw\
    \ N-2 triangles from N vertices. Using GL_TRIANGLES can only draw N/3 triangles\
    \ for the same bandwidth and GPU effort of transforming the same N vertices. Sounds\
    \ worthy of investigation for comparison's sake though. Presumably I'll be using\
    \ a mixture going forward.\r\n\r\nAlso, I considered display lists, but the red\
    \ book 'hints and tips' chapter enigmatically advises to prefer vertex arrays\
    \ for performance. Can anyone shed any light on why?", date: '2008-02-16 22:14:11
    -0600', date_gmt: '2008-02-16 22:14:11 -0600', id: 8071}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@Ezequiel: Glad you liked it, and I do plan to do more of the same, but
    be warned they will be interspersed between whatever other crap is on my mind
    at the time. Par for the3 course, I guess.', date: '2008-02-16 22:15:44 -0600',
  date_gmt: '2008-02-16 22:15:44 -0600', id: 8072}
- {author: Esteban, author_email: euccastro@yahoo.com, author_url: '', content: 'Skim
    a good OpenGL book (e.g. the Red book or the Superbible) on display lists, vertex
    buffer objects, and texture objects. If you keep the data in the GPU and only
    ''trigger'' it from Python code, there should be no noticeable difference between
    the time it takes to render a scene in Python/pyglet and what it takes in C.',
  date: '2008-02-17 00:44:34 -0600', date_gmt: '2008-02-17 00:44:34 -0600', id: 8080}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@Esteban: Thanks, that''s the sort of thing I was hoping might be true.
    Does anyone have any order-of-magnitude guesses of how fast code like the above
    should be in C? Dammit, I probably have some ten-year-old code lying around of
    my own that I could try out... (rummage, rummage)...', date: '2008-02-17 14:27:15
    -0600', date_gmt: '2008-02-17 14:27:15 -0600', id: 8098}
- {author: John M. Camara, author_email: john.m.camara@comcast.net, author_url: '',
  content: "I just took a look at your code and I have a few comments.  Python looks\
    \ up variable names in the order of LEGB (local, enclosing, global, and builtins).\
    \  So whenever you have a loop that is going to executed a lot of times it's best\
    \ to create a local variable to hold a reference to a variable outside of the\
    \ local name space before the loop.\r\n\r\nAlso, function calls in Python are\
    \ fairly slow so any time you can reduce them in these loops the code will execute\
    \ much faster.  In the generateVerts method the append method of list is being\
    \ called twice for each iteration but could be reduced to 1 call by using the\
    \ extend method.  With these 2 suggestions the _generateVerts will reduce it's\
    \ execution time by more than 40% in the case when numShards = 100,000.\r\n\r\n\
    <pre class=\"prettyprint\">\r\n    def _generateVerts():\r\n        verts = [0.0,\
    \ 0.0]\r\n        _cos = cos\r\n        CoordsFromPolar = Position.CoordsFromPolar\r\
    \n        tmp = 2 * pi / Entity.numShards\r\n        verts_extend = verts.extend\r\
    \n        for i in range(0, Entity.numShards+ 1):\r\n            bearing = i *\
    \ tmp\r\n            radius = (2 + _cos(bearing)) / 2\r\n            verts_extend(CoordsFromPolar(radius,\
    \ bearing))\r\n    \r\n        Entity.vertsGl = (GLfloat * len(verts))(*verts)\r\
    \n</pre>\r\n\r\nThese 2 techniques can also be applied to the rest of your code\
    \ to speed it up.  I have not done so with the rest of your code so I can not\
    \ report performance gains it would have.  You will have to try it for yourself.\
    \  But you can gain even more performance if you start using numpy [1] arrays.\
    \  Using numpy arrays you will be able to eliminate most of your loops as calculations\
    \ on numpy arrays are performed on all elements and perform almost as fast as\
    \ C code.  You may also find some use for the scipy [2] library which takes advantage\
    \ of numpy arrays.\r\n\r\nFor a couple additional tricks see David Goodger's Code\
    \ Like a Pythonista: Idiomatic Python [3] as well as a few of the references he\
    \ mentions.\r\n\r\n[1] http://numpy.scipy.org/\r\n[2] http://numpy.scipy.org/\r\
    \n[3] http://python.net/~goodger/projects/pycon/2007/idiomatic/handout.html",
  date: '2008-02-17 19:24:34 -0600', date_gmt: '2008-02-17 19:24:34 -0600', id: 8101}
- {author: theatrus, author_email: atrus@stackworks.net, author_url: '', content: 'The
    trick with modern graphics hardware is not to reduce the number of triangles,
    it is to reduce the number of batches sent to the card.', date: '2008-02-17 21:36:05
    -0600', date_gmt: '2008-02-17 21:36:05 -0600', id: 8106}
- {author: Richard, author_email: richard@mechanicalcat.net, author_url: 'http://www.mechanicalcat.net/richard',
  content: Pyglet 1.1 will include a graphics module which at its core provides a
    lovely Python wrapping around VBOs (including mutability). You can only get it
    via SVN at the moment. It's been in there for a while now and is the core of pyglet's
    new text rendering and sprite code., date: '2008-02-17 23:12:40 -0600', date_gmt: '2008-02-17
    23:12:40 -0600', id: 8109}
- {author: Alec Thomas, author_email: alec@swapoff.org, author_url: 'http://swapoff.org',
  content: "You're right, that is horrendously slow. Fortunately the solution is a\
    \ FAQ:\r\n\r\n  http://groups.google.com/group/pyglet-users/web/faq\r\n\r\nWith\
    \ \"python gameloop2.py\" I get about 150fps. With \"python -O gameloop2.py\"\
    \ I get around 720fps", date: '2008-02-19 14:02:15 -0600', date_gmt: '2008-02-19
    14:02:15 -0600', id: 8128}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "@John: Brilliant, thanks very much indeed for that. I took the liberty\
    \ of editing your post to put the code in (pre class=\"prettyprint\") tags, which\
    \ preserves whitespace and colors by syntax.\r\n\r\nI wasn't too worried by the\
    \ performance of generateVerts(), since it only gets called once on program startup\
    \ - but obviously the changes you suggest will be very handy if I start animating\
    \ vertices with the CPU and having to re-generate the vertex lists, which is something\
    \ I'm really looking forward to looking into.\r\n\r\nObviously the sort of techniques\
    \ you suggest will be relevant elsewhere too. I'll roll the ideas into my future\
    \ investigations.\r\n\r\nAh, and only this very morning I was wondering hether\
    \ NumPy could operate on arrays which would be useable as input to OpenGL routines.\
    \ I am *delighted* to hear that it can. I will definitely be trying this out,\
    \ since it will give me a feasible method to move vertices around dynamically.\
    \ I'm keen to produce dynamic shadow sort of effects, and to indicate in-game\
    \ entities state by changing their appearance, which can't come simply from precanned\
    \ vertex ordinates.\r\n\r\nBrilliant, thanks heaps.", date: '2008-02-20 11:31:44
    -0600', date_gmt: '2008-02-20 11:31:44 -0600', id: 8142}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "@Richard: I don't even know what a VBO is! Oh, hang on, is it a vertex\
    \ buffer object? Which stores the vertices on the graphics card, rather than sytem\
    \ memory? That was the next chapter I was going to skip to in the red book. Will\
    \ using these cause me problems if I want to animate the vertices? For example,\
    \ imagine we're drawing a pac-man style ghost, and I want to independently animate\
    \ the eyes (looking at pacman), the mouth (sometimes frowny), and the bottom edge\
    \ (constantly rippling). What are my options? I can see a few, but they all seem\
    \ to have drawbacks. I've clearly got some reading to do.\r\n\r\n@theatrus: Thanks,\
    \ so I'm beginning to glean.\r\n\r\n@Alec: Brilliant, thanks for bringing that\
    \ to my attention, I'll try it out on my setup, see what happens.", date: '2008-02-20
    11:36:53 -0600', date_gmt: '2008-02-20 11:36:53 -0600', id: 8143}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "If I'm drawing two entities from the same set of vertices, ie, the same\
    \ as:\r\n\r\n<pre class=\"prettyprint\">\r\nmodelTransform(entityA.position)\r\
    \nglDrawElements(entityA.vertices)\r\nmodelTransform(entityB.position)\r\nglDrawElements(entityB.vertices)\r\
    \n</pre>\r\n\r\nCan I batch these up into a single glDrawElements() call (or one\
    \ of its sibling functions glMultiDrawElements(), etc)\r\n\r\nI don't know how\
    \ to include transformation changes into a single batched call. Perhaps it can't\
    \ be done. Can anyone advise on approaches?", date: '2008-02-20 14:53:56 -0600',
  date_gmt: '2008-02-20 14:53:56 -0600', id: 8147}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "<b>Updates</b>\r\n\r\n1) Alec is right.\r\n\r\nInvoking python with '-O'\
    \ on Windows gives me 10-20% speed improvement, which is fantastic. \r\n\r\nOn\
    \ Linux, however, it gives me over <b>500% performance improvement</b>, just as\
    \ he promised, which is just astonishing. Best of all, the performance gains are\
    \ greatest in the cases with many entities on screen. I can now render 500 entities,\
    \ with 100 triangles in each, at 30fps, on a shonky laptop. Absolutely brilliant.\r\
    \n\r\n2) Use a seed.\r\n\r\nIf you're generating positions and sizes randomly\
    \ like I am, and hoping to compare performance from one run to the next, then\
    \ call random.seed(0) at the start of your program. Without it the varying size\
    \ and placement of the fans was peturbing performance by a significant amount\
    \ from one run to the next.", date: '2008-02-21 15:22:00 -0600', date_gmt: '2008-02-21
    15:22:00 -0600', id: 8157}
- {author: Richard, author_email: richard@mechanicalcat.net, author_url: 'http://www.mechanicalcat.net/richard',
  content: '@Tartley: yes you can mutate the contents of a VBO, and the pyglet wrapping
    around them makes it really nice (though again since this hasn''t been released
    there''s no docs yet, but there are examples).', date: '2008-02-22 01:57:18 -0600',
  date_gmt: '2008-02-22 01:57:18 -0600', id: 8162}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@Richard: Ah, now I come to re-read, no doubt that''s what you were indicating
    on your original post with the phrase ''including mutability''. :-)', date: '2008-02-22
    10:17:19 -0600', date_gmt: '2008-02-22 10:17:19 -0600', id: 8167}
- {author: 'tartley.com &raquo; Pyglet week 3 : Some Pretty Flowers', author_email: '',
  author_url: 'http://tartley.com/?p=285', content: '[...] is just a refinement of
    last week&#8217;s script. No massively significant changes, just a bunch of minor
    [...]', date: '2008-02-25 13:55:07 -0600', date_gmt: '2008-02-25 13:55:07 -0600',
  id: 8274}
date: 2008-02-16 04:24:33 -0600
date_gmt: 2008-02-16 04:24:33 -0600
layout: post
published: true
status: publish
tags: []
title: 'pyglet week 2: Better Vertex Throughput'
wordpress_id: 264
wordpress_url: http://tartley.com/?p=264
---

In last week's [2D Graphics With pyglet and
OpenGL](http://tartley.com/?p=250), I used the
[pyglet](http://www.pyglet.org/) library to produce some OpenGL
triangles on the screen, from my rough-and-ready Python code. This week,
I want to try to boost the throughput, to get some idea of how complex a
scene we can realistically render from Python, while still maintaining a
decent frame rate.

I was a little optimistic in my assessment of how fast last week's code
was running. When I come to measure it carefully, I find that displaying
just **85 triangles** will bring the framerate down to a minimally
acceptable **30fps**. This is on my lappy - a Thinkpad T60, with a dual
1.6GHz cores, only one of which is busy, and an ATI Radeon Mobility
X1400 running at 1680x1050. The framerate seems fairly independent of
what size the triangles are, and of whether blend is enabled to make
them translucent.

So what can we do to improve this? I suspect that an easy win would be
to replace each entity's single triangle with a collection of triangles,
specified by an array of vertices. To assemble the vertex list, we
create the first vertex at (0, 0), and then lay all the following
vertices in a ring around it.

![Seven
vertices](/assets/2008/02/points5.png)![Five
triangles](/assets/2008/02/fan5.png)

I've shown vertex 6 lying adjacent to vertex 1, just to make them both
visible, but in actuality they are coincident. Rendering these N
vertices using glDrawArray() can produce N-2 triangles in the best case.
All these vertices are shunted to the graphics card, translated,
rotated, scaled and rendered in hardware, all without our code having to
do any extra work, and hopefully without any significant performance
penalty.

Starting with the code from last week, I modify it to generate the
vertex list using the following new static member on class Entity. Note
that I have coined the term *shard* to describe the individual triangles
rendered by class Entity:

``` python
class Entity(object):

    numShards = 5
    vertsGl = None

    @staticmethod
    def _generateVerts():
        verts = [0.0, 0.0]
        for i in range(0, Entity.numShards+ 1):
            bearing = i * 2 * pi / Entity.numShards
            radius = (2 + cos(bearing)) / 2
            x, y = Position.CoordsFromPolar(radius, bearing)
            verts.append(x)
            verts.append(y)

        Entity.vertsGl = (GLfloat * len(verts))(*verts)

Entity._generateVerts()
```

The for-loop simply creates the list of vertex co-ordinates, as
illustrated above. The cryptic-looking penultimate line converts that
list into an array of GLfloats, as provided by ctypes, and stores that
array on a class level attribute, Entity.vertsGl. The final line then
calls this member function as soon as the class is defined, creating our
vertex array at program startup. We also create a similar array of
colors, which will be used to color each vertex, but since I want each
fan drawn in a different set of colors, this is done in
Entity.\_\_init\_\_(), and the resulting arrays are stored on the
instance (not shown).

This vertex and color arrays can then be rendered as a triangle fan
using the following Entity.draw() method:

``` python
    def draw(self):
        glLoadIdentity()
        glTranslatef(self.pos.x, self.pos.y, 0)
        glRotatef(self.pos.rot, 0, 0, 1)
        glScalef(self.size, self.size, 1)

        glEnableClientState(GL_VERTEX_ARRAY)
        glEnableClientState(GL_COLOR_ARRAY)
        glVertexPointer(2, GL_FLOAT, 0, Entity.vertsGl)
        glColorPointer(4, GL_FLOAT, 0, self.colorsGl)

        glDrawArrays(GL_TRIANGLE_FAN, 0, len(self.vertsGl) // 2)
```

With other minor tweaks to give a new background color, running this
with 3 shards per Entity produces quite a pleasing effect:

![3 shards per
entity](/assets/2008/02/screenshot-3.png)

At 30fps, we can still manage 85 entities, and we're now rendering a fan
of three shards for each one, so we've tripled our throughput to **225
triangles** per frame. I suspect it can get better though. Let's try
cranking up the number of shards per fan, while reducing the number of
fans to maintain 30fps.

  Shards per entity | Entities at 30fps | Triangles per frame
  -----------------:|------------------:|-------------------:
  3                 | 85                | 225
  [![7 shards](/assets/2008/02/7shards85ents.small.png)](/assets/2008/02/7shards85ents.png) 7                 | 85                | 595
  [![20 shards](/assets/2008/02/20shards85ents.small.png)](/assets/2008/02/20shards85ents.png) 20                | 85                | 1,700
  100               | 82                | 8,200
  [![400 shards](/assets/2008/02/400shards68ents.small.png)](/assets/2008/02/400shards68ents.png) 400               | 68                | 27,200
  [![1200 shards](/assets/2008/02/1200shards48ents.small.png)](/assets/2008/02/1200shards48ents.png)1,200             | 48                | 57,600
  1,800             | 39                | 70,200
  3,000             | 29                | 87,000
  6,000             | 17                | 102,000
  [![](/assets/2008/02/12000shards10ents.small.png)](/assets/2008/02/12000shards10ents.png) 12,000 | 10                | 120,000
  100,000           | 1                 | 100,000

Above about 200 shards per fan, the shards start getting so thin that
they produce moire effects, and above 10,000 there's some crazy white
artifact starts happening in the middle of the fans. But nevertheless,
the times taken to render these frames show a strong trend.

Fewer fans, each with more shards, results in much higher triangle
throughput - up to **120,000 triangles** per frame. Although it's
exciting to see such high figures, I'd almost rather it wasn't the case.
I'd prefer to create a game with more independent entities wandering
around, regardless of how little graphical detail they could be adorned
with. But there you have it, blame John Carmack. Anyhow, it's clear that
we can deliver sufficient graphical grunt to put together *some sort* of
game. Next time I hope to make a start on putting all these triangles to
good use.

**Update:** For a 500% performance boost when running under Linux,
invoke Python with the -O flag. I can now get 500 fans on screen, each
with 100 triangles, at 30fps. See comments below.

**On to [Part 3 - Some Pretty Flowers...](http://tartley.com/?p=285)**

### Download the source

[![Python
file](/assets/2008/02/doc-python.png)gameloop2.py.zip](http://tartley.com/wp-content/uploads/2008/02/gameloop2py.zip "gameloop2.py.zip")


