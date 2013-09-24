Feature: User views chronologically ordered discussion
  As a User
  So that I can easily start reading a discussion
  I want to see disucussion in chronological order

@javascript
Scenario: User views discussion in chronological order
  Given there is a discussion in a public group
  And there are two comments
  When I visit the discussion page
  Then I should see the comments in order of creation
