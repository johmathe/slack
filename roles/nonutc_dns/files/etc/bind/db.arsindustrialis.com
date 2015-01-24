$ttl 86400
arsindustrialis.com.   IN      SOA     arsindustrialis.com. postmaster.arsindustrialis.com. (
                        2014060101 
                        3600       ; refresh (1 hour)
                        1000        ; retry (5 minutes)
                        1296000     ; expire (1 week)
                        300        ; minimum (2 minutes)
                        )
                IN      NS      ks28105.kimsufi.com.
                IN      NS      ns.kimsufi.com.
                IN      MX      10 mail.arsindustrialis.com.
                IN      A       46.105.103.86
www             IN      A       46.105.103.86
mail            IN      A       46.105.103.86
smtp            IN      A       46.105.103.86
pop             IN      A       46.105.103.86
pop3            IN      A       46.105.103.86
imap            IN      A       46.105.103.86
sql             IN      A       46.105.103.86
mysql           IN      A       46.105.103.86
