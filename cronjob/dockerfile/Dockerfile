FROM alpine
MAINTAINER lu.jin
ADD . /opt
WORKDIR /opt
RUN cp /opt/kubectl /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
CMD ["sh"]
