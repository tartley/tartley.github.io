---
author: Jonathan Hartley
author_email: tartley@tartley.com
author_login: tartley
author_url: https://www.tartley.com
categories: [TODO]
date: 2020-04-20T13:57:47-05:00
layout: post
published: true
status: publish
tags: []
title: LXD for Development Environments.
---

[@hjwp asked](https://twitter.com/hjwp/status/1249636076660174849):

> I would be interested in seeing some example lxd config files,
> bash command history when creating, etc?

Here goes then.

I have one LXD container running for each nontrivial development project I'm
working on.

```bash
$ lxc ls
+-------------+---------+---------------------+------+-----------+-----------+
|    NAME     |  STATE  |        IPV4         | IPV6 |   TYPE    | SNAPSHOTS |
+-------------+---------+---------------------+------+-----------+-----------+
| devicegw    | RUNNING | 10.44.99.228 (eth0) |      | CONTAINER | 0         |
+-------------+---------+---------------------+------+-----------+-----------+
| ident       | RUNNING | 10.44.99.4 (eth0)   |      | CONTAINER | 0         |
+-------------+---------+---------------------+------+-----------+-----------+
| revs        | RUNNING | 10.44.99.151 (eth0) |      | CONTAINER | 0         |
+-------------+---------+---------------------+------+-----------+-----------+
| siab        | RUNNING | 10.44.99.128 (eth0) |      | CONTAINER | 0         |
+-------------+---------+---------------------+------+-----------+-----------+
| tartley-com | RUNNING | 10.44.99.161 (eth0) |      | CONTAINER | 0         |
+-------------+---------+---------------------+------+-----------+-----------+
```

(Out of the gate we see one source of confusion. "LXD", the daemon, is a
newer project that builds on top of "LXC" the containers. However the user
interface to all the new LXD-goodness is through a command-line called "lxc",
which replaces the older command line tool called "lxd". :-/)

To create a new one:

```bash
$ time lxc launch ubuntu:16.04 -p default -p jhartley demo
Creating demo
Starting demo

real	0m9.593s
```

Once created, they take about 3 seconds to stop and 0.5 seconds to start.

Those "-p" options cause the container to use two *profiles*. They are:

1. The *default* profile, which I've never touched. It's just doing whatever it
   always does.

2. The *jhartley* profile, I created in a one-off step by running a Bash script
   derived from instructions one of my colleagues passed around. I'll describe
   it at the end.

Once a new container is up, we can execute commands directly on it:

    $ lxc exec demo hostname
    demo
    $ lxc exec demo whoami
    root

Or SSH to them using their IP address:

    jhartley@t460 $ lxc ls demo
    +------+---------+---------------------+------+-----------+-----------+
    | NAME |  STATE  |        IPV4         | IPV6 |   TYPE    | SNAPSHOTS |
    +------+---------+---------------------+------+-----------+-----------+
    | demo | RUNNING | 10.44.99.162 (eth0) |      | CONTAINER | 0         |
    +------+---------+---------------------+------+-----------+-----------+
    jhartley@t460 $ ssh 10.44.99.162
    ...
    Warning: Permanently added '10.44.99.162' (ECDSA) to the list of known hosts.
    Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 5.4.0-25-generic x86_64)
    jhartley@demo $

Better than using IP addresses, you can run a DNS server to recognize
`{containername}.lxd` hostnames. (This part is from
[here](https://discuss.linuxcontainers.org/t/a-way-to-resolve-container-lxd-from-host-in-all-cases/3698).)

Find your lxd bridge IPv4 address

    lxc network show lxdbr0

Create file `/etc/systemd/network/lxd.network`:

    [Match]
    Name=lxdbr0

    [Network]
    Address=IPADDR/24
    DNS=IPADDR
    Domains=~lxd

Where IPADDR is the lxdbr0 IPv4 address.

    sudo systemctl enable systemd-networkd
    sudo reboot now

Then:

```bash
jhartley@t460 $ ssh demo.lxd
jhartley@demo $ # \o/
```

One nice thing is that DNS works both from the host and on the containers,
so your services can be configured by default to talk to each other at
SERVICE1.lxd, SERVICE2.lxd. Then running them in containers on your host
they would just find each other. We don't actually do this, but it seems
trivially easy to do. I should ask why we don't.

In practice I wrap up the ssh command with my accumulated foibles:

    jhartley@demo $ whence lssh
    lssh is a function
    lssh ()
    {
        TERM=xterm-color ssh -A -t "$1.lxd" -- "cd $PWD && exec $SHELL -l";
    }

I forget why -A and -t were required. The rest is mostly just to start the
shell on the container in the same directory as I was in on the host. There
is probably a simpler way.

---

The booooooring bits:

When we started the container, we mentioned
[a one-off setup script](assets/2020/setup-lxd-profile.sh).

The script does a few things:

1. Creates a new key pair specifically to SSH to the container.
2. Creates the custom *jhartley* profile, which causes all containers started
   with it to:
   1. Create a new user on the container with user and group ID mapped to
      those of my user on the host, presumably so that file permissions work
      for...
   2. Mount my $HOME directory on the container. Might not always be what you
      want, but works for me right now.
3. Doubtless due to my own misunderstanding somewhere, in order to get working
   IPv4 connections to my containers, I had to disable IPv6 connections to
   them.

