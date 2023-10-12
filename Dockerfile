# Docker is a technology for test my app in many environments for discovering my app works in all environments successfully
# For achieve this we should to transporting my app to Docker container

# for install any node js version in docker container
FROM node:18.16.0

# for create a folder in docker container
WORKDIR /app

# for copy a file from my original app to docker container
COPY package.json .

# for run a command in docker caontainer
RUN npm install

# for copy all files and folders from orginal app to docker container
COPY . .

# for pass enviroment variables to docker container
ENV MESSAGE='Hello world!'

# for specify what's the port that my original app work it
EXPOSE 3500

# for run comand to run my app in docker container
CMD [ "npm", "run", "server" ]



# next step is build Docker file for creating Docker image
# the comand for build Docker file: docker build -t <image name> .

# for showing all Docker images we executing this comand: docker image ls

# for run Docker container usin Docker image must using this comand: 
    # docker run --name <create container name> -d -p <port>:<port> <image name>

    # docker run --name mycontainer -v C:\Users\brahi\OneDrive\Bureau\DockerTest:/test -d -p 3500:3500 testimage
    # when apply -v flag and original app path and docker container directory. docker will listen any changes in original app and insert it in docker container
    # but must restart the container: docker <stop|start> mycontainer

    # docker run --name mycontainer -v C:/Users/brahi/OneDrive/Bureau/DockerTest:/test:ro -d -p 3500:3500 testimage
    # when add :ro flag to docker container directory. become the docker container just reading the changes not apply changes in working directory

    # docker run --name mycontainer -v ${pwd}:/test:ro -d -p 3500:3500 testimage
    # The ${pwd} params is a windows camand for get the working directory path

    # docker run --name con -v ${pwd}:/app:ro --env-file ./.env -d -p 3500:3500 test
    # The --env-file flag for adding .env file (using his path './.env') in docker container

# for remove Docker image: docker rmi <image name>

# for showing all Docker container: docker ps

# for remove Docker container: docker rm <container name> -f

# for controlle Docker container using terminal: docker exec -it <container name> bash