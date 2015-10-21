ubuntu-ssh
============

![](https://dn-daoweb-resource.qbox.me/image-icon/ubuntu.svg)

[Ubuntu](http://www.ubuntu.org.cn/index_kylin)（乌班图）是一个以桌面应用为主的Linux操作系统，其名称来自非洲南部祖鲁语或豪萨语的“ubuntu”一词，意思是“人性”、“我的存在是因为大家的存在”，是非洲传统的一种价值观，类似华人社会的“仁爱”思想。Ubuntu基于Debian发行版和GNOME桌面环境，而从11.04版起，Ubuntu发行版放弃了Gnome桌面环境，改为Unity，与Debian的不同在于它每6个月会发布一个新版本。Ubuntu的目标在于为一般用户提供一个最新的、同时又相当稳定的主要由自由软件构建而成的操作系统。Ubuntu具有庞大的社区力量，用户可以方便地从社区获得帮助。2013年1月3日，Ubuntu正式发布面向智能手机的移动操作系统。

简介
-----

简单的包含ssh访问的ubuntu的docker镜像


使用
-----

执行以下命令创建ubuntu-ssh镜像

	docker build -t dockerxman/ubuntu-ssh:latest .



运行ubuntu-ssh
--------------------

从前面创建的“latest”标签镜像运行一个容器,在所有接口绑定到端口2222,执行:

	docker run -d -p 0.0.0.0:2222:22 dockerxman/ubuntu-ssh:latest

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

第一次你运行你的容器,将为用户“root”生成一个随机密码，通过查看容器运行的日志来查看密码:

	docker logs <CONTAINER_ID>

你将看到一个如下输出:

	========================================================================
	You can now connect to this Ubuntu container via SSH using:

	    ssh -p <port> root@<host>
	and enter the root password 'U0iSGVUCr7W3' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================

在这种情况下, `U0iSGVUCr7W3` 就是分配给`root`用户的密码

完成!


设置一个特定的root帐户密码
------------------------------------------------

如果你想使用一个预设的密码,而不是一个随机生成的一个,你可以在运行容器时设置环境变量“ROOT_PASS”设置一个特定密码:

	docker run -d -p 2222:22 -e ROOT_PASS="mypass" dockerxman/ubuntu-ssh:latest


添加SSH授权密钥
--------------------------

如果你想用你的SSH密钥登录,您可以使用“AUTHORIZED_KEYS”环境变量。你可以添加多个公共密钥对,用”、“进行分离:

    docker run -d -p 2222:22 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" dockerxman/ubuntu-ssh:latest


代码创建和维护
--------------

* QQ: 479608797

* 邮件: fenyunxx@163.com

* [github](https://github.com/xiongjungit/docker-ubuntu-ssh)

* [dockerhub](https://hub.docker.com/r/dockerxman/)
