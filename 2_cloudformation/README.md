# how to use
1. the cloudformation template requires you to know what ami ID to use to create the ec2 instance. To get the AMI ID for your region. Open an AWS CLI session, and run this command:
```
aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region us-east-1 
```
2. once you have it, just simply run the cloudformation template in AWS > CloudFormation