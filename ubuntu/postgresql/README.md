#Postgresql Dev
##简介
Postgresql93

##使用方法
需要一个data docker提供数据存放位置.
 
##启动示例
`docker run --name="postgresql93" -idt --volumes-from="postgresql93-data" -p 5432:5432   ilegendsoft/postgresql /bin/bash`