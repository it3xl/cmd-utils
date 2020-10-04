@ECHO OFF

CHCP

FOR /F "tokens=2 delims=:." %%x IN ('CHCP') DO SET current_CHCP=%%x
CHCP 850>NUL

CHCP
ECHO Do something while the initial codepage is changed.

CHCP %current_CHCP%>NUL
CHCP
ECHO Now the codepage is switched back.

