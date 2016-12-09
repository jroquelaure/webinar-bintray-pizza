FROM ubuntu:5001/busybox

MAINTAINER jonathanr@jfrog.com

COPY ./pizza-1.0.tgz /root/

RUN /bin/tar -xvf /root/pizza-1.0.tgz

COPY ./exec/bintrayrocks.sh /root/exec/

CMD /root/exec/bintrayrocks.sh