sources=("ftp://irr.bboi.net/bboi.db.gz" "ftp://rr.Level3.net/pub/rr/level3.db.gz" "https://ftp.lacnic.net/lacnic/irr/lacnic.db.gz" "https://ftp.ripe.net/ripe/dbase/split/ripe.db.route6.gz" "https://ftp.ripe.net/ripe/dbase/split/ripe.db.route.gz" "ftp://ftp.apnic.net/pub/apnic/whois/apnic.db.route6.gz" "ftp://ftp.apnic.net/pub/apnic/whois/apnic.db.route.gz" "ftp://ftp.radb.net/radb/dbase/radb.db.gz" "http://ftp.afrinic.net/pub/dbase/afrinic.db.gz" "ftp://ftp.radb.net/radb/dbase/arin.db.gz" "ftp://ftp.altdb.net/pub/altdb/altdb.db.gz" "ftp://ftp.radb.net/radb/dbase/bell.db.gz" "ftp://ftp.radb.net/radb/dbase/canarie.db.gz" "ftp://irr-mirror.idnic.net/idnic.db.gz" "ftp://ftp.nic.ad.jp/jpirr/jpirr.db.gz" "ftp://rr1.ntt.net/nttcomRR/nttcom.db.gz" "ftp://ftp.panix.com/pub/rrdb/panix.db.gz" "ftp://ftp.ripe.net/ripe/dbase/split/ripe-nonauth.db.route6.gz" "ftp://ftp.ripe.net/ripe/dbase/split/ripe-nonauth.db.route.gz" "ftp://ftp.bgp.net.br/tc.db.gz")

rm irr.db;

for i in "${sources[@]}"
do
  curl --max-time 60 "$i" | gzip -d | grep -e "^route6:" -e "^route:" -e "origin:" >> irr.db
done

wait
echo "Building JSON"
python3 build.py
echo "Finished"
