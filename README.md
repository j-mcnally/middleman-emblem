# Middleman::Emblem

A simple plugin to support emblem with Middleman

Inspired by https://github.com/GutenYe/middleman-ember-template

A great template but we wanted to add slim/haml style support for ember templates.

Built around the Emblem JS project: https://github.com/machty/emblem.js


## Full Project Generation

Check out my other project ([mes](https://github.com/j-mcnally/mes)) which will build a full scaffold for a middleman/ember/emblem project.


## Installation

Add this line to your application's Gemfile:

    gem 'middleman-emblem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-emblem

## Usage

add `activate :emblem` to config.rb

## Configuration

by default:
`activate :emblem, emblem_dir: "templates", emblem_ext: "emblem", ignore: true`

`ignore: true` means it will ignore the "templates" folder when building

but this can be changed in config.rb to something like:
`activate :emblem, emblem_dir: "templates_slim", emblem_ext: "slim", ignore: false`

`ignore: false` means you need to *explicity ignore* the "templates" folder in your config.rb when building

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
