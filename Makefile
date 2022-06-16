
all: install config ping

install:
	
	sudo apt install ansible
	python3 -m pip install ansible
	ansible-galaxy collection install community.docker

inventory_file := "[default] \nlocalhost    ansible_connection=local"

ansible_config_file := "[defaults] \ninventory = inventory \nhost_key_checking = False\
			\ndeprecation_warnings=False"
config:
	
	echo $(inventory_file) >> inventory
	echo $(ansible_config_file) >> ansible.cfg
ping:
	ansible all -m ping

docker_install:
	
	ansible-playbook  master.yml
	docker ps
clean:
	rm inventory *.cfg

remove:
	sudo apt remove docker -y
	sudo apt remove portainer -y
	sudo apt remove python3 -y
