
FOR /F "delims=" %%i IN ('cygpath -u -p "%cd%"') DO set "PWD=%%i"

bash -c "configure --host=i686-w64-mingw32 --prefix=%CYGWIN_PREFIX%/Library CC='%PWD%/build-aux/compile cl -nologo' CFLAGS='-MD' LD='link' NM='dumpbin -symbols' STRIP=':' AR='%PWD%/build-aux/ar-lib lib' RANLIB=':'"
if errorlevel 1 exit 1

make
if errorlevel 1 exit 1
make check
if errorlevel 1 exit 1
make install
exit 1
if errorlevel 1 exit 1
