# CVE-2025-55182 - React Server Components RCE Exploit

Nuclei template for CVE-2025-55182, a critical RCE vulnerability in React Server Components via `react-server-dom-webpack or react-server-dom-parcel or react-server-dom-turbopack`.
This is very specific vulnerability and now I see benefits only from checker based on nuclei templates aimed to find vulnerable versions.

**Behaviour:** You will be a super lucky dude if you were able to find this vulnerability in the wild. First of all you need to find vulnerable react-server-dom-webpack component, then you need to find a POST route with ```multipart/form-data``` and then - vulnerable gadget, which could be easily disabled :) Good luck!

## Quick Start

## Checker with nuclei (by package.json version)

```bash
# Custom route:
https://github.com/ejpir/CVE-2025-55182-poc/blob/main/src/server.js

'/formaction' - is the custom route for the POST request (multipart/form-data).
This route should be replaced in real-life scenario testing.
Possible routes:

'/api/actions'
'/api/server-actions'
'/api/v1/login'
'etc..'

# Check vulnerability by package.json analysis (if package.json is accessible):
nuclei -t ~/cve-2025-55182-versions.yaml -u http://localhost:3005

                     __     _
   ____  __  _______/ /__  (_)
  / __ \/ / / / ___/ / _ \/ /
 / / / / /_/ / /__/ /  __/ /
/_/ /_/\__,_/\___/_/\___/_/   v3.4.10

		projectdiscovery.io

[INF] Current nuclei version: v3.4.10 (outdated)
[INF] Current nuclei-templates version: v10.3.4 (latest)
[INF] New templates added in latest release: 0
[INF] Templates loaded for current scan: 1
[WRN] Loading 1 unsigned templates for scan. Use with caution.
[INF] Targets loaded for current scan: 1
[CVE-2025-55182-versions] [http] [critical] http://localhost:3005/package.json
[CVE-2025-55182-versions] [http] [critical] http://localhost:3005/package-lock.json
[CVE-2025-55182-versions] [http] [critical] http://localhost:3005/node_modules/react-server-dom-webpack/package.json
[CVE-2025-55182-versions] [http] [critical] http://localhost:3005/react-server-dom-webpack/package.json
[INF] Scan completed in 81.999998ms. 4 matches found.
```

## Affected Versions

- `react-server-dom-webpack or react-server-dom-parcel or react-server-dom-turbopack`:
19.0.0, 19.1.0, 19.1.1, 19.2.0
- `Next.js`: 15.x, 16.x (App Router)

## Disclaimer

**FOR EDUCATIONAL AND AUTHORIZED TESTING PURPOSES ONLY**
