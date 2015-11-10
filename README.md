Rails Devise
================

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

This project is a ruby on rails planning tool to help with the organization of refugee support, e.g. language courses.

Setup
---------------

To easily aquire the correct ruby version, run (on mac)

```
brew install rbenv
brew install ruby build
```

and restart your terminal.

Then install ruby with

```
rbenv local 2.2.2
rbenv install
```

To setup the project after checkout, run

```
gem install bundler
bundle install
```

Then init the database by running

```
rake db:setup
```

To run the project, intall POW (http://pow.cx):

```
curl get.pow.cx | sh
```

and symlink it with

```
ln -s $(pwd) ~/.pow/$(basename $(pwd))
```

You should then be able to access the application in http://campusasyl_projectsdb.dev

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

https://github.com/engelsystem/engelsystem/
https://github.com/coders4help/volunteer_planner

Contributing
------------

Credits
-------

License
-------

This project is published using the MIT License
