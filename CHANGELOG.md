# Changelog Connectivity Insights

NOTE:

## Table of contents

- [r1.1]

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each (pre-)release as follows:

* for the first alpha or release-candidate API version, all changes since the release of the previous public API version
* for subsequent alpha or release-candidate API versions, the delta with respect to the previous pre-release
* for a public API version, the consolidated changes since the release of the previous public API version


## Release Notes

This release contains the definition and documentation of
* Connectivity Insights API
* Application Profiles API

The API definition(s) are based on
* Commonalities v0.4.0-rc.1
* Identity and Consent Management v0.2.0-rc.1


## Connectivity Insights API v0.4.0-rc.1

** 0.4.0-rc.1 is the first release-candidate version for connectivity insights**


### Main changes
- This version is primarily to align with the changes to Commonalities 0.4-rc.1 and Identity and Consent Management v0.2.0-rc.1.

- API definition **with inline documentation**:
  - View it on ReDoc:
    - [connectivity-insights.yaml](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights.yaml&nocors)
    
    - [application-profiles.yaml](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/application-profiles.yaml&nocors)
  - [View it on Swagger Editor]
    - [connectivity-insights.yaml]((https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights.yaml))
      - [application-profiles.yaml]((https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/application-profiles.yaml))
  - OpenAPI
    -  [connectivity-insights.yaml](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/connectivity-insights.yaml)
    -  [application-profiles.yaml](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r1.1/code/API_definitions/application-profiles.yaml)

### Added
  - Gherkin `.feature` file in Test_definitions
  - Implementation of ICM consent guidelines
  - Addition of `x-camara-commonalities` object to YAML
  - Documentation: added warning about use of `networkAccessIdentifier`, added User Story

### Changed
  - Compliance with DeviceIdentifier schema
  - Error model alignment, including device identifier-related errors
  - Updated the API Readiness Checklist to the new format
