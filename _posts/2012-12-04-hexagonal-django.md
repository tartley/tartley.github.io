---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Simeon, author_email: simeonf@gmail.com, author_url: 'http://simeonfranklin.com/',
  content: "I haven't heard of this name for the pattern but I think I've seen it\
    \ in the wild in Django apps. I've recommended in my classes that if your application\
    \ business logic is complicated enough (not just a pretty CRUD interface to a\
    \ database) that you should write your application separately, providing an API\
    \ that can be used independently of any particular application (web, GUI, console).\
    \ That's the same thing, right? \r\n\r\nThis gives you the benefits you've noted\
    \ of being unit-testable, of not having DB calls (or worse, presentation logic)\
    \ mixed in with your business logic, etc.\r\n\r\nSometimes (if your application\
    \ is small) the business logic can all live in form methods (which of course take\
    \ data in and pass data back and don't have to directly talk to the database,\
    \ know anything about html or http, etc). At any event it is a standard piece\
    \ of advice in the Django world that thick views are a bad code smell and your\
    \ business logic should live someplace else.", date: '2012-12-04 18:50:38 -0600',
  date_gmt: '2012-12-04 18:50:38 -0600', id: 67936}
- {author: Wyatt Baldwin, author_email: wyatt.lee.baldwin@gmail.com, author_url: 'http://wyattbaldwin.com',
  content: "At a minimum, I like to create a separately-installable package to contain\
    \ the model (helps enforce keeping Web stuff out, easier to reuse in scripts,\
    \ easier to unit test, etc). This is really easy to do and adds almost no conceptual\
    \ or technical overhead. It also puts in you in a good place to add more architectural\
    \ layers later if you need them without overengineering up front.\r\n\r\nCan the\
    \ Django ORM be installed separately from the rest of Django? (I'm more of a Pyramid/SQLAlchemy\
    \ user, and this level of separation is sort of built in.)", date: '2012-12-04
    19:26:56 -0600', date_gmt: '2012-12-04 19:26:56 -0600', id: 67943}
- {author: Graham King, author_email: graham@gkgk.org, author_url: 'http://darkcoding.net',
  content: "When I've used this architectural pattern with Django, I hit two problems:\r\
    \n\r\n - The admin interface. It uses Django objects, i.e. your storage objects,\
    \ not the objects from your business model. You either need to give up on the\
    \ admin entirely, or put a serious amount of work into over-riding the ModelAdmin's.\r\
    \n\r\n - No state is held in the app server between requests. You have to reload\
    \ and re-create your business objects on every single request. That gets old quickly,\
    \ especially as often the business layer doesn't do a whole lot.\r\n\r\nWhere\
    \ you can maintain state between requests (Java, Go) this works well. Where you\
    \ can't maintain state (Perl, Python, Ruby and other ActiveRecord pattern users),\
    \ I haven't found this pattern to be worth the extra effort.\r\n\r\nI think _in\
    \ principle_ this approach is more correct. We shouldn't build our apps to be\
    \ stuck inside a framework (django) or strictly depend on a specific ORM. In _practice_\
    \ ActiveRecord is good, pragmatic choice for most webapps.\r\n\r\nI'll look forward\
    \ to reading about your experience.", date: '2012-12-04 22:48:02 -0600', date_gmt: '2012-12-04
    22:48:02 -0600', id: 67977}
- {author: Kev Dwyer, author_email: kevin.p.dwyer@gmail.com, author_url: '', content: "I\
    \ first came across this technique in \"Growing Object-Oriented Software, Guided\
    \ By Tests\" (http://www.amazon.co.uk/Growing-Object-Oriented-Software-Guided-Signature/dp/0321503627/ref=sr_1_1?ie=UTF8&amp;qid=1354692166&amp;sr=8-1).\
    \  The book has a Google Group which may have some discussions about this pattern.\
    \  I think there's a place for it in Django apps with a lot of business logic,\
    \ or where data sources not traditional models, e.g. web services.  For simple,\
    \ get-some-data-and-throw-onto-the-page apps it may be over-engineering.\r\n\r\
    \nFrom the point of view of uni testing, the ports and adapters approach definitely\
    \ makes things a lot easier.  I look forward to reading about how you get on with\
    \ this.", date: '2012-12-05 07:39:32 -0600', date_gmt: '2012-12-05 07:39:32 -0600',
  id: 68041}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "There were a bunch of replies to a similar query I posted to python-uk:\r\
    \n\r\nhttp://mail.python.org/pipermail/python-uk/2012-December/002692.html", date: '2012-12-12
    18:16:26 -0600', date_gmt: '2012-12-12 18:16:26 -0600', id: 69346}
- {author: Luke Plant, author_email: L.Plant.98@cantab.net, author_url: 'http://lukeplant.me.uk/',
  content: "I think I would be wary of ideas assume a Java/C# model of typing.\r\n\
    \r\nIn Python, duck-typing (along with applying the law of Demeter) goes a long\
    \ way to providing you insulation from your database backend.\r\n\r\nSo, as far\
    \ as your template is concerned, your Product model instance is just an object\
    \ that has 'name', 'brand', 'image' and 'price' attributes. You can switch it\
    \ for another object with the same attributes without the view/template layer\
    \ needing to change at all.\r\n\r\nAt this point, adding lots of data transfer\
    \ objects to isolate the data from a Django model instance becomes overkill.\r\
    \n\r\n(If, however, your template is looking over \"product.variant_set.all\"\
    , rather than \"product.variants\" for example, you've slightly tied yourself\
    \ to a Django API. I tend to give my Django models attributes and methods that\
    \ give the view/template a simpler interface that is not tied to Django)\r\n\r\
    \nI'm also skeptical of the idea that business logic can be isolated in the way\
    \ suggested in these architectures. Your entire application is your business logic.\
    \ Your database schema is your business logic. You will often have to rely on\
    \ the fact that your database will throw an integrity error for a duplicate row,\
    \ unless you want to reimplement ACID etc.", date: '2012-12-13 12:48:09 -0600',
  date_gmt: '2012-12-13 12:48:09 -0600', id: 69416}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Luke, Thanks for the comment.\r\n\r\nThe concern I'm looking to alleviate\
    \ is with the *direction* of dependencies within the project, and the resulting\
    \ patterns they form (e.g, Do many parts of your project depend upon a component\
    \ is which subject to frequent change? Can substantial portions of your project\
    \ be meaningfully calved off in isolation, to form a library which is shared between\
    \ different applications, or on different flavours of servers.) I agree that duck\
    \ typing is convenient, and am a big proponent of dynamic typing and the benefits\
    \ it brings in general, but I don't understand how it help with this particular\
    \ concern.\r\n\r\nI do agree though, that one weakness of the idea seems to be\
    \ the data transfer objects you reference: One colleague told me about his former\
    \ job at Microsoft Research, where he say many projects are implemented in this\
    \ style. He said that he liked the pattern overall, but if he had to criticize\
    \ then it would be because there is a duplication of fields: In the core business\
    \ objects, and then a redundant-feeling mapping of these fields to database columns\
    \ in the persistence component, and also possibly again in the plumbing between\
    \ them. So I agree that sounds like something to be wary of.\r\n\r\nI don't share\
    \ your skepticism about the goal of isolated business logic. Some respondents\
    \ are telling me they have pulled this off, to a greater or lesser extent. This\
    \ seems like a commonly-espoused goal, and this pattern just seems to be one specific\
    \ method of achieving it. Certainly, the lack of this isolation in some of our\
    \ current projects seems to be hurting us significantly, and it seems worth an\
    \ effort to try and extricate ourselves from the situation.\r\n\r\nI agree with\
    \ you that there must be some decisions to be made about how to balance the enforcement\
    \ of constraints either in the database or in the core business objects, and I\
    \ absolutely confess that I haven't thought through how that will work. But for\
    \ the moment I'm assuming that there will be a relatively sane way of dealing\
    \ with it.\r\n\r\nI'll report back and let you know, whether I'm right or wrong.",
  date: '2012-12-13 15:40:41 -0600', date_gmt: '2012-12-13 15:40:41 -0600', id: 69433}
- {author: James Bennett, author_email: ubernostrum@gmail.com, author_url: '', content: "Agreeing\
    \ with and expanding on Luke's comment, this feels too much like the kind of architecture\
    \ gymnastics people invent when:\r\n\r\n1. They're working within the confines\
    \ of an inflexible statically-typed language (there are flexible statically-typed\
    \ languages, just not C++/Java/C#, which is the world these patterns come from),\
    \ and\r\n\r\n2. Their biggest fear is that they'll completely swap their technology\
    \ stack every six weeks.\r\n\r\nIf you're working in, say, Java, then decoupling\
    \ at all costs can make sense; otherwise, swapping out components can result in\
    \ excessive rewriting as you adjust to new compiler-enforced interfaces, etc.\
    \ But in Python, I'm less convinced of the utility. This has the smell of dependency-injection\
    \ and other hacks which exist solely to work around the type system, and in Python\
    \ if you're working around the type system something else has gone horribly wrong\
    \ already.\r\n\r\nAnd more importantly, the case of actually swapping out major\
    \ components (as in, those which would require you to rewrite significant amounts\
    \ of code due to new interfaces/APIs even in Python) seems to be far, far more\
    \ rare in the real world than it is in the theoretical architecture-astronaut\
    \ world. So while I could perhaps see an argument for decoupling for decoupling's\
    \ sake if that were something a project were doing all the time, my experience\
    \ is that projects don't do this all the time, and in fact rarely do it at all.\
    \ Which means that it's really just re-architecting for re-architecting's sake,\
    \ and YAGNI ends up advising against it.", date: '2013-11-29 04:00:53 -0600',
  date_gmt: '2013-11-29 04:00:53 -0600', id: 492034}
- {author: elliot, author_email: permafacture@gmail.com, author_url: '', content: 'This
    makes me think of having django serve Json to something like ember.js.  I agree
    with Luke that the database structure is business logic.  I think django models
    would best be objects with methods that hide the orm.  Then you could have app
    logic that uses the django models in an ORM ignorant way, and which serves Json
    to the client (Web browser, mobile app, CMD, whatever) which does whatever with
    it.  I''m not sure if this related to the topic, which I am pretty ignorant of.',
  date: '2013-11-30 02:59:31 -0600', date_gmt: '2013-11-30 02:59:31 -0600', id: 495999}
date: 2012-12-04 14:42:01 -0600
date_gmt: 2012-12-04 14:42:01 -0600
layout: post
published: true
status: publish
tags: []
title: Hexagonal Django
wordpress_id: 1404
wordpress_url: http://tartley.com/?p=1404
---

The last few weeks I've been thinking about the architectural pattern
known as [Clean, Onion, Hexagonal, or
Ports'n'Adaptors](http://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html).
I'm curious if many people are applying it in the Django world.

The premise is for your core application entity classes and business
rules to be plain old objects, with no dependencies. In particular, they
are not dependent on the interfaces between your application and
external systems, such as your persistence mechanism, or your web
framework. Instead, external interface components depend upon your core
business objects. This essentially moves the database from the 'bottom'
layer of the old traditional 'three layer architecture', to form a part
of the topmost layer - a sibling with the 'UI.'

For inbound messages (e.g handling a web request) this is
straightforward - Django calls your view code which calls your business
layer, but keep your business layer separate from your Django code, so
it is stand-alone and unit-testable. For outbound messages, such as then
rendering the web page in response, it's slightly more complicated: Your
business logic must pass the result (typically a pure data structure)
back to your web-aware code, but without your business logic depending
on the web-aware component. This requires an inversion of control.

That way, all your business logic can easily be tested in unit tests,
with no mocking required. You still need some end-to-end tests to verify
integration, but you shouldn't need to involve your UI or database in
testing every detail of your business logic.

Also, you can easily switch out your external system interfaces, such as
persistence, to use another RDBMS, another ORM, a NoSQL store, or an
in-memory version for testing Since the core of your application doesn't
have any dependency on these components, it is oblivious to the
change. The business logic, because it doesn't depend on Django, is no
longer riddled with Django's convenient ORM database access.

Same thing goes for switching out your web framework, or calling the
same logic from web UI or web API calls. And again, for switching out
your UI: add a command line application, or a console UI. The core
application logic is unaffected, and your new interface components
contain only the code that is specific to that interface's concerns.

Another side effect is that your web framework, if you're using one,
becomes a peripheral detail which depends upon your core application,
rather than the other way round. Your Django project would become a
subdirectory of your project, rather than dominating your project
directory structure. Since the business logic formerly contained within
it is now elsewhere (in your core business objects) the Django project
is now very thin. Views, for example, are delegations to single
business-layer functions. The Django project now contains just the
web-oriented aspects of your project, as it should.

These ideas all seem like relatively straightforward software
engineering, and I feel a bit foolish for not having been aware of them
all these years. I console myself that I'm not alone.

UncleBob's Ruby Midwest keynote "[Architecture - The Lost
Years](%20http://www.confreaks.com/videos/759-rubymidwest2011-keynote-architecture-the-lost-years)"
attributes one source of this idea to Ivar Jacobsen's 1994 book [Object
Oriented Software Engineering : A Use Case Driven
Approach](%20http://www.amazon.co.uk/Object-oriented-Software-Engineering-Approach-Press/dp/0201544350)
(2nd-hand hardbacks cheap on Amazon.)

I see a few people applying these ideas to Rails, but are many people
out there doing this in Django? I plan to refactor a small vertical
slice of our monster Django app into this style, to try and prove the
idea for myself.
