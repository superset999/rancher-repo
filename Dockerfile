FROM openjdk:8-jdk-alpine

MAINTAINER haha

WORKDIR /app/

VOLUME ["/app"]

ARG SPRING_ENV=dev
ARG JAR_FILE=./target/rancher-repo.jar
ARG SPRING_PROFILES="-Dspring.profiles.active=${SPRING_ENV}"
ARG JAVA_OPTS=" ${SPRING_PROFILES} \
-XX:ErrorFile=./hs_err_pid%p.log -XX:HeapDumpPath=./dump \
-Xloggc:./gc.log -XX:+HeapDumpOnOutOfMemoryError \
-XX:+PrintCommandLineFlags -XX:+PrintHeapAtGC \
-XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xmx512m -Xms512m "

COPY  ${JAR_FILE} app.jar

EXPOSE 30000
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar" ]