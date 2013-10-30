# Hungry Boots


1. [Learning Objectives](#learning-objectives)
1. [Summary](#summary)
1. [Releases](#releases)
1. [Helpful Resources](#helpful-resources)


## Learning Objectives
* Understand TDD.

## Summary
In this challenge you will be working with the amazing Hungry Boots application and building out additional resources using TDD.  Each feature should be written by first writing a failing test and then writing code to make the test pass.  

## Releases
### Getting Started 
** INSTALLATION**  

- clone project from github to your machine

- create a branch with your name(s)

- create an `.env` file in the root directory of the project containing the following:
```
database=database_name
```
where database_name is the name of your database

- run the following commands:
```
rvm use 1.9.3
rvm gemset use hungry_boot --create
bundle
rake db:create
rake db:migrate
```
If you are curious about why we are using a gemset, read more here [http://rvm.io/gemsets/basics](http://rvm.io/gemsets/basics)  

** RUNNING THE TESTS

Type `rpsec` on the command line.   

NOTE that each time you run the tests, it will wipe out any data you've previously entered. This is intentional -- discuss why, and how this could be avoided while you're developing.  


**RUNNING THE APP**

```
shotgun app/app.rb
```

- in a browser, open: 
```
http://localhost:9393/restaurants/new
```

Now your ready to add some features.  


### Release 1: 

* Allow a user to indicate what type of cuisine the restaurant serves.  Use TDD to drive the implementation of the needed changes to the model, route/controller, and view.

### Release 2:
* Implement another CRUD operation for restaurants (e.g. update, delete); or some other new behavior.

### Release 3:
* Allow a user to add a review for a restaurant. Use TDD to drive the design and implementation the needed migration, model with validations, route/controller, and view. Include the following attributes:
  - comment (must be non-blank)
  - by (must be non-blank)
  - rating (must be an integer between 1-5)

* Question: How are reviews related to restaurants? Remember to specify this association in your models.

### Release 4: 
* Assure that the same restaurant is not added twice
* Question to ponder: Where (and how) should this check be performed? Is there more than one place?

## Helpful Resources
* [Rspec](http://rspec.info/)
* [Capybara](https://github.com/jnicklas/capybara)
* [Shoulda](https://github.com/thoughtbot/shoulda)
* [Environment Variables for Configuration](http://blog.rubybestpractices.com/posts/gregory/033-issue-4-configurable.html)
* [dotenv](https://github.com/bkeepers/dotenv)
