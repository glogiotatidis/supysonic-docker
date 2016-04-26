FROM python:2

RUN echo "deb http://www.deb-multimedia.org jessie main non-free" > /etc/apt/sources.list.d/multimedia.list
RUN apt-get update && apt-get install -y -q --force-yes ffmpeg mpg123 vorbis-tools lame

WORKDIR /app
RUN pip install flask storm pillow simplejson requests mutagen watchdog gunicorn https://github.com/glogiotatidis/supysonic/archive/master.tar.gz
RUN mkdir /data

COPY app.py /app/app.py
COPY supysonic.conf /etc/supysonic

CMD gunicorn app --bind 0.0.0.0
EXPOSE 8000
