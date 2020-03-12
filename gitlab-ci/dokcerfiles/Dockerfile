FROM alpine

ADD helm /usr/local/bin
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk upgrade \
  && apk add --update wget git openssl bash \
  && helm plugin install https://github.com/chartmuseum/helm-push

ENTRYPOINT ["helm"]
CMD ["help"]