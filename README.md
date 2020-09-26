### Vivino Appium | Boilerplate
> A basic ruby appium framework with cucumber flavor on Vivino Android app

## Highlights
- Added a complete end-to-end scenario from `user registration -> login` 
- Used cucumber version `cucumber 5.1.0 (latest)`
- Executed tests in both `browserstack` and `local` environments 
- Used three different `HTML` reporters
- Github actions for `Linter`
- Followed ruby standards through-out the framework and tests


## Steps before Run
> **Note:** make sure that you have `RVM` and `Ruby` installed on prior; install `allure cli` which is optional
>
> ```
> curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --ruby
> source ~/.rvm/bin/rvm
> bash --login
> brew install allure
> ```

- Create a gem profile specific to the project 
```
rvm gemset create vivino
rvm gemset use vivino
```

- Install ruby libraries
```
gem install bundler
bundle install
```

## Runners

| Action         | Command            |
| -------------- | ---------          |
| Bash runner    | `bundle exec bash runner/prod/local.sh` |
| Default        | `bundle rake spec` |
| Browserstack runner | `bundle exec bash runner/prod/browserstack.sh` |
| Allure report | `bundle rake allure` |