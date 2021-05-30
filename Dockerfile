FROM debian:stable-slim
ENV DEBIAN_FRONTEND noninteractive

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD aria2.conf /root/aria2/aria2.conf
ADD trackers-list-aria2.sh /root/aria2/trackers-list-aria2.sh
ADD run.sh /root/cloudreve/run.sh

RUN apt-get update \
    && apt-get install wget curl aria2 sudo unzip -y

RUN wget -qO /root/cloudreve/cloudreve.tar.gz https://github.com/AishaFisher/cloudreve-heroku/releases/download/3.2.0/cloudreve_60cec72_linux_amd64.tar.gz \
    && wget -qO /root/aria2/dht.dat https://github.com/P3TERX/aria2.conf/raw/master/dht.dat \
    && wget -qO /root/aria2/dht6.dat https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat
    
RUN ls -al /root/cloudreve
RUN ls -al
RUN sudo tar -xzvf /root/cloudreve/cloudreve.tar.gz -C /root/cloudreve
#RUN  cp cloudreve /root/cloudreve
RUN touch /root/aria2/aria2.session /root/aria2/aria2.log
RUN chmod +x /root/cloudreve/cloudreve \
    && chmod +x /root/aria2/trackers-list-aria2.sh \
    && chmod +x /root/cloudreve/run.sh
RUN mkdir -p /root/Download

CMD /root/cloudreve/run.sh
