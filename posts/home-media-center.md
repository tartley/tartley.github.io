<!--
.. title: Home media center
.. slug: home-media-center
.. date: 2009-08-24 13:02:42-05:00
.. tags: geek,hardware,media,networking
-->

I just bought a
[NetGear ReadyNas Duo](http://www.dabs.com/products/netgear-readynas-duo--2-bay----no-drives-included-5063.html)
to connect hard drives to my home network, to stream movies and the like
to our fabulous Xbox Classic media center. In the process of
researching, I was wondering whether the kind of hard drive connection
matters. I mean, if you plug USB hard drives into a device like that,
does it run fast enough to stream one or more movies simultaneously? How
many simultaneous movies or audio streams would your average home
ethernet carry? My first stab at answering these questions are below.

On the left are various network and hard drive connection technologies.
On the right are various uses to which I might want to put them. You
can't use a slower connection (eg. bluetooth) to drive a faster usage
(eg. blu-ray quality movies). Centre column is the data rate in megabits
per second (Mb/s):

 Channel              | Bandwidth<br/>(Mb/s) | Media
 ---------------------|---------------------:|-----------------------------
 EDGE mobile phone    |                  0.2 |
                      |                  0.3 | CD audio
 Bluetooth1           |                  0.7 |
                      |                  1.3 | Minimal video
 Bluetooth2           |                  2.1 |
 Wifi 802.11b         |                  4.5 |
                      |                  5.0 | DVD mpeg-2 quality
 ADSL1                |                  8.0 |
 Ethernet 10baseT     |                 10.0 |
 USB1                 |                 12.0 |
                      |                 15.0 | HDTV video (from 8 to 15)
 ADSL2+ ⭐️            |                 24.0 |
 Cable modem          |                 30.0 |
                      |                 40.0 | Blu-ray disc
 Wifi 802.11g         |                 54.0 |
 Firewire800 act      |                 65.0 |
 Ethernet 100baseT ⭐️ |                100.0 |
 PCI                  |                133.0 |
 USB2 actual          |                240.0 |
 Firewire 400 theo    |                400.0 |
 USB2 theoretical     |                480.0 |
 Wifi 802.11n         |                600.0 |
 Firewire 800 theo    |                800.0 |
 Seagate Barracuda ⭐️ |                960.0 |
 Ethernet gigabit     |              1,000.0 |
 SATA-150 theo        |              1,500.0 |
 SATA-300 theo        |              3,000.0 |


⭐️ = my setup

I'm assuming that I don't have gigabit ethernet, because I've never paid
it any attention in the past. Judging from the above, my 100BaseT should
be more than adequate, but will be the weakest link. So that'll be the
first thing I look at if streaming seems sub-par. Coolio!

**Update:** Everything works swimmingly. I've had no problem with
streaming speeds. Problems *have* occurred with some .avi files which
appeared to have invalid interleave cross-stream differential parity (or
something) and efforts to reverse their polarity were to no avail
(transcoding software generally wouldn't even read the files!) A quick
visit or two to MiniNova fixed all that.
