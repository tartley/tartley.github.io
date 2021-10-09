<!--
.. title: TIL: Download audio from YouTube
.. slug: til-create-mp3-from-youtube-video
.. date: 2021-05-13 11:18:33 UTC-05:00
.. tags: linux,music,til
.. type: text
-->

Install ffmpeg:

```bash
sudo apt install ffmpeg
```

Install `youtube-dl`, a tool to download YouTube videos. Using `apt` installs a
version that's too old to work, so:

```bash
pip install --user pipsi
pipsi install youtube-dl
```

## The best way

Tell youtube-dl to download the audio:

```bash
youtube-dl -x --audio-format=best URL
```

Where
* `-x` downloads just the audio part.
* Audio format defaults to 'best', but can be "aac", "flac", "mp3", "m4a",
  "opus", "vorbis", or "wav".

As I understand it, it downloads whatever audio format YouTube provides,
then converts it locally using ffmpeg, so you're not really getting the
benefit of those lossless formats - mp3 is fine for
[my](https://www.youtube.com/watch?v=VSJWvzLuGz8)
[needs](https://www.youtube.com/watch?v=nyU1Pt2IXyE).

## My previous inferior way

This method is worse because it downloads the whole video file before
extracting audio locally, and the download gets throttled by youtube in some
way, which of late is very slow indeed.

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

