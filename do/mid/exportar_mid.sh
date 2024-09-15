#!/bin/bash

diretorio_musescore=../musescore/xml
diretorio_saida=arquivos_mid

mkdir $diretorio_saida 2> /dev/null
rm -r $diretorio_saida/*.mid 2> /dev/null

find $diretorio_musescore/*.mscx -type f | while read path_arquivo_mscx; do
    # Extraindo o nome do arquivo midi a ser gerado.
    nome_arquivo_midi="$diretorio_saida/$(basename "$path_arquivo_mscx" | cut -d '.' -f 1).mid"
    
    # Executando o comando musescore3 para exportar arquivos mid.
    musescore3 --export-to $nome_arquivo_midi $path_arquivo_mscx >> $BASH_SOURCE.log 2>> $BASH_SOURCE.err.log
done
