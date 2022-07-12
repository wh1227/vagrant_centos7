Vagrant.configure("2") do |config|
	host_list = [
	{
		:name => "host_1",
		:box => "centos/7",
		:ip => "172.16.1.50",
		:ssh_port => '2210'
	},
	{
		:name => "host_2",
		:box => "centos/7",
		:ip => "172.16.1.51",
		:ssh_port => '2211'
	},
	{
		:name => "host_3",
		:box => "centos/7",
		:ip => "172.16.1.52",
		:ssh_port => '2212'
	},
	]
	
	host_list.each do |host|
		config.vm.define host[:name] do |task|
			task.vm.box = host[:box]
			task.vm.hostname = host[:hostname]
			task.vm.network :private_network, ip: host[:ip]
			task.vm.network "forwarded_port", guest: 22, host: host[:ssh_port], id:"ssh"
			task.vm.provision "shell", path: "./provision.sh"
					
			task.vm.provider :virtualbox do |vb|
				vb.customize ["modifyvm", :id, "--memory", 4096]
				vb.customize ["modifyvm", :id, "--cpus", 1]
			end
		end
	end
end

