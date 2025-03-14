# Changelog Connectivity Insights

NOTE:

## Table of contents

- **[r2.2](#r22)**
- **[r2.1](#r21)**
- **[r1.2](#r12)**
- **[r1.1 - rc](#r11---rc)**

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r2.2
## Release Notes

This release contains the definition and documentation of
* connectivity-insights v0.5.0
* connectivity-insights-subscriptions v0.5.0
* application-profiles v0.4.0

The API definition(s) are based on
* Commonalities 0.5.0
* Identity and Consent Management v0.3.0

*  **r2.2 release of ConnectivityInsights has the following API definitions:**

    *  **connectivity-insights v0.5.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r2.2/code/API_definitions/connectivity-insights.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r2.2/code/API_definitions/connectivity-insights.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r2.2/code/API_definitions/connectivity-insights.yaml)

    *  **connectivity-insights-subscriptions v0.5.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.2/code/API_definitions/connectivity-insights-subscriptions.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.2/code/API_definitions/connectivity-insights-subscriptions.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.2/code/API_definitions/connectivity-insights-subscriptions.yaml)

    *  **application-profiles v0.4.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.2/code/API_definitions/application-profiles.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.2/code/API_definitions/application-profiles.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.2/code/API_definitions/application-profiles.yaml)

### Changed
* Changes requested by Release Management for M4

**Full Changelog**: https://github.com/camaraproject/connectivityInsights/compare/r1.2...r2.2

# r2.1
## Release Notes

This release contains the definition and documentation of
* connectivity-insights v0.5.0-rc.1
* connectivity-insights-subscriptions v0.5.0-rc.1
* application-profiles v0.4.0-rc.1

The API definition(s) are based on
* Commonalities 0.5.0-rc.1 (r2.2)
* Identity and Consent Management v0.3.0-rc.1 (r2.2)

*  **r2.1 release of ConnectivityInsights has the following API definitions:**

    *  **connectivity-insights v0.5.0-rc.1**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r2.1/code/API_definitions/connectivity-insights.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r2.1/code/API_definitions/connectivity-insights.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r2.1/code/API_definitions/connectivity-insights.yaml)

    *  **connectivity-insights-subscriptions v0.5.0-rc.1**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.1/code/API_definitions/connectivity-insights-subscriptions.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.1/code/API_definitions/connectivity-insights-subscriptions.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.1/code/API_definitions/connectivity-insights-subscriptions.yaml)

    *  **application-profiles v0.4.0-rc.1**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.1/code/API_definitions/application-profiles.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.1/code/API_definitions/application-profiles.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/2.1/code/API_definitions/application-profiles.yaml)

### Changed
All changes are to align with Commonalities 0.5.0-rc.1 and Identity and Consent management 0.3.0-rc.1, as captured in PR #116
* Error names and structures updated
* removed `406` and `5xx` errors
* `security` component updated
* `x-camara-commonalities` version updated
* Device identifier updates
* Template text for identifying devices updated
* Test guidelines updated to incorporate changed errrors.
* New API Readiness checklist used and updated
* For more details see [Scope for Spring 25 CAMARA meta release](https://github.com/camaraproject/ConnectivityInsights/issues/106)

**Full Changelog**: https://github.com/camaraproject/connectivityInsights/compare/r1.2...r2.1

# r1.2
## Release Notes

This release contains the definition and documentation of
* connectivity-insights v0.4.0
* connectivity-insights-subscriptions v0.4.0
* application-profiles v0.3.0

The API definition(s) are based on
* Commonalities v0.4.0
* Identity and Consent Management v0.2.0

*  **r1.2 release of ConnectivityInsights has the following API definitions:**

    *  **connectivity-insights v0.4.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/connectivity-insights.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/connectivity-insights.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/connectivity-insights.yaml)

    *  **connectivity-insights-subscriptions v0.4.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/connectivity-insights-subscriptions.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/connectivity-insights-subscriptions.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/connectivity-insights-subscriptions.yaml)

    *  **application-profiles v0.3.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/application-profiles.yaml&nocors)
    [[View it on Swagger Editor]](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/application-profiles.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.2/code/API_definitions/application-profiles.yaml)

### Added
* n/a
### Changed
* n/a

**Full Changelog**: https://github.com/camaraproject/connectivityInsights/commits/r1.2


# r1.1 - rc
## Release Notes

This release contains the definition and documentation of
* connectivity-insights v0.4.0-rc.1
* connectivity-insights-subscriptions v0.4.0-rc.1
* application-profiles v0.3.0-rc.1

The API definition(s) are based on
* Commonalities v0.4.0-rc.2
* Identity and Consent Management v0.2.0-rc.2

## connectivity-insights v0.4.0-rc.1

0.4.0-rc.1 is the first release of the API. The version is aligned with
Commonalities 0.4.0-rc.2 and Identity and Consent Management v0.2.0-rc.2.

- API definition **with inline documentation**:
  - View it on ReDoc:
    - [connectivity-insights.yaml](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights.yaml&nocors)


  - View it on Swagger Editor
    - [connectivity-insights.yaml](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights.yaml)

  - OpenAPI
    -  [connectivity-insights.yaml](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights.yaml)


### Added
  - Gherkin `.feature` file in Test_definitions
  - Implementation of ICM consent guidelines
  - Addition of `x-camara-commonalities` object to YAML
  - Documentation: added warning about use of `networkAccessIdentifier`, added User Story

### Changed
  - Compliance with DeviceIdentifier schema
  - Error model alignment, including device identifier-related errors
  - Updated the API Readiness Checklist to the new format

## connectivity-insights-subscriptions v0.4.0-rc.1

0.4.0-rc.1 is the first release of the API. The version is aligned with
Commonalities 0.4.0-rc.2 and Identity and Consent Management v0.2.0-rc.2.

- API definition **with inline documentation**:
  - View it on ReDoc:
    - [connectivity-insights-subscriptions.yaml](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights-subscriptions.yaml&nocors)


  - View it on Swagger Editor
    - [connectivity-insights-subscriptions.yaml](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights-subscriptions.yaml)

  - OpenAPI
    -  [connectivity-insights-subscriptions.yaml](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights-subscriptions.yaml)


### Added
  - Gherkin `.feature` file in Test_definitions
  - Implementation of ICM consent guidelines
  - Addition of `x-camara-commonalities` object to YAML
  - Documentation: added warning about use of `networkAccessIdentifier`, added User Story

### Changed
  - Compliance with DeviceIdentifier schema
  - Error model alignment, including device identifier-related errors
  - Updated the API Readiness Checklist to the new format

## application-profiles 0.3.0-rc.1

0.3.0-rc.1 is the first release of the API. The version is aligned with
Commonalities 0.4.0-rc.2 and Identity and Consent Management v0.2.0-rc.2.

- API definition **with inline documentation**:
  - View it on ReDoc:
    - [application-profiles.yaml](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/application-profiles.yaml&nocors)

  - View it on Swagger Editor
    - [application-profiles.yaml](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/application-profiles.yaml)

  - OpenAPI
    -  [application-profiles.yaml](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/application-profiles.yaml)

### Added

- Gherkin
`.feature` file in Test_definitions

### Changed

- Aligned the network monitoring KPIs to match with Quality on Demand CAMARA API.
- update the end points to make it more developer friendly based on the discussion in the API working group.
- Updated the API Readiness Checklist to the new format

**Full Changelog**: https://github.com/camaraproject/ConnectivityInsights/commits/r1.1
