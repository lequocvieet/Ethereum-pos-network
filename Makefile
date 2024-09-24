.PHONY:  geth1 geth2 geth3
PWD=/app
NODEKEY1=9a3908c2156a901cc035325230186da25d28a60fdb44af16aab42e8b6d1f20d87ef22691370940a7eeacfbd6cabd5198882218c0a6707ba669440b0f4ef2a241
NODEKEY2=bfc21049b09d1acf828eb896b432accd90fa02764f4e99d17963efdef3070084b7caad1d5acac1eae92c451271fa61dde948df6faf3f66c29e5543ea587a5369
NODEKEY3=ab62bc1f00e557dd805425359091a9183ad6ace2ed643320744f53d722d54f08eed848f994d13d3c00dc9de400b0bba15b6151c55cffeb3d50683a44690bc83a
IPGETH1=10.22.0.10
IPGETH2=10.22.0.11
IPGETH3=10.22.0.12
PEER_PORT=30303
#enode://ab62bc1f00e557dd805425359091a9183ad6ace2ed643320744f53d722d54f08eed848f994d13d3c00dc9de400b0bba15b6151c55cffeb3d50683a44690bc83a@10.22.0.12:30303
ENODE_ADDRESS="enode://${NODEKEY1}@${IPGETH1}:${PEER_PORT},enode://${NODEKEY2}@${IPGETH2}:${PEER_PORT},enode://${NODEKEY3}@${IPGETH3}:${PEER_PORT}"
 #--bootnodes=${ENODE_ADDRESS}
 #./bin/geth attach --exec admin.nodeInfo.enr geth1/geth.ipc
geth1:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --nat=none --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth1/jwtsecret --datadir=./geth1 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth1/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal --bootnodes=${ENODE_ADDRESS} 

geth2:
	chmod +x ./bin/geth
	./bin/geth  --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --nat=none --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth2/jwtsecret --datadir=./geth2 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth2/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal  --bootnodes=${ENODE_ADDRESS}

geth3:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --nat=none --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth3/jwtsecret --datadir=./geth3 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth3/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal  --bootnodes=${ENODE_ADDRESS}

prysm:
	chmod +x ./consensus/prysm.sh
	./consensus/prysm.sh beacon-chain --rpc-provider=http://${IPGETH1}:8545
	