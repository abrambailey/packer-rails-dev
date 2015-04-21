#!/bin/bash
set -eo pipefail

# Setup rbenv
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo '# enable rbenv' >> ~/.profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile

# Enable rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Install MRI 2.1.5 and make it the default
rbenv install 2.2.2
rbenv global 2.2.2

# Install bundler
echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc
/home/vagrant/.rbenv/shims/gem install bundler
