---
title: Configurando Jekyll com Docker
date: 2024-12-19 15:00:00 +0000
categories: [Tutorial, DevOps]
tags: [docker, jekyll, desenvolvimento, tutorial]
math: false
mermaid: false
pin: false
---

Neste tutorial, vou mostrar como configurar um ambiente de desenvolvimento Jekyll usando Docker, garantindo que todos tenham a mesma experiência, independentemente do sistema operacional.

## Por que usar Docker?

Docker oferece várias vantagens:

1. **Isolamento**: Cada projeto tem suas próprias dependências
2. **Consistência**: Mesmo ambiente em qualquer máquina
3. **Simplicidade**: Não precisa instalar Ruby, Jekyll e outras dependências localmente
4. **Reprodutibilidade**: Fácil de compartilhar e replicar

## Estrutura do Projeto

Vamos ver a estrutura básica necessária:

```
.
├── Dockerfile
├── docker-compose.yml
├── Gemfile
├── _config.yml
└── _posts/
```

## Dockerfile

O `Dockerfile` define como construir a imagem:

```dockerfile
FROM ruby:3.1

RUN apt-get update -qq && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock* ./
RUN bundle install

COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--force_polling"]
```

## Docker Compose

O `docker-compose.yml` facilita o gerenciamento:

```yaml
services:
  jekyll:
    build: .
    ports:
      - "4000:4000"
    volumes:
      - .:/srv/jekyll
      - bundle_cache:/usr/local/bundle
    environment:
      - JEKYLL_ENV=development
```

## Comandos Úteis

### Iniciar o servidor

```bash
docker compose up --build
```

### Parar o servidor

```bash
docker compose down
```

### Rebuild completo

```bash
docker compose build --no-cache
```

### Executar comandos dentro do container

```bash
docker compose exec jekyll bundle exec jekyll build
```

## Vantagens desta Abordagem

- ✅ Não precisa instalar Ruby localmente
- ✅ Dependências isoladas por projeto
- ✅ Fácil de compartilhar com a equipe
- ✅ Mesmo ambiente em desenvolvimento e produção

## Conclusão

Usar Docker com Jekyll simplifica muito o processo de desenvolvimento e garante que todos tenham o mesmo ambiente. É uma prática recomendada para projetos modernos!

---

> **Nota**: Certifique-se de ter o Docker e Docker Compose instalados antes de começar.
{: .prompt-info }
