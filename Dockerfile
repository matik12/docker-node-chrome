FROM openjdk:8-jdk

# Node.js

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
	&& npm install -g npm@5.5.1 \
	&& npm install -g aurelia-cli@~0.27.0

# Google Chrome

RUN set -xe \
	&& wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update -yqqq \
	&& apt-get install -y google-chrome-stable

# Xvfb

RUN apt-get install -y xvfb
