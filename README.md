# IRPF: Carnê-Leão rodando em Docker

Instalar o Java? Não, obrigado.

Este é o repositório com os fontes para a imagem Docker [aureliojargas/carne-leao](https://cloud.docker.com/u/aureliojargas/repository/docker/aureliojargas/carne-leao), que traz o programa [Carnê-Leão](http://receita.economia.gov.br/orientacao/tributaria/pagamentos-e-parcelamentos/pagamento-do-imposto-de-renda-de-pessoa-fisica/carne-leao) da Receita Federal rodando de maneira enxuta (<150MB) no Alpine Linux.

## Quero rodar AGORA! Só quero copiar e colar e ser feliz

    mkdir ~/ProgramasRFB

    xhost +local:docker

    docker run --rm \
        -e DISPLAY \
        -e _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on' \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v ~/ProgramasRFB:/home/leao/ProgramasRFB \
        aureliojargas/carne-leao

    xhost -local:docker

## Quero criar e rodar a minha própria imagem, localmente

    git clone https://github.com/aureliojargas/carne-leao-docker.git
    cd carne-leao-docker

    docker-compose build
    ./run.sh

## Detalhes

- Estou assumindo que você roda o docker e docker-compose sem precisar de `sudo`. Caso contrário, coloque os `sudo` apropriados.

- Você tem que criar o diretório `~/ProgramasRFB` antes de rodar o contêiner, senão esse diretório será criado pelo usuário `root` e você terá que arrumar as permissões manualmente.

- Você sabe que os certificados desses sites do governo é uma novela, né? Por isso precisa da opção `--no-check-certificate` ao baixar o programa (vide `Dockerfile`) :(

- [Por que precisa do xhost?](http://wiki.ros.org/docker/Tutorials/GUI)

- O comportamento padrão é sempre rodar a versão mais recente (`latest`). Se você precisar de uma versão mais antiga, use tags. Por exemplo, para rodar o programa de 2018, use a imagem `aureliojargas/carne-leao:2018`. Veja [a lista de tags disponíveis](https://cloud.docker.com/repository/docker/aureliojargas/carne-leao/tags).

## Contribuições

Sua ajuda é muito bem-vinda! Se virar o ano e eu não atualizar a imagem, ou se você tem uma sugestão de melhoria, mande seu Pull Request.

## Créditos

Inspirado pelo [andresmrm/docker-irpf](https://github.com/andresmrm/docker-irpf), que disponibilizou o programa principal do IRPF numa imagem com o Alpine Linux.
