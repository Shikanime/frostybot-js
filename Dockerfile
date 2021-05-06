FROM node:12
RUN apt-get update -y && apt-get install -y sudo jq wget sqlite3 git openssh-server
RUN mkdir -p /usr/local && cd /usr/local && git clone https://github.com/CryptoMF/frostybot-js.git frostybot-js
WORKDIR /usr/local/frostybot-js
COPY package*.json ./
RUN npm install
RUN ln -s /usr/local/frostybot-js/frostybot /usr/bin/frostybot
EXPOSE 8080
RUN ./scripts/dbupgrade
CMD [ "npm", "start" ]