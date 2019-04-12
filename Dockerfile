# Use Alpine Linux for minimal image size
FROM openjdk:8-alpine
RUN apk add --no-cache wget

# Run as a normal user, not root
RUN adduser -D -u 1000 leao
USER leao

WORKDIR /home/leao

# Download and expand the app into ~/app
ARG url=https://downloadirpf.receita.fazenda.gov.br/irpf/2018/carne-leao/LEAO2018v1.1.zip
RUN wget "$url" -O app.zip --no-check-certificate && \
    unzip app.zip && \
    rm app.zip && \
    mv LEAO20?? app

# Run the app
CMD java -jar app/PgdCarneLeao.jar
