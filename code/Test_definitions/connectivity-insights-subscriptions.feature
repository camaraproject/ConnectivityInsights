@Connectivity_Insights_Subscriptions
Feature: CAMARA Connectivity Insights Subscriptions API, v0.6.0-rc.1 - Operations for Subscriptions

# Input to be provided by the implementation to the tests
# References to OAS spec schemas refer to schemas specified in connectivity-insights-subscriptions.yaml

  Background: Common Connectivity Insights Subscriptions setup
    Given the resource "{apiroot}/connectivity-insights-subscriptions/v0.6rc1" as base-url
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value

######### Happy Path Scenarios #################################

  @connectivity_insights_subscriptions_01_create_subscription_sync
  Scenario: Create subscription synchronously
    Given that subscriptions are created synchronously
    And a valid subscription request body with network quality event type
    And the request body property "$.sink" is set to a valid callback URL
    And the request body property "$.protocol" is set to "HTTP"
    And the request body property "$.config.subscriptionDetail.applicationProfileId" is set to a valid application profile ID
    When the request "createSubscription" is sent
    Then the response code is 201
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/Subscription"
    And the response contains a valid "subscriptionId"

  @connectivity_insights_subscriptions_02_create_subscription_async
  Scenario: Create subscription asynchronously
    Given that subscriptions are created asynchronously
    And a valid subscription request body with network quality event type
    And the request body property "$.sink" is set to a valid callback URL
    And the request body property "$.protocol" is set to "HTTP"
    And the request body property "$.config.subscriptionDetail.applicationProfileId" is set to a valid application profile ID
    When the request "createSubscription" is sent
    Then the response code is 202
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/SubscriptionAsync"
    And the response contains a valid "subscriptionId"

  @connectivity_insights_subscriptions_03_retrieve_empty_subscription_list
  Scenario: Retrieve a list of subscriptions when no subscriptions available
    Given a client without subscriptions created
    When the request "getSubscriptionList" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body is an empty array

  @connectivity_insights_subscriptions_04_retrieve_subscription_list
  Scenario: Retrieve a list of subscriptions
    Given a client with subscriptions created
    When the request "getSubscriptionList" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body has an array of items and each item complies with the OAS schema at "/components/schemas/Subscription"

  @connectivity_insights_subscriptions_05_retrieve_subscription_by_id
  Scenario: Retrieve a subscription based on existing subscription-id
    Given the path parameter "subscriptionId" is set to the identifier of an existing subscription
    When the request "getSubscription" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/Subscription"

  @connectivity_insights_subscriptions_06_delete_subscription
  Scenario: Delete a subscription based on existing subscription-id
    Given the path parameter "subscriptionId" is set to the identifier of an existing subscription
    When the request "deleteSubscription" is sent
    Then the response code is 204
    And the response header "x-correlator" has same value as the request header "x-correlator"

  @connectivity_insights_subscriptions_08_receive_network_quality_notification
  Scenario: Receive network quality notification
    Given that subscriptions are created synchronously
    And a valid subscription request body with network quality event type
    And the request body property "$.types" contains the element "org.camaraproject.connectivity-insights-subscriptions.v0.network-quality"
    When the request "createSubscription" is sent
    Then the response code is 201
    And when the network quality changes for the subscribed device
    Then event notification "network-quality" is received on callback-url
    And sink credentials are received as expected
    And notification body complies with the OAS schema at "/components/schemas/EventNetworkQuality"
    And type="org.camaraproject.connectivity-insights-subscriptions.v0.network-quality"

  @connectivity_insights_subscriptions_09_subscription_ends_on_expiry
  Scenario: Receive notification for subscription-ends event on expiry
    Given that subscriptions are created synchronously
    And a valid subscription request body with network quality event type
    And the request body property "$.config.subscriptionExpireTime" is set to a value in the near future
    When the request "createSubscription" is sent
    Then the response code is 201
    And when the subscription expires
    Then event notification "subscription-ends" is received on callback-url
    And notification body complies with the OAS schema at "/components/schemas/EventSubscriptionEnds"
    And type="org.camaraproject.connectivity-insights-subscriptions.v0.subscription-ends"
    And the response property "$.data.terminationReason" is "SUBSCRIPTION_EXPIRED"

  @connectivity_insights_subscriptions_10_subscription_ends_when_max_events
  Scenario: Receive notification for subscription-ends event on max events reached
    Given that subscriptions are created synchronously
    And a valid subscription request body with network quality event type
    And the request body property "$.config.subscriptionMaxEvents" is set to 1
    When the request "createSubscription" is sent
    Then the response code is 201
    And when the network quality changes for the subscribed device
    Then event notification "network-quality" is received on callback-url
    And event notification "subscription-ends" is received on callback-url
    And notification body complies with the OAS schema at "/components/schemas/EventSubscriptionEnds"
    And type="org.camaraproject.connectivity-insights-subscriptions.v0.subscription-ends"
    And the response property "$.data.terminationReason" is "MAX_EVENTS_REACHED"

  @connectivity_insights_subscriptions_11_subscription_ends_on_delete
  Scenario: Receive notification for subscription-ends event on deletion
    Given that subscriptions are created synchronously
    And a valid subscription request body with network quality event type
    When the request "createSubscription" is sent
    Then the response code is 201
    When the request "deleteSubscription" is sent with the created subscription ID
    Then the response code is 204
    And event notification "subscription-ends" is received on callback-url
    And notification body complies with the OAS schema at "/components/schemas/EventSubscriptionEnds"
    And type="org.camaraproject.connectivity-insights-subscriptions.v0.subscription-ends"
    And the response property "$.data.terminationReason" is "NETWORK_TERMINATED"

  @connectivity_insights_subscriptions_12_initial_event
  Scenario: Receive initial event when requested
    Given that subscriptions are created synchronously
    And a valid subscription request body with network quality event type
    And the request body property "$.config.initialEvent" is set to true
    When the request "createSubscription" is sent
    Then the response code is 201
    And event notification "network-quality" is immediately received on callback-url
    And notification body complies with the OAS schema at "/components/schemas/EventNetworkQuality"
    And type="org.camaraproject.connectivity-insights-subscriptions.v0.network-quality"

