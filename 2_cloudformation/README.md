# how to use
1. the cloudformation template requires you to know what ami ID to use to create the ec2 instance. To get the AMI ID for your region. Open an AWS CLI session, and run this command:
```
aws ssm get-parameters-by-path --path "/aws/service/ami-amazon-linux-latest" --region ap-southeast-2
```
2. once you have it, just simply run the cloudformation template in AWS > CloudFormation