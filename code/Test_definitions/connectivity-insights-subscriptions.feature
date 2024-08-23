
Feature: Connectivity Insights API automated test

  Background:
    Given an environment at "apiRoot"
    And the resource "{path_resource}"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value

  @connectivityInsights_createSubscription_1_success
  Scenario: Create subscription for reciving connectivity insghts notifications
    Given the API Client makes a POST request to the {path_resource}
    When Create request with valid request body
    Then Response code is 201 Created
    And The response body complies with Subscription object

  @connectivityInsights_retrieveAllSubscriptions_1_success
  Scenario: Retrieve all subscriptions details
    Given the API Client makes a GET request to the {path_resource}
    When Create request with valid request body
    Then Response code is 200
    And The response body complies with Subscription object

  @connectivityInsights_retrieveSubscriptionById_1_success
  Scenario: Retrieve subscription details based on specific Id
    Given the API Client makes a GET request to the {path_resource}
    When Create request with valid request body
    Then Response code is 200
    And The response body complies with Subscription object

  @connectivityInsights_deleteSubscriptionById_1_success
  Scenario: Delete subscription details based on specific Id
    Given the API Client makes a DELETE request to the {path_resource}
    When Create request with valid request body
    Then Response code is 202
    And The response body complies with SubscriptionAsync object
