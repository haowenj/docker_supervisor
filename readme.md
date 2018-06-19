### 目录结构
````
supervisor:存放supervisor的日志
default Nginx配置文件
laravel-work-default.conf laravel队列配置文件
laravel-work-other.conf laravel队列配置文件
Dockerfile 构建docker镜像文件

````

### 构建镜像
````sybase
docker build -t 自定义镜像名字 .
````

### 运行镜像
````sybase

docker run -d -p 宿主机端口:80 -v 宿主机项目根目录:/var/www/html/laravel_supervisor -v $PWD/supervisor目录:/var/log/supervisor --name 自定义容器名字 构建的镜像名字
````

### 添加反向代理
````sybase
server {
    listen 80;

    index index.php index.html index.htm index.nginx-debian.html;

    server_name supervisor.thinkleak.com;

    location / {
        proxy_pass http://127.0.0.1:映射到宿主机的端口;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_set_header X-Real-IP $remote_addr;
    }
}
````