Feature: Pruebas de API para el endpoint de usuarios

  Background:
    * url 'https://jsonplaceholder.typicode.com/users'

  Scenario: Obtener todos los usuarios
    When method get
    Then status 200
    And match response == '#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]'
    And match response[0].id == 1
    And match response[0].name == 'Leanne Graham'

  Scenario: Obtener un usuario específico
    Given path '1'
    When method get
    Then status 200
    And match response.id == 1
    And match response.name == 'Leanne Graham'
    And match response.username == 'Bret'
    And match response.email == 'Sincere@april.biz'

  Scenario: Intentar obtener un usuario que no existe
    Given path '999'
    When method get
    Then status 404