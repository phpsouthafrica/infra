#How to use
To use this first make sure you load your credentials

Make sure you api key is loaded

ie ```export AWS_PROFILE=kantar ```.

Using the name that you have set in ```~/.aws/credentials```

Now just run 
```bash
packer build packer-ubuntu1804-aws-docker.json
```

This will create the ami and echo out it's new name i.e.
```bash
==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:
eu-west-1: ami-0864318fd96277771
```
Grab this and add to terraform.
