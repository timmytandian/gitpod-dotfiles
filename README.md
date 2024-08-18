### Note: This is repo is created based on a [repo template](https://github.com/gitpod-samples/demo-dotfiles-with-gitpod/tree/main) provided by Gitpod

# Bring your Dotfiles to Gitpod

Ever wondered how you can bring your personal dotfiles configurations to [Gitpod](https://www.gitpod.io/) to have your personalized ephemeral developer environments in the cloud? Here's how...

## How Does this Repo. Works?

- It has a `./setup.sh` file that contains the initial setup script to execute all the scripts to install/ configure required services under `./scripts/` to keep that X service installed on your next Gitpod Workspaces. For example, it contains following scripts:
  - `./scripts/gpg_configure.sh` is script to configure [GPG](https://www.gnupg.org/) key.
  - `./scripts/terraform_configure.sh` is script to setup & configure [Terraform](https://www.terraform.io/).
  - `./scripts/aws_cli_install.sh` to install [AWS CLI](https://aws.amazon.com/cli/).
  - `./scripts/deno_configure.sh` to install & configure [deno](https://deno.land/).
  - `./scripts/gcloud_cli_install.sh` to install [Google Cloud CLI](https://cloud.google.com/sdk/docs/install-sdk).

> **Note**: Your installation script will be terminated if it exceeds 120 seconds.


## Modify it according to your personal requirements

To modify it out in a new development environment, click the button below:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/timmytandian/gitpod-dotfiles)

## Recommended Reading

- [Blog: Personalize your Gitpod Workspace Environments](https://www.gitpod.io/blog/personalize-your-gitpod-workspace-environment)
- [Docs: Config-dotfiles](https://www.gitpod.io/docs/config-dotfiles)

## Examples

Here are some example `dotfiles` which you can refer:

- [webpro/awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
- [holman/dotfiles](https://github.com/holman/dotfiles)
