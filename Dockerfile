FROM python:2

RUN echo "deb http://www.deb-multimedia.org jessie main non-free" > /etc/apt/sources.list.d/multimedia.list
RUN apt-get update && apt-get install -y -q --force-yes ffmpeg mpg123 vorbis-tools lame flac

WORKDIR /app
RUN pip install flask storm pillow simplejson requests mutagen watchdog gunicorn https://github.com/spl0k/supysonic/archive/master.tar.gz
RUN mkdir /data

COPY app.py /app/app.py
COPY supysonic.conf /etc/supysonic

# 4 workers, 180 secs timeout due to transcoding
CMD gunicorn app --bind 0.0.0.0 -w ${WORKERS:-4} -t ${TIMEOUT:-180}
EXPOSE 8000
