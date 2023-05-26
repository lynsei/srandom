FROM amazonlinux:2
RUN sudo apt-get update && sudo yum install -y kernel-devel gcc shc 
COPY .bash_profile ~/.bash_profile
RUN ./.bash_profile
WORKDIR /app
COPY 11-srandom.rules .
COPY Makefile .
COPY srandom .
COPY srandom.c .
COPY srandom.conf .
make
make load
make install 
