Feature: Validate home page

  Scenario: Home Page Exists
    When I visit the home page
    Then I see the title Hello World
