#! /bin/bash
apt-get install libxml2 libxml2-dev libxml2-utils;
apt-get install libaprutil1 libaprutil1-dev;
ln -s /usr/lib/x86_64-linux-gnu/libxml2.so.2 /usr/lib/libxml2.so.2;
apt-get install libapache2-modsecurity -y;
apt install apache2;
service apache2 reload;
mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf;
gedit /etc/modsecurity/modsecurity.conf;
cd /tmp;
wget -O SpiderLabs-owasp-modsecurity-crs.tar.gz https://github.com/SpiderLabs/owaspmodsecurity-crs/tarball/master;
tar -zxvf SpiderLabs-owasp-modsecurity-crs.tar.gz;
cp -R SpiderLabs-owasp-modsecurity-crs-*/* /etc/modsecurity/;
rm SpiderLabs-owasp-modsecurity-crs.tar.gz;
rm -R SpiderLabs-owasp-modsecurity-crs-* ;
mv /etc/modsecurity/modsecurity_crs_10_setup.conf.example /etc/modsecurity/modsecurity_crs_10_setup.conf;
cd /etc/modsecurity/base_rules;
for f in * ; do   ln -s /etc/modsecurity/base_rules/$f /etc/modsecurity/activated_rules/$f ;  done
cd /etc/modsecurity/optional_rules;
for f in * ; do   ln -s /etc/modsecurity/optional_rules/$f /etc/modsecurity/activated_rules/$f ;  done
gedit /etc/modsecurity/modsecurity.conf;
echo "testear";
a2enmod headers;
a2enmod security2;
/etc/init.d/apache2 restart;
gedit /etc/apache2/apache2.conf;
gedit/etc/modsecurity/modsecurity.conf;
apache2ctl configtest;
/etc/init.d/apache2 restart;
apt-get install libapache2-mod-evasive;
mkdir /var/log/mod_evasive;
chown www-data:www-data /var/log/mod_evasive/;
gedit /etc/apache2/mods-available/evasive.conf;
a2enmod evasive ;
/etc/init.d/apache2 restart;
