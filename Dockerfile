# Copyright (c) 2019 D2iQ.
# Licensed under the Apache 2.0 License

ARG FROMIMAGE
FROM ${FROMIMAGE}
ARG IMGVERSION

LABEL maintainer="Martijn Dekkers <mdekkers@d2iq.com>"
LABEL copyright="Copyright (c) 2019 D2iQ, Inc."
LABEL vendor="D2iQ, Inc."
LABEL version=${IMGVERSION}
LABEL site="https://www.d2iq.com"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
		&& apt-get -qqy upgrade
COPY dcos_1.13_lnx /usr/local/bin/dcos
RUN chmod +x /usr/local/bin/dcos

VOLUME /root/.dcos

RUN echo ${DOCKERTAG} > /dockertag

WORKDIR /root/.dcos

ENTRYPOINT ["dcos"]
