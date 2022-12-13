FROM yuchen168/blog AS builder
# ENV TZ=Asia/Shanghai


FROM nginx:1.19.3-alpine
COPY --from=builder /usr/bin/xray /usr/bin/xray
# COPY --from=builder /etc/xray/config.json /etc/xray/config.json
COPY --from=builder /etc/xray /etc/xray

COPY nginx/nginx.conf /etc/nginx/nginx.conf


EXPOSE 10000

# CMD ["nginx", "-g", "daemon off;"]
# nginx -g 'daemon off;'

ADD run.sh /
RUN chmod +x /run.sh
CMD /run.sh
