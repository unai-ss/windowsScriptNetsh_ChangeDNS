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
