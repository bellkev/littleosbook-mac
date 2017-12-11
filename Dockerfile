FROM ubuntu:xenial

# Deps
RUN apt-get update; apt-get install -y \
  # Some basic dev/build tools
  build-essential nasm bison flex curl gdb \
  # Used by grub-mkrescue to create ISOs
  xorriso

WORKDIR /root

# Grub
RUN curl -O ftp://ftp.gnu.org/gnu/grub/grub-2.02.tar.gz && tar -xzvf grub-2.02.tar.gz
RUN cd grub-2.02 && ./configure --target=i386 --with-platform=pc && make install

RUN mkdir -p /opt/littleosbook
WORKDIR /opt/littleosbook