FROM              docker.io/maven As BUILD
RUN               mkdir /app
WORKDIR            /app
COPY              ./  /app/
RUN               mvn clean package
RUN               mv target/shipping-1.0.jar shipping.jar


FROM              docker.io/amazoncorretto:17
RUN               mkdir /app
WORKDIR           /app
COPY              --from=BUILD /app/shipping.jar /app/shipping.jar
COPY              run.sh /app/run.sh
ENTRYPOINT        ["bash","/app/run.sh"]