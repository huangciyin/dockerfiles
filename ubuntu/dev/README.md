#Ubuntu Dev
##简介
Ubuntu Dev Image
##使用方法
启动镜像后执行 /config/bootstrap.sh,依次执行/config/init下的脚本进行初始化,并上传supervisor配置文件,
默认通过supervisor启动sshd. 用户名/密码: root/root
 
##启动示例 
```docker run -tid --name buntu-dev  ilegendsoft/ubuntu-dev /bin/bash```