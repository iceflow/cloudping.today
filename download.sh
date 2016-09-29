#!/bin/bash


aws --profile global_admin s3 sync s3://cloudping.today/ cloudping.today
