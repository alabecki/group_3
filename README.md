# group_3
CMPT 276 Group Three Project. Working Tittle: Random Encounters  
link to site: https://quiet-stream-41275.herokuapp.com/

changes for "basic user model":
  created user controller (still at default values)
  created user model found in db/migrate, which has one main file and three "add" files which add latitude, longitude, and password.
  created tests for model attributes verification in test/models/user_test.rb
  created various validations for username, email, and password in app/models/user.rb 
  Added our group document file - no real additions have been made since the meeting last week
  
  Also.... I had to blank out 'jdbcpostgresql' gem and use the 'pg' gem, so Windows users will need to change this again in the gemfile 
  before resuming work. 
  