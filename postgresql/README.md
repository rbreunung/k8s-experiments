# Postgres Server

## Installation

| Variable | Meaning |
| -------- | ------- |
| POSTGRES_PASSWORD | Initialization password of the root user if not already installed / initialized. |
| POSTGRES_USER | Initialization value for the root DBS user. default value is `postgres`.|

- default port `5432`
- data storage `/var/lib/postgresql/data`
- configuration parameters can be overwritten by `-c` parameter

### sysctl parameter for elastic

The postgres image requires some parameters to be set in the VM.
This [tutorial](https://www.krenger.ch/blog/docker-desktop-for-mac-ssh-into-the-docker-vm/) shows how to connect an SSH to the hosting VM.

Call on shell.

``` sh
socat -d -d ~/Library/Containers/com.docker.docker/Data/debug-shell.sock pty,rawer
```

Find in the answer prompt the correct port. Something like `PTY is /dev/ttys010`. Create the followup command.

``` sh
screen /dev/ttys010
```

Those vales can be added to `/etc/sysctl.conf` to keep them more permanent.

## Administration
