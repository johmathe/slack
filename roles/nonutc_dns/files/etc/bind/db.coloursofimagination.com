$ORIGIN .
$TTL 3600		; 1 hour
nonutc.fr		IN SOA	cod60-1-82-230-248-28.fbx.proxad.net. johmathe.etu.utc.fr. (
				2008031001 ; serial
				3600       ; refresh (1 hour)
				300        ; retry (5 minutes)
				604800     ; expire (1 week)
				120        ; minimum (2 minutes)
				)
			NS	ns6.gandi.net.
			NS	cod60-1-82-230-248-28.fbx.proxad.net.
			A	213.251.181.139

$ORIGIN coloursofimagination.com.

; Entrées A

$TTL 3600

