#!/bin/bash
echo >/etc/nsd3/master.zone.conf
cd /etc/nsd3

for i in `ls /etc/nsd3/generate|grep .domain`;do

	#echo $i
	for a in `cat /etc/nsd3/generate/$i|grep -v '#'`;do 
	#		echo $a;
	b=`echo $a|tr ':' ' '`
	#echo $b	
	domain=`echo $b|awk '{print $1}'`
#	echo $domain
ns1=`echo $b|awk '{print $2}'`;
ns2=`echo $b|awk '{print $3}'`;
mx=`echo $b|awk '{print $4}'`;
a_ip=`echo $b|awk '{print $5}'`;
ns1_ip=`echo $b|awk '{print $6}'`;
ns2_ip=`echo $b|awk '{print $7}'`;
echo "{$domain} {$ns1} {$ns2} {$mx} {$a_ip} {$ns1_ip} {$ns2_ip}";

	sed -e "s/{domain}/$domain/g" -e "s/{ns1}/$ns1/g" -e "s/{ns2}/$ns2/g" -e "s/{mx}/$mx/g" -e "s/{a_ip}/$a_ip/g" -e "s/{ns1_ip}/$ns1_ip/g" -e "s/{ns2_ip}/$ns2_ip/g"    /etc/nsd3/generate/zone.conf >  /etc/nsd3/zone/master/$domain

        sed -e "s/{domain}/$domain/g" /etc/nsd3/generate/zone-zone.conf >> /etc/nsd3/master.zone.conf


	done

echo "---------"
done



/etc/init.d/nsd3 rebuild
/usr/sbin/nsdc rebuild
/etc/init.d/nsd3 restart

