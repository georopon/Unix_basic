#!/bin/bash

Curso : BIONFORMÁTICA EN LA ERA POST-GENÓMICA 

Módulo 1: Programación y Biolinux  v. 1.0  (2018)

																				E-mails: 
Escrito por: ROPON PALACIOS G., BSc, MSc(c), 		 				# biodano.geo@gmail.com 
			 RODRIGUEZ LIMA INGRID, BSc      					# ingridgimena02994@gmail.com 
			 LETONA YURY, Ing, MSc (c) 						# yuryletona@gmail.com
			 SALGUERO CAMPANA NELSON, 						# ng.salguero.c@gmail.com 
			 HUMAM SUTTA VIRGINIA, BSc 						# vhuamas131@gmail.com 
			 ACURIO SAAVEDRA, BSc, MSc 						# jorge.acurio@unsaac.edu.pe

			 $ INSTITUCIÓN: 
			 Unidad de Bioinformática y Biofísca teórica,
			 Laboratorio de Genética Molecular, 
			 Despartamento de Biología, Facultad de Ciencias,
			 Universidad Nacional de San Antonio Abad del Cusco, 
			 Av. La cultura 733, Wanchaq, Cusco, Perú.
			 Cell: +51 933 324949
			 E-mail: bioinfo.unsaac@gmail.com 

Por favor si usted esta usando este turorial o alguna información del mismo en vuestro trabajo sea tan amable de citar: 
		****** Ropón-Palacios G. et al. *(2018)*  Programación y Biolonux v.1.0 en Github: https://github.com/georopon/Unix_basic ******

# Prohibido su modificación, porque puede cometer un delito.
# Tenemos derechos reservados de este turotial.  

