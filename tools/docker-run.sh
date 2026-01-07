#!/usr/bin/env bash
#
# Script para executar o Jekyll dentro do Docker

set -e

cd "$(dirname "$0")/.."

help() {
  echo "Usage:"
  echo
  echo "   bash tools/docker-run.sh [options]"
  echo
  echo "Options:"
  echo "     -b, --build        Rebuild a imagem Docker antes de iniciar"
  echo "     -p, --production   Executar em modo produção"
  echo "     -h, --help         Mostrar esta ajuda"
}

build=false
prod=false

while (($#)); do
  opt="$1"
  case $opt in
  -b | --build)
    build=true
    shift
    ;;
  -p | --production)
    prod=true
    shift
    ;;
  -h | --help)
    help
    exit 0
    ;;
  *)
    echo -e "> Opção desconhecida: '$opt'\n"
    help
    exit 1
    ;;
  esac
done

if $build; then
  echo "> Construindo a imagem Docker..."
  docker compose build
fi

if $prod; then
  echo "> Iniciando Jekyll em modo produção..."
  docker compose run --rm -e JEKYLL_ENV=production jekyll bundle exec jekyll build
else
  echo "> Iniciando Jekyll em modo desenvolvimento..."
  docker compose up
fi
