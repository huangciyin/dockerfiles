#odoo Dev
##简介
odoo 容器，包含odoo运行需要的各种依赖。
##使用方法
需要启动外部的postgresql docker(例如[maxexcloo/postgresql](https://registry.hub.docker.com/u/maxexcloo/postgresql/)),在run时做link操作。  
代码放在宿主机/opt/odoo/server,根据postgresql修改/opt/odoo/conf/odoo.conf .
 
##启动示例
```docker run -tid -p 8069:8069 -p 8072:8072 --link postgresql:db -v /opt/odoo:/opt/odoo --name odoo  ilegendsoft/odoo sh /config/bootstrap.sh```