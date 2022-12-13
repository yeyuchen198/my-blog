FROM yuchen168/blog AS builder
# ENV TZ=Asia/Shanghai



FROM nginx:1.19.3-alpine
COPY --from=builder /usr/bin/xray /usr/bin/xray
# COPY --from=builder /etc/xray/config.json /etc/xray/config.json
COPY --from=builder /etc/xray /etc/xray


# CMD whereis nginx

# COPY --from=builder /usr/sbin/nginx /usr/local/nginx/sbin/nginx
# # /usr/sbin/nginx
# COPY --from=builder /etc/nginx /etc/nginx

COPY nginx/default.conf /etc/nginx/nginx.conf



EXPOSE 10000

#run nginx when start container
#ENTRYPOINT /usr/local/nginx/sbin/nginx && tail -f /etc/passwd

# CMD ["nginx", "-g", "daemon off;"]
# nginx -g 'daemon off;'


ADD run.sh /
RUN chmod +x /run.sh

# CMD /usr/local/nginx/sbin/nginx && /run.sh
CMD /run.sh
