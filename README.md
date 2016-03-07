# build-my-ubuntu
Script that automates configuration of your newly installed system. 
Its idea is to  write config file once and use it on further installations.

## Usage
Just edit `config.sh` to suit your needs and run `main.sh`. 
If you are not sure what'll happen append `-d` option for dry-run, you will see all commands without executing.

## What it does?
- Adds apt repositories and installs needed packages, also removes amazon button from Unity.
- Disables `quiet splash` option from grub config.
- Copies your ssh keys and configures git.
- Creates symlinks for easier access to other partitions (dual-boot system).

## Todo:
- Modify fstab to mount partitions with your uid and gid.
- Download and install tools like Pycharm, Sublime Text in newest versions.
- Enhance CLI to enable interactive configuration.
- Create swap file.
