# !/bin/bash
# by Austin Hester

# Attach nodes

CURR=`dirname $0`
BOOT=$CURR/bootstrap
MINER1=$CURR/miner1
MINER2=$CURR/miner2

if [[ -d $BOOT/geth/ && -d $MINER1/geth/ && -d $MINER2/geth/ ]]
then
# bootstrap node
read -p "Which node do you want to connect to? (b/1/2) : " -r
echo
if [ $REPLY == "b" ]; then
if [ -d $BOOT/geth/ ]; then
	BOOTIPC=/Users/$USER/.ethereum/geth.ipc
	if [ -e $BOOTIPC ]; then
		echo "Attaching"
		geth attach ipc:$BOOTIPC
	else
		echo "bootstrap not running."
	fi
else
	echo "bootstrap not initialized."
fi
fi
# miner 1
if [ $REPLY == "1" ]; then
if [ -d $MINER1/geth/ ]; then
	if [ -e $MINER1/geth.ipc ]; then
		echo "Attaching"
		geth attach $MINER1/geth.ipc
	else
		echo "miner1 not running."
	fi
else
	echo "miner1 not initialized."
fi
fi
# miner 2
if [ $REPLY == "2" ]; then
if [ -d $MINER2/geth/ ]; then
	if [ -e $MINER2/geth.ipc ]; then
		echo "Attaching"
		geth attach $MINER2/geth.ipc
	else
		echo "miner2 not running."
	fi
else
	echo "miner2 not initialized."
fi
fi
else
	echo "You must initialize the chain first"
fi
