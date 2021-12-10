<!--
.. title: Creating Animated Meme GIFs on the Command-Line
.. slug: creating-animated-meme-gifs-on-the-command-line
.. date: 2021-12-08 15:32:10 UTC-06:00
.. tags: til,terminal,linux,video,image
-->

Got sick of navigating the limitations of various online services to create
animated gif memes, finally figured out how to do it manually. Not a universal
process, just what worked for my situation. (Which is Ubuntu 21.10, "Impish".)

All of of the ffmpeg invocations could probably be combined into one, but I
show the commands as I used them, as I was figuring each step out.

### 1. Download a video

Starting from a video on YouTube:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/6-gJMs6DwuE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<p />

To download this locally,
[install `youtube-dl`](https://github.com/ytdl-org/youtube-dl),
hit the YouTube *share* button to grab the video's encoded URL,
and:

```
youtube-dl https://youtu.be/6-gJMs6DwuE -o Ash.mp4
```

This gives me an 850KB .mp4 video file.

### 2. Split

I only want the final few seconds. To remove the start of the video,
keeping from 6.5 seconds until the end:

```
ffmpeg -hide_banner -i Ash.mp4 -acodec copy -vcodec libx264 -ss 00:00:06.5 Ash-split.mp4
```

Args to ffmpeg are position sensitive. Specifying '-ss' (to split the file)
before the input ('-i') can't create the split at an accurate location, since
it has to guess whereabouts in the file the given timestamp will occur. But
putting it after the input (as done here) means it can split accurately on the
given timestamp, since the file has been processed by the time this arg gets
actioned, so accurate timestamp/frame conversion is known, at the cost of
having had to process even the parts of the video that are then discarded.

Vcodec of libx264 is specified because, according to stackoverflow,
"[scenes in mp4 are broken](https://stackoverflow.com/questions/5651654/ffmpeg-how-to-split-video-efficiently#comment85070704_13289426)", whatever that means,
and specifying "copy", as most people do, gives me an output with no video,
only audio.

This results in a three second, 217KB .mp4 video file. (the following is just an
image of it).

![ash-split.webp](/files/2021/ash-split.webp)

### 3. Crop

To crop out the black bars from the top and bottom:

```
ffmpeg -hide_banner -i Ash-split.mp4 -vf 'crop=iw:365' Ash-split-crop.mp4
```

Here, we crop it to the input width "iw", and 365 high. In the absense of
any offset ordinates for the crop, ffmpeg defaults to centering them, so this
365 pixels are taken from the (spatial, vertical) middle of the video, which is
exactly what we want.

This results in a three second, 220KB .mp4 video file.

![ash-split-crop.webp](/files/2021/ash-split-crop.webp)

## 4. Resize and convert to gif

```
ffmpeg -hide_banner -i Ash-split-crop.mp4 -vf 'scale=512:-1' Ash-split-crop-resize.gif
```

This results in a grainy-but-passable three second 750KB animated .gif:

![ash-split-crop-resize.gif](/files/2021/ash-split-crop-resize.gif)

The file size can be smaller, if you care, most easily by splitting a shorter
video clip, reducing the frame rate, or reducing the 'scale' in this step.

Alternately, this could be done using ImageMagik's 'convert', but the result
of that was a very large (10MB) file and played very slowly, and I wasn't
immediately sure how to fix that.

## 5. Add text

Using Imagemagik's 'convert':

```
convert \
    Ash-split-crop-resize.gif \
    -coalesce \
    -font impact -pointsize 36 -fill white -stroke black -strokewidth 2 \
    -gravity north -annotate +0+0 'I can''t lie about your chances, but' \
    -gravity south -annotate +0+0 'you have my sympathies' \
    -layers Optimize \
    Ash-split-crop-resize-text.gif
```

The '-coalesce' option removes all the .gif optimizations, then we apply the
text labels, then the '-layers' option re-applies optimizations. Without this
dance, the text is all twitchy and messy.

Voilà. Imagine sending it to a co-worker who is taking on a difficult task,
like making changes to that thorny section of the codebase that nobody likes:

![ash-split-crop-resize-text.gif](/files/2021/ash-split-crop-resize-text.gif)


