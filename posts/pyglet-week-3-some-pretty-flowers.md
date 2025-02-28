<!--
.. title: pyglet week 3 : Some Pretty Flowers
.. slug: pyglet-week-3-some-pretty-flowers
.. date: 2008-02-25 01:35:33-06:00
.. tags: geek,software,python,graphics,genart,pyglet
-->


This is just a refinement of [last week's
script](/posts/pyglet-week-2-better-vertex-throughput). No massively significant changes,
just a bunch of minor tweaks.

-   The fans are replaced with slightly prettier flowers, with separate
    vertex and color arrays for each one.
-   Running with the python -O flag means we can render 800 flowers at
    30fps, no problem.
-   The camera can now be moved and rotated and zoomed. I just use this
    to subtly zoom in after the screen has filled with flowers
-   I discovered that if I fail to clear the screen before rendering,
    then I inherit the appearance of the desktop as a backdrop. No doubt
    this cannot be relied upon, and presumably doesn't happen on some
    other graphics hardware or operating systems, so YMMV (**Update:**
    yep - it looks CRAZY on Windows unless you uncomment the glClear()
    call). I won't be relying on this trick in future, but for now, on
    my machine at least, it looks like this:

![flowers1](/files/2008/02/screenshot-flowers1.jpg)

![flowers2](/files/2008/02/screenshot-flowers2.jpg)

![flowers3](/files/2008/02/screenshot-flowers3.jpg)

![flowers4](/files/2008/02/screenshot-flowers4.jpg)

![flowers5](/files/2008/02/screenshot-flowers5.jpg)

![flowers6](/files/2008/02/screenshot-flowers6.jpg)

[gameloop2c-flowers.py![Python
file](/files/2008/02/doc-python.png)](/files/2008/02/gameloop2c-flowerspy.zip "gameloop2c-flowers.py")
