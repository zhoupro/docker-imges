## docker镜像编译
>依赖于 lnmp_installer项目
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



