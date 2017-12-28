#!/bin/bash
echo "Script To migrate code from DEV to INTT Begins"
PATH=.:$PATH
for fn in `cat folders.txt`; do
	echo "-----------------------"
    echo "the next project is $fn"
    cd $(echo $fn)
	git checkout intt
	git pull
	git merge origin/dev --no-edit 
	git push -u origin intt
	git checkout dev
	cd ..
done
echo "Script To migrate code from DEV to INTT Completed"
