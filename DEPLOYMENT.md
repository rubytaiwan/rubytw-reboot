# Deployment

Host on Heroku. [Integrated with GitHub](https://devcenter.heroku.com/articles/github-integration).

## Prepare your environment

```
cd your_projects_folder
git clone https://github.com/rubytaiwan/rubytw-reboot.git
heroku login
heroku git:remote -a rubytw-staging -r staging
heroku git:remote -a rubytw-production -r production
git remote -v
# you will got staging/production remote name now.
```

## Local development environment

Use `foreman` run as same Procfile environment.

```
$ gem install foreman
# Do not install in Gemfile.
```

```
$ foreman start
# No more "rails s", do "foreman start" in your local development.
```

## Review Apps

Pull Request will automatically spawns up a new review app.

## Deploy to Staging

    git push staging master

## Deploy a Feature Branch to Staging

Suppose feature branch name: `feature/awesome`

    git push staging feature/awesome:master

## Deploy to Production

    git push production master

For more information, please refer to [Heroku Docs](https://devcenter.heroku.com/articles/git).

## Rollback

    heroku releases
    # show history of releases

    heroku rollback v10
    # rollback to version 10

For more information, please refer to [Releases and Rollback](https://devcenter.heroku.com/articles/releases).

