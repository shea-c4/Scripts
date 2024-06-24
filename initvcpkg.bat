@echo off

cd C:\src\github\microsoft\vcpkg
call bootstrap-vcpkg.bat

set VCPKG_ROOT=C:\src\github\microsoft\vcpkg
echo INITVCPKG: updating path with %VCPKG_ROOT%
set PATH=%VCPKG_ROOT%;%PATH%

set vcpkg_cmakepath=C:\src\github\microsoft\vcpkg\downloads\tools\cmake-3.27.1-windows\cmake-3.27.1-windows-i386\bin
echo INITVCPKG: updating path with %vcpkg_cmakepath%
set PATH=%vcpkg_cmakepath%;%PATH%

