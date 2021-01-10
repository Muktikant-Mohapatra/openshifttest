#FROM openjdk:11
#ADD build/libs/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
#FROM gradle:4.2.1-jdk8-alpine
#WORKDIR /app
#ADD --chown=gradle:gradle /app/demo /app

#RUN ./gradlew build


FROM adoptopenjdk/openjdk11
RUN apt-get update && apt-get install -y unzip
#WORKDIR /gradle
#RUN curl -L https://services.gradle.org/distributions/gradle-6.5.1-bin.zip -o gradle-6.5.1-bin.zip
#RUN unzip gradle-6.5.1-bin.zip
#ENV GRADLE_HOME=/gradle/gradle-6.5.1
#ENV PATH=$PATH:$GRADLE_HOME/bin
#RUN gradle --version
COPY . /home/demo1/src
#COPY build.gradle /home/demo1
RUN ./gradlew build


ADD build/libs/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]
