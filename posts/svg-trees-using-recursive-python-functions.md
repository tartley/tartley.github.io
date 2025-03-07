<!--
.. title: SVG Trees using recursive Python functions
.. slug: svg-trees-using-recursive-python-functions
.. date: 2025-02-28 11:10:27 UTC-06:00
.. tags: geek,software,creative,graphics,genart,svg,python
-->

Inspired by a woodland hike under the first blue skies we've seen this year, I
got home and showed the kiddo how to draw an SVG tree with recursive functions
in Python.

At first the generated shape looked kinda lumpy and uninspiring, but it did
demonstrate the principle. We were thinking of calling it a day, but I did a
little bit of tweaking on parameters to control how each branch differs in
length and direction from its parent. Suddenly, the generated shape really came
alive, and started to look a lot more like the trees we'd seen on our hike that
afternoon.

![Silhouette of tree against a blue sky, drawn by a Python program](/files/2025/tree-art.lossy.webp)

This image uses a recursion depth of 18, yielding 2^18 twigs, i.e. 250,000,
which generates a 100MB SVG file. This takes about ten seconds to generate, and
another ten to display in an SVG viewer. Alternatively, I can convert the SVG to
a lossy webp, as displayed here, which is only 280kB and displays instantly.

Pushing the generation to greater recursion depth makes my SVG viewer and
conversion tools start to stutter and barf. Presumably I could be smarter about
the SVG I generate -- maybe generating the outline of the tree as points on
fewer, more complex polygons, instead of a polygon for each branch segment? No
matter, the artifact is the thing here, and it's done now.

Source is at [https://github.com/tartley/tree-art](https://github.com/tartley/tree-art).

