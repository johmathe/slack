$ORIGIN .
$TTL 3600		; 1 hour
johmathe.com		IN SOA ks28105.kimsufi.com. johmathe.google.com. (
				2011032102 ; serial
				3600       ; refresh (1 hour)
				1000       ; retry (5 minutes)
				1296000    ; expire (1 week)
				300        ; minimum (2 minutes)
				)
			NS	ks28105.kimsufi.com.
			NS  ns6.gandi.net.
      MX	10 epicurus.nonutc.fr.
			MX	20 bach.nonutc.fr.
      A   91.121.112.17

$ORIGIN johmathe.com.

; A entries

$TTL 3600

www             A 91.121.112.17
