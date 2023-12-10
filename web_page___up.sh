sudo docker start psql

ip=$(ifconfig | grep -oP 'inet 19\K\S+')
IP="19$ip:5000"
echo ""
echo ""
echo "IP ===> $IP"
echo ""
sudo docker run --name web-page -p $IP:5000 rfusaro12276/web_page:latest
