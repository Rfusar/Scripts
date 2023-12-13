var=true
while $var; do
    clear
    echo "					--esci: esci dal programma"
    echo ""
    echo ""
    echo "--update: aggiornare WEB_PAGE"
    echo "--up: accendi WEB_PAGE"
    echo "--down: spegni WEB_PAGE "
    echo ""
    echo ""
    read -p "cosa devi fare?" ris
    

    if [ "$ris" = "update" ]; then
	update=true
        sudo docker rmi rfusaro12276/web_page:latest
	sudo docker pull rfusaro12276/web_page:latest
	clear 
	echo "AVVIO DEL TEST"
	./comandi/web_page___init.sh	
	while $update; do
	    clear 
	    read -p "Vuoi fare altro? [Y/N]" update_ris
	        if "$update_ris" = "Y"; then
			update=false
	        elif "$update_ris" = "N"; then
			update=false
			var=false
		fi
	done


    elif [ "$ris" = "up" ]; then
	clear
	./comandi/web_page___up.sh
	ip=$(ifconfig | grep -oP 'inet 19\K\S+')
	IP="19$ip:5000"
	echo "Prova su:"
	echo "		$IP" 
	echo "		172.17.0.3"
	read


    elif [ "$ris" = "down" ]; then
	clear
	./comandi/web_page___down.sh	
    
    elif [ "$ris" = "esci" ]; then
	clear
        var=false
    fi		    
done

