FROM debian:12.6
EXPOSE 5000
WORKDIR /srv
COPY . .

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python-is-python3 \
    git \
    htop

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "/usr/local/bin/gunicorn", "-b", "0.0.0.0:5000", "hello:app"]