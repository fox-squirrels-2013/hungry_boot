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
rvm use 2.0.0
rvm gemset use hungry_boot --create
bundle
rake db:create
rake db:migrate
```



HOW TO TEST (NOTE: running test will wipe out existing data!!!)
---------------------------------------------------------------
```
rspec
```



HOW TO RUN:
-----------
```
shotgun app/app.rb
```

- in a browser, open: 
```
http://localhost:9393/restaurants/new
```
