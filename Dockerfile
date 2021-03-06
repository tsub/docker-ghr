FROM frolvlad/alpine-glibc:alpine-3.6
LABEL maintainer "tsub <tsubasatakayama511@gmail.com>"
LABEL io.whalebrew.config.environment '["GITHUB_TOKEN"]'
LABEL io.whalebrew.config.volumes '["~/.gitconfig:/.gitconfig:ro"]'

ENV GHR_VERSION="0.9.0"

RUN apk update --no-cache && \
    apk add --no-cache \
        git && \
    apk add --no-cache --virtual build-dependencies \
        curl && \
    curl -fSL -o ghr.tar.gz "https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz" && \
    tar -xvzf ghr.tar.gz && \
    mv ghr_v0.9.0_linux_amd64/ghr /usr/local/bin && \
    chown root:root /usr/local/bin/ghr && \
    rm -r \
        ghr.tar.gz \
        ghr_v0.9.0_linux_amd64 && \
    apk del --purge build-dependencies

ENTRYPOINT ["ghr"]
CMD ["--help"]
