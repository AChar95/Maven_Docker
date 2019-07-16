FROM maven:latest
COPY . /build
WORKDIR /build
RUN mvn clean package
FROM java:8
WORKDIR /opt/hello-world
COPY --from=0 /build/target/HelloWorld-1.0.0.jar app.jar
ENTRYPOINT ["/usr/bin/java", "-jar", "app.jar"]
