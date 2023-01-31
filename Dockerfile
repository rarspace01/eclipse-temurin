FROM alpine:latest as baseImage
RUN wget -O /etc/apk/keys/adoptium.rsa.pub https://packages.adoptium.net/artifactory/api/security/keypair/public/repositories/apk
RUN echo 'https://packages.adoptium.net/artifactory/apk/alpine/main' >> /etc/apk/repositories
RUN apk add temurin-17 && jlink --compress=2 --no-header-files --strip-java-debug-attributes --no-man-pages --vm=server --module-path /usr/lib/jvm/default-jvm/jmods --add-modules ALL-MODULE-PATH --output=/root/jre && apk del temurin-17

FROM alpine:latest as runImage
COPY --from=baseImage /root/jre /root/jre
ENV PATH="${PATH}:/root/jre/bin"