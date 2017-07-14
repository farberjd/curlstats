#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

CURLSTATS=`curl -vw '%{time_namelookup}\t%{time_connect}\t%{time_appconnect}\t%{time_pretransfer}\t%{time_redirect}\t%{time_starttransfer}\t%{time_total}\t%{filename_effective}\t%{http_code}\t%{http_connect}\t%{http_version}\t%{local_ip}\t%{local_port}\t%{num_connects}\t%{num_redirects}\t%{time_namelookup}\t%{remote_ip}\t%{remote_port}\t%{size_download}\t%{size_header}\t%{size_request}\t%{size_upload}\t%{speed_download}\t%{speed_upload}\t%{ssl_verify_result}\t%{url_effective}\n' -o /dev/null -s $1`
TIMENAMELOOKUP=`echo -e $CURLSTATS | awk '{print $1}'`
TIMECONNECT=`echo -e $CURLSTATS | awk '{print $2}'`
TIMEAPPCONNECT=`echo -e $CURLSTATS | awk '{print $3}'`
TIMEPRETRANSFER=`echo -e $CURLSTATS | awk '{print $4}'`
TIMEREDIRECT=`echo -e $CURLSTATS | awk '{print $5}'`
TIMESTARTTRANSFER=`echo -e $CURLSTATS | awk '{print $6}'`
TIMETOTAL=`echo -e $CURLSTATS | awk '{print $7}'`
FILENAMEFFECTIVE=`echo -e $CURLSTATS | awk '{print $8}'`
HTTPCODE=`echo -e $CURLSTATS | awk '{print $9}'`
HTTPCONNECT=`echo -e $CURLSTATS | awk '{print $10}'`
HTTPVERSION=`echo -e $CURLSTATS | awk '{print $11}'`
LOCALIP=`echo -e $CURLSTATS | awk '{print $12}'`
LOCALPORT=`echo -e $CURLSTATS | awk '{print $13}'`
NUMCONNECTS=`echo -e $CURLSTATS | awk '{print $14}'`
NUMREDIRECTS=`echo -e $CURLSTATS | awk '{print $15}'`
REDIRECTURL=`echo -e $CURLSTATS | awk '{print $16}'`
REMOTEIP=`echo -e $CURLSTATS | awk '{print $17}'`
REMOTEPORT=`echo -e $CURLSTATS | awk '{print $18}'`
SIZEDOWNLOAD=`echo -e $CURLSTATS | awk '{print $19}'`
SIZEHEADER=`echo -e $CURLSTATS | awk '{print $20}'`
SIZEREQUEST=`echo -e $CURLSTATS | awk '{print $21}'`
SIZEUPLOAD=`echo -e $CURLSTATS | awk '{print $22}'`
SPEEDDOWNLOAD=`echo -e $CURLSTATS | awk '{print $23}' | sed 's/\..*//'`
SPEEDUPLOAD=`echo -e $CURLSTATS | awk '{print $24}'`
SSLVERIFYRESULT=`echo -e $CURLSTATS | awk '{print $25}'`
URLEFFECTIVE=`echo -e $CURLSTATS | awk '{print $26}'`

KBSPEED=`expr $SPEEDDOWNLOAD / 1024`
MBSPEED=`expr $SPEEDDOWNLOAD / 1048576`

KBSIZE=`expr $SIZEDOWNLOAD / 1024`
MBSIZE=`expr $SIZEDOWNLOAD / 1048576`
echo -e ""
if [ $MBSPEED -gt 10 ] ; then
    echo -e "Transfered \033[0;32m$MBSPEED\033[0m MB/sec in \033[0;32m$TIMETOTAL\033[0m seconds."
else
    echo -e "Transfered \033[0;32m$KBSPEED\033[0m KB/sec in \033[0;32m$TIMETOTAL\033[0m seconds."
fi
echo -e "----------------------------------------"
echo -e "  DNS Resolve Time: \033[0;32m$TIMENAMELOOKUP\033[0m seconds."
echo -e "   time_namelookup: $TIMENAMELOOKUP seconds"
echo -e "   time_appconnect: $TIMEAPPCONNECT seconds"
echo -e "  time_pretransfer: $TIMEPRETRANSFER seconds"
echo -e "     time_redirect: $TIMEREDIRECT seconds"
echo -e "time_starttransfer: $TIMESTARTTRANSFER seconds"
#echo -e "        time_total: \033[0;32m$TIMETOTAL\033[0m seconds"
echo -e "filename_effective: $FILENAMEFFECTIVE"
echo -e "         http_code: \033[0;32m$HTTPCODE\033[0m"
echo -e "      http_connect: $HTTPCONNECT"
echo -e "      http_version: $HTTPVERSION"
echo -e "          local_ip: $LOCALIP"
echo -e "        local_port: $LOCALPORT"
echo -e "      num_connects: $NUMCONNECTS"
echo -e "     num_redirects: $NUMREDIRECTS"
echo -e "         remote_ip: \033[0;32m$REMOTEIP\033[0m"
echo -e "       remote_port: \033[0;32m$REMOTEPORT\033[0m"
if [ $MBSIZE -gt 10 ] ; then
    echo -e "     size_download: $MBSIZE MB"
else
    echo -e "     size_download: $KBSIZE KB"
fi
echo -e "       size_header: $SIZEHEADER"
echo -e "      size_request: $SIZEREQUEST"
echo -e "       size_upload: $SIZEUPLOAD"
if [ $MBSPEED -gt 10 ] ; then
    echo -e "    speed_download: $MBSPEED MB"
else
    echo -e "    speed_download: $KBSPEED KB"
fi
echo -e "      speed_upload: $SPEEDUPLOAD"
echo -e " ssl_verify_result: $SSLVERIFYRESULT"
echo -e "     url_effective: $URLEFFECTIVE"


