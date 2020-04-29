# This file contains a user story for the color CRUD.

Feature: Color CRUD
  In order to manage colors
  As a user
  I need to be able to Create, View (single, list), Update and Delete colors

  Scenario: List when no colors in database
    Given The database is empty
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "GET" request to "api/colors"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be equal to:
      """
      []
      """

  Scenario: Add a color to the database
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "POST" request to "api/colors" with body:
    """
    {"name": "Red"}
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the JSON nodes should be equal to:
      | id   | 1   |
      | name | Red |

  Scenario: Add a second color to the database
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "POST" request to "api/colors" with body:
    """
    {"name": "Purple"}
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the JSON nodes should be equal to:
      | id   | 2   |
      | name | Purple |

  Scenario: List all the colors
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "GET" request to "api/colors"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be equal to:
      """
      [{"id":1,"name":"Red"},{"id":2,"name":"Purple"}]
      """

  Scenario: Update the Red color to Blue
    When I add "Content-Type" header equal to "application/merge-patch+json"
    And I add "Accept" header equal to "application/json"
    And I send a "PATCH" request to "api/colors/1" with body:
    """
    {"name": "Blue"}
    """
    And the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the JSON nodes should be equal to:
      | id   | 1    |
      | name | Blue |

  Scenario: Replace the Blue color with Green
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "PUT" request to "api/colors/1" with body:
    """
    {"name": "Green"}
    """
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the JSON nodes should be equal to:
      | id   | 1     |
      | name | Green |

  Scenario: We can see the Green color
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "GET" request to "api/colors/1"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the JSON nodes should be equal to:
      | id   | 1     |
      | name | Green |

  Scenario: Delete the color with ID 1
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "DELETE" request to "api/colors/1"
    And the response status code should be 204

  Scenario: List when the colors (Purple)
    When I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    And I send a "GET" request to "api/colors"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be equal to:
      """
      [{"id":2,"name":"Purple"}]
      """
