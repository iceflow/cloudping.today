##!/bin/bash


BUCKET_NAME=cloudping.today

make_object_public()
{
	echo "Making public $1 s3://$2/$3"
	aws --profile $1 s3api put-object-acl --bucket $2 --key $3  --grant-read 'uri="http://acs.amazonaws.com/groups/global/AllUsers"'
}

# BJS



# Global 
#aws --profile global_admin s3 sync cloudping.today/ s3://cloudping.today


deploy_region()
{
	echo "** Deploy region $1 ...."
	aws --profile $1 s3 sync ${BUCKET_NAME} s3://${BUCKET_NAME}
	pushd ${BUCKET_NAME}
		L=`ls`

		for F in $L; do
			make_object_public $1 ${BUCKET_NAME} $F
		done
	popd
	echo "Deploy region $1 .... Done"
}


## Main 
deploy_region chinakb
deploy_region global_admin

exit 0
