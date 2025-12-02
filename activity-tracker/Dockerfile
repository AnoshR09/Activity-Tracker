FROM openjdk:17-jdk-slim

WORKDIR /app

COPY pom.xml .
COPY *.java .
COPY *.properties .
COPY *.html .
COPY *.css .
COPY *.js .

# Install Maven
RUN apt-get update && apt-get install -y maven

# Build the application
RUN mvn clean package -DskipTests

# Copy static files to resources
RUN mkdir -p src/main/resources/static && \
    cp *.html *.css *.js src/main/resources/static/

# Rebuild with static files
RUN mvn clean package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/activity-tracker-1.0.0.jar"]