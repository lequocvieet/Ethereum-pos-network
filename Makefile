.PHONY:  geth1 geth2 geth3
PWD=/app
NODEKEY1=31cc58c833115e360122ea07d56a69522c359d0a78e01899789752e61c46750c0dc802a0e7f7e122ba47d1761cab704b58038f64e0ecf0ea40bfc16562b6068a
NODEKEY2=ed83d43e24c57a4fabefbb69a82de1023b76109eb130f3fdfe95dae8d159c5eb2b44253adf52cc162182e851d17a39dd5791d0f998750b1c37cc3ce4b9fd76fc
NODEKEY3=328de564e5e8dd946f79653dc8c4766accbed531252b8a2df449196a13281cfd33bbbca3f05ed1b653674879348bb47f3d43a1868f917eec999b8fe94d4130b5
IPGETH1=166.22.0.10
IPGETH2=166.22.0.11
IPGETH3=166.22.0.12
PEER_PORT=30303
#enode://ab62bc1f00e557dd805425359091a9183ad6ace2ed643320744f53d722d54f08eed848f994d13d3c00dc9de400b0bba15b6151c55cffeb3d50683a44690bc83a@10.22.0.12:30303
ENODE_ADDRESS="enode://${NODEKEY1}@${IPGETH1}:${PEER_PORT},enode://${NODEKEY2}@${IPGETH2}:${PEER_PORT},enode://${NODEKEY3}@${IPGETH3}:${PEER_PORT}"
 #--bootnodes=${ENODE_ADDRESS}
 #./bin/geth attach --exec admin.nodeInfo.enr geth1/geth.ipc
geth1:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0  --http.corsdomain=* --ws --ws.api=eth,net,web3   --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=*  --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth1/jwtsecret --datadir=./geth1 --nodekey=./geth1/geth/nodekey  --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth1/geth_password.txt  --syncmode=full --verbosity=3  --log.format=terminal --bootnodes=${ENODE_ADDRESS} 

geth2:
	chmod +x ./bin/geth
	./bin/geth  --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0  --http.corsdomain=* --ws --ws.api=eth,net,web3   --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth2/jwtsecret --datadir=./geth2 --nodekey=./geth2/geth/nodekey --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth2/geth_password.txt  --syncmode=full --verbosity=3 --log.format=terminal  --bootnodes=${ENODE_ADDRESS}

geth3:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0  --http.corsdomain=* --ws --ws.api=eth,net,web3   --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth3/jwtsecret --datadir=./geth3 --nodekey=./geth3/geth/nodekey --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth3/geth_password.txt  --syncmode=full --verbosity=3 --log.format=terminal  --bootnodes=${ENODE_ADDRESS}

prysm:
	chmod +x ./consensus/prysm.sh
	./consensus/dist/beacon-chain-v5.1.0-linux-amd64 beacon-chain --execution-endpoint=http://${IPGETH1}:8545  --verbosity=debug



start-geth1:
	docker compose up -d geth1 && docker logs -f geth1	

start-geth2:
	docker compose up -d geth2 && docker logs -f geth2	
	
start-geth3:
	docker compose up -d geth3 && docker logs -f geth3	

start-consensus-client:
	docker compose up -d prysm && docker logs -f prysm	