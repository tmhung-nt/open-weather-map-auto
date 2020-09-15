FROM  python:3.8.5-alpine3.12
WORKDIR /tests

COPY ./requirements.txt .
COPY ./package.json .

RUN apk --no-cache update && apk add --no-cache --virtual .build-deps \
		build-base gcc bash \
		musl-dev libxml2-dev libxslt-dev	\
		postgresql-dev  \
		libffi-dev 	\
		py-pip jpeg-dev zlib-dev npm  curl \
	&& pip install --upgrade pip  && pip install -r requirements.txt  && npm i &&  rm -rf /var/cache/apk/*

RUN apk add curl

ENV LIBRARY_PATH=/lib:/usr/lib

ENTRYPOINT ./docker/scripts/wait-for-selenium.sh ${SELENIUM_URL} ./ExecutionScripts/docker-run.sh
