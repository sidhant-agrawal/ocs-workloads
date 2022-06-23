while true
	file=/mnt/test/data_`date +%s`
	hashfile=/mnt/test/hashfile
	do 
		dd if=/dev/urandom of=$file bs=$(($RANDOM)) count=$(($RANDOM%3+1))
		md5sum $file >>$hashfile
		sync
		sleep 15
		if [ $(($RANDOM%2)) == 1 ]
			then md5sum -c $hashfile
		fi
	done

