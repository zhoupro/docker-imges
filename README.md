## docker镜像编译
>依赖于 lnmp_installer项目
### php
* 支持的版本
    - 5.3.29
    - 5.6.30
* 编译步骤

```bash
./install.sh #选择php版本
docker build -i youname/php-phpversion .
```
### mysql
* 支持的版本
    - 5.6
    
### vsftpd


