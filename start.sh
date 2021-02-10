docker build . -t reactdocker &&\
docker run -it -p 8080:80 --name reactnginxapp reactdocker

# Cleanup