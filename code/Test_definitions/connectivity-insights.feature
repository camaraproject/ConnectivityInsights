
Feature: Connectivity Insights API automated test

  Background:
    Given an environment at "apiRoot"
    And the resource "{path_resource}"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value

  @connectivityInsights_getInsights_1_success
  Scenario: Retrieve connectivity insights
    Given The API Client makes a POST request to the {path_resource}
    When Create request with valid request body
    Then Response code is 200 OK
    And The response body complies with NetworkQualityInsightResponse object
