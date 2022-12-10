FROM httpd:2.4

COPY my-httpd.conf /usr/local/apache2/conf/httpd.conf

COPY . /usr/local/apache2/htdocs/

ENV CONTAINER docker

EXPOSE 9999

CMD echo ${CONTAINER} && httpd -D FOREGROUND
                                            
