FROM ubuntu:16.04

# modified from http://gernotklingler.com/blog/howto-get-hardware-accelerated-opengl-support-docker/

MAINTAINER Naveen Malik <jewzaam@gmail.com>

# initial update and graphics stuff
RUN apt-get update && apt-get install -y mesa-utils xserver-xorg-video-all && apt-get clean

# slic3r dependencies
RUN apt-get install -y build-essential libgtk2.0-dev libwxgtk3.0-dev libwx-perl libmodule-build-perl git cpanminus libextutils-cppguess-perl libboost-all-dev libxmu-dev liblocal-lib-perl wx-common libopengl-perl libwx-glcanvas-perl libtbb-dev libxmu-dev freeglut3-dev libwxgtk-media3.0-dev libboost-thread-dev libboost-system-dev libboost-filesystem-dev && apt-get clean
# ^ https://github.com/alexrj/Slic3r/wiki/Running-Slic3r-from-git-on-GNU-Linux#ubuntu-1604


# get source
RUN git clone https://github.com/alexrj/Slic3r.git

# build: https://github.com/alexrj/Slic3r/wiki/Running-Slic3r-from-git-on-GNU-Linux#build-slic3r

RUN cd Slic3r && export LDLOADLIBS=-lstdc++ && perl Build.PL
#RUN cd Slic3r && touch utils/glversion.txt && touch src/utils/glversion.txt
RUN cd Slic3r && perl Build.PL --gui

CMD /Slic3r/slic3r.pl --gui

