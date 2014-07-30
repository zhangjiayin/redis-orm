Feature: Repository persistence
  Objects should be stored in redis with the appropriate "index" keys

  Scenario: Saving an object with "indexed" properties
    Given the following Car:
      | make  | model   | engine_type | color |
      | Tesla | Model S | V8          | red   |
    Then there should be 6 keys in the database
    And the following keys should exist:
      | name           | value |
      | make:Tesla     | 1     |
      | model:Model S  | 1     |
      | engine_type:V8 | 1     |
      | color:red      | 1     |

  Scenario: Finding an object by it's id
    Given the following Car:
      | make  | model   | engine_type | color |
      | Tesla | Model S | V8          | red   |
    When I find a Car by id 1
    Then there should be 1 car