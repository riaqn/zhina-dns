#!/usr/bin/awk -f
# This script expects to read from
# ftp://ftp.ripe.net/pub/stats/apnic/delegated-apnic-latest

# Please fill you VPS's IPv4 here
VPS=""

BEGIN {
	FS="|";
}
$2 == "CN" && $3 == "ipv4" {
	prefix=32;
	while ($5 > 1) {
		--prefix;
		$5 = $5/2;
	}
	print $4 "/" prefix 
}
END {
	print $VPS
	
	print "0.0.0.0/8"
	print "10.0.0.0/8"
	print "127.0.0.0/8"
	print "192.168.0.0/16"
}