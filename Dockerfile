FROM eclipse-temurin:25-jdk AS builder

WORKDIR /build

COPY gradlew build.gradle settings.gradle ./
COPY gradle ./gradle
COPY src ./src

RUN sh ./gradlew --no-daemon bootJar

FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=builder --chown=10001:10001 /build/build/libs/*.jar ./app.jar

USER 10001:10001

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
