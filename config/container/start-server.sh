#!/bin/bash
cd /rails
source /etc/profile.d/rvm.sh
bundle exec unicorn -E production -D -p 8080
nginx