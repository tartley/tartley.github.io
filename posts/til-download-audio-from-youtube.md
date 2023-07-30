<!--
.. title: TIL: Download audio from YouTube
.. slug: download-audio-from-youtube
.. date: 2021-05-13 11:18:33 UTC-05:00
.. tags: geek,linux,music,til,youtube,command-line
-->

For the sort of weirdos who still host their own music files, but aren't
preciously audiophile about it. Aaaaand also I'm wording this with the
assumption you're a Linux, command-line and Python nerd.

Sometimes it's a video which is explicitly Creative Commons. Other times, it's
a friend's otherwise unpublished non-commercial thing. Or maybe it's a massive
commercial product from a famously litigious corporate behemoth, but you've
already bought the soundtrack and you just really *really* wish you had a
version which had the exact same sound effects or dialog or arrangement that
you or your child has grown to love from obsessive movie re-watches.

I've got ya.

## One-off setup:

Install [*ffmpeg*](https://ffmpeg.org/), a venerable open-source command-line
video/audio conversion tool.

```bash
sudo apt install ffmpeg
```

Next, install [*pipx*](https://pypa.github.io/pipx/), a tool to install
commmand-line tools that are distributed as Python packages:

```bash
python3 -m pip install --user pipx
python3 -m pipx ensurepath
```

Finally, use pipx to install the [*youtube-dl*](https://youtube-dl.org/), an
oft-sued but never vanquished tool to download YouTube videos. (We're using
the Python package because the apt package is too old to work):

```bash
pipx install youtube-dl
```

## Goal fulfillment

Here, download your precious audio:

```bash
youtube-dl -x --audio-format=best URL
```

Where:

* `URL` is the encoded version of the video URL (i.e. like "youtu.be/XXX"),
  obtained by hitting the 'share' button on the YouTube page.
* `-x` requests just the audio part, with no video.
* While `--audio-format=best` is ostensibly the default setting, meaning
  YouTube decides which format to send, using `-x` seems to fail if we don't
  specify this explicitly. Alternatively, you can explicitly request "aac",
  "flac", "mp3", "m4a", "opus", "vorbis", or "wav". As I understand it, YouTube
  will only send the requested format if the uploader provided it. If they
  didn't then we get whatever YouTube provides and then convert it locally
  using ffmpeg. So you sometimes won't be getting the benefit of those lossless
  formats.

But mp3 works well enough for [my](https://www.youtube.com/watch?v=VSJWvzLuGz8)
[needs](https://www.youtube.com/watch?v=ENVIoR2f-Qgh).

Alternatively, for playlists:

```bash
youtube-dl -x --audio-format=best --yes-playlist -i URL
```

Where:

* `--yes-playlist` / `--no-playlist` chooses which to download if the URL you
  provide is both a playlist and a video.
* `-i` ignores errors, so one bad track in the playlist doesn't stop the whole
  thing.

## My previous inferior way

This method is worse because it downloads the whole video file before
extracting audio locally, and the download gets throttled by YouTube in
some way, which of late is very slow indeed, i.e. substantially slower
than watching the video.

Download the video from YouTube:

```bash
youtube-dl URL
```

This results in a webm file. I have no idea what that is, and am relieved
to discover that converting it into an mp3 requires just:

```bash
ffmpeg -i MyVideoFile -vn MyAudioFile.mp3
```

Where `-vn` disables video in the output.

---

### Changelog

* 2023/02/14: Wide-ranging rewrite of prose to enliven, enlink, and clarify.
* 2023/02/14: Swapped use of [*pipsi*](https://github.com/mitsuhiko/pipsi/)
  tool, last released 2015, for *pipx*, which is more useful, well-maintained
  and popular.
* 2022: Added "Goal fulfillment" section, initially called "The Best Way", and
  deprecated the previous method under "My previous inferior way".

