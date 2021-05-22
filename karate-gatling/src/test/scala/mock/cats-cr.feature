Feature: cats crud

  Background:
    * url baseUrl
    * print 'gatling userId:', __gatling.userId

  @name=create
  Scenario: create

    Given request { name: 'Billie' }
    When method post
    Then status 200
    And match response == { id: '#uuid', name: 'Billie' }
    * def id = response.id

  @name=read
  Scenario: read
    # requires id to be passed.
    Given path id
    When method get
    Then status 200
    And match response == { id: '#(id)', name: 'Billie' }

