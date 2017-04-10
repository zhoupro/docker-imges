FROM zsz/nginx-1.10.1

RUN apt-get update -qq &&  apt-get upgrade -y && apt-get install -y python-pip git && \
    pip install mkdocs mkdocs-material && apt-get clean && apt-get autoclean

RUN mkdir -p /opt/htdocs/demo/docs && cd /opt/htdocs && mkdocs new demo

RUN rm -f /etc/nginx/conf.d/*
COPY soft/mkdocs.conf /etc/nginx/conf.d
#solve chianese search
ADD soft/search.py /usr/local/lib/python2.7/dist-packages/mkdocs/search.py.bak
RUN mv /usr/local/lib/python2.7/dist-packages/mkdocs/search.py.bak /usr/local/lib/python2.7/dist-packages/mkdocs/search.py
ADD soft/lunr.min.js /usr/local/lib/python2.7/dist-packages/mkdocs/assets/search/mkdocs/js/lunr.min.js.bak
run mv /usr/local/lib/python2.7/dist-packages/mkdocs/assets/search/mkdocs/js/lunr.min.js.bak /usr/local/lib/python2.7/dist-packages/mkdocs/assets/search/mkdocs/js/lunr.min.js
WORKDIR /usr/local/lib/python2.7/dist-packages/mkdocs
RUN rm -rf search.pyc && python -m py_compile search.py
#end solve chinese search

RUN sed -i "s|#gzip  on;|gzip  on; etag  off; server_tokens off; gzip_types *;|" /etc/nginx/nginx.conf
WORKDIR /
RUN echo '#!/bin/bash' > /init.sh && \
    echo '/etc/nginx/nginx; while true; do sleep 30; cd /opt/htdocs/demo && mkdocs build; done' >> /init.sh && \
    chmod +x /init.sh
CMD ["/init.sh"]


