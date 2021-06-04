<!--
.. title: Opengl Shading Language
.. slug: opengl-shading-language
.. date: 2009-05-11 22:19:26-05:00
.. tags: media,book,non-fiction,software,graphics
.. link: 
.. description: 
.. type: text
-->


<span style="float: left">
![OpenGL Shading Language cover](/files/2009/05/opengl-shading-language.jpg)
</span>

*by Randi J. Rost (2nd Edtion, 2006)*

I've had a hobbyist interest in computer graphics for years, but had
avoided the technology of *shaders* these last few years, thinking that
they were just another layer of complexity which I didn't need to embark
upon while I was still getting to grips with the standard OpenGL API.

With hindsight, I was wrong. I was recently cajoled into getting on
board after talking to [Mike Fletcher](http://blog.vrplumber.com/)
(creator of [PyOpenGL](http://pyopengl.sourceforge.net/)) after his talk
at PyCon, and now I feel as if I should have read this book years ago.
Shaders solve many of the problems I've been happily messing with for
ages, in ways that are easier to implement, more powerful, and more
performant.

I [whined about the Red Book](/opengl-programming-guide-6th-ed), but this
"Orange" OpenGL Shading Language book is brill - just what I needed.
Incisive without being overly terse, practical, and once it got into the
chapters about applications of multidimensional Perlin noise it got me
all hot'n'bothered about computer graphics again. Yay my inner geek!

**Update:** I started this book fascinated by using vertex shaders to
transform geometry on the fly, with little interest in the superficial
fragment shaders used to decorate the rendered surfaces with pretty
images or lighting effects. Since finishing it, this has reversed: I've
become obsessed with noise and Fourier transforms and all the
paraphernalia of fragment shaders, imagining relatively simple fragment
shader that could, I believe, provide a surface with infinite levels of
detail. I dreamed about my old university 'Signals & Systems' type
lectures. Uncanny.

**Update2:** Ohdear. Once I started trying to write anything more than
the most trivial of my own shaders, I ran into an unexpected problem. My
shaders just wouldn't link. I couldn't figure out why. The book was no
help. *Google* was no help. The error messages *certainly* weren't any
help (thanks ATI.) Eventually I realised that the 'built-in' noise
functions which are part of the OpenGL shader language are simply not
implemented by the vast majority of graphics card manufacturers - you
have to roll your own. Which is not a major deal-breaker, but what
*is* disappointing is that the OpenGL Shader Language book makes
absolutely no mention of this in any of the chapters plural in which it
lovingly describes the built-in noise functions, along with their
characteristics and uses. Perhaps I spoke too soon when praising the
book. Maybe it is another case of idealistic OpenGL theory that has
something of a disconnect with real world development. Maybe the book
was written before this situation came to pass - regardless, it's no
bloody use to me.

Rating (oh, how I love my new rating system. Check this one out:)

10/10 if you want to learn *the theory of* how to use the OpenGL shader
language.

0/10 if you don't.

<br style="clear: both" />
