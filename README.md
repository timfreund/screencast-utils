# Screencast Utilities

## Assumptions

1. You want to capture or stream screencasts
2. You use linux
3. You use [JACK](http://www.jackaudio.org/) to capture audio
4. You have the following software installed
  * jack_connect
  * obs
  * wmctl
  * Xephyr

## Included Utilities

### obs-start.sh

[Open Broadcaster Software](https://obsproject.com/) is an open source
tool for capturing video and recording or streaming it.  It is simple
to start, but my configuration requires additional steps once OBS is
running.

First, the window is moved outside of my capture area.  I don't need OBS
to capture OBS.

Second, the system capture_1 device is connected to both of the OBS
Jack Input ports.  Why both?  Because I have one microphone but I want
audio in both channels of the recording.

### xephyr-init

[Xephyr](https://en.wikipedia.org/wiki/Xephyr) is a nested display
server: it lets you run X inside of X.

Why is this useful for screencasting?  Among other uses, I can run a
slide presentation inside a Xephyr window of 1920x1080 and capture it
without the need to resize or crop the capture before uploading.

`xephyr-init` starts xephyr, moves it to the lower right corner of the
screen, starts metacity and exports a new DISPLAY variable so that any
commands in the current shell will open in the newly created Xephyr
display server.

```
$ . xephyr-init
$ # Xephyr window is created and repositioned
$ xterm &
$ # xterm is now running in the Xephyr display server
```

It also creates a function that you can call to reposition and resize
the xephyr window:

```
$ xephyr-position
```

## Next Steps

This is good enough for now and for me, but it isn't useful for others
without customization.  Regardless, it's available, and if folks are
interested we can start to mold it into something that is useful out
of the box.
