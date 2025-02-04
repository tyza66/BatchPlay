@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

rem 设置前缀
set "prefix=前缀_"

rem 获取当前批处理脚本的文件名
set "script_name=%~nx0"

rem 遍历当前文件夹中的所有文件
for %%f in (*) do (
    rem 跳过脚本文件本身
    if "%%f" neq "%script_name%" (
        rem 重命名文件，加上前缀
        ren "%%f" "%prefix%%%f"
    )
)

endlocal
