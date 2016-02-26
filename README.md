# build-my-ubuntu
Script that automates bootstraping your newly installed system

Clone it edit `config.sh` to suit your needs and run `main.sh`. 
If you are not sure what'll happen append `-d` option for dry-run, you will see all comands without executing.

## What it does?
- Adds apt repositories and instal needed packages, also removes amazon button from Unity.
- Disables `quiet splash` option from grub config.
- Copies your ssh keys and configure git.
- Creates symlinks for easier acces to other partitions (dual-boot system).
