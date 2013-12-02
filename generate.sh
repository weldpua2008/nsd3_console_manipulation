#!/bin/bash
echo >/etc/nsd3/master.zone.conf
cd /etc/nsd3

for i in 1tbit.ru site.ru
 do
	sed -e "s/wel.org.ua/$i/g" /etc/nsd3/zone.conf/wel.org.ua >> /etc/nsd3/master.zone.conf
	  # /etc/nsd3/zone.conf/$i
	sed -e "s/wel.org.ua/$i/g" /etc/nsd3/zone/master/wel.org.ua > /etc/nsd3/zone/master/$i
	echo "include: \"/etc/nsd3/zone.conf/$i\""
done


for i in pstool.ru breezeuser.ru mirvba.ru XN----7SBHMGTT1B4F.XN--P1AI XN----7SBHIFHTDMOPB.XN--P1AI XN----7SBBHJGKZZ.XN--P1AI XN----7SBQAAHCWUFHM3B9D.XN--P1AI XN----7SBEVQQY2GB.XN--P1AI XN----7SBUGIBRFHBJLK.XN--P1AI XN----7SBQAGTJL4AJL6C.XN--P1AI XN----7SBKHHCTBXOCX.XN--P1AI ekonomiks.net.ua akropol-spb.ru academik.com.ua wigame.ru weingame.ru kaluga-prod-torg.ru xn--90awpj2c.xn--p1ai limonad.biz formstyle.com.ua bolero.kh.ua XN----7SBABO1ADK3AE0AF2B.XN--P1AI isp.pl.ua XN----9SBKCBQDN5CDZ.XN--P1AI xn--80ahwoes.pl.ua drupal.pl.ua burn.pl.ua xn--e1aancihr2a9a.pl.ua xn--h1aebjvk.pl.ua dom-radio.pl.ua kupilink.info tverhotels.info rnb-bianka.com big-hosting.spb.ru biznessv.ru borblok.ru dotnetcoding.ru egostyle.spb.ru faceoffuture.ru glasses-shop.ru gnu.net.ru gurzuf.msk.ru kinocovers.com.ru mclarencars.com.ru misaf.ru motorola-news.ru nixstudio.ru postfix.org.ru seo-masters.org.ru sleep-drive.org.ru svyatoynikolay.ru top-finance.org.ru yanshyk.ru ymalusha.ru zagranicu.net.ru gkvodoley.com.ua luxwatch.org.ua mgf.in.ua perepel.co.ua statya.org.ua


do
	sed -e "s/site.ru.sample/$i/g" /etc/nsd3/zone.conf/site.ru.sample >> /etc/nsd3/master.zone.conf
	  # /etc/nsd3/zone.conf/$i
	sed -e "s/site.ru.sample/$i/g" /etc/nsd3/zone/master/site.ru.sample > /etc/nsd3/zone/master/$i
	echo "include: \"/etc/nsd3/zone.conf/$i\""
done





/etc/init.d/nsd3 rebuild
/usr/sbin/nsdc rebuild
/etc/init.d/nsd3 restart

