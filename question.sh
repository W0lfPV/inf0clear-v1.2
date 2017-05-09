zenity --question --title "Siguiente paso.." --text "¿Quieres que hagamos una desfragmentación del disco?" >/dev/null 2>&1
case $? in 
  0)sh desfragmentado.sh
  ;; 
  1) echo [!]Jo, vale, la verdad es que es algo poco necesario en formatos vinculados a sistemas GNU/Linux, pero aún así cada un tiempo siempre viene bien, sigamos!
  ;; 
  *) echo "Timeout"
  ;; 
esac

