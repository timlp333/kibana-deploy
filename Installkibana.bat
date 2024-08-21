@echo off
chcp 65001
setlocal enabledelayedexpansion


:: 設定變量
SET BATROOT=%~dp0
set HOSTFILE=hosts.txt
set USERNAME=root
set PASSWORD=Pa$$w0rd
set VERSION=8.15.0
set COUNTER=1
:: 循環遍歷每個主機，逐一執行操作
for /f %%i in (%HOSTFILE%) do (
    echo Processing %%i


    :: 上傳 kibana-linux-x86_64.tar.gz 到 /tmp
    echo Uploading kibana to %%i: /tmp
    pscp.exe -pw %PASSWORD% kibana-%VERSION%-linux-x86_64.tar.gz %USERNAME%@%%i:/tmp

    :: 上傳 step1.sh 到 /tmp
    echo Uploading step1.sh to %%i: /tmp
    pscp.exe -pw %PASSWORD% step1.sh %USERNAME%@%%i:/tmp

    :: 執行 step1.sh
    echo Executing step1.sh on %%i
    plink.exe -batch -ssh -pw %PASSWORD% %USERNAME%@%%i "bash /tmp/step1.sh"


    :: 上傳  kibana.yml 到 /home/kibana
    echo Uploading kibana.yml to %%i: /home/kibana/kibana-%VERSION%/config
    pscp.exe -pw %PASSWORD% %BATROOT%/kibana.yml %USERNAME%@%%i:/home/kibana/kibana-%VERSION%/config
    
    :: 上傳  certs 到 /home/kibana
    echo Uploading kibana.yml to %%i: /home/kibana/kibana-%VERSION%/config
    pscp.exe -pw %PASSWORD% %BATROOT%/certs.tar.gz %USERNAME%@%%i:/home/kibana/kibana-%VERSION%/config



    :: 上傳 step2.sh 到 /tmp
    echo Uploading step2.sh to %%i: /tmp
    pscp.exe -pw %PASSWORD% step2.sh %USERNAME%@%%i:/tmp

    :: 執行 step2.sh
    echo Executingstep2.sh on %%i
    plink.exe -batch -ssh -pw %PASSWORD% %USERNAME%@%%i "bash /tmp/step2.sh !COUNTER!"



    :: 上傳 kibana.service 到 /etc/systemd/system
    echo Uploading kibana.service to %%i: /etc/systemd/system
    pscp.exe -pw %PASSWORD% %BATROOT%/kibana.service %USERNAME%@%%i:/etc/systemd/system

   
    :: 上傳 step3.sh 到 /tmp
    echo Uploading step3.sh to %%i: /tmp
    pscp.exe -pw %PASSWORD% step3.sh %USERNAME%@%%i:/tmp

    :: 執行 step3.sh
    echo Executingstep3.sh on %%i
    plink.exe -batch -ssh -pw %PASSWORD% %USERNAME%@%%i "bash /tmp/step3.sh"

    set /A COUNTER=COUNTER+1

    echo Processing %%i completed
)

echo 所有主機命令執行完畢。
pause
