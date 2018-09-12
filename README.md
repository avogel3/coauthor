# Coauthor

Command line tool for working with Github Coauthors. Interactively create a commit template for coauthoring.

[Github Coauthoring (Article)](https://help.github.com/articles/creating-a-commit-with-multiple-authors/)

## Installation

Install with:
  		
  		$ gem install coauthor

## Usage

#### Set Up Coauthors

1) First thing you should do is setup a coauthor file. At this time, we support 2 coauthors. This adds a `~/.coauthorrc` file as a git template.

      	$ coauthor setup

2) After that you're all set to commit. Add your files with git and run the following when you are ready to commit:
  		
  		$ coauthor

#### Set Your Current Project Author (Optional)

Coauthor includes a utility to interactively set the git author of the current project. 

		$ coauthor git_user

#### List Available Commands

		$ coauthor --help

## Development

* After checking out the repo, run `bin/setup` to install dependencies.
* To install this gem onto your local machine, run `bundle exec rake install`. 
* To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/avogel3/coauthor.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).