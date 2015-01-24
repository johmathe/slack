$ttl 86400
arsindustrialis.net.   IN      SOA     arsindustrialis.net. postmaster.arsindustrialis.net. (
                        2010100901
                        3600       ; refresh (1 hour)
                        1000        ; retry (5 minutes)
                        1296000     ; expire (1 week)
                        300        ; minimum (2 minutes)
                        )
                IN      NS      ks28105.kimsufi.com.
                IN      NS      ns.kimsufi.com.
                IN      MX      10 mail.arsindustrialis.net.
                IN      A       91.121.106.198
www             IN      A       91.121.106.198
mail            IN      A       91.121.106.198
smtp            IN      A       91.121.106.198
pop             IN      A       91.121.106.198
pop3            IN      A       91.121.106.198
imap            IN      A       91.121.106.198
sql             IN      A       91.121.106.198
mysql           IN      A       91.121.106.198
