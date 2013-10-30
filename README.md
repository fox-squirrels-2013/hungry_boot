## README


HOW TO INSTALL:
---------------
- clone project from github to your machine

- create a branch with your name(s)

- create an `.env` file in the root directory of the project containing the following:
```
database=[database_name]
```
where [database_name] is the name of your database

- run the following commands:
```
rvm use 1.9.3
rvm gemset use hungry_boot --create
bundle
rake db:create
rake db:migrate
```


HOW TO TEST
-----------
```
rspec
```
NOTE that each time you run the tests, it will wipe out any data you've previously entered. This is intentional -- discuss why, and how this could be avoided while you're developing.


HOW TO RUN:
-----------
```
shotgun app/app.rb
```

- in a browser, open: 
```
http://localhost:9393/restaurants/new
```


CHALLENGE:
----------
There are some new requirements for your application:

Allow a user to indicate what type of cuisine the restaurant serves.
Use TDD to drive the implementation of the needed changes to the model, route/controller, and view.

Implement another CRUD operation for restaurants (e.g. update, delete); or some other new behavior.

Allow a user to add a review for a restaurant
Use TDD to drive the design and implementation the needed migration, model with validations, route/controller, and view
Include the following attributes:
- comment (must be non-blank)
- by (must be non-blank)
- rating (must be an integer between 1-5)
Question: How are reviews related to restaurants? Remember to specify this association in your models.

Stretch: assure that the same restaurant is not added twice
Question to ponder: Where (and how) should this check be performed? Is there more than one place?
