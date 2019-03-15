#!/bin/bash
opcion1="1"
opcion2="2"
# comando para mostrar la ip que estamos conectados
ip="$(hostname -I)"
echo "esta es tu IP:$ip"
#mandamos esa ip a un archivo para que se nos sea mas sencillo dividirlo
for i in "$ip"; do
    echo -e $i > "ip.txt"
done    
#cortamos las tres primeras partes.
ipcut="$(cat "ip.txt" | cut -d"." -f1-3)"
#borramos el archivo
rm "ip.txt"
#aqui definimos el rango que direcciones que nosotros deseamos
for i in {1..10}; do 
    ping -c 1 $ipcut.$i >/dev/null && echo "respondio este host $ipcut.$i"
done