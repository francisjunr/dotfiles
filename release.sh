#! /bin/bash
if [ $# -eq 0 ]
  then
    echo "error: tag not provided"
    exit
fi

for i in $@
do
	echo "pushing $i"
	git tag $i
	git push origin tag $i
done

exit
