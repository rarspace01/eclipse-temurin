FROM alpine:latest
RUN apk add bash curl git zip && \
  curl -s "https://get.sdkman.io" | bash
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk version"
