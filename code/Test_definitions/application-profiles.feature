
Feature: Application Profiles API automated test

  Background:
    Given an environment at "apiRoot"
    And the resource "{path_resource}"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value

  @applicationProfile_create_1_success
  Scenario: Create application profile
    Given the API Client makes a POST request to the {path_resource}
    When Create request with valid request body
    Then Response code is 201 Created
    And The response body complies with ApplicationProfileId object

   @applicationProfile_retrieveById_1_success
  Scenario: Retrieve details based on specific Id
    Given the API Client makes a GET request to the {path_resource}
    When Create request with valid request body
    Then Response code is 200 OK
    And The response body complies with ApplicationProfile object

    @applicationProfile_updateApplicationProfileById_1_success
  Scenario: Update details based on specific ApplicationProfileId
    Given the API Client makes a PATCH request to the {path_resource}
    When Create request with valid request body
    Then Response code is 200 OK
    And The response body complies with ApplicationProfile object

  @applicationProfile_deleteById_1_success
  Scenario: Delete specific ApplicationProfileId
    Given the API Client makes a DELETE request to the {path_resource}
    When Create request with the mandatory parameters
    Then Response code is 200
