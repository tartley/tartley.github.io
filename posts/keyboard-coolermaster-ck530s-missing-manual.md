<!--
.. title: Keyboard CoolerMaster CK530's Missing Manual
.. slug: keyboard-coolermaster-ck530s-missing-manual
.. date: 2021-07-23 13:41:50 UTC-05:00
.. tags: hardware,keyboard,manual
.. type: text
-->

I have a
[CoolerMaster CK530](https://www.coolermaster.com/catalog/peripheral/keyboards/ck530/)
mechanical keyboard, which I love. It might have come with a small printed
manual, but if it did, I no longer have it, and I'm failing to find one online.
Here's are some things I've gleaned from experimentation.
If there's a manual I've overlooked, or if you have corrections,
[let me know](https://twitter.com/tartley).

The [Quickstart guide](https://coolermaster.egnyte.com/dl/8NuIc843wQ/?)
provides a list of key strokes, but no explanations. I've reproduced
the table here, with tweaks for understandability, and added more descriptions
below.

|   |   |
| ------------- | ------------------------------------------------------ |
| Select a mode <br /> |   |
| `fn + F5`     | Cycle modes.
| `fn + F8`     | Demo (automatically cycles through modes).
| Tweak mode <br /> |   |
| `fn + F1`     | Cycle 8 color variations of the current mode.
| `fn + F2`     | Red level 0-9.
| `fn + F3`     | Green level 0-9.
| `fn + F4`     | Blue level 0-9.
| `fn + F6`     | Foreground color. (See [below](#foreground-and-background-colors).)
| `fn + F7`     | Background color.
| `fn + Up`     | Faster.
| `fn + Down`   | Slower.
| `fn + Left`   | Forwards.
| `fn + Right`  | Backwards.
| `fn + F10`    | In "custom" mode, define color of each key.
| Profiles <br /> |   |
| `fn + Esc`    | Default profile
| `fn + 1`      | Profile 1 (see mnemonic "P1" - "P4" on sides of these keys)
| `fn + 2`      | Profile 2
| `fn + 3`      | Profile 3
| `fn + 4`      | Profile 4
| `fn + r`      | Reset current profile to default appearance. (Hold 3 secs.)
| `fn + e`      | Reset all profiles to default appearance. (Hold 3 secs.)
| Macros <br /> |   |
| `fn + F11`    | Record a macro
| `fn + F12`    | Delete macro
| `fn + PrtSc`  | Single
| `fn + ScrLk`  | Infinite loop
| `fn + Pause`  | Repeat
| Media <br /> |   |
| `fn + Ins`    | Play / pause
| `fn + Home`   | Next track
| `fn + Del`    | Stop
| `fn + End`    | Previous track
| `fn + PgUp`   | Volume up
| `fn + PgDown` | Volume down
| Lock <br /> |   |
| `fn + F9`     | Cycle unlocked(off) / lock windows key(red) / lock whole keyboard(green)

<br />

Many of these are self-explanatory. For the rest:

## Using modes

`fn` is the "coolermaster" key, on the bottom row key between right Windows and
right Ctrl.

When holding `fn`, several keys might light up, depending on the current
mode:

* `ESC/1/2/3/4` - one of these keys flashes white to show which profile
  (see [below](#profiles)) is currently in use.
* If the current mode allows you to select a color to use, then `F2/F3/F4`
  will light up to show the currently selected color's levels of
  red/green/blue.
* If the current mode allows *two* colors to be set (foreground & background),
  then one of `F6/F7` will flash white, to show which is currently affected. (See [below](#foreground-and-background-colors).)

Pressing `fn + F5` cycles through:


| Mode                       | Foreground | . Background | . Reactive. |
| -------------------------- |:----------:|:------------:|:-----------:|
|  1. All off                |            |              |             |
|  2. Static (all one color) | ✅         |              |             |
|  3. Rainbow wave           | ✅         |              |             |
|  4. Crosshair              | ✅         | ✅           | ✅          |
|  5. Reactive fade          | ✅         | ✅           | ✅          |
|  6. Custom (see [below](#custom-mode)) | ✅         | ✅           |             |
|  7. Stars                  | ✅         | ✅           |             |
|  8. Rain                   | ✅         | ✅           |             |
|  9. Color cycle            |            |              |             |
| 10. Breathing              | ✅         |              |             |
| 11. Ripple                 | ✅         | ✅           | ✅          |
| 12. Reactive punch         |            |              | ✅          |
| 13. Arcing                 | ✅         | ✅           | ✅          |
| 15. Fireball               | ✅         | ✅           | ✅          |
| 16. Tornado (color spin)   |            |              |             |
| 17. Reactive tornado       |            |              | ✅          |
| 18. Water ripple           | ✅         | ✅           | ✅          |
| 19. Snake                  |            |              | ✅          |

<br />

Modes marked "reactive" react to keypresses. Mostly this lights up a pattern
around the pressed key. In the case of "snake", you can play using the arrow
keys.

<span id="foreground-and-background-colors" />

## Foreground & background colors

Many of the modes have a foreground effect that you can change the color of.
For example, in the *all-one-color* mode (officially called "static")
you can select the color with which all keys are lit, using `fn + F2/F3/F4`.

Some of the modes also have a second color, the background, that you can set
separately. You can see if a mode offers this by selecting the mode and holding
`fn`. If this mode offers two settable colors, then either `F6` or `F7` will
flash white, to show you which one you are currently setting.

Press `fn + F6/F7` to choose foreground or background,
then use `fn + F2/F3/F4` to set it.

<span id="custom-mode" />

## Custom mode

Custom (mode #6 above) lets the user assign a different color to each key.

1. First, cycle through modes using `fn + F5` until you reach custom mode.
   It can be tricky to identify when you've reached it. Use the list of modes
   above to help.
2. While in custom mode, press `fn + F10` to edit key colors.
3. Select a color using `fn + F2/F3/F4`.
4. Press all the keys you want lit in the selected color. Pressing the same key
   again turns it unlit.
5. Repeat steps 3 & 4 for other color/key combinations.
6. Finally, save to your current profile (see [below](#profiles)) by holding
   `fn` and pressing your current profile key (whichever of `Esc/1/2/3/4` is
   flashing white.)

Some wrinkles:

I can't manage to set a color for the FN key itself, which always appears unlit
in this mode.

The caps lock key is unlit in this mode, unless caps lock is on.
Similarly, scroll lock seems to always be unlit for me in this mode,
although it is lit in other modes.

When you try to assign a color to whichever one of `Esc/1/2/3/4` is lit white,
to indicate the active profile, then nothing visible happens, but it is
working. You have to save (step 6 above).
Then you can see whether you successfully assigned the color,
or pressed the key one too many times and left it unlit.

While editing key colors, if you wait, without exit/saving, pressing nothing
for a minute or so, then key color editing times out, cancelling all your
changes since step 2.

<span id="profiles" />

## Profiles

There are five "profiles", each of which can be used to save the current
state of the keyboard.

The profiles are accessed using `fn + 1/2/3/4/Esc`. `Esc` is the "default"
profile. Current keyboard settings (e.g. illumination mode and customized
colors) can be saved to one of the five profiles, and then loaded back later.
Are macros stored in a profile? Don't know.

The current profile is shown when you hold `fn`, by one of `1/2/3/4/Esc`
flashing white. While keeping FN pressed:

* Pressing the flashing profile key will save the keyboard state to your
  current profile.

* Pressing any of the other profile keys will LOAD that profile,
  losing the current keyboard state.

Hence, to save changes to an arbitrary profile, you need to select that
profile *before* making the changes.

When turning the keyboard on (ie. plugging the USB cable into a computer),
the active profile will be whichever one was last active.

