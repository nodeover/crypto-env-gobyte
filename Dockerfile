FROM nodeover/crypto-env:latest

MAINTAINER Alex

# ports
EXPOSE 12455

# env
ENV APP_NAME 'crypto-env-gobyte'
ENV PYTHONIOENCODING 'utf8'

# entrypoint
USER root
WORKDIR /usr/local/bin
ADD entrypoint.sh /usr/local/bin/
RUN chmod +x entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# user env
USER crypto
WORKDIR /home/crypto