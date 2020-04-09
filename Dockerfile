FROM ubuntu:18.04

MAINTAINER frzifus benne@klimlive.de

RUN apt-get update && apt-get install -y tar wget xauth libqt5webkit5 libqt5xml5 libqt5multimedia5 libqt5script5 libqt5scripttools5 qt-at-spi sudo
COPY PacketTracer_730_amd64.deb.sha256 /tmp/PacketTracer_730_amd64.deb.sha256

RUN export uid=1000 gid=1000 \
  && mkdir -p /home/pt \
  && echo "pt:x:${uid}:${gid}:pt,,,:/home/pt:/bin/bash" >> /etc/passwd \
  && echo "pt:x:${uid}:" >> /etc/group \
  && mkdir /home/pt/storage \
  && chown ${uid}:${gid} -Rv /home/pt \
  && wget "https://archive.org/download/packettracer730mac_202002/PacketTracer_730_amd64.deb" \
  && sha256sum PacketTracer_730_amd64.deb | diff - /tmp/PacketTracer_730_amd64.deb.sha256 \
  && mkdir -p pt_package/DEBIAN \
  && dpkg-deb -x /PacketTracer_730_amd64.deb /pt_package/ \
  && dpkg-deb -e /PacketTracer_730_amd64.deb /pt_package/DEBIAN/ \
  && rm -f /pt_package/DEBIAN/preinst \
  && dpkg-deb -Z xz -b /pt_package/ . \
  && dpkg -i /packettracer_7.3.0_amd64.deb \
  && rm -f /*.deb \
  && rm -rf /pt_package \
  && rm -f /tmp/PacketTracer_730_amd64.deb.sha256 \
  && chown ${uid}:${gid} -Rv /opt/pt

USER pt
ENV HOME /home/pt
CMD /usr/local/bin/packettracer
