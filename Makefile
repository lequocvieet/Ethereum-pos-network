.PHONY:  geth1 geth2 geth3
PWD=/app
NODEKEY1=enr:-J-4QIfjMqtiWxAbqEERheNyHzTO5VycVIim935MvS86Whr9dyZQSvmcpy37phMdLu4DH3lYzam-EBR0ESX7Q7nMHpCGAZIfVcvcg2V0aMrJhPxk7ASDEYwwgmlkgnY0gmlwhH8AAAGJc2VjcDI1NmsxoQKqnJ9CnPLunGjkN309oq6BlzHIE-KVXmH1FQd4uYvxooRzbmFwwIN0Y3CCdl8
NODEKEY2=338cba70dbe40d17df836e3dbbb84820f6a4b03e6d144365727318edd4bc8a51
NODEKEY3=8b3a1e8202550db0918bcd76b460c5f549a38f8c76fb65b8b08bf031e7870a5e
IPGETH1=10.220.0.10
IPGETH2=10.220.0.11
IPGETH3=10.220.0.12
PEER_PORT=30303
ENODE_ADDRESS="enode://${NODEKEY1}@${IPGETH1}:${PEER_PORT},enode://${NODEKEY2}@${IPGETH2}:${PEER_PORT},enode://${NODEKEY3}@${IPGETH3}:${PEER_PORT}"
 #--bootnodes=${ENODE_ADDRESS}
 #./bin/geth attach --exec admin.nodeInfo.enr geth1/geth.ipc
geth1:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth1/jwtsecret --datadir=./geth1 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth1/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal 

geth2:
	chmod +x ./bin/geth
	./bin/geth  --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth2/jwtsecret --datadir=./geth2 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth2/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal  

geth3:
	chmod +x ./bin/geth
	./bin/geth --networkid 100 --http --http.api=eth,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=./geth3/jwtsecret --datadir=./geth3 --allow-insecure-unlock --unlock=0x123463a4b065722e99115d6c222f267d9cabb524 --password=./geth3/geth_password.txt --nodiscover=false --syncmode=full --verbosity=4 --log.format=terminal  