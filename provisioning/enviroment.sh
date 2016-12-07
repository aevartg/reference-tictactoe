#!/bin/bash

echo "Creating User"

echo "Enter user name: "
read user_name

aws iam create-user --user-name $user_name

echo "Enter group name: "
read group_name

aws iam create-group --group-name $group_name

echo "Putting user in group"

aws iam add-user-to-group --user-name $user_name --group-name $group_name

echo "verifying group"

aws iam get-group --group-name $group_name