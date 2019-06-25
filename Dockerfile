FROM python:3-stretch

RUN apt-get update && \
    apt-get install -y -q ffmpeg mpg123 vorbis-tools lame flac && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN pip install gunicorn https://github.com/spl0k/supysonic/archive/master.tar.gz
RUN mkdir /data

COPY app.py /app/app.py
COPY supysonic.conf /etc/supysonic

# 4 workers, 180 secs timeout due to transcoding
CMD gunicorn app --worker-tmp-dir /dev/shm --bind 0.0.0.0 -w ${WORKERS:-4} -t ${TIMEOUT:-180}
EXPOSE 8000
