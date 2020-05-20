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
  - name: My Project
    uses: apfm-actions/terraform-project-base-action@master
    with:
      project: examples
      owner: MyTeam
      email: myteam@mydomain.org
      remote_state_bucket: apfm-terraform-remotestate
      remote_lock_table: terraform-statelock
      shared_state_key: /shared-infra/remotestate.file
  - name: My Service
    uses: apfm-actions/terraform-ecs-app-action@master
    with:
      public: true
      debug: false
```

Inputs
------

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
Automatic SSL Certification Creation
- required: false
- default: true

### certificate_alt_names
List of subjective alternate names to apply to the generated SSL cert
- required: false

### autoscaling
Enable/Disable service autoscaling
- required: false
- default: false

### autoscaling_min
Minimum number of ECS tasks during scale-in
- required: false
- default: 3

### autoscaling_max
Maximum number of ECS tasks during scale-out
- required: false
- default: 3

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
