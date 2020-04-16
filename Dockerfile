FROM python:3.7.3-stretch

ENV PYTHONUNBUFFERED=1

WORKDIR /code

ADD ./requirements.txt .
RUN pip install -r requirements.txt

ADD . /code

EXPOSE 8000

HEALTHCHECK --interval=5s --timeout=10s --start-period=15s CMD python healthcheck.py || exit 1

ADD ./docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
CMD ["/docker-entrypoint.sh"]
