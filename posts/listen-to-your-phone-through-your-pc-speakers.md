<!--
.. title: TIL: Listen to your phone through your PC speakers
.. slug: listen-to-your-phone-through-your-pc-speakers
.. date: 2015-03-15 10:50:09-05:00
.. tags: geek,terminal,til
-->


``` bash
#!/usr/bin/env bash

# Directs audio input (e.g. mic) to audio output (e.g. speakers),
# then sleeps forever. Stops audio redirection when it is killed.
# So, for example, plug your phone into the PC's mic, run 'listen',
# and listen to phone audio through your computer's speakers.
#
# Requires:
# sudo apt-get install pactl # Ubuntu

set -e

module=$(pactl load-module module-loopback)

function cleanup {
    pactl unload-module $module
}

trap cleanup EXIT

sleep infinity
```
