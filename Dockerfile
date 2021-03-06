FROM alpine:edge
MAINTAINER Yassine Echabbi <github.com/yassine>

ENV GOPATH /go-workspace
ENV GOBETWEEN_VERSION 0.5.0
ENV PATH $GOPATH/bin:$PATH

ADD ./startup.sh /etc/gobetween-startup.sh

RUN apk update \
    && apk upgrade \
    # Build Deps
    && apk add --no-cache --virtual .build-deps \
        make \
       	"go=1.10.1-r0" \
        git \
        gcc \
        libc-dev \
        libgcc \
    && mkdir -p $GOPATH/src/github.com/yyyar $GOPATH/bin \
    && cd $GOPATH/src/github.com/yyyar \
    && git clone --branch $GOBETWEEN_VERSION --depth 1 https://github.com/yyyar/gobetween.git \
    && cd gobetween \
    && make deps \
    && make build-static \
    && cp bin/gobetween /bin/gobetween \
    && apk del .build-deps \
    && rm -rf $GOPATH /var/cache/apk/* \
    && mkdir -p /var/log/supervisor \
    && chmod +x /etc/gobetween-startup.sh

CMD ["/etc/gobetween-startup.sh"]
