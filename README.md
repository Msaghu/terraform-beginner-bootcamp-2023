# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to use semantic versioning for its tagging 
[semver.org](https://semver.org/)

The general format will be:

 **MAJOR.MINOR.PATCH**, e.g. `1.0.1`:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Conisderations with the Terraform CLI changes
Using the Terraform CLI installation instructions to install a local version of Terraform. So the original  gitpod.yml bash instructions and we needed to refer to the latest install CLI instructions via Terraform docuemntation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
)

### Considerations for different Linux distributions.
This project is built against Ubuntu.
Please check your distribution to check then changa accordingly to distribution needs.
[How to check your OS version in the Linux terminal](https://www.ionos.com/digitalguide/server/know-how/how-to-check-your-linux-version/
)


```
$cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into Bash scripts

While fixing the Terraform CLI gpg deprecation issues, we nticed that the Bash script steps had a considerable amount more of code and we decided to create a bash script to install the Terraform CLI.
 This bash script is located here: [./bin/](./bin/install_terraform-cli.sh)

- This will keep the Gitpod Task file([.gitpod.yml](.gitpod.yml)) tidy.
- This allows us an easier to debug and executes manually Terraform CLI install .
- This will allow for better portability for other projects that need to install the Terraform CLI.

### Shebang Considerations 
A shebang (#!) tells the bash script what program will interpret the script e.g `#!/bin/bash`

ChatGPT recommend this format for bash: `#!/usr/bin/env bash`
- for portability for different OS distributions
- will allow us to search the user's PATH for the bash executable

### Execution considerations 

When executing the bash scripts we can use the `./` shorthand notation to execute the bash script as opposed to the '$ source gdjshh.sh' notation. 

If we are using a script in Gitpod yaml, we need to point the script to a program to interpret it e.g `$ source gdjshh.sh` notation. 

### Linux Permissions Considerations

Linux permissions works as follows:
1. In order to make a bash scrit executable, we need to change the inux permissions for the file to be executable

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively:
```sh
chmod 744 ./bin/install_terraform_cli
```

[Linux Permissions](https://linuxhint.com/switch-back-to-master-with-git/)

### Github Lifecycle (Init, Begfore, Command)

We need to be mindful when using `init` as it will no run if we restart an existin workspace.

[Gitpod Documentation](https://www.gitpod.io/docs/configure/workspaces/tasks)

### Working with Env vars

We can list out all environment variables (Env Vars) using the `env`` command.

We can filter specific environment variables using `grep` e.g `env | grep AWS`

### Setting and unsetting Env Vars

We can set env vars in the terminal i.e for an env var , `HELLO='world'` , we can set it as: `export HELLO='world'`

In the terminal we can unset the env var using `unset HELLO`

We can temporarily set an env var when running a command i.e

```sh
HELLO='world' ./bin/print_message
```

Within a bash script , we can set the nenv var without writing exort e.g

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

### Printing Env Vars

We can print out env vars using `echo` to get their associated value e.g `echo $HELLO`

### Scoping of Env Vars

When we open new bash terminals in VS Code, they do not maintain previously set Env Vars. 
Thus , to change this and make the env vars persist, we will need to set env vars in the 
bash profile eg. `.bash_profile`

### Persisiting Env Vars in Gitpod

We can persist env vars into Gitpod by scoping them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened 
in their workspaces.

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars.