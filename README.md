Ruby on Rails
-------------

Getting Started
---------------

This project is a ruby on rails planning tool to help with the organization of refugee support, e.g. language courses.

Setup
---------------

To easily aquire the correct ruby version, run (on mac)

```
brew install rbenv
brew install ruby-build
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

and symlink it by running this from the project's root:

```
ln -s $(pwd) ~/.pow/$(basename $(pwd))
```

You should then be able to access the application in http://campusasyl_projectsdb.dev

The login credentials are:
email: me@example.com
password: password


Documentation and Support
-------------------------
If you need help, feel free to drop us/me an email.
asol@num42.de


Issues
-------------

Similar Projects
----------------

https://github.com/engelsystem/engelsystem/
https://github.com/coders4help/volunteer_planner

Contributing
------------

We need help translating this platform to:
- arabic
- german
- english

Feel free to fork and PR


Credits
-------

License
-------

This project is published using the MIT License
