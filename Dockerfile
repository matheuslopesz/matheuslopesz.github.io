FROM ruby:3.1

# Instalar dependências do sistema
RUN apt-get update -qq && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

# Criar diretório de trabalho
WORKDIR /srv/jekyll

# Copiar Gemfile e Gemfile.lock (se existir)
COPY Gemfile Gemfile.lock* ./

# Instalar dependências do Jekyll
RUN bundle install

# Copiar o resto dos arquivos
COPY . .

# Expor a porta padrão do Jekyll
EXPOSE 4000

# Comando padrão para desenvolvimento
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--force_polling"]
