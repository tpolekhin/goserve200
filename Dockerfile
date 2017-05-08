FROM golang:onbuild
MAINTAINER Tymofii Poliekhin <tpolekhin@gmail.com>

LABEL io.k8s.description="Simple Go HTTP/1.1 Server replying 200" \
      io.k8s.display-name="goserve200" \
      io.openshift.build.source-location="https://github.com/tpolekhin/goserve200.git" \
      io.openshift.expose-services="3000:http"

EXPOSE 3000
