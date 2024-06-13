Feature: Star Wars API
  Background: Set urlBase
    * url urlBase

  Scenario Outline: Consult all swapi resources successfully
    * def jsonResponse = read('../schemas/'+'<json>')
    Given path '<path>'
    When method get
    Then status <status>
    And match $.count == "#number"
    And match response == jsonResponse

    Examples:
      | path      | status | json              |
      | /people/  | 200    | peopleSchema.json |
      | /planets/ | 200    | planets.json      |

  Scenario: Consult person successfully
    * def personSchema = read('../schemas/specificPersonSchema.json')
    * def personPath = '/people/4/'

    Given path personPath
    When method get
    Then status 200
    And match response == personSchema

  Scenario: Consult species successfully
    * def speciesSchema = read('../schemas/speciesSchema.json')
    * def speciesPath = '/species/'

    Given path speciesPath
    When method get
    Then status 200
    And match response contains {count: "#number", next: "https://swapi.dev/api/species/?page=2", previous: "#null"}
    And match each $.results[*] == speciesSchema