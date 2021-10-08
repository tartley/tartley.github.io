<!--
.. title: TIL: Create mp3 from YouTube video
.. slug: til-create-mp3-from-youtube-video
.. date: 2021-05-13 11:18:33 UTC-05:00
.. tags: linux,music,til
.. category: 
.. link: 
.. description: 
.. type: text
-->

Install `youtube-dl`, a tool to download YouTube videos. Using `apt` installs a
version that's too old to work, so:

```bash
pipsi install youtube-dl
```

Download the video from YouTube:

```bash
youtube-dl https://www.youtube.com/watch?v=nyU1Pt2IXyE
```

This results in a webm file. I have no idea what that is, and am relieved
to discover that converting it into an mp3 requires just:

```bash
ffmpeg -i MyVideoFile.webm -vn MyAudioFile.mp3
```

Where `-vn` disables video in the output.

