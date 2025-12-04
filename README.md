# CVE-2025-55182 - React Server Components RCE (PoC - RCE not working)

**Original research and PoC:** [msanft/CVE-2025-55182](https://github.com/msanft/CVE-2025-55182)

Nuclei template for CVE-2025-55182, a critical RCE vulnerability in React Server Components via prototype pollution in React Flight Protocol. PoC tested on Next.js 16.0.6 with React 19.2.0.

**Brief overview:**
- The vulnerability allows accessing the `Function` constructor through prototype pollution (`__proto__:constructor:constructor`)
- When the deserialized object is `await`ed by Next.js, it calls the `.then()` method
- However, `.then()` is invoked with V8's internal `resolve` and `reject` functions, which are not attacker-controlled
- These internal functions serialize to `function () { [native code] }` when stringified, causing a `SyntaxError: Unexpected token 'function'`

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
RCE require additional reseach and specific gadgets. 

**Brief overview:**
- The vulnerability allows accessing the `Function` constructor through prototype pollution (`__proto__:constructor:constructor`)
- When the deserialized object is `await`ed by Next.js, it calls the `.then()` method
- However, `.then()` is invoked with V8's internal `resolve` and `reject` functions, which are not attacker-controlled
- These internal functions serialize to `function () { [native code] }` when stringified, causing a `SyntaxError: Unexpected token 'function'`

## Affected Versions

* `react-server-dom-webpack` or `react-server-dom-parcel` or `react-server-dom-turbopack`: 19.0.0, 19.1.0, 19.1.1, 19.2.0
* `Next.js`: 15.x, 16.x (App Router)

## Disclaimer

**FOR EDUCATIONAL AND AUTHORIZED TESTING PURPOSES ONLY**
