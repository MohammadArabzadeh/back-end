# Django backend for Securise-front-end

- using safety for scaning python packages used in requirement.txt

## post request :
```yml
    url : http://127.0.0.1:8009/safety-check/
    content-type : application/json

```

```json
{
  "requirements": "insecure-package==0.1.0"
}
```

response :
```ruby
+==============================================================================+
                               /$$$$$$            /$$
                              /$$__  $$          | $$
           /$$$$$$$  /$$$$$$ | $$  \__//$$$$$$  /$$$$$$   /$$   /$$
          /$$_____/ |____  $$| $$$$   /$$__  $$|_  $$_/  | $$  | $$
         |  $$$$$$   /$$$$$$$| $$_/  | $$$$$$$$  | $$    | $$  | $$
          \____  $$ /$$__  $$| $$    | $$_____/  | $$ /$$| $$  | $$
          /$$$$$$$/|  $$$$$$$| $$    |  $$$$$$$  |  $$$$/|  $$$$$$$
         |_______/  \_______/|__/     \_______/   \___/   \____  $$
                                                          /$$  | $$
                                                         |  $$$$$$/
  by pyup.io                                              \______/

+==============================================================================+

REPORT

  Safety is using PyUp's free open-source vulnerability database. This
  data is 30 days old and limited.
  For real-time enhanced vulnerability data, fix recommendations, severity
  reporting, cybersecurity support, team and project policy management, and more,
  sign up at https://pyup.io or email sales@pyup.io

  Safety v2.3.5 is scanning for Vulnerabilities...

  Scanning dependencies in your files:

  -> ./requirements.txt

  Using non-commercial database
  Found and scanned 1 package
  Timestamp 2023-07-18 19:51:58
  1 vulnerability found
  0 vulnerabilities ignored

+==============================================================================+
 VULNERABILITIES FOUND
+==============================================================================+

-> Vulnerability found in insecure-package version 0.1.0
   Vulnerability ID: 58758
   Affected spec: <0.2.0
   ADVISORY: Insecure-package 0.2.0 test vuln.
   PVE-2021-25853
   For more information, please visit https://pyup.io/v/58758/f17

 Scan was completed. 1 vulnerability was found. 

+==============================================================================+
   REMEDIATIONS

  1 vulnerability was found in 1 package. For detailed remediation & fix 
  recommendations, upgrade to a commercial license. 

+==============================================================================+

  Safety is using PyUp's free open-source vulnerability database. This
  data is 30 days old and limited.
  For real-time enhanced vulnerability data, fix recommendations, severity
  reporting, cybersecurity support, team and project policy management, and more,
  sign up at https://pyup.io or email sales@pyup.io

+==============================================================================+

```