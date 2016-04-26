FROM python:2

WORKDIR /app
RUN pip install flask storm pillow simplejson requests mutagen watchdog gunicorn https://github.com/glogiotatidis/supysonic/archive/master.tar.gz
RUN mkdir /data

COPY app.py /app/app.py
COPY supysonic.conf /etc/supysonic

CMD gunicorn app --bind 0.0.0.0
EXPOSE 8000
