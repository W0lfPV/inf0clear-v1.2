echo "Pulsa [Enter] para comenzar, por favor, acuerdese de ejecutar este programa con poder de administrador, si no lo tiene asi, pulse Ctrl-C."
read o
echo [!]Iniciando ...
sleep 2
apt install figlet
yum install figlet
echo [!]Espere ...
sleep 2
yum  install zenity
apt install zenity
sleep 2
echo [!]¡Ya mismo está!
apt install smartmontools
yum install smartmontools
sleep 1
echo /----------------------------/
echo / Comenzamos en 2 segundos.../
echo /----------------------------/
nombre=$(zenity --entry --title "Su nombre" --text "¿Cuál es su nombre?")
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
discoana=$(zenity --entry --title "¿Dónde está su sistema o disco que quiere que analicemos?" --text "Responde con el formato: /dev/sd¿? (Lo normal es que esté en /dev/sda)")
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
echo [!]Ahora esperaremos 30 segundos para continuar.
memoriadedisco=$(smartctl -l selftest -i /dev/sda | grep Capacity | cut -f8,9 -d " ")
echo [!]Por cierto, por si le resulta muy liante, un dato importante podría ser que su memoria de disco es: $memoriadedisco
sleep 30
echo [!]Muy bien, tome un resumen de los dispositivos que tiene conectadas a su máquina  ¿alguno extraño?
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
sleep 10
rm c024d02f-764b-4352-be9f-9bfea74507d5.png\?ver\=1479150763000
figlet ":D"
zenity --info --text="Ahora pasaremos a buscar y arreglar errores de su sistema."
echo [!]Configurando dpkg.
sleep 5
dpkg --configure -a
apt-get update
apt-get upgrade
yum update
yum upgrade
sleep 5
echo [!]Se está buscando paquetes dañados e intentando solucionar los problemas.
apt-get -f install
yum clean metadata
yum clean all
apt-get autoclean
apt-get autoremove
sleep 4
echo [!]Se han eliminado los paquetes que no son necesarios para ahorrar espacio.
sleep 5
echo [!]Vamos a proceder a actualizar el Grub de su sistema.
sleep 1
update-grub > /dev/null 2>&1
figlet Falta poco!
