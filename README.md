# CVE-2025-55182 - React Server Components RCE Exploit

**Original research and PoC:** [msanft/CVE-2025-55182](https://github.com/msanft/CVE-2025-55182)

Nuclei template for CVE-2025-55182, a critical RCE vulnerability in React Server Components via prototype pollution in React Flight Protocol. PoC tested on Next.js 16.0.6 with React 19.2.0.

## Usage

```bash
nuclei -t cve-2025-55182.yaml -u http://target.com
```

**Test Results:**
```
[nextjs-server-actions-prototype-pollution] [http] [high] http://localhost:3000
[nextjs-server-actions-prototype-pollution] [http] [high] http://localhost:3000/
[INF] Scan completed in 31.125619ms. 2 matches found.
```

Version checker template based on accessible package.json (`cve-2025-55182-versions.yaml`) available in [sickwell/CVE-2025-55182](https://github.com/sickwell/CVE-2025-55182) repository.

## Affected Versions

* `react-server-dom-webpack` or `react-server-dom-parcel` or `react-server-dom-turbopack`: 19.0.0, 19.1.0, 19.1.1, 19.2.0
* `Next.js`: 15.x, 16.x (App Router)

## Disclaimer

**FOR EDUCATIONAL AND AUTHORIZED TESTING PURPOSES ONLY**
