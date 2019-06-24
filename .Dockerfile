FROM ubuntu:latest
RUN apt-get update
RUN apt-get install vim
# fix /etc/dpkg/dpkg.cfg.d/excludes
RUN apt-get install man-db:q

