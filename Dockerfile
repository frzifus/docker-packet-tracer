FROM ubuntu:16.04

MAINTAINER frzifus benne@klimlive.de

RUN apt-get update && apt-get install -y tar wget xauth libqt5webkit5 libqt5xml5 libqt5multimedia5 libqt5script5 libqt5scripttools5

RUN export uid=1000 gid=1000 \
  && mkdir -p /home/pt \
  && echo "pt:x:${uid}:${gid}:pt,,,:/home/pt:/bin/bash" >> /etc/passwd \
  && echo "pt:x:${uid}:" >> /etc/group \
  && chown ${uid}:${gid} -Rv /home/pt \
  && wget "https://archive.org/download/pt711/PacketTracer7.1.1ForLinux64Bit.tar" -O  /pt.tar  \
  && tar -xvf /pt.tar -C /home/pt/ \
  && sed -i s/"read.*IDIR"//g /home/pt/install \
  && sed -i s/"initInstall$"/"installer"/g /home/pt/install \
  && ./home/pt/install \
  && chown ${uid}:${gid} -Rv /opt/pt


USER pt
ENV HOME /home/pt
CMD /home/pt/bin/PacketTracer7
