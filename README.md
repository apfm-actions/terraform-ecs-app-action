ECS App Action
==============
A [GitHub Action][GitHub Actions][] to deploy an AWS ECS Application using
Terraform.

See also:
 - https://github.com/apfm-actions
 - https://help.github.com/en/actions
 - https://github.com/apfm-actions/terraform-project-base-action

Usage
-----

```yaml
  - name: Configure AWS credentials
    uses: aws-actions/configure-aws-credentials@v1
    with:
      aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
      aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      aws-region: us-west-2
  - name: My Project
    uses: apfm-actions/terraform-project-base-action@v1
    with:
      project: examples
      owner: MyTeam
      email: myteam@mydomain.org
      tf_assume_role: TerraformApply
      remote_state_bucket: apfm-terraform-remotestate
      remote_lock_table: terraform-statelock
      shared_state_key: terraform/apfm.tfstate
  - name: My Service
    uses: apfm-actions/terraform-ecs-app-action@master
    with:
      public: true
      debug: false
```

**NOTE: Please be aware that using `@master` will result in using the latest
development version of this action.**

Inputs
------

### name
An optional ECS application name to append to the github project name when
creating this resource.  This allows for the deployment of multiple ECS
applications from the same job.
- required: no
- default: N/A

### prefix
Resource prefix to use when creating resources
- required: no
- default: N/A

### image
ECR repository name containing bootable image
- required: no
- default: (current AWS account ECR repo)

### label
Label of ECR image to deploy
- requred: no
- default: latest

### public
Enable Public IP Allocation
- required: false
- default: false

### command
Specify an alternate command/entrypoint for the Docker container
- required: false

### environment
Specify a map of key=value pairs to be passed off in the ECS containers environment.

Example:
```
with:
  environment: '{ VAR1 = VAL1, VAR2 = VAL2 }'
```
- required: false

### secrets
Specify a map of key=value pairs to be passed off in the ECS containers secrets.

Example:
```
with:
  environment: '{ VAR1 = VAL1, VAR2 = VAL2 }'
```
- required: false

### cpu
ECS CPU Allocation
- required: false
- default: 256

### mem
ECS Memory Allocation
- required: false
- default: 512

### certificate
Name of the ACM certificate to use.  If unset then a certificate will be automatically generated.
- required: false

### certificate_alt_names
List of subjective alternate names to apply to autogenerated SSL certs
- required: false

### autoscaling
Enable/Disable service autoscaling
- required: false
- default: true

### autoscaling_min
Minimum number of ECS tasks during scale-in
- required: false
- default: 3

### autoscaling_max
Maximum number of ECS tasks during scale-out
- required: false
- default: 21

### autoscaling_target_cpu
Target mean CPU usage.  Should CPU usage rise too much above this value then trigger auto scale-out.  Should CPU usage fall too far below this value then trigger auto scale-in.
- required: false
- default: 50

### autoscaling_target_mem
Target mean memory usage.  Should memory usage rise too much above this value then trigger auto scale-out.  Should memory usage fall too far below this value then trigger auto scale-in.
- required: false
- default: 50

### target_port
TCP/IP port the container is listening on
- required: false
- default: 80

### target_protocol
TCP/IP protocol the container communications with
- required: false
- default: 'http'

### listener_port
TCP/IP port the loadbalancer should listen on
- required: false
- default: 443

### listener_protocol
TCP/IP protocol the loadbalancer uses for communication
 - required: false
- default: 'https'

### health_check_path
Health check path
- required: false
- default: /

### health_check_interval
Health check interval
- reqired: false
- default: 30

### health_check_timeout
Health check timeout
- reqired: false
- default: 10

### health_check_grace
Grace period in which to ignore the health check during task startup
- reqired: false
- default: 120

### debug
enable debugging
- default: false

Outputs
-------

|       Context         |          Description            |
|-----------------------|---------------------------------|
| service-arn           | ECS Service ARN                 |
| task-arn              | ECS Task ARN                    |
| loadbalancer-arn      | Network Loadbalancer ARN        |
| loadbalancer-endpoint | Network Loadbalancer Endpoint   |
| certificate-arn       | SSL Certificate ARN             |
| certificate-name      | DNS Name on the ACM Certificate |

[//]: # (The following are reference links used elsewhere in the document)

[Git]: https://git-scm.com/
[GitHub]: https://www.github.com
[GitHub Actions]: https://help.github.com/en/actions
[Terraform]: https://www.terraform.io/
[Docker]: https://www.docker.com
[Dockerfile]: https://docs.docker.com/engine/reference/builder/
