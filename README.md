RoR Workshops
================

[![Build Status](https://travis-ci.org/sikor144/netguru-workshops-app.svg?branch=master)](https://travis-ci.org/sikor144/netguru-workshops-app)

### :book: Demo

You can check out a demo application here: https://michal-netguru-workshops-app.herokuapp.com/

### :closed_lock_with_key: Technology stack
-------------

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.2.3 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 4.2.1 |
| [PostgreSQL](http://www.postgresql.org/) | 9.3 |

### :book: Setup
-------------
1. clone repository,
2. `cd path/to/repo`,
3. `cp config/database.yml.sample config/database.yml`,
4. `createuser -s workshops`,
5. `rake db:create db:schema:load`
