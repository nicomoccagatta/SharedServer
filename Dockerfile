FROM ubuntu
RUN apt-get -y update && apt-get install -y nodejs && apt-get install -y npm

# Install heroku
# wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
# heroku --version
# heroku login
# nicomoccagatta@gmail.com
# taller2tp

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/

RUN npm install
RUN npm install angular-route@1.5.5

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080
CMD [ "npm", "start" ]
