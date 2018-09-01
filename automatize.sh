#!/bin/bash

#author = Fabio Alexandre Spanhol
#email = faspanhol@gmail.com
#date = 2018-08-25

# Makes a minimal structure for the exercises.

echo "Informe o número da lista, seguido de [ENTER]"
read list_number

printf -v LIST_NUMBER "%03d" $list_number

echo "Informe a quantidade de exercícios, seguido de [ENTER]"
read n_exercises

echo "Informe seu nome completo *sem espaços*, no formato SeuNomeCompleto, seguido de [ENTER]"

# reading the full name without spaces
while true; do
  read full_name
  case $full_name in *\ *) echo Informe o nome SEM espaços!;;  *) break;; esac
done

# creates the parent directory
root_dir=LE${LIST_NUMBER}_${full_name}
mkdir $root_dir

# for each exercise, creates a directory which contains
# a basic HTML document and an empty JavaScript file

for id in $( seq -f "%02g" 1 $n_exercises)
    do
	mkdir -p $root_dir/Exerc$id

	file_html=$root_dir/Exerc$id/index.html

	cat > $file_html <<EOF
<html>
   <head>
      <meta charset="UTF-8">
      <title>LE$LIST_NUMBER-Exercício $id</title>
   </head>
   <body>
      <!-- Crie aqui os elementos necessários -->
      <script src="app.js"></script>
   </body>
</html>
EOF

       touch $root_dir/Exerc$id/app.js  #JS empty
    done

echo -e "Estrutura [$root_dir] criada com sucesso. \nAgora comece pois o tempo está passando! ;-)"