- Comnandos de Unix (MAC y Linux)

 PARTE 1: "Vizualizando y Moviendose por los directorios"

 	$ pwd               # Obtener la dirección del directorio de trabajo actual (igual que "echo $HOME")
 	$ ls                # Listar el contenido del directorio 
 	$ ls -l             # Similar a ls, pero provee información adicional de los archivos en el directorios 
 	$ ls -a             # Incluye archivos ocultos (.name) 
 	$ ls -R             # Lista subdirectorios
 	$ ls -t             # Lista los archivos en orden cronológico   
 	$ cd                # Facilita la entrada a un directorio de manera suscesiva
 	$ cd ..             # Facilita la salida de un diretorio
 	$ cd ../../         # Facilita la salida de dos directorios de manera consecuitiva
 	$ cd -              # Volver al directorio donde previamente de encontraba
 
 PARTE 2: "Archivos y Directorios"
 	$ mkdir <dir_name>   # Crear un directorio específico
	$ rmdir <dir_name>   # Eliminar un directorio vacio
	$ rm <file_name>     # Eliminar un archivo específico
	$ rm -r <dir_name>   # Eliminar un directorio con su contenido, el argumento 'f' se torna para confirmar off
	$ cp <name> <path>   # Copiar Archivos/directorio a una específica ruta (-r para incluir el contenido del directorio)
	$ mv <name1> <name2> # Renombrar archivos o directorios
	$ mv <name> <path>   # Mover Archivo/directorio a una específica ruta
 
 PARTE 3: "Manipulando Archivos"
 	$ grep pattern file           				# provee lineas in 'archivo' donde aparece 'query',
	$ grep "word" <nanme file>    				# Econtrar proteínas y/o genes específicos en un archivo fasta, fastaqc o faa 
	$ grep -c "word" <name file>  				# Contar el número de proteínas y/o genes específico en un archivo fasta, fastaqc o faa 
	$ grep -c "word" <name file> > <out file>   # Cuenta el query pero no imprime en panta nos da un archivo (i.e outfile.text)
	$ grep -v "word" <name file> 				# Encuentra a todos las proteínas y/o genes que no tengan el nombre "word" y los imprime
	$ grep 'word' file | wc -l   				# Pipeline encuentra a la palabra query 'word' y luego las cuenta usando una tubería 

 PARTE 4: "Vizualizando archivos de Texto"
 	$ more <my_file>  # vizualizar texto, usar bar o espeacio para moverse por la ventana, tipear 'q' para salir
	$ less <my_file>  # es más versátil que 'more', 'q' para salir, 'G' para ir al final de texto, 'g' incio 
	$ cat  <my_file>  # concatenar archivo e imprimir el contenido en una salida estandar

 PARTE 5: "Installar programas"
 	$ sudo apt-get <program name> 	# Este comando sirver para installar progrmas (i.e. <ncbi-blast+>)
 	$ sudo apt-get update 			# Sirve para realizar las actualizaciones de los programas y ficheros
 	$ sudo apt-get upgrade 			# Sirve para realizar las actualazaciones de los progrmas pero recuper archivos perdidos. 
 	$ wget <ftp://> 				# Descargar archivos de las web 'www.', -r facilita la descarga de directorio completos

 CASO DE ESTUDIO 1: "FILTRANDO PROTEOMAS"

 	 - Imagine que usted se encuentra interesado en estudiar nuevos blancos para drogas, para lo cual diseño un experimento en el que secuenció
 	   el genoma de Echinococcus granulosus, el cual se ha ensamblado, anotado y depositado en el Genbank, para lo cual debe descargar el genoma
 	   anotado. Sin embargo, el genoma tiene un volumen grande de proteínas para lo cual usted desea saber la cantidad de proteínas existes, además 
 	   en este proteoma existen proteínas hipotéticas, las cuales tienen función inaparente y para evitar errores desea eliminarlos, así 
 	   también tiene, proteínas parciales, y proteínas putativas. Pero no sabe cuanto es la cantidad de cada una de ellas. Finalmente usted no
 	   desea trabajar con todo el volúmen de proteínas, si no que con una familia de proteínas llamadas TRP, estas proteínas son de membrana y están
 	   involucradas en el paso de iones a través de la membra, lo cual resulta en buenos tagets drugables. Pero usted, no quiere hacer una busqueda 
 	   manual por que eso le tomaría mucho tiempo, e incluso podría perder información, para lo cual ustede va a necesitar hacer uso de comandos 
 	   bioinformaticos. 

 	   1. Paso 1: Debemos descargar el protema de Echinococcus granulosus del NCBI para lo cual podemos usar el siguiente comando:
 	   		# Abrimos el terminal y entramos al directorio 'Escritorio'
 	   		$ cd Escritorio  
 	   		# Creamos una carpeta con el nombre "unix_tutorial"
 	   		$ mkdir unix_tutorial 
 	   		# Entramos a la carpeta creada
 	   		$ cd unix_tutorial
 	   		# Descargar el protema de Echinoccosus granulosus del NCBI 
 	   		$ wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/524/195/GCF_000524195.1_ASM52419v1/GCF_000524195.1_ASM52419v1_protein.faa.gz
 	   		# Abrirlo haciendo anticlick y buscando la opción extraer aquí, sin embargo esto no es necesario. 
 	   		# Seguidamente le cambiamos de nombre 
 	   		$ mv nombre_del_archivo_descargado.faa proteoma_echinogra.fasta 

 	   2. Paso 2: Queremos saber cuantas proteínas contiene (totales, hipotéticas, putativas y parciales), para lo cual usamos el comando grep: 
 	   		# Contar el número de proteínas totales sin y usando tubería (pipeline)
 	   		$ grep '>' proteoma_echinogra | wc -l 	# usando tuberías 
 	   		$ grep -c '>' proteoma_echinogra 		# sin usar tueberías
 	   		# Idetificar la presencia de proteínas parciales, hipotética y putativas
 	   		$ grep "hypothetical" proteoma_echinogra 	# proteínas hipotéticas
 	   		$ grep "partial" proteoma_echinogra 	 	# proteínas parciales
 	   		$ grep "putative" proteoma_echinogra	 	#  proteínas putativas
 	   		# Contar el número de proteínas parciales, hipotéticas y putativas
 	   		$ grep -c "hypothetical" proteoma_echinogra 	# proteínas hipotéticas
 	   		$ grep -c "partial" proteoma_echinogra 	 	# proteínas parciales
 	   		$ grep -c "putative" proteoma_echinogra	 	#  proteínas putativas

 	   3. Paso 3: Escribiendo un pequeño script en lenguaje awk: 
 	   		# Fijese que en este pequeño script la palabra HYPOTHETICAL  puede ser reemplazado por lo que usted necesite filtrar (parcial, putativa, etc.)
 	   		$ $ awk '/^>/ && toupper($0) ~ /HYPOTHETICAL/ {bool=1}; /^>/ && toupper($0) !~ /HYPOTHETICAL/ {bool=0}; {if (bool==0) print}' proteoma_echinogra.fasta > filtrado1.fasta 
 	   		# Necesitamos seprar solo las proteínas TRP
 	   		$ awk '/^>/ { p = ($0 ~ /Transient/)} p' filtrado1.fasta > trp.fasta
 	   		$ awk '/^>/ { p = ($0 ~ /Short/)} p' filtrado1.fasta > strp.fasta
 	   		# Ahora tenemos un archivo multi-fasta con todas las proteínas TRP, pero necesitamos tenerlas en archivos individuales para lo cual podemos usar un script en PERL:
 	   		# Este script fue escrito por Paul Stothard, Canadian Bioinformatics Help Desk. diponible en: 'http://www.bioinformatics-made-simple.com/2013/07/how-to-split-multi-line-fasta-files.html'
 	   		$ perl split_fasta.pl -i input.fasta -o out_*.fasta -n 1 	# Donde 1 es la cantidad de secuencias por archivo que se quiere, este script esta en linea de commandos
 	   		# Debemos inspeccionar los archivos, debemos tener 15 archivos de trp.fasta (0 - 14) y 4 archivos de (0 - 3) y removemos los números 15 y 4: 
 	   		$ rm out_*.fasta_4
 	   		$ rm out_*.fasta_15
 	   		# Con esto hemos completado los análisis, si ustede tiene preguntas por favor consultenos.

 	   	4. Describa que es lo que obtiene en los archvios.

