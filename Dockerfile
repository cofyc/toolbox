FROM k8s.gcr.io/debian-base:v1.0.0 as builder

# copy from https://hub.docker.com/r/skandyla/wrk/dockerfile
RUN echo "===> Installing  tools..."  && \
    apt-get -y update && \
    apt-get -y install build-essential curl && \
    \
    echo "===> Installing wrk" && \
    WRK_VERSION=$(curl -L https://github.com/wg/wrk/raw/master/CHANGES 2>/dev/null | \
                  egrep '^wrk' | head -n 1 | awk '{print $2}') && \ 
    echo $WRK_VERSION  && \
    mkdir /opt/wrk && \
    cd /opt/wrk && \
    curl -L https://github.com/wg/wrk/archive/$WRK_VERSION.tar.gz | \
       tar zx --strip 1 && \
    make && \
    cp wrk /usr/local/bin/

# For security, we use kubernetes community maintained debian base image.
# https://github.com/kubernetes/kubernetes/blob/master/build/debian-base/
FROM k8s.gcr.io/debian-base:v1.0.0

# Keep packages up to date and install packages for our needs.
RUN apt-get update \
    && apt-get upgrade -y \
    && clean-install \
    util-linux \
    e2fsprogs \
    bash \
    fio \
    iproute2 \
    strace \
    dnsutils \
    procps \
    netcat \
    telnet \
    rsync \
    vim \
    lsof \
    curl

ADD init.bashrc /etc/profile.d/
ADD vimrc /root/.vimrc

COPY --from=builder /usr/local/bin/wrk /usr/local/bin/wrk

CMD ["/bin/bash"]
