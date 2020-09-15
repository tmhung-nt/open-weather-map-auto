FROM  python:3.8.5-alpine3.12
WORKDIR /src

COPY ./requirements.txt .

RUN apk --no-cache update && apk add --no-cache --virtual .build-deps \
		build-base gcc bash \
		musl-dev libxml2-dev libxslt-dev	\
		postgresql-dev  \
		libffi-dev 	\
		py-pip jpeg-dev zlib-dev npm  curl \
	&& pip install --upgrade pip  && pip install -r requirements.txt  &&  rm -rf /var/cache/apk/*

# RUN sysctl net.ipv4.ip_local_port_range="15000 61000" && sysctl net.ipv4.tcp_fin_timeout=30

ENV LIBRARY_PATH=/lib:/usr/lib

ENTRYPOINT ./docker/scripts/wait-for-selenium.sh ${SELENIUM_URL} ./ExecutionScripts/docker-run.sh
