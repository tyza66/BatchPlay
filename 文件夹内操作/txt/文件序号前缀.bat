@echo off
setlocal enabledelayedexpansion

rem 初始化计数器
set count=0

rem 获取当前批处理脚本的文件名
set "script_name=%~nx0"

rem 将文件名存入数组，跳过脚本文件本身
set i=0
for %%f in (*) do (
    if "%%f" neq "%script_name%" (
        set "files[!i!]=%%f"
        set /a i+=1
    )
)

rem 对数组按字母顺序进行排序（区分大小写）
for /L %%i in (0,1,!i!-1) do (
    for /L %%j in (%%i,1,!i!-1) do (
        if "!!files[%%i]!!" gtr "!!files[%%j]!!" (
            set "temp=!files[%%i]!"
            set "files[%%i]=!files[%%j]!"
            set "files[%%j]=!temp!"
        )
    )
)

rem 给文件添加排序前缀，跳过脚本文件本身，并从01开始
for /L %%k in (0,1,!i!-1) do (
    set "file=!files[%%k]!"
    set "prefix=!count!"
    if !count! LSS 10 (
        set "prefix=0!count!"
    )
    ren "!file!" "!prefix!_!file!"
    set /a count+=1
)

endlocal
