FROM ubuntu:5001/busybox

MAINTAINER jonathanr@jfrog.com

COPY ./pizza-1.0.tgz /root/

RUN /bin/tar -xvf /root/pizza-1.0.tgz

RUN mv /exec /root/exec

RUN ["chmod", "+x", "/root/exec/bintrayrocks.sh"]

CMD /root/exec/bintrayrocks.sh