FROM node:8-alpine

#RUN mkdir /usr/app
#WORKDIR /usr/app

EXPOSE 4200


#ADD package.json /usr/app
#RUN npm install --quiet

#ADD . /usr/app

#CMD ["npm", "start"]

ENV HOME=/home/nodejs
ENV APP_NAME=myapp
ENV PATH $HOME/$APP_NAME/node_modules/.bin:$PATH


# before switching to user we need to set permission properly
COPY package.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force

ADD package.json $HOME/$APP_NAME/
RUN npm i && mkdir -p $HOME/$APP_NAME && cp -R ./node_modules $HOME/$APP_NAME

WORKDIR $HOME/$APP_NAME

ADD . $HOME/$APP_NAME/

RUN ls -ltr $HOME/$APP_NAME/

#CMD ["ng", "serve", "--host", "0.0.0.0" ]

CMD ["npm", "start"]