# terraform-azure-examples

Examples of deploying Azure infrastructure with Terraform. Each folder is
self-contained, so you can cd into whichever one you want and deploy it on
its own.

## Examples

* [managed_disk](managed_disk/) - resource group with an empty managed disk
  (defaults to a 32GB Standard_LRS, both configurable)
* [storage_account](storage_account/) - storage account with the firewall
  locked down to your current public IP
* [virtual_network](virtual_network/) - virtual network with subnets, built
  with a local module

There's also a `playground/` folder I use for scratch work. It's gitignored.

## Requirements

* An Azure subscription
* Azure CLI
* Terraform

## Usage

Change your directory into the example you want to deploy and then run the
following commands.

`$ az login`

`$ terraform init`

`$ terraform plan`

`$ terraform apply`

Every example needs a `subscription_id`, which is the one variable without
a default. Everything else (location, disk size, subnets, replication type,
etc.) ships with a default you can override — drop any overrides in a
`terraform.tfvars` file in the example's folder.
