# Usa a versão Trixie do Debian como base da imagem.
FROM debian:trixie

# Identifica a finalidade da imagem.
LABEL descricao="Site simples executado em um container Debian"

# Instala o servidor web Nginx e remove arquivos temporários do APT.
RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx \
    && rm -rf /var/lib/apt/lists/*

# ADD reconhece o arquivo compactado e extrai seu conteúdo no diretório do site.
ADD meu_site.tar /var/www/html/

# Documenta a porta utilizada pelo servidor web.
EXPOSE 80

# Mantém o Nginx em primeiro plano para que o container continue em execução.
CMD ["nginx", "-g", "daemon off;"]
