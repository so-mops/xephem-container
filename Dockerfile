FROM ubuntu:bionic


ADD ./xephem-3.7.7 /src/xephem

COPY xdebs/*.deb /debs/

RUN apt -y update
RUN apt -y install openssh-server
RUN apt -y install x11-apps
RUN dpkg -i /debs/multiarch-support_2.19-0ubuntu6.14_amd64.deb && \
	dpkg -i /debs/xorg-sgml-doctools_1.11-1_all.deb && \	
	dpkg -i /debs/libxdmcp6_1.1.1-1_amd64.deb && \
	dpkg -i /debs/libxau6_1.0.8-1_amd64.deb && \
	dpkg -i /debs/x11proto-core-dev_7.0.26-1~ubuntu2_all.deb && \
	dpkg -i /debs/x11proto-input-dev_2.3-1_all.deb && \
	dpkg -i /debs/x11proto-kb-dev_1.0.6-2_all.deb && \
	dpkg -i /debs/libxau-dev_1.0.8-1_amd64.deb && \
	dpkg -i /debs/libpthread-stubs0-dev_0.3-4_amd64.deb && \
	dpkg -i /debs/libxdmcp-dev_1.1.1-1_amd64.deb && \
	dpkg -i /debs/libxdmcp6_1.1.1-1_amd64.deb && \
	dpkg -i /debs/libxcb1_1.10-2ubuntu1_amd64.deb && \
	dpkg -i /debs/libxcb1-dev_1.10-2ubuntu1_amd64.deb && \
	dpkg -i /debs/xtrans-dev_1.3.5-1~ubuntu14.04.2_all.deb && \	
	dpkg -i /debs/libx11-data_1.6.2-1ubuntu2_all.deb && \
	dpkg -i /debs/libx11-6_1.6.2-1ubuntu2_amd64.deb && \
	dpkg -i /debs/libx11-dev_1.6.2-1ubuntu2_amd64.deb && \
	dpkg -i /debs/libxext6_1.3.2-1ubuntu0.0.14.04.1_amd64.deb && \
	dpkg -i /debs/x11proto-print-dev_1.0.5-2_all.deb && \
	dpkg -i /debs/x11proto-xext-dev_7.3.0-1_all.deb && \
	dpkg -i /debs/x11-common_7.7+19ubuntu7_all.deb && \
	dpkg -i /debs/libbsd0_0.8.7-1_amd64.deb && \
	dpkg -i /debs/libxext-dev_1.3.2-1ubuntu0.0.14.04.1_amd64.deb && \
	dpkg -i /debs/libice6_1.0.9-2_amd64.deb && \
	dpkg -i /debs/libice-dev_1.0.9-2_amd64.deb && \
	dpkg -i /debs/libsm6_1.2.2-1_amd64.deb && \
	dpkg -i /debs/libsm-dev_1.2.2-1_amd64.deb && \
	dpkg -i /debs/libbsd0_0.8.7-1_amd64.deb && \
	dpkg -i /debs/libice6_1.0.9-2_amd64.deb && \
	dpkg -i /debs/libxt6_1.1.5-1_amd64.deb && \
	dpkg -i /debs/libxt-dev_1.1.5-1_amd64.deb && \
	dpkg -i /debs/x11proto-core-dev_7.0.26-1~ubuntu2_all.deb && \
	dpkg -i /debs/libxmu6_1.1.2-2_amd64.deb && \
	dpkg -i /debs/libxmu-headers_1.1.2-2_all.deb && \
	dpkg -i /debs/libxp6_1.0.2-1ubuntu1_amd64.deb && \
	dpkg -i /debs/libxp-dev_1.0.2-1ubuntu1_amd64.deb && \
	dpkg -i /debs/libxmu-dev_1.1.2-2_amd64.deb && \
	dpkg -i /debs/libmotif-common_2.3.4-5_all.deb && \
	dpkg -i /debs/ucf_3.0027+nmu1_all.deb && \
	dpkg -i /debs/fonts-dejavu-core_2.34-1ubuntu1_all.deb && \
	dpkg -i /debs/libpng12-0_1.2.50-1ubuntu2.14.04.3_amd64.deb && \
	dpkg -i /debs/libjpeg-turbo8_1.3.0-0ubuntu2.1_amd64.deb && \
	dpkg -i /debs/libjpeg8_8c-2ubuntu8_amd64.deb && \
	dpkg -i /debs/libfreetype6_2.5.2-1ubuntu2.8_amd64.deb && \
	dpkg -i /debs/fontconfig-config_2.11.0-0ubuntu4.2_all.deb && \
	dpkg -i /debs/libexpat1_2.1.0-4ubuntu1.4_amd64.deb && \
	dpkg -i /debs/libfontconfig1_2.11.0-0ubuntu4.2_amd64.deb && \
	dpkg -i /debs/libxrender1_0.9.8-1build0.14.04.1_amd64.deb && \
	dpkg -i /debs/libxft2_2.3.1-2_amd64.deb && \
	dpkg -i /debs/libxm4_2.3.4-5_amd64.deb 


RUN mkdir /var/run/sshd
RUN useradd -ms /bin/bash observer

EXPOSE 7624
CMD echo XEphem.PrivateDir: ${XEHOME} >  /root/.xephemrc && cp /home/vattobs/.xephem/catalogs/*.edb src/xephem/GUI/xephem/catalogs && cd src/xephem/GUI/xephem && ./xephem
