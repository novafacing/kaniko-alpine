# Kaniko
FROM gcr.io/kaniko-project/executor:debug as kaniko

# Install Git on Alpine
FROM alpine:3
RUN apk update
RUN apk add bash git

# Deploy kaniko into alpine
COPY --from=kaniko /kaniko /kaniko
ENV HOME /root
ENV USER /root
ENV PATH $PATH:/kaniko
ENV SSL_CERT_DIR /kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
