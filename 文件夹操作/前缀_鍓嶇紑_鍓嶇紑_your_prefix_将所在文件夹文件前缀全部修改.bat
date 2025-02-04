@echo off
setlocal enabledelayedexpansion
rem 设置前缀
set "prefix=your_prefix_"
rem 遍历所有文件
for %%f in (*) do (
  rem 检查是否已经有前缀，避免重复添加
  if not "%%~nxf"=="%prefix%%%~nxf" (
    rem 重命名文件
    ren "%%f" "%prefix%%%f"
  )
)
endlocal
echo 文件重命名完成！
pause