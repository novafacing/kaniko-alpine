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
ENV PATH /bin:/usr/bin:/usr/local/bin:/kaniko
ENV SSL_CERT_DIR /kaniko/ssl/
ENV DOCKER_CONFIG /kaniko/.docker/