############### Error response scenarios ###########################

  # 400 Error Scenarios

  @connectivity_insights_subscriptions_13_create_with_invalid_request_body
  Scenario: Create subscription with invalid request body
    Given the request body is not compliant with the schema "/components/schemas/SubscriptionRequest"
    When the request "createSubscription" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_14_subscription_with_expiry_time_in_past
  Scenario: Create subscription with expiry time in past
    Given a valid subscription request body with network quality event type
    And the request body property "$.config.subscriptionExpireTime" is set to a timestamp in the past
    When the request "createSubscription" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_15_invalid_protocol
  Scenario: Create subscription with invalid protocol
    Given a valid subscription request body with network quality event type
    And the request body property "$.protocol" is set to "UNSUPPORTED_PROTOCOL"
    When the request "createSubscription" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_PROTOCOL"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_16_invalid_credential_type
  Scenario: Create subscription with invalid credential type
    Given a valid subscription request body with network quality event type
    And the request body property "$.sinkCredential.credentialType" is not "ACCESSTOKEN"
    When the request "createSubscription" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_CREDENTIAL"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_17_invalid_access_token_type
  Scenario: Create subscription with invalid access token type
    Given a valid subscription request body with network quality event type
    And the request body property "$.sinkCredential.accessTokenType" is not "bearer"
    When the request "createSubscription" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_TOKEN"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_18_invalid_subscription_id_format
  Scenario: Retrieve subscription with invalid subscription ID format
    Given the path parameter "subscriptionId" is set to an invalid format value
    When the request "getSubscription" is sent
    Then the response code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  # 401 Error Scenarios

  @connectivity_insights_subscriptions_19_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And a valid subscription request body with network quality event type
    When the request "createSubscription" is sent
    Then the response code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_20_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And a valid subscription request body with network quality event type
    When the request "createSubscription" is sent
    Then the response code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_21_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And a valid subscription request body with network quality event type
    When the request "createSubscription" is sent
    Then the response code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  # 403 Error Scenarios

  @connectivity_insights_subscriptions_22_permission_denied
  Scenario: Client does not have sufficient permissions
    Given the header "Authorization" is set to a valid access token without required scope
    And a valid subscription request body with network quality event type
    When the request "createSubscription" is sent
    Then the response code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_23_subscription_mismatch
  Scenario: Inconsistent access token for requested events subscription
    Given a valid subscription request body with network quality event type
    And the request body property "$.types" contains an event type not supported by the API
    When the request "createSubscription" is sent
    Then the response code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "SUBSCRIPTION_MISMATCH"
    And the response property "$.message" contains a user friendly text

  # 404 Error Scenarios

  @connectivity_insights_subscriptions_24_subscription_id_not_found
  Scenario: Retrieve subscription with unknown subscription ID
    Given the path parameter "subscriptionId" is set to a non-existent subscription ID
    When the request "getSubscription" is sent
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_25_delete_unknown_subscription
  Scenario: Delete subscription with unknown subscription ID
    Given the path parameter "subscriptionId" is set to a non-existent subscription ID
    When the request "deleteSubscription" is sent
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  # 422 Error Scenarios

  @connectivity_insights_subscriptions_27_service_not_applicable
  Scenario: Create subscription for a device not supported by the service
    Given a valid subscription request body with network quality event type
    And the request body property "$.config.subscriptionDetail.device" refers to a device not supported by the service
    When the request "createSubscription" is sent
    Then the response code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "SERVICE_NOT_APPLICABLE"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_28_missing_identifier
  Scenario: Create subscription without device identifier with two-legged token
    Given the header "Authorization" is set to a valid two-legged access token
    And a valid subscription request body with network quality event type
    And the request body property "$.config.subscriptionDetail.device" is removed
    When the request "createSubscription" is sent
    Then the response code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "MISSING_IDENTIFIER"
    And the response property "$.message" contains a user friendly text


  # 429 Error Scenarios

  @connectivity_insights_subscriptions_30_too_many_requests
  Scenario: Too many requests (rate limit)
    Given the client has exceeded the rate limit
    And a valid subscription request body with network quality event type
    When the request "createSubscription" is sent
    Then the response code is 429
    And the response property "$.status" is 429
    And the response property "$.code" is "TOO_MANY_REQUESTS"
    And the response property "$.message" contains a user friendly text

  @connectivity_insights_subscriptions_31_quota_exceeded
  Scenario: Quota exceeded
    Given the client has exceeded their quota
    And a valid subscription request body with network quality event type
    When the request "createSubscription" is sent
    Then the response code is 429
    And the response property "$.status" is 429
    And the response property "$.code" is "QUOTA_EXCEEDED"
    And the response property "$.message" contains a user friendly text
