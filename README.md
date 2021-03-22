# sanitIRRy
A tool for using IRR to valid routes like RPKI using an RTR server

## Usage
sanitIRRY should not deployed on any networks where traffic arriving is important as around 10% (87,845 / 855,781 as of March 22, 2021) of the DFZ lacks either RPKI or IRR validation.
```bash
sh build.sh
http-server -p 8080 & # Just start some kind of HTTP server serving the irr.json file
go run gortr.go -metrics.addr ":8083" -cache http://127.0.0.1:8080/irr.json -verify=false
```

## Why
sanitIRRy was written for research into the authorization of routes on the DFZ
