# Site em container Debian

Projeto da atividade de DevOps que cria uma imagem baseada em `debian:trixie`,
instala o Nginx e publica um site armazenado no arquivo `meu_site.tar`.

## Estrutura

```text
meu_projeto/
├── meu_site.tar
├── Dockerfile
├── README.md
└── evidencias/
```

## Como o arquivo foi compactado

O comando correto para criar o arquivo compactado é:

```bash
tar -czf meu_site.tar -C .site-build .
```

As opções utilizadas significam:

- `c`: cria um novo arquivo;
- `z`: compacta com gzip;
- `f`: informa o nome do arquivo de saída.

## Como executar

```powershell
docker build -t meu-site-debian:1.0 .
docker run -d --name meu-site-container -p 8082:80 meu-site-debian:1.0
```

Depois, acesse `http://localhost:8082`.

A porta `8082` foi escolhida porque a porta `8080` já estava ocupada por outro
serviço no computador durante a validação.

Para encerrar e remover o container:

```powershell
docker rm -f meu-site-container
```
