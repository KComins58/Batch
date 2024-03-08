    @echo off

    set pwd=01000000d08c9ddf0115d1118c7a00c04fc297eb01000000b75029abba5e0348b6689080f1aa6da30000000002000000000003660000c000000010000000ac34d1619ec1336ab002cd000ecd8bf20000000004800000a0000000100000004c84efefa5df87b98683fffa25bcc01718000000f272659789076b5abc469c560456b1c39914c5dce13ea0301400000039fa7f55e65c676784765199c20092f2f9d44223

    for /f "delims=" %%a in ('powershell -Command "(Get-LocalUser -Name 'admin').Password | ConvertFrom-SecureString"') do set storedPwd=%%a

    if "%storedPwd%" neq "" (
        echo Previously set password: %storedPwd%
    )

    powershell -Command " = Get-LocalUser -Name 'CompanyAdmin';  | Set-LocalUser -Password (ConvertTo-SecureString -String '%pwd%')"
