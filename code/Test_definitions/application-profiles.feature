@Application_Profiles
Feature: CAMARA Application Profiles API, v0.4.0 - Operations for Application Profiles

# Input to be provided by the implementation to the tests
# References to OAS spec schemas refer to schemas specified in application-profiles.yaml

  Background: Common Application Profiles setup
    Given the resource "{apiroot}/application-profiles/v0.4" as base-url
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value

######### Happy Path Scenarios #################################

  @application_profiles_01_create_application_profile
  Scenario: Create an application profile successfully
    Given a valid application profile request body with network quality thresholds
    When the request "createApplicationProfile" is sent
    Then the response code is 201
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/ApplicationProfile"
    And the response contains a valid UUID as "applicationProfileId"

  @application_profiles_02_update_application_profile
  Scenario: Update an application profile successfully
    Given the path parameter "applicationProfileId" is set to the identifier of an existing application profile
    And a valid application profile update request body
    When the request "updateApplicationProfile" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/ApplicationProfile"

  @application_profiles_03_read_application_profile
  Scenario: Read an application profile successfully
    Given the path parameter "applicationProfileId" is set to the identifier of an existing application profile
    When the request "readApplicationProfile" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/ApplicationProfile"

  @application_profiles_04_delete_application_profile
  Scenario: Delete an application profile successfully
    Given the path parameter "applicationProfileId" is set to the identifier of an existing application profile
    When the request "deleteApplicationProfile" is sent
    Then the response code is 200
    And the response header "x-correlator" has same value as the request header "x-correlator"

############### Error response scenarios ###########################

  # 400 Error Scenarios

  @application_profiles_05_create_with_invalid_request_body
  Scenario: Create application profile with invalid request body
    Given the request body is not compliant with the schema "/components/schemas/ApplicationProfileRequest"
    When the request "createApplicationProfile" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @application_profiles_06_update_with_invalid_request_body
  Scenario: Update application profile with invalid request body
    Given the path parameter "applicationProfileId" is set to the identifier of an existing application profile
    And the request body is not compliant with the schema "/components/schemas/ApplicationProfile"
    When the request "updateApplicationProfile" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  # 403 Error Scenarios

  @application_profiles_11_permission_denied
  Scenario: Client does not have sufficient permissions
    Given the header "Authorization" is set to a valid access token without required scope
    And a valid application profile request body
    When the request "createApplicationProfile" is sent
    Then the response code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @application_profiles_12_invalid_token_context
  Scenario: Token context is invalid
    Given the header "Authorization" is set to a valid access token
    And a valid application profile request body with inconsistent information compared to the token
    When the request "createApplicationProfile" is sent
    Then the response code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "INVALID_TOKEN_CONTEXT"
    And the response property "$.message" contains a user friendly text

  # 404 Error Scenarios

  @application_profiles_13_read_unknown_profile_id
  Scenario: Read application profile with unknown ID
    Given the path parameter "applicationProfileId" is set to an unknown profile ID
    When the request "readApplicationProfile" is sent
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  @application_profiles_14_update_unknown_profile_id
  Scenario: Update application profile with unknown ID
    Given the path parameter "applicationProfileId" is set to an unknown profile ID
    And a valid application profile update request body
    When the request "updateApplicationProfile" is sent
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  @application_profiles_15_delete_unknown_profile_id
  Scenario: Delete application profile with unknown ID
    Given the path parameter "applicationProfileId" is set to an unknown profile ID
    When the request "deleteApplicationProfile" is sent
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text
