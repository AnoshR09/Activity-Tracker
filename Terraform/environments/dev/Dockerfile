FROM eclipse-temurin:17-jdk

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Copy pom.xml first
COPY pom.xml .

# Create proper directory structure
RUN mkdir -p src/main/java/com/tracker src/main/resources/static

# Copy and organize files
COPY *.java ./
COPY *.properties ./
COPY *.html *.css *.js ./

# Move files to correct Maven structure
RUN mv *.java src/main/java/com/tracker/ && \
    mv *.properties src/main/resources/ && \
    mv *.html *.css *.js src/main/resources/static/

# Build application
RUN mvn clean package -DskipTests

EXPOSE 8080
CMD ["java", "-jar", "target/activity-tracker-1.0.0.jar"]