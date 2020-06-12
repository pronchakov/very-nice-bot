FROM maven:3.6.3-openjdk-14-slim as build
ENV TZ="Europe/Moscow"

WORKDIR /opt/build

COPY src src
COPY pom.xml pom.xml

RUN mvn clean install -Dmaven.test.skip=true


FROM openjdk:14.0.1-slim as run
ENV TZ="Europe/Moscow"
ENV VM_PARAMS=""

RUN addgroup --system --gid 1001 appuser && adduser --system --ingroup appuser --uid 1001 appuser
USER 1001

WORKDIR /opt/bot

COPY --from=build --chown=1001:1001 /opt/build/target/very-nice-bot.jar .

ENTRYPOINT java \
    ${VM_PARAMS} \
    -jar very-nice-bot.jar