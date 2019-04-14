# IRPF: Carnê-Leão rodando em Docker

Instalar o Java? Não, obrigado.

Este é o repositório com os fontes para a imagem Docker [aureliojargas/carne-leao](https://cloud.docker.com/u/aureliojargas/repository/docker/aureliojargas/carne-leao), que traz o programa [Carnê-Leão](http://receita.economia.gov.br/orientacao/tributaria/pagamentos-e-parcelamentos/pagamento-do-imposto-de-renda-de-pessoa-fisica/carne-leao) da Receita Federal rodando de maneira enxuta (<150MB) no Alpine Linux.

## Como usar

A imagem do Carnê-Leão pronta está hospedada no Docker Hub, então para utilizá-la você só precisa rodar o script `run.sh` e nada mais. Renomeá-lo para `leao.sh` pode ser uma boa:

    curl -LO https://github.com/aureliojargas/carne-leao-docker/raw/2019/run.sh
    mv -v run.sh leao.sh
    sh leao.sh

## Como reconstruir a imagem

Caso queira reconstruir a imagem em sua máquina, clone este repositório e faça o build local da imagem antes de rodá-la:

    git clone https://github.com/aureliojargas/carne-leao-docker.git
    cd carne-leao-docker
    ./build.sh
    ./run.sh

## Detalhes

- Estou assumindo que você roda o docker sem precisar de `sudo`. Caso contrário, coloque os `sudo` apropriados nos scripts.

- Você sabe que os certificados desses sites do governo é uma novela, né? Por isso precisa da opção `--no-check-certificate` ao baixar o programa (vide `Dockerfile`) :(

- O comportamento padrão é sempre rodar a versão mais recente (`latest`). Se você precisar de uma versão mais antiga, use tags. Por exemplo, para rodar o programa de 2018, use a imagem `aureliojargas/carne-leao:2018`. Veja [a lista de tags disponíveis](https://cloud.docker.com/repository/docker/aureliojargas/carne-leao/tags).

## Contribuições

Sua ajuda é muito bem-vinda! Se virar o ano e eu não atualizar a imagem, ou se você tem uma sugestão de melhoria, mande seu Pull Request.

## Créditos

Inspirado pelo [andresmrm/docker-irpf](https://github.com/andresmrm/docker-irpf), que disponibilizou o programa principal do IRPF numa imagem com o Alpine Linux.
