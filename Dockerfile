FROM ubuntu:18.04 

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y >> /dev/null 2>&1 

RUN apt-get update -y >> /dev/null 2>&1
RUN apt-get install software-properties-common -y >> /dev/null 2>&1

RUN apt-get install python-pip -y >> /dev/null 2>&1
RUN apt-get install python3 -y >> /dev/null 2>&1
RUN apt-get install python3-pip -y >> /dev/null 2>&1

CMD update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1
RUN mkdir /home/docker/
WORKDIR /home/docker/
RUN  apt-get update -y >> /dev/null 2>&1
RUN apt-get install unzip -y >> /dev/null 2>&1
COPY chatbot_alldata.zip /home/docker/
RUN unzip /home/docker/chatbot_alldata.zip  >> /dev/null 2>&1

CMD cd /home/docker/chatbot_alldata
WORKDIR /home/docker/chatbot_alldata

RUN pip3 install -r requirement.txt >> /dev/null 2>&1

RUN pip3 install --upgrade pip >> /dev/null 2>&1


RUN pip3 install googletrans  >> /dev/null 2>&1

RUN pip3 install tensorflow==2.2 >> /dev/null 2>&1

#RUN chmod -R 777 chatbot_prv 

RUN locale -a | grep "UTF-8"
RUN export LC_ALL=C.UTF-8

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install python3-tk -y >> /dev/null 2>&1

WORKDIR /home/docker/chatbot_alldata/

ENV LANG C.UTF-8

CMD python3 chatbot.py
CMD python3 guimain.py




#apt-get install x11-xserver-utils
#xhost +
#xauth list
#xauth list $DISPLAY
#docker run -it --name docker  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro docker:latest
