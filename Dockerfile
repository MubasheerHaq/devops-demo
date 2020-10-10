FROM oneartifactorycloud.vpc.XYZdomain.com:8091/dev

WORKDIR /opt/app

ADD /newrelic/newrelic.yml /opt/newrelic/newrelic.yml
USER openjdk

COPY ./target/*.jar /opt/app/target/app.jar

EXPOSE 8080 5672
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Doracle.jdbc.timezoneAsRegion=false","-javaagent:/opt/newrelic/newrelic.jar","-jar","/opt/app/target/app.jar"]
