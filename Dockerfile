FROM phusion/baseimage

RUN apt-get update \
    && apt-get -y install software-properties-common \
	&& apt-get update \
	&& add-apt-repository -y ppa:builds/sphinxsearch-rel22 \
	&& apt-get update \
	&& apt-get -y install sphinxsearch vim \
	&& mkdir /var/lib/sphinx \
	&& mkdir /var/lib/sphinx/data \
	&& mkdir /var/log/sphinx \
	&& mkdir /var/run/sphinx \
	&& apt-get clean
ADD index.sh /
ADD rotate.sh /
ADD restart.sh /
ADD searchd.sh /
ADD lordsearchd.sh /

RUN chmod a+x index.sh \
	&& chmod a+x searchd.sh \
	&& chmod a+x rotate.sh \
	&& chmod a+x restart.sh \
	&& chmod a+x lordsearchd.sh \
	&& ln -s /searchd.sh /etc/my_init.d/searchd.sh

EXPOSE 9306 9312

VOLUME [ "/var/lib/sphinx/data", "/var/log/sphinx" ]

CMD ["/sbin/my_init"]