echo 'Agradecimientos a: 
echo
echo '- Ingrid Rogriguez-Lima, BSc --> Fellow en la Unidad de Biología de Sistemas y Bioinformática, Mol Genetics Lab.'
echo '- Nelson Salguero Campana, BSc --> Asistente de Investigación en la Unidad de Biología de Sistemas y Bioinformática, Mol Genetics Lab.' 
echo '- Virginia Humana Sutta, BSc, --> Fellow en la Unidad de Biología de Sistemas y Bioinformática, Mol Genetics Lab.' 
echo '- Sandro Mormontoy, BSc, --> Fellow en la Unidad de Biología de Sistemas y Bioinformática, Mol Genetics Lab.' 
echo '- Yuri Letona Villa, Ing, --> Fellow Master scholar in Mathematics, en la Unidad de Biología de Sistemas y Bioinformática, Mol Genetics Lab,' 
echo '- Andrea Palomino-Cardenas, BSc, --> Fellow Master scholar in Ecology, en la Unidad de Biología de Sistemas y Bioinformática, Mol Genetics Lab.'
echo '- Prof. Jorge Saavedra, MSc, --> Jefe del Laboratorio de Genética Molecular.'
echo '- Roger Quispe-Mamani, BSc, --> Fellow en la Unidad de Biología de Sistemas y Bioinformática, Mol Genetics Lab.' 
echo
echo '# Por el apoyo brindado durante el desarrollo del tutorial, por su amistad, y por su comprensión.' 

echo 'SI HA ENCONTRADO ALGÚN INCONVENIENTE, CONTACTENOS, SI ECONTRO ALGÚN ERROR, DE ESCRITURA LE PREDIMOS DISCULPAS'















