#!/bin/bash
cd /rails
source /etc/profile.d/rvm.sh
bin/rake db:migrate RAILS_ENV=production
bin/rake assets:precompile RAILS_ENV=production
bundle exec unicorn -E production -D -p 8080
nginx