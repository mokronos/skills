---
name: dev-servers
description: Use whenever starting, reusing, configuring, or troubleshooting a development server, previewing an app, or giving the user a URL to test changes, including worktree previews. Check fleet and identify the execution machine first, then provide a URL reachable from the user's main device.
---

# Dev Servers

## Identify the machines first

1. Load the `fleet` skill before inspecting or starting a dev server. Treat fleet as the source of truth for machine roles and the user's main device.
2. Run `hostname` in the environment where commands execute and match it to fleet. Do not infer the machine from the working directory, tool UI, or a previous session. Never SSH into the machine you are already on.
3. Determine where the app actually runs. A server started through SSH runs on the SSH target; a container or VM may require a published port on its host.
4. Determine how the main device reaches that host. Consult fleet and, when needed, the main device's `~/.ssh/config` or `ssh -G <alias>` for its resolved address. An SSH alias is not necessarily a browser-resolvable hostname. Do not copy private keys or credentials.

`localhost` always means the device opening the URL. A URL that works in the agent's environment or browser is not automatically reachable from the user's main device.

## Run the right server

- Read the project's instructions and scripts for its dev command, bind options, and required services.
- Inspect existing listeners and processes before choosing a port. Reuse a healthy server only after confirming that it serves the intended checkout. Preserve the user's existing dev server.
- For a worktree, start a separate dev server from that worktree on an available port. Do not reuse a server serving another checkout.
- On the main device, a loopback listener and `http://localhost:<port>` are appropriate.
- On another machine, bind to an interface reachable from the main device, commonly `0.0.0.0`, using the framework's supported option. Give the user the host's reachable address, never `0.0.0.0` or `::` as a destination.
- Use an existing private-network route or project preview proxy when available. If direct access is unavailable, use an SSH local forward from the main device to the server. A loopback-only server can stay loopback-only behind that tunnel.
- Keep the process running using the environment's supported background execution. Capture enough logs to diagnose startup failures.
- Read the actual listening port from startup output or socket inspection; a framework may choose a different port when its default is occupied.
- Ensure browser-facing API, asset, and WebSocket URLs also work from the main device. A page that loads but calls a remote machine's `localhost` is not a working preview.

## Verify and return the URL

1. Wait for readiness and request the app on the actual port. Inspect startup logs if it fails.
2. When the server is remote, verify the intended URL from the main device if accessible through available tools or SSH. A request made on the server proves only server-side availability. Do not claim main-device reachability unless checked from there.
3. If the address is unknown or access fails, diagnose the route, bind address, port publishing, and any existing proxy or tunnel. Ask for missing network details rather than inventing a hostname or claiming success.
4. Return a clickable URL, the machine running the server, and any action the user must take. If main-device reachability could not be tested, say so briefly.

For a tunnel, choose a free local port on the main device. Run the forward there if possible; otherwise provide the exact command for the user to run there, for example `ssh -N -L <local-port>:127.0.0.1:<server-port> <server-alias>`, followed by `http://localhost:<local-port>`. State clearly when the URL requires that tunnel first.

## Examples

- Server on the main device, port 5173: **Preview:** `http://localhost:5173` — running on the main device.
- Server on another development machine: **Preview:** `http://<address-reachable-from-main-device>:5174` — running on that machine, using the verified port for this checkout.

Resolve addresses and machine roles afresh from fleet and the environment; these examples are not a machine inventory.
