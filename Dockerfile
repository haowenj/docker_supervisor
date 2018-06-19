# 自己构建的基于nginx 和 php7.0 的 镜像
FROM hwj637096/nginx-php7.0
MAINTAINER Hwj "XXX@163.com"
# 将两个laravel的队列配置文件放在supervisor的配置文件夹里
COPY *.conf /etc/supervisor/conf.d/
# 将nginx的默认配置文件复制到Nginx的配置目录
COPY default /etc/nginx/sites-available/
# supervisor前台运行命令
CMD supervisord -c /etc/supervisor/supervisord.conf -n
# 暴露80端口
EXPOSE 80