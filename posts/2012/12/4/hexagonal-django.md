<!--
.. title: Hexagonal Django
.. slug: hexagonal-django
.. date: 2012-12-04 14:42:01-06:00
.. tags: Python
.. category: Python
.. link: 
.. description: 
.. type: text
-->


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