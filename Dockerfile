FROM node:8.9.4

COPY . /app/
WORKDIR /app
RUN yarn global add hexo-cli && yarn install

EXPOSE 4000
CMD ["hexo", "server"]