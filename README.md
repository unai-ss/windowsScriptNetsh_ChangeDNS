# Change DNS after use VPN Client

Normally VPN Clients like Forticlient or OpenVPN would add the remote network DNS.
Maybe this should make some local error because of a DNS misconfiguration.
The following script delete the remote DNS, in order to force local network DNS.

```
@echo off

:: DNS
set DNS1=A.B.C.D


for /f "tokens=1,2,3*" %%i in ('netsh int show interface') do (
    if %%j equ Conectado (
        echo Changing "%%l" : %DNS1% 
        netsh int ipv4 set dns name="%%l" static %DNS1% primary validate=no
    )
)

ipconfig /flushdns
pause
:EOF
```

Please be awere with the following
* This script works on Windows 10
* Change the DNS A.B.C.D
* Be aware i18n: Windows spanish Conectado, in english Connected
