# Changelog ConnectivityInsights

<!-- TOC:START -->
## Table of Contents
- [r4.1](#r41)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r4.1

## Release Notes

This release candidate contains the definition and documentation of
* connectivity-insights-subscriptions 0.7.0-rc.1
* connectivity-insights 0.7.0-rc.1

The API definition(s) are based on
* Commonalities r4.3 (0.8.0)
* Identity and Consent Management r4.2 (0.5.0)

## connectivity-insights-subscriptions 0.7.0-rc.1

**connectivity-insights-subscriptions 0.7.0-rc.1 is a release-candidate version of this API.**

Changes documented below are compared to version 0.6.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r4.1/code/API_definitions/connectivity-insights-subscriptions.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r4.1/code/API_definitions/connectivity-insights-subscriptions.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectivityInsights/blob/r4.1/code/API_definitions/connectivity-insights-subscriptions.yaml)

### Breaking changes

* Aligned the API with CAMARA Commonalities r4.3 (0.8.0) by @maheshc01 in https://github.com/camaraproject/ConnectivityInsights/pull/198
  * Pagination for listing of subscriptions using `GET /subscriptions` is now supported — also listed under Changed
    * Addition of `page` and `perPage` query parameters to control pagination
    * Returned subscriptions are now embedded in the `subscriptions` array within the response JSON, with page metadata in the `pagination` object
    * Addition of response headers `X-Total-Count`, `X-Total-Pages`, and `Link` to facilitate page navigation

### Added

* N/A

### Changed

* Aligned the API with CAMARA Commonalities r4.3 (0.8.0) by @maheshc01 in https://github.com/camaraproject/ConnectivityInsights/pull/198
  * Pagination for listing of subscriptions using `GET /subscriptions` is now supported — also listed under Breaking changes
    * Addition of `page` and `perPage` query parameters to control pagination
    * Returned subscriptions are now embedded in the `subscriptions` array within the response JSON, with page metadata in the `pagination` object
    * Addition of response headers `X-Total-Count`, `X-Total-Pages`, and `Link` to facilitate page navigation
  * CloudEvent subscription replaced with `allOf` ref to `CAMARA_event_common.CloudEvent`
  * Added mandatory `info.description` sections (authorization and authentication, additional error responses, request body strictness)
  * Added `maxLength`, `format`, and pattern constraints to string fields

### Fixed

* Fixed `maxLength`, `pattern` for `ApplicationServerIpv4Address` and `ApplicationServerIpv6Address` schemas, and fixed required properties in `CreateSubscriptionDetail` by @Kevsy in https://github.com/camaraproject/ConnectivityInsights/pull/209
* Fixed `externalDocs.url` trailing slash and `externalDocs.description` trailing period by @Kevsy in https://github.com/camaraproject/ConnectivityInsights/pull/214

### Removed

* N/A

## connectivity-insights 0.7.0-rc.1

**connectivity-insights 0.7.0-rc.1 is a release-candidate version of this API.**

Changes documented below are compared to version 0.6.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r4.1/code/API_definitions/connectivity-insights.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r4.1/code/API_definitions/connectivity-insights.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectivityInsights/blob/r4.1/code/API_definitions/connectivity-insights.yaml)

### Breaking changes

* N/A

### Added

* N/A

### Changed

* Aligned the API with CAMARA Commonalities r4.3 (0.8.0) by @maheshc01 in https://github.com/camaraproject/ConnectivityInsights/pull/198
  * Common definitions reused via `$ref` into `CAMARA_common.yaml` (`Device`, `DeviceResponse`, `Port`, `XCorrelator`, error responses)
  * Added mandatory `info.description` sections (authorization and authentication, additional error responses, request body strictness)
  * Added `maxLength`, `format`, `minimum`, and `maximum` constraints throughout

### Fixed

* Fixed missing `type: object` declarations in schema definitions by @hdamker in https://github.com/camaraproject/ConnectivityInsights/pull/193
* Fixed `maxLength` and added `pattern` for `ApplicationServerIpv4Address` and `ApplicationServerIpv6Address` schemas by @Kevsy in https://github.com/camaraproject/ConnectivityInsights/pull/214
* Fixed `externalDocs.description` trailing period by @Kevsy in https://github.com/camaraproject/ConnectivityInsights/pull/214

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/ConnectivityInsights/compare/r3.2...r4.1

