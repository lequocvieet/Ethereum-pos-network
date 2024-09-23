.PHONY:  geth1 geth2 geth3

PWD=/app

geth1:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth1/jwtsecret --datadir=./geth1 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth1/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal  --bootnodes "geth1
:30303"

geth2:
	chmod +x ./bin/geth
	./bin/geth  --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth2/jwtsecret --datadir=./geth2 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth2/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal

geth3:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth3/jwtsecret --datadir=./geth3 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth3/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal