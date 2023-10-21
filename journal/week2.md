# Terraform Beginner Bootcamp 2023 - week 1

## Working with Ruby

## Bundler

Bundler is a package manager for Ruby.
It is the primary way to install Ruby packages known as Gems for Ruby.

#### Installing Gems

You need to create a Gemfile and define your Gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command. This will install the Gems on the system globally(unlike node js which installs packahges in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions being used.

#### Executing Ruby scripts in the context f bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is how we set context.

### Sinatra

Sinatra is a micro-web framework for Ruby to build web apps. It is great for mock or development servers ofr for very simple projects. 

You can create a web-server in a single file.

[Sinatra - Ruby](https://sinatrarb.com/)

## Terratowns Mock Server

### Running a Web Server

We can run a web server by running the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our web server is installed in the `server.rb` file.

## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for create, Read, Uodate, Delete.