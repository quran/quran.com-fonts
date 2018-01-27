FROM node:8.9

LABEL maintainer="Mohamed El Mahallawy <mmahalwy@gmail.com>, Hossam Hammady <github@hammady.net>"

ENV NODE_ENV production

RUN mkdir /fonts
WORKDIR /fonts

# cache node_modules using docker layers
# any change to package.json will rebuild modules
ADD package*.json /fonts/
RUN npm install --silent --production

# you would typically mount .:/fonts during dev
ADD . /fonts/

EXPOSE 3000

CMD ["npm", "start"]
