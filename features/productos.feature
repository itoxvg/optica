Feature: Productos

  Scenario: Listing productos
    When I am on productos page
    Then I should see productos

  Scenario: Creating new product for my invetory
    When I am on productos page
    When I click on new producto link
