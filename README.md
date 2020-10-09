# Terraform Associate Certification

A notepad and code playground for my working towards the [Terraform Associate Certification](https://www.hashicorp.com/certification/terraform-associate).

I've been doing Terraform for quite a while now, so I think it's a good idea to study towards a certification.

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

### The Terraform Core

- Figures out what the resource graph looks like.
- Lifecycle management.
- Providers (e.g. AWS, Azure) plug into the core.

---

### Manage infrastructure

- Remember that the `aws configure` command sets up your local CLI and sets up the local `~/.aws/credentials` file.
  - I usually use [AWS Vault](https://github.com/99designs/aws-vault) to do this for me.

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

---

## Things to read up on

- Self-Service Clusters
- Provisioners

---
