# Chatbot
 Dockerfile to build and  run Docker Container to Python Tkinter Gui chatbot



For ubuntu - get GUI of docker container

sudo apt-get install x11-xserver-utils
xhost +
xauth list
xauth list $DISPLAY
docker run -it --name name -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro image:name




For windows:

Install Docker Desktop
WSL 2 docker window 10 install
Window latest updated otherwise docker desktop showing error.
VcXsrv Windows X Server download 

Docker pull image
Go to Cmd panel and hit docker command first pull image then run

docker run -e DISPLAY=192.168.43.184:0.0 -v C:\Users\Admin:\Admin sourabhj/dockerproject

 
 
