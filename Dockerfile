FROM maven:3.9.11-amazoncorretto-21-debian AS builder

WORKDIR /usr/src/guest-book
COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY . .
RUN mvn package -DskipTests

FROM amazoncorretto:21.0.8

WORKDIR /app
COPY --from=builder /usr/src/guest-book/target/guest-book-0.0.1.jar .

ENTRYPOINT ["java", "-jar", "/app/guest-book-0.0.1.jar"]