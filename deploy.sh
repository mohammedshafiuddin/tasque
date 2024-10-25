docker stop app

docker rm app

docker build -t app:latest .

docker run -d -p 443:443 --name app app:latest