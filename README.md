# Terraform Associate Certification

A notepad and code playground for my working towards the [Terraform Associate Certification](https://www.hashicorp.com/certification/terraform-associate).

I've been doing Terraform for quite a while now, so I think it's a good idea to study towards a certification.

This is my study guide for myself, and is not intended as a deep reference document.

Note that many of the examples in this code are not my own: they were copy-pasted from the [HashiCorp Learn](https://learn.hashicorp.com/) website.

---

## Section Checklist

I'm working my way through the sections in the [study guide](https://learn.hashicorp.com/tutorials/terraform/associate-study).

- [x] Learn about IaC
- [ ] Manage infrastructure
- [ ] Master the workflow
- [ ] Learn more subcommands
- [ ] Use and create modules
- [ ] Read and write configuration
- [ ] Manage state
- [ ] Debug in Terraform
- [ ] Understand Terraform Cloud and Enterprise

---

## General Notes

- Make sure that you know about HashiCorp's cloud offering.
- Make sure that you know about Terraform Enterprise.

---

## Exam Section Notes

### Learn about IaC

- `terraform refresh` reconciles local state with what's actually on the infra.
- `terraform plan` plans the changes to be made (execution plan).
- `terraform apply` executes the plan.
- `terraform destroy` nukes your infra.
- `terraform show` shows the current state.
- `terraform output` shows output variables.

### The Terraform Core

- Figures out what the resource graph looks like.
- Lifecycle management.
- Providers (e.g. AWS, Azure) plug into the core.
  - The [Terraform registry](https://registry.terraform.io/browse/providers) is is the main directory of publicly available Terraform providers.

---

### Manage infrastructure

- Remember that the `aws configure` command sets up your local CLI and sets up the local `~/.aws/credentials` file.
  - I usually use [AWS Vault](https://github.com/99designs/aws-vault) to do this for me.
- `terraform fmt -recursive` formats all `tf` files recursively.
- `terraform validate` finds syntax errors in your `tf` files.
- The default state file is called `terraform.tfstate`.
- Over and above the default `terraform.tfvars` input variable file, Terraform will also load any other variable files matching the pattern `_.auto.tfvars`.
- Environment variables can be used for variables too. e.g. if you have a variable named `foo`, the environment variable `TF_VAR_foo` can provide a value to it.
- Order of variable loading (later overrides earlier):
  - Environment variables
  - `terraform.tfvars`
  - `terraform.tfvars.json` file, if present.
  - `_.auto.tfvars` and `_.auto.tfvars.json` files, processed in lexical order of their filenames.
  - Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace).

#### Remote Backends

- These store state remotely.
  - My common use-case here: S3 + DynamoDB.
- HashiCorp recommends using [Terraform Cloud](https://www.hashicorp.com/products/terraform).

#### Terraform Cloud Blurb

- Terraform Cloud also offers HashiCorp's commercial solutions and with a free version which acts as a remote backend.
- Terraform Cloud allows teams to easily version, audit, and collaborate on infrastructure changes.
- Each proposed change generates a Terraform plan which can be reviewed and collaborated on as a team.
- When a proposed change is accepted, the Terraform logs are stored, resulting in a linear history of infrastructure states to help with auditing and policy enforcement.
- Additional benefits to running Terraform remotely include moving access credentials off of developer machines and freeing local machines from long-running Terraform processes.

#### Terraform Cloud - General

TODO: the [Terraform Cloud tutorial](https://learn.hashicorp.com/collections/terraform/cloud-get-started). Take note of the following workflow options when following this tutorial:

- A VCS-driven workflow, in which it automatically queues plans whenever changes are committed to your configuration's VCS repo.
- An API-driven workflow, in which a CI pipeline or other automated tool can upload configurations directly.

You need to generate a user token to use Terraform Cloud, which is stored in `~/.terraformrc`.

Example below:

```
credentials "app.terraform.io" {
  token = "REPLACE_ME"
}
```

Remember to run `terraform init` when setting up your remote backend.

---

### Master the workflow

---

### Learn more subcommands

---

### Use and create modules

---

### Read and write configuration

---

### Manage state

---

### Debug in Terraform

---

### Understand Terraform Cloud and Enterprise

---

## Important Terms

- "Resource Graph": Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources.
- "Day 0" code is the initial provisioning code of your infrastructure.
- "Day 1" code makes changes going forward from Day 0
- The Terraform site defines a module as "a collection of .tf or .tf.json files kept together in a directory.".

---

## Things to read up on

- Self-Service Clusters
- Provisioners
- The `terraform state` command [link](https://www.terraform.io/docs/commands/state/index.html)

---
