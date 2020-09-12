FROM  tmhung62/python3-alpine3.8
WORKDIR /tests


RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

ENV LIBRARY_PATH=/lib:/usr/lib

ENTRYPOINT ./docker/scripts/wait-for-selenium.sh ${SELENIUM_URL} ./ExecutionScripts/docker-run.sh
