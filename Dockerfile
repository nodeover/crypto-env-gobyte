FROM nodeover/crypto-env:latest

MAINTAINER Alex

# ports
EXPOSE 12455

# env
ENV APP_NAME 'crypto-env-gobyte'
ENV PYTHONIOENCODING 'utf8'

# install
USER root
RUN apt-get update
RUN apt-get install -y git vim

# sentinel
USER crypto
WORKDIR /home/crypto
RUN git clone https://github.com/gobytecoin/sentinel.git
WORKDIR /home/crypto/sentinel
RUN echo "gobyte_conf=/home/crypto/.gobytecore/gobyte.conf" >> sentinel.conf
RUN virtualenv venv
RUN ./venv/bin/pip install -r requirements.txt
USER root
RUN touch /etc/cron.d/sentinel-cron
RUN chmod 0644 /etc/cron.d/sentinel-cron
RUN echo "* * * * * cd /home/crypto/sentinel && ./venv/bin/python bin/sentinel.py > /home/crypto/sentinel.log 2>&1" >> /etc/cron.d/sentinel-cron

# reset apt-get cache
USER root
RUN rm -rf /var/lib/apt/lists/*

# entrypoint
WORKDIR /usr/local/bin
ADD entrypoint.sh /usr/local/bin/
RUN chmod +x entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# user env
USER crypto
WORKDIR /home/crypto