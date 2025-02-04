@echo off
setlocal enabledelayedexpansion

rem 获取当前批处理脚本的文件名
set "script_name=%~nx0"

rem 遍历当前文件夹中的所有文件
for %%f in (*) do (
    rem 跳过脚本文件本身
    if "%%f" neq "%script_name%" (
        rem 获取文件的扩展名
        set "ext=%%~xf"
        set "ext=!ext:~1!"

        rem 创建对应扩展名的文件夹（如果不存在）
        if not exist "!ext!" (
            mkdir "!ext!"
        )

        rem 移动文件到对应文件夹
        move "%%f" "!ext!"
    )
)

endlocal
