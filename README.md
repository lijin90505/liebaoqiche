liebaiqiche信息化平台项目地址：https://github.com/papafly123/liebaoqiche 提供用户鉴权、活动管理、积分管理、卡券管理、经验值等级管理、支付流水、支付退款管理、支付配置管理、支付对账管理、接入系统管理、监控系统管理、系统管理等功能。


平台总体架构设计
![加载图片失败](https://github.com/papafly123/img-floder/blob/master/ItemDesign.png)

NGTP架构精要
![加载图片失败](https://github.com/papafly123/img-floder/blob/master/essenceOfArchitecture.png)

平台内部各个系统均采用统一的数据安全策略和流程，对于敏感数据我们采用业界标准的加密算法进行加密包括RSA/AES/MD5。对于敏感数据的传输保护，我们采用VPN，IPSEC，SSL等方式。在数据库层次上，我们针对敏感数据列和表进行加密处理以降低内部和外部的威胁。
![加载图片失败](https://github.com/papafly123/img-floder/blob/master/Secret.jpg)

#技术栈

#后端技术栈

1.SpringMVC

2.MyBatis

3.Mysql

#前端技术栈

1.EasyUI

#快速部署

1.clone项目到本地git@github.com:papafly123/liebaiqiche.git

2.数据库脚本放在DB目录下，在Mysql中执行数据库脚本

3.数据库配置在liebaiqiche项目的resources目录下的jdbc.properties文件中

4.在Eclipe中运行liebaiqiche项目

OK，至此，服务端就启动成功了，此时我们直接在地址栏输入http://localhost:8080即可访问我们的项目。

#文档

待完善