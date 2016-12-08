+++
date = "2016-12-04T18:28:39Z"
title = "Web sentry with SMS Notification using AWS Lambda"
draft = true

+++

[AWS Lambda](https://aws.amazon.com/lambda/) lets you run code (python2, nodejs, java, C#) in response to events. It is optimized for short-running code. I decided to use it to watch a webpage, and notify me when a specific change happen. When a value gets under a threshold, I use [AWS SNS](https://aws.amazon.com/sns/), the notification system, to send myself a SMS alert.

Lambda provides a small text editor (you can upload larger codebases if necessary) that you can use to edit and test your code. The lack of error-handling in my code is intentional, as I will get notification of any failure, including the stacktrace through the AWS Cloudwatch service. The same service (AWS Cloudwatch Events), was used as the event source to run the Lambdas.

I have been very impressed by the power of Lambdas: I managed to finish this project in half an hour, and it is running very well ever since.

{{< highlight python >}}
import urllib2
import re
import boto3

PHONE_NUMBER='<my phone>'

find_me = (
        (
            "<label>",
            r'<regex>',
            "<url>",
            <limit>
        )
)


def send_message(message):
    sns_client = boto3.client('sns')
    response = sns_client.publish(
            PhoneNumber=PHONE_NUMBER,
            Message=message,
    )
    return response


def lambda_handler(event, context):
    for search in find_me:
        (label, regex, url, limit) = search
        response = urllib2.urlopen(url)
        html = str(response.read())
        current = float(re.search(regex, html).group(1))
        if current < limit:
            return send_message("Value for {} is {:.2f}".format(label, current))
    return "Nothing interesting today"
{{< /highlight >}}

