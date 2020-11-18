FROM centos:7

RUN yum update -y \
	&& yum install https://mirror.webtatic.com/yum/el7/webtatic-release.rpm epel-release -y\
	&& yum install mariadb mariadb-server nginx php71w php71w-fpm php71w-mbstring php71w-common php71w-gd php71w-mcrypt php71w-mysql php71w-xml php71w-cli php71w-devel php71w-pecl-memcached php71w-pecl-redis php71w-opcache -y 

ENV MARIADB_USER root
ENV MARIADB_PASS 123456

COPY scripts/db.sh /root/db.sh
COPY scripts/run.sh /root/run.sh
COPY files/wordpress-5.4.2-zh_CN.tar.gz /usr/share/nginx/
COPY files/certs/ /usr/share/nginx/certs
COPY files/wordpress.conf /etc/nginx/conf.d/



RUN chmod 755 /root/run.sh /root/db.sh\
    && /bin/bash /root/db.sh \
    && tar -zxvf /usr/share/nginx/wordpress-5.4.2-zh_CN.tar.gz -C /usr/share/nginx \
		&& yum clean all \
    && rm -f /usr/share/nginx/wordpress-5.4.2-zh_CN.tar.gz

COPY files/wp-config.php /usr/share/nginx/wordpress/
RUN chown -R nginx:nginx /usr/share/nginx/

VOLUME ["/var/lib/mysql","/usr/share/nginx/","/etc/nginx/"]

EXPOSE 443


CMD ["/bin/bash","/root/run.sh"]
