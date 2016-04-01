FROM centos:latest
EXPOSE 22
MAINTAINER Alvise Dorigo <alvise.dorigo@pd.infn.it>
RUN yum -y update 
RUN yum -y install iproute \
	net-tools \
	telnet \
	bind-utils \
	hostname \
	less \
	vim \
	more \
	gawk \
	sed \
	grep \
	sudo \
	bash \
	tcsh \
	git \
	make \
	gcc-c++ \
	perl \
	cmake \
	coreutils \
	ntp \
	iputils \
	emacs \
	cloud-init \
	curl \
	openssh-server \
	passwd \
	initscripts \
	bash
RUN groupadd -g 500 centos
RUN useradd -u 500 -g 500 -m -p centos centos
RUN echo "centos ALL=(ALL)       ALL" >> /etc/sudoers
RUN mv /etc/ntp.conf /etc/ntp.conf.old
ADD ./ntp.conf /etc/ntp.conf
#RUN chmod +s /usr/bin/ping /usr/bin/nslookup
#ADD ./resolv.conf /etc/resolv.conf
ADD ./startup /etc/startup
RUN chmod +x /etc/startup
CMD /etc/startup