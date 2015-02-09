# Rails-Dev Vagrant

This packer configuration creates a Ubuntu based VM for Ruby On Rails development.

## Quick-start

### 1. Build the box
```sh
packer build boxes/rails-dev.json
vagrant box add --name mojocode/rails-dev builds/rails-dev.box
```

### 2. Create a vagrant project

```ruby
Vagrant.configure(2) do |config|
  config.vm.box = 'mojocode/rails-dev'
  config.vm.box_url = 'http://vagrant-boxes.mojocode.de/rails-dev/'
  config.vm.box_version = '~> 2.2.2'
  config.vm.box_check_update = true

  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.ssh.forward_agent = true

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 2048
    vb.cpus   = 2
  end
end
```

### 3. Install Vagrant Plugin „exec“

```bash
$ vagrant plugin install vagrant-exec
```

## Developing

### Managing the development box

```bash
$ vagrant up      # Start/Setup the virtual machine
$ vagrant halt    # Stops the virtual machine
$ vagrant reload  # Restart the virtual machine
$ vagrant destroy # Remove the virtual machine from disk
```

### Starting the web server

```bash
$ vagrant exec bin/rails server -b 0.0.0.0
```

The site will be accessible with a web browser at [localhost:3000](http://localhost:3000). The server can be stopped by pressing `Ctrl-C`.

### Running the test suite

```bash
$ vagrant exec RAILS_ENV=test bin/rake test
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
