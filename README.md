# 钢筋数据助手 · 独立版

Windows 10/11 桌面程序，无需安装 Python、Microsoft Excel 或 WPS。
使用系统自带的 .NET Framework 4.7.2 或更高版本。安装及文件处理均可离线运行。

## 下载

- [下载安装程序 SteelExcelAssistant-Setup.exe](https://github.com/luoqiu132/luoqiu/raw/refs/heads/steel-excel-standalone/SteelExcelAssistant-Setup.exe)
- [下载便携包 SteelExcelAssistant_Standalone_Portable.zip](https://github.com/luoqiu132/luoqiu/raw/refs/heads/steel-excel-standalone/SteelExcelAssistant_Standalone_Portable.zip)

安装程序约 8.6 MiB。双击后选择“安装并创建桌面快捷方式”。程序安装到当前用户的 LocalAppData 文件夹，无需管理员权限。
安装成功后会显示快捷方式的完整路径，并打开实际桌面文件夹、选中“钢筋数据助手（独立版）.lnk”。
便携包需要完整解压，保留 EXE 同目录的全部 DLL 和 .config 文件，再双击 SteelExcelAssistant.exe。

## 使用

1. 选择源数据 `.xls` 或 `.xlsx`，读取第一个工作表，第一行为表头。
2. 选择目标计算表模板，以及单独的输出文件。
3. 使用日历选择源数据日期，点击“开始处理”。
4. 查看进度条与逐测点日志，完成后打开输出文件夹。

源数据 B 列为测点，F/G/H/I 列分别为电阻、电阻比、温度、应力；每个测点取最后一条记录。
目标工作表名称与测点名称对应。从目标 A 列第 11 行开始优先匹配相同日期，否则使用首个空白日期行，再无空白则追加。
目标 B/C/D/E 列依次写入电阻比、电阻、温度、应力。新增日期使用标准 Excel 日期值。

输入文件只读；输出不可覆盖输入或模板。成功处理后才替换输出，覆盖已有输出前会确认。
内置 NPOI 引擎保留并重新计算支持的公式；遇到无法计算的公式会明确报错并保留已有输出。
不执行宏、不更新外部链接、不上传数据。暂不支持 `.xlsm`、`.xlsb`、加密文件及写保护模板。

## 验证范围

已在无 Office 的 Linux/Mono 环境通过 42 项检查：真实 `.xls/.xlsx` 读写、1900/1904 日期系统、测点去重及列映射、日期匹配与新增、公式保留和重算、格式与合并单元格、输入保护和失败回滚，以及日历、文件选择和进度日志界面。
安装程序的嵌入资源、22 个依赖 DLL 和界面已检查。Windows 安装及实际桌面快捷方式创建仍需在 Windows 上验收，首次使用请用实际模板副本核对结果。

便携包及安装后的 Source 目录包含源码、测试和 Windows 构建脚本；licenses、THIRD-PARTY-NOTICES.txt 和 third-party-source 包含第三方授权及对应 NSax 源码。
SHA256SUMS 提供两个下载文件的 SHA-256 校验值。

本分支仅用于独立程序分发，不修改主分支的网站。
