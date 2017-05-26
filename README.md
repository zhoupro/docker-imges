## docker镜像编译

### 命名规范
* 文件夹：　操作系统简写_版本号_服务名称_版本号
>* cs: centos    ubuntu:uu
>* 版本号:big.small
>* eg: uu_14.04_mysql_5.6
* 镜像名称: 用户名称/操作系统简写_服务名称_版本号　
>* eg: prozhou/uu_14.04_mysql_5.6　


* 目录约定
>* 服务目录：/data/server
>* web目录: /data/www/wwwroot
>* 脚本目录: /data/sh




依赖于 lnmp_installer项目
### php
* 支持的版本
    - 5.3.29
    - 5.6.30
    - 7.1.3 (swoole)
* 编译步骤

```bash
./install.sh #选择php版本
docker build -i youname/php-version .
```

### nginx
* 支持的版本
    - 1.4.4
* 编译步骤

```bash
./install.sh #选择nginx版本
docker build -i youname/nginx-version .
```

### mysql
* 支持的版本
    - 5.6
* 编译步骤

```bash
./install.sh #选择nginx版本
docker build -i youname/mysql-version .
```    
### vsftpd

* 编译步骤

```bash
./install.sh #选择nginx版本
docker build -i youname/ftp-version .
``` 



