FROM node:lts as build

COPY . /var/task/
RUN apt-get update && \
    apt-get install -y \
    g++ \
    make \
    cmake \
    unzip \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/* \
    && cd /var/task \
    && npm install --prod-only \
    && npm install aws-lambda-ric

FROM node:lts-slim
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime
COPY --from=build ${LAMBDA_TASK_ROOT} ${LAMBDA_TASK_ROOT}
RUN mkdir /opt/extensions
WORKDIR ${LAMBDA_TASK_ROOT}
ENTRYPOINT ["/usr/local/bin/npx", "aws-lambda-ric"]
CMD [ "main.handler" ]  