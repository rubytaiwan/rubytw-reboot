# Contributing

Thank you for contributing! We love pull requests from everyone. By participating
in this project, you agree to abide by the [code of conduct](/CODE_OF_CONDUCT.md).

Feel free to tackle [issues with "Help Wanted"](https://github.com/rubytaiwan/rubytw-reboot/labels/Help%20Wanted) label.

For pure documentation changes, please add `[ci skip]` to your commit message,
this can prevent CI server from needless :runner:.

Few technical guidelines to follow:

1. Open an issue to discuss a new feature.
2. Write tests.
3. Make sure the entire test suite passes locally and CI.
4. Open a Pull Request.
5. Receiving feedback.
6. Merge!

## Configure Your Local Development Environment

After cloned this repository, run the setup script:

`bin/setup`

## How To Run Our Application In The Local Development Environment

Use [foreman](https://github.com/ddollar/foreman) run as same Procfile environment.

```
$ gem install foreman # Do not install in Gemfile.
```

```
$ foreman start # No more "rails s", do "foreman start" in your local development.
```

## Testing

Set up your development environment as previous section.

Run `bin/rspec` to execute the full test suite.

## Style Checks

### Ruby

https://github.com/bbatsov/rubocop/tree/v0.29.1

Run style checks: `bundle exec rubocop -DR`

## Use docker containers

If you prefer to develop with containers, you can use docker-composer.

    docker-compose build
    docker-compose up

in another console

    docker-compose run app bin/rake db:setup

and you are good to go. You can issue all the commands by prefixing them with `docker-compose run app`. For example:

    docker compose run app bin/rspec
    docker conpose run app rubocop -DR

ultimately you will end up creating an alias in your `.bashrc` or `.zshrc` like for example

    alias dc="docker-compose run app"

## Contributor License Agreement

If you submit a contribution to this application's source code, you hereby grant
it to public domain. See [UNLICENSE](/UNLICENSE).
