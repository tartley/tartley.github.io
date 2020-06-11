<!--
.. title: A Guide to GIT using spatial analogies
.. slug: a-guide-to-git-using-spatial-analogies
.. date: 2010-12-15 14:40:14-06:00
.. tags: Python,Software
.. category: Python
.. link: 
.. description: 
.. type: text
-->


Some developers find Git takes a little getting used to, claiming that
it is conceptually convoluted compared to other distributed version
control systems. I used to number myself amongst them.

Happily, I've found that a couple of simple spatial analogies have made
me proficient and fluent in using Git's command-line interface.

One of the things that tripped me up as a novice user was the way Git
handles **branches**. Unlike more primitive version control systems, git
repositories are not linear, they support branching, and are thus best
visualised as trees, upon the nodes of which your current commit may add
new leaf nodes. To visualise this, it's simplest to think of the state
of your repository as a point in a high-dimensional 'code-space', in
which branches are represented as n-dimensional membranes, mapping the
spatial loci of successive commits onto the projected manifold of each
cloned repository.

![Branches as n-branes](/files/2010/12/I1546manifold.png "I1546manifold")

**Update:** There is, of course, a [fabulously insightful
commentary](http://www.reddit.com/r/programming/comments/embdf/git_complicated_of_course_not_commits_map_to/)
on reddit.

**Update:** Thanks folks. You've made my usual one or two hundred daily
visitors look kinda paltry:

![spike in daily traffic graph](/files/2010/12/daily-traffic.png "daily-traffic")