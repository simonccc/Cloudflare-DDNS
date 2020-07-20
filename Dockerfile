FROM alpine:latest
RUN apk add --no-cache python3
RUN python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
RUN pip3 install requests
COPY cf_ddns.py /
ENTRYPOINT [ "python3", "-u", "./cf_ddns.py" ]
