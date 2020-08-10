#FROM registry.cn-beijing.aliyuncs.com/linkme/java:8-pinpoint
FROM openjdk:8-jdk-alpine

RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" > /etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache bash curl tzdata \
	&& cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& rm -rf /var/cache/apk/*

ENV LANG en_US.UTF-8
RUN apk add --update ttf-dejavu fontconfig && rm -rf /var/cache/apk/*
COPY target/*.jar /app.jar

#COPY docker-entrypoint.sh /app/docker-entrypoint.sh

#RUN chmod +x /app/docker-entrypoint.sh

#HEALTHCHECK --interval=1m --timeout=5s --retries=5 CMD curl -fs http://127.0.0.1:8080/health || exit 1

#ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar