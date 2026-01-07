# Chirpy Starter

[![Gem Version](https://img.shields.io/gem/v/jekyll-theme-chirpy)][gem]&nbsp;
[![GitHub license](https://img.shields.io/github/license/cotes2020/chirpy-starter.svg?color=blue)][mit]

When installing the [**Chirpy**][chirpy] theme through [RubyGems.org][gem], Jekyll can only read files in the folders
`_data`, `_layouts`, `_includes`, `_sass` and `assets`, as well as a small part of options of the `_config.yml` file
from the theme's gem. If you have ever installed this theme gem, you can use the command
`bundle info --path jekyll-theme-chirpy` to locate these files.

The Jekyll team claims that this is to leave the ball in the user’s court, but this also results in users not being
able to enjoy the out-of-the-box experience when using feature-rich themes.

To fully use all the features of **Chirpy**, you need to copy the other critical files from the theme's gem to your
Jekyll site. The following is a list of targets:

```shell
.
├── _config.yml
├── _plugins
├── _tabs
└── index.html
```

To save you time, and also in case you lose some files while copying, we extract those files/configurations of the
latest version of the **Chirpy** theme and the [CD][CD] workflow to here, so that you can start writing in minutes.

## Usage

Check out the [theme's docs](https://github.com/cotes2020/jekyll-theme-chirpy/wiki).

### Executando com Docker

Para executar o site Jekyll dentro de um container Docker:

1. **Construir e iniciar o container:**
   ```bash
   docker compose up --build
   ```
   ou usando o script auxiliar:
   ```bash
   bash tools/docker-run.sh --build
   ```

2. **Acessar o site:**
   O site estará disponível em `http://localhost:4000`

3. **Parar o container:**
   Pressione `Ctrl+C` ou execute:
   ```bash
   docker compose down
   ```

**Opções disponíveis:**
- `docker compose up` - Inicia o servidor em modo desenvolvimento
- `docker compose up --build` - Reconstrói a imagem antes de iniciar
- `bash tools/docker-run.sh --build` - Usa o script auxiliar com rebuild
- `bash tools/docker-run.sh --production` - Executa em modo produção

### Executando localmente (sem Docker)

1. Instale as dependências:
   ```bash
   bundle install
   ```

2. Execute o servidor:
   ```bash
   bash tools/run.sh
   ```

## Contributing

This repository is automatically updated with new releases from the theme repository. If you encounter any issues or want to contribute to its improvement, please visit the [theme repository][chirpy] to provide feedback.

## License

This work is published under [MIT][mit] License.

[gem]: https://rubygems.org/gems/jekyll-theme-chirpy
[chirpy]: https://github.com/cotes2020/jekyll-theme-chirpy/
[CD]: https://en.wikipedia.org/wiki/Continuous_deployment
[mit]: https://github.com/cotes2020/chirpy-starter/blob/master/LICENSE
