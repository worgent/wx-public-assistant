#!/bin/bash
connect_sql="mysql -uroot  -pOvrn123456"
#执行抓取程序,进行抓取
echo `date`
jecho "抓取程序开始运行"

echo "#1程序开始抓取"
java -jar /usr/local/article_spider/chuansongmen/article_spider_chuansongmen.jar
echo "程序抓取结束"


echo "#2开始将抓取的文章导入到数据库中"

ret=`$connect_sql article_spider -e "
insert into wpweixin.wpwx_article(
spider_id,title,category_id,link,
read_num,support,summary,thumbnail,
publish_time,created_time,update_time)
(select wa.id,wa.title,wc.category,wa.link,
wa.read_num,wa.support,wa.summary,wa.thumbnail,
wa.publish_time,wa.create_time,wa.create_time 
from article_spider_chuansongmen.wx_article wa join article_spider_chuansongmen.wx_category wc 
on wa.category_name=wc.special 
where DATE_FORMAT(wa.create_time, \"%Y-%m-%d\")=DATE_FORMAT(now(), \"%Y-%m-%d\"));
"`
ret2=`$connect_sql article_spider -e "
insert into wpweixin.wpwx_article_content(article_id,content)
(select wpa.id,wxa.content 
from wpweixin.wpwx_article as wpa join article_spider_chuansongmen.wx_article as wxa 
on wxa.id = wpa.spider_id and DATE_FORMAT(wpa.created_time, \"%Y-%m-%d\")=DATE_FORMAT(now(), \"%Y-%m-%d\") );
"`
echo "#2执行结果1,"$ret
echo "#2执行结果2,"$ret2

echo `date`


