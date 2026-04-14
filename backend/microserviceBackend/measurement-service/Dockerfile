FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy project files
COPY . .

# Install Maven and build
RUN apt-get update && apt-get install -y maven
RUN mvn clean package -DskipTests

# Run app (bind to Render port)
ENV PORT=8080
CMD java -jar target/*.jar
