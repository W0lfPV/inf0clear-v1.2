desfrag=$(zenity --entry --title "Responde como antes, formato /dev/sd?¿" --text "Vamos a procesador a desfragmentar el disco, ¿cúal es el disco que mantiene tu sistema? ") >/dev/null 2>&1
estoo=$(fdisk -l | grep $desfrag)
frag=$(zenity --info --title "¿Qué partición?" --text "Vale, dentro de $desfrag está lo siguiente: \n \n $estoo \n \n Si quieres desfragmentar todo el disco, ponga $desfrag* a continuación:") >/dev/null 2>&1
X2r2=$(zenity --entry --title "Estamos a punto de acabar..." --text "Introduzca la partición o dispositivo") >/dev/null 2>&1
zenity --info --title "Atención" --text "Este proceso puede durar un tiempo considerable, tómese un café a mi salud" >/dev/null 2>&1
e4defrag $X2r2
