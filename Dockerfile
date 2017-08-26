FROM frolvlad/alpine-glibc:alpine-3.6
LABEL maintainer "tsub <tsubasatakayama511@gmail.com>"

ENV GHR_VERSION="0.5.4"

RUN apk update --no-cache && \
    apk add --no-cache \
        git && \
    apk add --no-cache --virtual build-dependencies \
        curl \
        unzip && \
    curl -fSL -o ghr.zip "https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.zip" && \
    unzip -d /usr/local/bin ghr.zip && \
    rm ghr.zip && \
    apk del --purge build-dependencies

ENTRYPOINT ["ghr"]
CMD ["--help"]
