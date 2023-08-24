SHELL=/bin/bash

setup-debian-server:
	apt update && apt upgrade -y && apt autoremove
	apt install -y curl zsh powerline fonts-powerline exa mc btop

	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	cp .zshrc ~/.zshrc
	chsh -s $$(which zsh)

	curl https://getmic.ro | bash
	mv micro /usr/bin

setup-ssh-homelab:
	cp ssh-homelab.conf /etc/ssh/sshd_config.d/ssh-homelab.conf
	service ssh restart

setup-ssh-public:
	cp ssh-public.conf /etc/ssh/sshd_config.d/ssh-public.conf
	service ssh restart

setup-dotnet:
	apt install -y dotnet-sdk-7.0
	dotnet tool install -g dotnet-ef
	dotnet tool install -g dotnet-script

setup-git:
	sh bin/git-user

setup-docker:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	adduser $$USER docker
	ln -s /var/lib/docker/volumes ~/docker_volumes

setup-unattended-upgrades:
	apt install -y unattended-upgrades apt-listchanges
	cp 50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades