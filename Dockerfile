# Use Alpine Linux for minimal image size
FROM openjdk:8-alpine
RUN apk add --no-cache wget ttf-dejavu

# Run as a normal user, not root
RUN adduser -D -u 1000 leao
USER leao

WORKDIR /home/leao

# Download and expand the app into ~/app
ARG url=https://downloadirpf.receita.fazenda.gov.br/irpf/2019/leao/LEAO2019v1.0.zip
RUN wget "$url" -O app.zip --no-check-certificate && \
    unzip app.zip && \
    rm app.zip && \
    mv LEAO20?? app

# Run the app
CMD java -jar app/PgdCarneLeao.jar
