echo "Pulsa [Enter] para comenzar, por favor, acuerdese de ejecutar este programa con poder de administrador, si no lo tiene asi, pulse Ctrl-C."
read o
clear
echo 
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@ inf0clear @@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@ by W0lfAdri @@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo  
echo  
echo  
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@ Realizado por: Adrián Diaz @@@@@@@@@@@
echo @@@@@@@@ Contacto: freeadri@autistici.org @@@@@@@@@
echo @@@@@@@@@@@ Versión del programa: v1.2 @@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo  
echo  
echo   
sleep 8
echo [!]Iniciando ...
sleep 2
touch yes.sh
echo Y > yes.sh
apt install figlet < yes.sh >/dev/null 2>&1
yum install figlet < yes.sh >/dev/null 2>&1
apt-get install e4defrag < yes.sh >/dev/null 2>&1
yum install e4defrag <yes.sh >/dev/null 2>&1
echo  
echo [!]Instalando paquetes necesarios...
sleep 2
echo [!]Confirmando la instalación de los paquetes.
sleep 2
yum  install zenity < yes.sh >/dev/null 2>&1
apt install zenity < yes.sh >/dev/null 2>&1
sleep 2
echo [!]¡Ya mismo está!
apt install smartmontools < yes.sh >/dev/null 2>&1
yum install smartmontools < yes.sh >/dev/null 2>&1
echo [!]Los paquetes se han instalado o se ha comprobado que ya están instalados.
sleep 1
echo /----------------------------/
echo / Comenzamos en 2 segundos.../
echo /----------------------------/
nombre=$(zenity --entry --title "Su nombre" --text "¿Cuál es su nombre?") >/dev/null 2>&1
ramusado=$(free -mh | grep Memoria | cut -f17 -d " ")
sistema=$(uname)
procesador=$(uname -p)
ram=$(free -mh | grep Memoria | cut -f9 -d " ")
nucleos=$(cat /proc/cpuinfo | grep "model name" | wc | cut -f7 -d " ")
procesadormodelo=$(cat /proc/cpuinfo | grep "model name" | head -n 1 |cut -f3,4,5,6,7,8,9,10 -d " ")
echo [!]Procesando datos...
echo Señor/a $nombre, aquí una breve explicación de su sistema: > readme.txt
echo [!]Creando archivo readme.txt...
echo Su sistema $sistema mantiene un procesador $procesador, creemos que usted mantiene $nucleos nucleos de procesador, el modelo de su procesador es $procesadormodelo >> readme.txt
echo [!]Terminando de plasmar datos en archivo readme.txt...
echo Tu memoria RAM es de $ram, y ahora mismo utilizas $ramusado >> readme.txt
sleep 2
echo [!]A continuación mostraremos información sobre su disco duro, pero antes, debe responder:
sleep 3
discoana=$(zenity --entry --title "¿Dónde está su sistema o disco que quiere que analicemos?" --text "Responde con el formato: /dev/sd¿? (Lo normal es que esté en /dev/sda)") >/dev/null 2>&1
echo -----------------------Adelante información-----------------------
sleep 1
smartctl -l selftest -i $discoana
echo   >> readme.txt
echo    >> readme.txt
echo [!] A continuación, datos de su disco duro: >> readme.txt
echo  >> readme.txt
echo  >> readme.txt
smartctl -l selftest -i $discoana >> readme.txt
echo [!]Hemos plasmado el resultado en el archivo readme.txt
sleep 1
echo [!]Pulse [Enter] cuando quiera continuar.
read i
memoriadedisco=$(smartctl -l selftest -i /dev/sda | grep Capacity | cut -f8,9 -d " ")
echo [!]Por cierto, por si le resulta muy liante, un dato importante podría ser que su memoria de disco es: $memoriadedisco
sleep 5
echo   
echo [!]Muy bien, tome un resumen de los dispositivos que tiene conectadas a su máquina  ¿alguno extraño?
echo 
sleep 3
df -h
sleep 9
echo  >> readme.txt
echo >> readme.txt
echo [!]Copiando datos al archivo readme.txt
echo --------------Información de particionado y dispositivos-------------- >> readme.txt
echo  >>readme.txt
df -h >> readme.txt
echo [!]Información copiada correctamente.
sleep 2
echo [!]$nombre, tienes un procesador $procesador, modelo de procesador $procesadormodelo, con $nucleos nucleos, y su sistema corre con $ram de RAM, y estas usando $ramusado.
sleep 5
echo [!]Si alguno de los datos no es correcto, ¡acude a Google!
sleep 2
wget https://mlsvc01-prod.s3.amazonaws.com/442c6ea9001/c024d02f-764b-4352-be9f-9bfea74507d5.png?ver=1479150763000 > /dev/null 2>&1
display c024d02f-764b-4352-be9f-9bfea74507d5.png\?ver\=1479150763000
rm c024d02f-764b-4352-be9f-9bfea74507d5.png\?ver\=1479150763000
figlet ":D"
zenity --info --text="Ahora pasaremos a buscar y arreglar errores de su sistema." >/dev/null 2>&1
echo [!]Configurando dpkg.
echo  
sleep 5
dpkg --configure -a
apt-get update >/dev/null 2>&1
apt-get upgrade < yes.sh >/dev/null 2>&1
yum update >/dev/null 2>&1
yum upgrade < yes.sh >/dev/null 2>&1
sleep 5
echo  
echo [!]Se está buscando paquetes dañados e intentando solucionar los problemas.
echo  
apt-get -f install < yes.sh >/dev/null 2>&1
yum clean metadata < yes.sh >/dev/null 2>&1
yum clean all < yes.sh >/dev/null 2>&1
apt-get autoclean < yes.sh >/dev/null 2>&1
apt-get autoremove < yes.sh >/dev/null 2>&1
sleep 4
rm yes.sh
echo  
echo [!]Se han eliminado los paquetes que no son necesarios para ahorrar espacio.
sleep 5
echo [!]Vamos a proceder a actualizar el Grub de su sistema.
sleep 1
update-grub > /dev/null 2>&1
figlet Falta poco!
sleep 3
echo [!]A continuación nos pondremos a desfragmentar el disco si usted lo desea.
sh question.sh
echo  
sleep 2
echo ¡Hemos terminado!
zenity --info --text="Hemos terminado, se ha creado un archivo llamado readme.txt con algunos datos de interés sacados en nuestro proceso, ¡hasta la próxima!" >/dev/null 2>&1
