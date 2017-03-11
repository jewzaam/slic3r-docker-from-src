FROM fedora:25

MAINTAINER Naveen Malik <jewzaam@gmail.com>

RUN dnf update -y && dnf install -y git curl gcc-c++ \
    boost-devel perl-Wx perl-OpenGL perl-PAR perl-PAR-Packer \
    perl-Module-Build perl-App-cpanminus perl-Moo \
    perl-Math-PlanePath perl-Boost-Geometry-Utils \
    perl-Math-ConvexHull perl-Math-Geometry-Voronoi perl-parent \
    perl-Growl-GNTP perl-Class-XSAccessor perl-XML-SAX-ExpatXS \
    perl-Math-ConvexHull-MonotoneChain perl-ExtUtils-XSpp \
    perl-ExtUtils-CppGuess perl-ExtUtils-Typemaps-Default \
    perl-Capture-Tiny perl-Test-Base perl-Test-Differences \
    perl-Text-Diff perl-Module-Build-WithXSpp libXmu-devel \
    libXi-devel freeglut-devel perl-Alien-wxWidgets perl-Wx-GLCanvas \
    xorg-x11-server-Xvfb xdotool xorg-x11-apps && \
    dnf clean all
RUN git clone https://github.com/alexrj/Slic3r.git
RUN cd Slic3r && perl Build.PL 
RUN dnf install -y perl-CPAN && dnf clean all 

ENV DISPLAY :0

RUN cd Slic3r && touch utils/glversion.txt && touch src/utils/glversion.txt
RUN cd Slic3r && cpan -i OpenGL
RUN cd Slic3r && perl Build.PL --gui

CMD /Slic3r/slic3r.pl --gui

GLUT=%d\nVERSION=%s\nVENDOR=%s\nRENDERER=%s\nEXTENSIONS=%s\n
3

