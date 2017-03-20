# group_3
/* ************************************************************* */
CMPT 276 Group Three Project. Title: Random Encounters  
link to site: https://secure-gorge-21030.herokuapp.com/
(remote site goes down randomly...please refer to the email)

/* ************************************************************* */
Changes for "basic user model":
  - Created user controller (still at default values)
  - Created user model found in db/migrate, which has one main file and three "add" files which add latitude, longitude, and password.
  - Created tests for model attributes verification in test/models/user_test.rb
  - Created various validations for username, email, and password in app/models/user.rb
  - Added our group document file - no real additions have been made since the meeting last week
  - Added gem 'bcrypt', '~> 3.1.7' to gemfile

  Had to blank out 'jdbcpostgresql' gem and use the 'pg' gem, so Windows users will need to change this again in the gemfile
  before resuming work.

Changes for "finish user signup"
  - Modified user controler and minor addtion to routes
  - Created a very basic "new" user page and a link to it from the main page. Some validations implemented but more to be added
  - Created a very basic "show" (profile page), which is currently displayed upon signing upon. So far I have not figured out how to indicate which "boxes" where clicked.
