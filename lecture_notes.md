Lecture Topics:
---------------
- testing frameworks for Ruby/Sinatra: RSpec, Test-unit, Minitest, Bacon
- helpers: shoulda, rack-test, capybara
- TDD/BDD/EDD
- unit vs. integration vs. functional vs. acceptance test  
  - unit test => single method / class, in isolation  
  - integration test => interactions across classes / layers
  - functional test => end-to-end, full-stack, observable inputs & output
  - acceptance test => as user would interact with system; satisfies user requirement
- inside-out vs. outside-in
- mantras
  - Red-Green-Refactor
  - Only test code that you control (i.e. don't test libraries)
  - Call the method you wish you had


Demo psql:
```
psql database_name  
\q  
\l  
\dt
```  
plus, good old familiar sql statements (don't forget to end with semi-colon)  


Links:
------
http://dannorth.net/introducing-bdd/

"Dan North changed my life"
http://arialdomartini.wordpress.com/2012/09/03/pre-emptive-commit-comments/

https://www.ruby-toolbox.com/categories/testing_frameworks
