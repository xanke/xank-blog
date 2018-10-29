FROM node:8.9.4

RUN mkdir -p /usr/src/hexo-blog
WORKDIR /usr/src/hexo-blog

COPY . .
RUN yarn add hexo-cli
RUN yarn install
RUN hexo clean && hexo g

FROM nginx:latest
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /usr/share/nginx/html

COPY --from=build-env /usr/src/hexo-blog/public /usr/share/nginx/html
EXPOSE 80