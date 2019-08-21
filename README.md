## Honeycrisp

This is a partial implementation of the Honeycrisp secure data aggregation system.

It is implemented within a docker to allow for easy set-up and cross-compatability performance.

## Docker Setup
Create a Docker image. This will take a few minutes. You only have to do this
once.
```
$ docker build -t honeycrisp .
```
Spin up a Docker container from the image. 
```
$ docker run -it --rm honeycrisp
```
Please note that any changes you make in the container are not persistent.

## Experiments

Follow instructions in test/ec2.sh to run on an amazon EC2 instance - should be repeated on many machines to test full functionality

