FROM localhost:32000/tchaudhry/alpine-curl-gzip
RUN curl -o access.log.gz http://172.17.0.1:32002/access.log.gz
RUN gzip -d access.log.gz
RUN cat access.log | cut -f 1 -d " " | sort | uniq > unique-access.log
RUN rm access.log
