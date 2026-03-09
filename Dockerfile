# Image Java
FROM eclipse-temurin:21-jdk

# Dossier de travail
WORKDIR /app

# Copier le projet
COPY . .

# Compiler le projet
RUN ./mvnw clean package -DskipTests

# Exposer le port
EXPOSE 8080

# Lancer l'application
CMD ["java", "-jar", "target/jkconverter-1.0-SNAPSHOT.jar"]