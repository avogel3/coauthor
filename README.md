# Coauthor

Command line tool for easily committing with Github Coauthors

[Link - Github Coauthoring](https://help.github.com/articles/creating-a-commit-with-multiple-authors/)

## Installation

Install with: 

    $ gem install coauthor

## Usage

1) First thing you should do is setup a coauthor file. At this time, we support 2 coauthors. 

    $ coauthor # Follow the steps and setup your pair


2) After that you're all set to commit. Add your files with git and run `coauthor` when you are ready to commit

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/avogel3/coauthor.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
