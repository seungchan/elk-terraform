# Creating elastic stacks using Terraform

## Pre-requisite:
1. Create key pairs with pem format, and save it to root of project directory.
   ```
   chmod 400 <KEY_NAME>.pem
   ```
## Provisiong elk stack
```
$ terraform init
$ terraform plan
var.key_name
  The name of the key-pair used to access the EC2 instances

  Enter a value: <KEY_NAME>

$ terraform apply
var.key_name
  The name of the key-pair used to access the EC2 instances

  Enter a value: <KEY_NAME>
```
After it is successfully provisioned, it outputs elasticsearch ip and kibana ip to access
```
elasticsearch_ip_addr = "<ELASTICSEARCH_PUBLIC_IP>:9200"
kibana_ip_addr = "<KIBANA_PUBLIC_IP>:5601"
```

## Destroying elk stack
```
$ terraform destroy
```


# Flow of logging
EC2 /var/log  --> Filebeat --> Logstash --> ElasticSearch --> Kibana

1. Filebeat greps logs from /var/log directory, and send to Logstash
   i.e., create a log file named demo.log with some content.
   ```
   $ echo "This log is generated from ec2. Some more log" > /var/log/demo.log
   ```
2. Logstash send the logs to logstash index in elasticsearch
3. Kibana can display the logs by creating index pattern.
   Create index pattern for 'logstash*' in Kibana.
   The log will be appeared in the Kibana Search
   ```
message:This log is generated from ec2. Some more log cloud.instance.id:i-0461888750237b362 cloud.image.id:ami-04d29b6f966df1537 cloud.provider:aws cloud.machine.type:t2.medium cloud.availability_zone:us-east-1a cloud.account.id:746252282333 cloud.region:us-east-1 ecs.version:1.1.0 log.offset:0 log.file.path:/var/log/demo.log @version:1 input.type:log host.containerized:false host.name:ip-172-20-10-80.ec2.internal host.os.name:Amazon Linux host.os.codename:Karoo host.os.version:2 host.os.family:redhat
   ```

