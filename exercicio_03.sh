#!/bin/bash

# Diretórios de origem e destino
origem="C:\Temp"
destino="C:\Temp2"

# Verificar se o diretório de origem existe
if [ ! -d "$origem" ]; then
  echo "O diretório de origem '$origem' não existe."
  exit 1
fi

# Criar o diretório de destino se não existir
if [ ! -d "$destino" ]; then
  mkdir "$destino"
  if [ $? -ne 0 ]; then
    echo "Falha ao criar o diretório de destino '$destino'."
    exit 1
  fi
fi

# Copiar arquivos .txt do diretório de origem para o diretório de destino
if ls "$origem"/*.txt 1> /dev/null 2>&1; then
  cp "$origem"/*.txt "$destino"
  # Verificar se a cópia foi bem-sucedida
  if [ $? -eq 0 ]; then
    echo "Arquivos .txt copiados com sucesso para o diretório '$destino'."
  else
    echo "Falha ao copiar arquivos .txt para o diretório '$destino'."
    exit 1
  fi
else
  echo "Nenhum arquivo .txt encontrado no diretório '$origem'."
fi

exit 0
