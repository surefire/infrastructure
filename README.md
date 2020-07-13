# Infrastructure

[Terraform] configuration files for building, changing, and versioning [SureFire] infrastructure on [AWS].


## Prerequisites

* [Git]
* [Terraform]
* [AWS]


## Installation

```sh
$ git clone https://github.com/surefire/infrastructure.git
```


## Configuration

Configure [Terraform] to store its state in a bucket on [Amazon S3].

```sh
$ terraform remote config \
    -backend=s3 \
    -backend-config="bucket=surefire.operations.terraform" \
    -backend-config="key=terraform.tfstate" \
    -backend-config="region=eu-west-1" \
    -backend-config="encrypt=true" \
    -backend-config="acl=private"
```


## Usage

```sh
$ terraform apply
```


[Amazon S3]: https://aws.amazon.com/s3
[AWS]: http://aws.amazon.com
[Git]: http://git-scm.com
[SureFire]: https://www.surefirething.co.uk
[Terraform]: https://www.terraform.io
