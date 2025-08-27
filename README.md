<a href="https://github.com/camaraproject/ConnectivityInsights/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/camaraproject/ConnectivityInsights?style=plastic"></a>
<a href="https://github.com/camaraproject/ConnectivityInsights/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/camaraproject/ConnectivityInsights?style=plastic"></a>
<a href="https://github.com/camaraproject/ConnectivityInsights/pulls" title="Open Pull Requests"><img src="https://img.shields.io/github/issues-pr/camaraproject/ConnectivityInsights?style=plastic"></a>
<a href="https://github.com/camaraproject/ConnectivityInsights/graphs/contributors" title="Contributors"><img src="https://img.shields.io/github/contributors/camaraproject/ConnectivityInsights?style=plastic"></a>
<a href="https://github.com/camaraproject/ConnectivityInsights" title="Repo Size"><img src="https://img.shields.io/github/repo-size/camaraproject/ConnectivityInsights?style=plastic"></a>
<a href="https://github.com/camaraproject/ConnectivityInsights/blob/main/LICENSE" title="License"><img src="https://img.shields.io/badge/License-Apache%202.0-green.svg?style=plastic"></a>
<a href="https://github.com/camaraproject/ConnectivityInsights/releases/latest" title="Latest Release"><img src="https://img.shields.io/github/release/camaraproject/ConnectivityInsights?style=plastic"></a>
<a href="https://github.com/camaraproject/Governance/blob/main/ProjectStructureAndRoles.md" title="Sandbox API Repository"><img src="https://img.shields.io/badge/Sandbox%20API%20Repository-yellow?style=plastic"></a>

# ConnectivityInsights

Sandbox API Repository to describe, develop, document, and test the ConnectivityInsights Service API(s). The repository does not yet belong to a CAMARA Sub Project.

* API Repository [wiki page](https://lf-camaraproject.atlassian.net/wiki/x/KTLe)

## Scope
* Service APIs for “Connectivity Insights” (see APIBacklog.md)
* It provides the API consumer with the ability to:
  * share key details about their applications that are relevant for network-related decisions across various CAMARA APIs.
  * gain visibility into network quality, allowing them to
check if their application's network requirements can be met for a given user session. Based on the API’s response, developers can make informed decisions - like requesting a network boost through CAMARA Quality on Demand API or adjusting application settings (e.g. adjust video resolution) to ensure the best possible user experience.
  * enables application developers to receive continuous updates
about network quality through event notifications.
  * NOTE: The scope of these APIs should be limited (at least at a first stage) to 4G and 5G.
* Describe, develop, document and test the APIs (with 1-2 Telcos)
* Started: November 2023

## Release Information

* Note: Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until a new release is created. For example, changes may be reverted before a release is created. **For best results, use the latest available release**.

* **NEW: The latest public release is [r3.2](https://github.com/camaraproject/ConnectivityInsights/tree/r3.2), with the following API versions:**

    *  **Connectivity Insights API v0.6.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r3.2/code/API_definitions/connectivity-insights.yaml&nocors)
    [[View it on Swagger Editor]](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r3.2/code/API_definitions/connectivity-insights.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r3.2/code/API_definitions/connectivity-insights.yaml)

    *  **Connectivity Insights Subscriptions API v0.6.0**
    [[View it on ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r3.2/code/API_definitions/connectivity-insights-subscriptions.yaml&nocors)
    [[View it on Swagger Editor]](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r3.2/code/API_definitions/connectivity-insights-subscriptions.yaml)
    [[OpenAPI]](https://raw.githubusercontent.com/camaraproject/ConnectivityInsights/r3.2/code/API_definitions/connectivity-insights-subscriptions.yaml)

* The latest public release is available here: https://github.com/camaraproject/ConnectivityInsights/releases/latest
* Other releases of this sub project are available in https://github.com/camaraproject/ConnectivityInsights/releases
* For changes see [CHANGELOG.md](https://github.com/camaraproject/ConnectivityInsights/blob/main/CHANGELOG.md)

## Contributing
* Meetings
    * [Registration / Join](https://zoom-lfx.platform.linuxfoundation.org/meeting/92345695827?password=35dff2b2-058d-44de-bd7e-67d08c9e9f9d)
    * Schedule: Bi-weekly on Wednesday at 1500UTC
    * Minutes: Access [meeting minutes](https://lf-camaraproject.atlassian.net/wiki/x/vTve)
* Mailing List
    * Subscribe / Unsubscribe to the mailing list of this Sub Project <https://lists.camaraproject.org/g/sp-coi>.
    * A message to the community of this Sub Project can be sent using <sp-coi@lists.camaraproject.org>.
