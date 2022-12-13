FROM yuchen168/blog
ENV TZ=Asia/Shanghai

ADD run.sh /
RUN chmod +x /run.sh



#base image
# FROM ubuntu

#MAINTAINER
# MAINTAINER longwentao255@126.com

#unpack nginx
ADD ./nginx-1.18.0.tar.gz /usr/local/src

RUN apt-get update

#install independency package
RUN apt-get install -y 'g++'
RUN apt-get install -y openssl libssl-dev
RUN apt-get install -y libpcre3 libpcre3-dev
RUN apt-get install -y zlib1g-dev

#install make package
RUN apt-get install -y make

#change dir to workdir
WORKDIR /usr/local/src/nginx-1.18.0

#config and install nginx
RUN ./configure --prefix=/usr/local/nginx && make && make install

COPY nginx/default.conf /etc/nginx/nginx.conf

EXPOSE 80

#run nginx when start container
#ENTRYPOINT /usr/local/nginx/sbin/nginx && tail -f /etc/passwd

# CMD ["nginx", "-g", "daemon off;"]
# nginx -g 'daemon off;'



# CMD /usr/local/nginx/sbin/nginx && /run.sh
CMD /run.sh
