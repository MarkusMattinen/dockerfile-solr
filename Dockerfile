# solr and supervisord on trusty
#
FROM markusma/supervisord:trusty

RUN apt-get update \
 && apt-get install -y --no-install-recommends solr-tomcat \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/etc/supervisor/conf.d /etc/supervisor/conf.d
ADD config/etc/solr /etc/solr
ADD config/init /init

EXPOSE 8080
CMD [ "/init" ]
