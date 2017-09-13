FROM prozhou/uu_16.04_nginx_1.10.1

RUN apt-get update -qq &&  apt-get upgrade -y && apt-get install -y python-pip inotify-tools git && \
    pip install mkdocs mkdocs-material mkdocs-bootswatch && apt-get clean && apt-get autoclean

RUN mkdir -p /data/www && cd /data/www && mkdocs new wwwroot

RUN rm -f /data/server/nginx/conf.d/*
COPY soft/mkdocs.conf /data/server/nginx/conf.d
#solve chianese search
ADD soft/search.py /usr/local/lib/python2.7/dist-packages/mkdocs/search.py.bak
RUN mv /usr/local/lib/python2.7/dist-packages/mkdocs/search.py.bak /usr/local/lib/python2.7/dist-packages/mkdocs/search.py
ADD soft/lunr.min.js /usr/local/lib/python2.7/dist-packages/mkdocs/assets/search/mkdocs/js/lunr.min.js.bak
run mv /usr/local/lib/python2.7/dist-packages/mkdocs/assets/search/mkdocs/js/lunr.min.js.bak /usr/local/lib/python2.7/dist-packages/mkdocs/assets/search/mkdocs/js/lunr.min.js
WORKDIR /usr/local/lib/python2.7/dist-packages/mkdocs
RUN rm -rf search.pyc && python -m py_compile search.py
#end solve chinese search

RUN sed -i "s|#gzip  on;|gzip  on; etag  off; server_tokens off; gzip_types *;|" /data/server/nginx/nginx.conf
WORKDIR /
COPY init.sh  /init.sh
RUN chmod +x  /init.sh
CMD ["/init.sh"]


