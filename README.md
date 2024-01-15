

## Install the Docker

You can create a bash script to install both Docker and Docker Compose on your Linux-based system. Here's a basic example of a bash script that installs Docker and Docker Compose

[docker.io](https://docs.docker.com/engine/install/ubuntu/)



### Refactoring into Bash Scripts
While fixing the Docker I gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to install the Docker.

This bash script is located here: [./bin/install_docker](./bin/install_docker)

* This will keep the Gitpod Task File [(.gitpod.yml)](.gitpod.yml) tidy.


#### Shebang Considerations

A Shebang (prounced Sha-bang) tells the bash script what program that will interpet the script. eg. `#!/bin/bash`

ChatGPT recommended this format for bash: `#!/usr/bin/env bash`

- for portability for different OS distributions 
-  will search the user's PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations

When executing the bash script we can use the `./` shorthand notiation to execute the bash script.

eg. `./bin/install_docker`

If we are using a script in .gitpod.yml  we need to point the script to a program to interpert it.

eg. `source ./bin/install_docker`

#### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be exetuable at the user mode.

```sh
chmod u+x ./bin/install_docker
```

alternatively:

```sh
chmod 744 ./bin/install_docker
```

https://en.wikipedia.org/wiki/Chmod


## Login Docker 

Create a bash script to log in to Docker and store the credentials using the docker-credential-secretservice helper. You'll also want to set up a symbolic link to store the Docker configuration file outside of the Gitpod workspace's home directory. Create a script, e.g., docker-login.sh:

## Working Env Vars

### env command

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terrminal we unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

### Setting Docker Credintials 

```sh
gp env DOCKER_PASSWORD = ''
gp env DOCKER_USERNAME = '
```

### Checking docker login status

### Refactoring into Bash Scripts
While fixing the Docker I gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to install the Docker.

This bash script is located here: [./bin/docker-login](./bin/docker-login)

```sh
cat ~/.docker/config.json
```

```sh
{
        "auths": {
                "https://index.docker.io/v1/": {
                        "auth": "bWVobWV0MTIzOlR1emN1LjE3MzE="
                }
        }
```
```sh
docker logout
```

```sh
{
        "auths": {}
}
```

[AzureNamingTool](https://github.com/mspnp/AzureNamingTool/wiki#installation)


```sh
git clone https://github.com/mspnp/AzureNamingTool.git
```

```sh
cd AzureNamingTool/src/
```

```sh
docker build -t azurenamingtool .
```

```sh
docker run -d -p 8081:80 --mount source=azurenamingtoolvol,target=/app/settings azurenamingtool:latest
```
