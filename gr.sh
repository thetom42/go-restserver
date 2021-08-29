docker stop gr >> /dev/null 2>&1
docker rm gr >> /dev/null 2>&1
docker build -t go-restserver:0.1 -f Dockerfile .
docker run -d -p 2323:1323 --name gr go-restserver:0.1