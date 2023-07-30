<!--
.. title: Stretching pyglet's Wings
.. slug: stretching-pyglets-wings
.. date: 2008-09-08 22:25:36-05:00
.. tags: geek,python,software,graphics,presentations
-->


![](/files/2008/09/pacman.png)

I'm excited to be giving a talk at PyCon UK next weekend about creating
OpenGL programs in Python, using the graphics and games library
[pyglet](http://pyglet.org/). I'm still working feverishly on the
presentation. This post is to be a permanent URL for the content,
downloadable demos and YOUR comments, once PyCon is over.

See y'all there.

**Update v1.0**: The [presentation
slides](http://tartley.com/files/stretching_pyglets_wings/presentation.zip)
are online, as is the [demo source
code](http://tartley.com/files/stretching_pyglets_wings/stretching_pyglets_wings-1.3.zip).

**Update v1.1**: Fixed a bug using batches of vertex lists. (they don't
work with triangle fans, and they need a duplicated first and last
vertex in each list to delineate primitives.) Rendering speed is still
awful using graphics.draw, vertex\_lists and batches though. I'm chasing
that up next.

**Update v1.2:** Fixed some of the performance problems, demo 6's
batches of vertex lists are now the fastest way to render, which is the
expected result. Still curious why calls to pyglet.graphics.draw() are
slower than pyglet.gl.glvertex() though.

**Update v1.3**: Added demo 9 which creates a maze with ghosts wandering
within it. The entire maze is rendered in a single batch.draw() call.
Innumerable other improvements throughout.
