<!--
.. title: OpenGL Draw API Visualised
.. slug: opengl-draw-api-visualised
.. date: 2010-03-20 13:15:54-05:00
.. tags: geek,python,software,graphics
.. link: 
.. description: 
.. type: text
-->


To help me grok and remember the OpenGL 3.3 draw API, I drew them in a
diagram. I hope this will help me see at a glance what I can and can't
achieve with each function call.

![OpenGL array draw calls](/files/2010/03/opengl-draw-calls.png)

I haven't annotated any of the parameter types. These days I tend to be
calling these functions from Python, so generally only care about the
values. Interestingly, the most recent additions to the API, such as
`glMultiDrawElements`, feature parameters such as
'`const void ** indices`'. Apparently the OpenGL Architecture Review
Board has also decided that they also no longer care about the types
either. Wise choice. :-)

**Updatate:** I wanted to publish this diagram as SVG, but apparently
these days that works in every browser except IE, surprise surprise.
