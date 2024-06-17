#! /bin/bash
if [ $# -eq 0 ]
  then
    echo "error: tag not provided"
fi

tag=$1
for i in $@
do
	echo "pushing $i"
	git tag $i
	git push origin tag $i
done

exit
