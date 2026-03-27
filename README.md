# Collections

A Ruby gem providing useful collection data structures and utilities.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add collections
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install collections
```

## Usage

```ruby
require "collections"
```

## Implemented Collections

| Collection | Description                               |
|------------|-------------------------------------------|
| `Stack` | LIFO (Last In, First Out) data structure  |
| `Queue` | FIFO (First In, First Out) data structure |
| `LinkedList` | Singly linked list data structure         |
| `Tree` | Binary search tree data structure         |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

To build the gem locally:

```bash
gem build collections.gemspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub.

## Documentation

[Class and method Docs](Doc.md)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
