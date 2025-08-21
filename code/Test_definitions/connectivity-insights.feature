Feature: CAMARA Connectivity Insights API, vwip - Operations for Network Quality

# Input to be provided by the implementation to the tests
# References to OAS spec schemas refer to schemas specified in connectivity-insights.yaml

  Background: Common Connectivity Insights setup
    Given the resource "{apiroot}/connectivity-insights/vwip" as base-url
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"

######### Happy Path Scenarios #################################

  @connectivity_insights_01_check_network_quality_meets_requirements
  Scenario: Check network quality when it meets application requirements
    Given a valid application profile exists with ID in the system
    And a valid network quality insight request body with that application profile ID
    And the device identified in the request is connected to a network that meets the application requirements
    When the request "checkNetworkQuality" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/NetworkQualityInsightResponse"
    And the response property "$.packetDelayBudget" is "meets the application requirements"
    And the response property "$.targetMinDownstreamRate" is "meets the application requirements"
    And the response property "$.targetMinUpstreamRate" is "meets the application requirements"
    And the response property "$.packetlossErrorRate" is "meets the application requirements"
    And the response property "$.jitter" is "meets the application requirements"

  @connectivity_insights_02_check_network_quality_unable_to_meet_requirements
  Scenario: Check network quality when it cannot meet application requirements
    Given a valid application profile exists with ID in the system
    And a valid network quality insight request body with that application profile ID
    And the device identified in the request is connected to a network that cannot meet the application requirements
    When the request "checkNetworkQuality" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/NetworkQualityInsightResponse"
    And at least one of the response properties contains "unable to meet the application requirements"

  @connectivity_insights_03_check_network_quality_with_additional_kpis
  Scenario: Check network quality with additional KPIs in response
    Given a valid application profile exists with ID in the system
    And a valid network quality insight request body with that application profile ID
    When the request "checkNetworkQuality" is sent
    Then the response code is 200
    And the response body complies with the OAS schema at "/components/schemas/NetworkQualityInsightResponse"
    And the response contains additionalKPIs information
    And the response property "$.additionalKPIs.signalStrength" is one of "excellent", "good", "fair", "poor", "no signal"
    And the response property "$.additionalKPIs.connectivityType" is one of "5G-SA", "5G-NSA", "4G", "3G"

############### Error response scenarios ###########################

  # 400 Error Scenarios

  @connectivity_insights_05_check_network_quality_with_invalid_request_body
  Scenario: Check network quality with invalid request body
    Given the request body is not compliant with the schema "/components/schemas/NetworkQualityInsightRequest"
    When the request "checkNetworkQuality" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_06_check_network_quality_with_invalid_application_profile_id
  Scenario: Check network quality with invalid application profile ID format
    Given a valid network quality insight request body
    And the request body property "$.applicationProfileId" is set to an invalid UUID format
    When the request "checkNetworkQuality" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  # 401 Error Scenarios

  @connectivity_insights_09_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And a valid network quality insight request body
    When the request "checkNetworkQuality" is sent
    Then the response code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_10_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And a valid network quality insight request body
    When the request "checkNetworkQuality" is sent
    Then the response code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_11_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And a valid network quality insight request body
    When the request "checkNetworkQuality" is sent
    Then the response code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  # 403 Error Scenarios

  @connectivity_insights_12_permission_denied
  Scenario: Client does not have sufficient permissions
    Given the header "Authorization" is set to a valid access token without required scope
    And a valid network quality insight request body
    When the request "checkNetworkQuality" is sent
    Then the response code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_13_invalid_token_context
  Scenario: Token context is invalid
    Given the header "Authorization" is set to a valid access token
    And a valid network quality insight request body with inconsistent information compared to the token
    When the request "checkNetworkQuality" is sent
    Then the response code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "INVALID_TOKEN_CONTEXT"
    And the response property "$.message" contains a user friendly text

  # 404 Error Scenarios

  @connectivity_insights_14_application_profile_id_not_found
  Scenario: Application profile ID not found
    Given a valid network quality insight request body
    And the request body property "$.applicationProfileId" is set to a UUID that doesn't exist in the system
    When the request "checkNetworkQuality" is sent
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_15_device_identifier_not_found
  Scenario: Device identifier not found
    Given a valid network quality insight request body
    And the request body property "$.device" contains identifiers not matching any device in the system
    When the request "checkNetworkQuality" is sent
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "IDENTIFIER_NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  # 429 Error Scenarios

  @connectivity_insights_20_too_many_requests
  Scenario: Too many requests (rate limit)
    Given the client has exceeded the rate limit
    And a valid network quality insight request body
    When the request "checkNetworkQuality" is sent
    Then the response code is 429
    And the response property "$.status" is 429
    And the response property "$.code" is "TOO_MANY_REQUESTS"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_21_quota_exceeded
  Scenario: Quota exceeded
    Given the client has exceeded their quota
    And a valid network quality insight request body
    When the request "checkNetworkQuality" is sent
    Then the response code is 429
    And the response property "$.status" is 429
    And the response property "$.code" is "QUOTA_EXCEEDED"
    And the response property "$.message" contains a user friendly text
