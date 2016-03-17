youtube-to-vlc
==============

youtube-to-vlc is a one page bash script that serves only one
purpose: Turning a youtube URL like

https://www.youtube.com/watch?v=.......&t=7m19s

into a call to vlc. Note that vlc doesn't work with such URLs. The 
script execs the following command

vlc https://www.youtube.com/watch?v=....... --start-time=439
