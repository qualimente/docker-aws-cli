FROM centos:7.2.1511

MAINTAINER skuenzli@qualimente.com

RUN yum -y install epel-release

ENV PACKAGE_DEPS='python2-pip jq groff'
RUN yum -y update \
  && yum -y install $PACKAGE_DEPS \
  && yum clean all

RUN pip install --upgrade awscli s3cmd

VOLUME /work
WORKDIR /work
ENTRYPOINT ["aws"]

ADD Dockerfile /Dockerfile
