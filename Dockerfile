FROM phusion/baseimage

RUN apt-get update \
    && apt-get -y install software-properties-common \
	&& apt-get update \
	&& add-apt-repository -y ppa:builds/sphinxsearch-beta \
	&& apt-get update \
	&& apt-get -y install sphinxsearch vim \
	&& mkdir /var/lib/sphinx \
	&& mkdir /var/lib/sphinx/data \
	&& mkdir /var/log/sphinx \
	&& mkdir /var/run/sphinx \
	&& apt-get clean
ADD indexandsearch.sh /
ADD searchd.sh /
ADD lordsearchd.sh /

RUN chmod a+x indexandsearch.sh \
	&& chmod a+x searchd.sh \
	&& chmod a+x lordsearchd.sh

EXPOSE 3306

VOLUME [ "/var/lib/sphinx/data", "/var/log/sphinx" ]

CMD /indexandsearch.sh