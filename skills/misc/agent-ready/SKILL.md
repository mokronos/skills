---
name: agent-ready
description: Use you are analyzing an API or an interface of an application if it is ready to be used by an AI agent.
---


Validate the following categories for the whole API surface of the application.

# Completeness

- Any button in the dashboard or UI should be available via the API or MCP as well.
- Mark any under specified arguments or descriptions of the endpoints. E.g. if its not clear if a argument should be an Enum or any string or the range on an int or float that should be in a range.

# Awkwardness

- While validating the API, think of some scenarios of how the API would be used by an AI agent. If there are some scenarios that would require a super long chain of tool calls to complete for a common task, mark that.

# Result

- Your result should include a list of all the functionalities that are not available via the API or MCP.
- Your result should include a list of all the awkward uses of the API or MCP you can find.
