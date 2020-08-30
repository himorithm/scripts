#!/usr/bin/bash
gst-launch-1.0 -vt souphttpsrc location='http://192.168.1.12:4747/video' is-live=true ! multipartdemux ! decodebin2 ! v4l2sink 



