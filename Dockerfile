FROM frolvlad/alpine-java:jdk8-slim
EXPOSE 8080
VOLUME /tmp
ADD target/circle-ci-0.0.1-SNAPSHOT.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS="-Xmx512m -Xms256m"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar --spring.profiles.active=dev-server" ]