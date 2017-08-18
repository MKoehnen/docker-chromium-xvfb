FROM markadams/chromium-xvfb

WORKDIR /usr/src/app
ENV NODE_VERSION=6.11.2-1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs=${NODE_VERSION}nodesource1~jessie1 \
    && rm -rf /var/lib/apt/lists

CMD npm test

ONBUILD COPY package.json /usr/src/app/package.json
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app
