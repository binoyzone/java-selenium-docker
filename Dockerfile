FROM maven:3.9-eclipse-temurin-21

# Install Chrome
RUN apt-get update && apt-get
# Set workdir and copy project
WORKDIR /app
COPY . .

CMD ["mvn", "test"]
