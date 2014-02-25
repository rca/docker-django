FROM ubuntu:quantal
MAINTAINER Roberto Aguilar roberto@baremetal.io


# Base stuff for python-based update_runtime
RUN apt-get update
RUN apt-get install -y software-properties-common python python-pip

RUN pip install jinja2


RUN apt-get install -y git libpq-dev python-dev python-pip libjpeg-dev libwebp-dev libfreetype6-dev liblcms1-dev

# Just add the requirements.txt file because adding the entire project will
# likely introduce other changes that then bust the cache
ADD requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt


# Now add the entire application
ADD . /app/


# Customize the container environment

# This will allow these ports to be exposed when run via vanilla `docker run`
EXPOSE 8000

ENV HOME /app

ENV SERVICE djapp

ENV SERVICE_PORT 8000


# The default command to run
CMD gunicorn_django /app/djapp/settings.py -b 0.0.0.0:8000 --workers=3
