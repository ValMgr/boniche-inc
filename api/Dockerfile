FROM node:16.12.0

# Add docker-compose-wait tool -------------------
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

RUN npm install -g nodemon
WORKDIR /api
COPY package*.json .
RUN npm install
COPY . .

EXPOSE 3000

CMD /wait && npm start
