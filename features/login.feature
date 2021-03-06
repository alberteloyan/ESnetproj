Feature: Log in to user account
  As a network administrator 
  So that I can manage the servers I want data about without interference by others
  I want to be able to authenticate my identity

Background: User information has been added to the database

  Given the following users exist:

  |username       | email            | password      | password_confirmation    |
  | admin         | admin@admin.com  | admin1        | admin1                   |


Scenario: Authenticate using credentials
  When I am on the new user session page
  And I fill in "user_session_username" with "admin"
  And I fill in "user_session_password" with "admin1"
  And I press "login"
  Then I should be on the traceroutes page
  And I should see "Login Successful"

Scenario: Fail to authenticate
  When I am on the new user session page
  And I fill in "user_session_username" with "admin"
  And I fill in "user_session_password" with "admin"
  And I press "login"
  Then I should be on the user session page
  And I should see "Password is not valid"

Scenario: Create new account
  When I am on the traceroutes page
  And I follow "login"
  Then I should be on the login page
  And I follow "Register"
  Then I should be on the new user page
  And I fill in "user_username" with "the_admin"
  And I fill in "user_email" with "the_admin@admin.com"
  And I fill in "user_password" with "admin2"
  And I fill in "user_password_confirmation" with "admin2" 
  And I press "Save User"
  Then I should be on the users page
  And I should see "the_admin"


