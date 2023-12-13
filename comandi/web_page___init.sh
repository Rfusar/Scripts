sudo docker start psql

ip=$(ifconfig | grep -oP 'inet 19\K\S+')
IP="19$ip:5000"
sudo docker run --name web_page -p $IP:5000 rfusaro12276/web_page:latest

sudo docker stop psql
sudo docker stop web_page
