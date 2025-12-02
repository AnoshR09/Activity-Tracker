FROM eclipse-temurin:17-jdk

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Create proper directory structure
RUN mkdir -p src/main/java/com/tracker src/main/resources/static

# Copy files
COPY pom.xml .
COPY *.java src/main/java/com/tracker/
COPY *.properties src/main/resources/
COPY *.html *.css *.js src/main/resources/static/

# Build application
RUN mvn clean package -DskipTests

EXPOSE 8080
CMD ["java", "-jar", "target/activity-tracker-1.0.0.jar"]