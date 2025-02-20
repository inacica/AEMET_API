Feature: Test the AEMET endpoints.

  Background:
    * url baseUrl.aemet
    * configure headers = read('classpath:karate-headers.js')

  Scenario Outline: Get Antartica data from different stations.
    * def expectedResponse = read('this:responses/positiveResponse.json')
    Given path 'api','antartida','datos','fechaini',<fechaIniStr>,'fechafin',<fechaFinStr>,'estacion',<identificacion>
    When method GET
    Then status 200
    And print response
    #And match response contains expectedResponse

    # From here below, it's a pseudocode: extract the url from the response and check the values for temp, pres, vel. It can be done for all temp, pres, vel , but I wrote only for one example.

    #* def datos = response.datos
    #* def extract_url = '#regex expression'
    #* url extract_url
    #* match temp[0] == 1.4
    #* match pres[0] == 990.3
    #* match vel[0] == 4.1

    Examples:
    | TestCase                                       | fechaIniStr              | fechaFinStr              | identificacion |
    | "Meteorological station  Juan Carlos I"        | "2000-01-05T00:00:00UTC" | "2000-02-05T00:00:00UTC" | "89064"        |
    | "Radiometric station  Juan Carlos I"           | "2007-12-05T00:00:00UTC" | "2008-01-05T00:00:00UTC" | "89064R"       |
    | "Radiometric2 station  Juan Carlos I"          | "2000-01-05T00:00:00UTC" | "2000-02-05T00:00:00UTC" | "89064RA"      |
    | "Meteorological station  Gabriel de Casatilla" | "2024-01-05T00:00:00UTC" | "2024-02-05T00:00:00UTC" | "89070"        |




  Scenario Outline: Negative tests for getting Antartica data older than 1 month from different stations.
    Given path 'api','antartida','datos','fechaini',<fechaIniStr>,'fechafin',<fechaFinStr>,'estacion',<identificacion>
    When method GET
    Then status 200
    #And match response.descripcion == "El rango de fechas no puede ser superior a 1 mes"
    #And match response.estado == 404

    Examples:
    | TestCase                                       | fechaIniStr              | fechaFinStr              | identificacion |
    | "Meteorological station  Juan Carlos I"        | "2000-01-05T00:00:00UTC" | "2001-02-05T00:00:00UTC" | "89064"        |
    | "Radiometric station  Juan Carlos I"           | "2007-12-05T00:00:00UTC" | "2008-05-05T00:00:00UTC" | "89064R"       |
    | "Radiometric2 station  Juan Carlos I"          | "2002-01-05T00:00:00UTC" | "2002-02-06T00:00:00UTC" | "89064RA"      |
    | "Meteorological station  Gabriel de Casatilla" | "2005-01-05T00:00:00UTC" | "2005-02-28T00:00:00UTC" | "89070"        |



  Scenario Outline: Negative tests when the date format or station format is wrong.
    Given path 'api','antartida','datos','fechaini',<fechaIniStr>,'fechafin',<fechaFinStr>,'estacion',<identificacion>
    When method GET
    Then status 200
    #And match response.descripcion == "No hay datos que satisfagan esos criterios"
    #And match response.estado == 404

    Examples:
    | TestCase                                       | fechaIniStr              | fechaFinStr              | identificacion |
    | "Meteorological station  Juan Carlos I"        | "2000-01-05T00:00:00"    | "2001-02-05T00:00:00UTC" | "89064"        |
    | "Radiometric station  Juan Carlos I"           | "2007-12-05"             | "2008-05-05T00:00:00UTC" | "89064R"       |
    | "Radiometric2 station  Juan Carlos I"          | "2002-01-05T00:00:00UTC" | "2002-02-06T00:00"       | "89064RA"      |
    | "Meteorological station  Gabriel de Casatilla" | "2005-01-05T00:00:00UTC" | "2005-02-28T00:00:00UTC" | "12"           |
