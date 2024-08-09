#!/bin/bash

# get current day
day_of_month=$(date +%d)

# check day is odd
if [ $((day_of_month % 2)) -ne 0 ]; then
    echo "Today is an odd day of the month."

    # ask info
    read -p "Enter the EC2 instance ID: " instance_id
    read -p "Enter the SNS topic ARN: " sns_topic_arn

    # reboot with ssm
    echo "Rebooting EC2 instance $instance_id..."
    aws ssm send-command --instance-ids "$instance_id" --document-name "AWS-RunShellScript" --comment "Rebooting instance" --parameters commands="sudo reboot" --output text

    # check if last command exited with 0
    if [ $? -eq 0 ]; then
        echo "EC2 instance $instance_id has rebooted successfully."

        # sns
        echo "Publishing message to SNS topic $sns_topic_arn..."
        aws sns publish --topic-arn "$sns_topic_arn" --message "EC2 instance $instance_id has been rebooted."

        # check if sns publish was a success
        if [ $? -eq 0 ]; then
            echo "Message published to SNS topic $sns_topic_arn successfully."
        else
            echo "Failed to publish message to SNS topic $sns_topic_arn."
        fi
    else
        echo "Failed to reboot EC2 instance $instance_id."
    fi
else
    echo "Today is divisible by 2. No action will be taken."
fi
