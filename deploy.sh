##!/bin/bash

# BJS
aws --profile chinakb s3 sync cloudping.today/ s3://cloudping.today

# Global 
aws --profile global_admin s3 sync cloudping.today/ s3://cloudping.today
