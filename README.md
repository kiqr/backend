Backend 
==============
[![RuboCop Github Action](https://github.com/kiqr/backend/actions/workflows/rubocop.yml/badge.svg)](https://github.com/kiqr/backend/actions/workflows/rubocop.yml)
[![RSpec](https://github.com/kiqr/backend/actions/workflows/rspec.yml/badge.svg)](https://github.com/kiqr/backend/actions/workflows/rspec.yml)
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE.md)

An administration panel for Ruby on Rails.

Installation
------------

#### 1. Add the following line to your Gemfile:

```ruby
gem "backend", github: "kiqr/backend" # Use development branch until first release.
```

and run `bundle install` from your terminal to install it.

#### 2. Link the stylesheet

Add the backend stylesheet to your manifest file at `app/assets/config/manifest.js`:

```sass
//= link backend/application.css
```

#### 3. Setup the routes

Add `backend` to your routes in `config/routes.rb`.

```ruby
Rails.application.routes.draw do
  backend
  ...
end
```

After you've installed `Backend` follwing the instructions above, you should have some new routes enabled which can be used to access the backend. Confirm that the installation works by navigating to the Dashboard at `/backend` in your browser.


Getting Started
---------------

Let's create a backend for the model `Category`. You can generate a pre-configured backend with the `backend` generator. Replace `MODEL` with the class name used for the model to create a `Backend` for that model (if one does not exist) and configure it with the default attributes: 

```console
$ rails generate backend MODEL
```

This should generate a `CategoryBackend`-class at `app/backend/category_backend.rb`:

```ruby
class CategoryBackend < ApplicationBackend
  ...
end
```

### The #index block
Use the `index`-block to configure which columns to display on your index of resources.
```ruby
class CategoryBackend < ApplicationBackend
  index do
    column :name
    column :description
    column :created_at
  end
end
```

### The #edit block
Use the `edit`-block to configure which form fields to display on your resoure's edit page.
```ruby
class CategoryBackend < ApplicationBackend
  edit do
    field :name
    field :description, type: :editor # WYSIWYG editor
    association :products
  end
end
```

Contributing
------------
If you are interested in reporting/fixing issues and contributing directly to the code base, please see [CONTRIBUTING.md](CONTRIBUTING.md) for more information on what we're looking for and how to get started.

Versioning
----------
This library aims to adhere to [Semantic Versioning](http://semver.org/). Violations
of this scheme should be reported as bugs. Specifically, if a minor or patch
version is released that breaks backward compatibility, that version should be
immediately yanked and/or a new version should be immediately released that
restores compatibility. Breaking changes to the public API will only be
introduced with new major versions. As a result of this policy, you can (and
should) specify a dependency on this gem using the [Pessimistic Version
Constraint](http://guides.rubygems.org/patterns/#pessimistic-version-constraint) with two digits of precision. For example:

```ruby
gem "backend", "~> 1.0"
```

License
-------
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
