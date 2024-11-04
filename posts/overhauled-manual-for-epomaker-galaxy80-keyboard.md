<!--
.. title: Overhauled Manual for Epomaker Galaxy80 Tri-Mode Keyboard
.. slug: overhauled-manual-for-epomaker-galaxy80-keyboard
.. date: 2024-11-03 18:22:45 UTC-06:00
.. tags: manual,hardware,geek,keyboard
-->

Loving the new keyboard, an Epomaker Galaxy80 with Feker Marble White switches.

My requirements are pretty much the same as last time I bough a keyboard:

* Tenkeyless layout, or TKL as it's known, i.e. without a numpad. The kiddo and
  I fit two side-by-side gaming stations at this desk, and the extra
  mouse-swiping space is precious, as is the ergonomics of putting the mouse
  just a few inches closer.
* Standard ANSI layout, to match the other keyboards I commonly use.
* Mechanical, although I'm not experienced enough to know a good one from a bad
  one.
* At least two connections which are easy to switch between, for work and
  personal computers. This one has five, three of which are Bluetooth.
* At least one of those connections should be reasonably low latency, i.e. <5ms,
  which means wired or a dedicated 2.4GHz dongle, not Bluetooth. The Galaxy80
  has both. I'm a long way away from being a pro gamer, but even down here in
  the GamerDad leagues, I seem to be more aware of annoying latency than most
  people are.
* Backlit. I don't especially care about per-key RGB, but that seems to be
  extremely common. Shine-through keycaps would be nice, but these seem to be
  increasingly rare outside of garish gamer-boi cyber-monstrosities, so not a
  big deal.
* Hot-swappable switches. This is the requirement I compromised on last time I
  bought a keyboard, settling for the Logitech G915, which was great, but got
  old after switches started failing. I'm tired of desoldering them and am
  noping out to buy something else, a mere 16 months later.
* Not egregiously incompatible with Linux. It would be hard to find a keyboard
  which doesn't actually work with Linux, but maybe some manufacturer has buried
  some vital configuration detail in badly written Windows-only configuration
  software that doesn't play nice with Wine, etc.
* Without expensive features I don't need, like configurable activation height,
  or OLED screens.

The switches are described as sounding "like marbles clacking", which worried me
that they might be too loud and piercing. But now it's arrived, they are
actually quieter than any other mechanical switch I've had. The sound is deeper
than I expected. Recognizably like marbles, but merged with the sound of
pebbles, and a hint of a wooden xylophone.

I really like it! Although since pulling the trigger I've seen that Reddit
doesn't like Epomaker. I'm just not going to read those posts for now.

As seems traditional with all keyboards, the manual is quite hard to read.
Here's [my overhauled manual](/files/2024/Keyboard-Ecomaker-Galaxy80-tri-mode-mine.pdf), for future reference.

**Update**: The incantations needed to get function keys working the way
you want them to on Ubuntu :eyeroll: etc ([via Reddit](https://www.reddit.com/r/Epomaker/comments/1bte204/galaxy80_cant_use_functionkeys_in_linux/)):

```bash
echo "options hid_apple fnmode=2" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
```

and reboot.

---

