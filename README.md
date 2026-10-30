# 工程监测计算平台 · Windows 下载包

这是独立的程序下载分支，不包含主分支网站的修改。

## 下载与启动

1. 点击本页面绿色 **Code** 按钮，选择 **Download ZIP**。
2. 将下载的 ZIP **完整解压**到本机可写文件夹，不要在压缩包内部运行。
3. 双击 **START-MonitoringDesk.cmd**。它会合并程序分卷、核对 SHA-256，然后打开程序。
4. 此后可直接双击生成的 **MonitoringDesk.exe**。

程序无需安装 Python、Excel 或 LibreOffice。首次启动需展开内置运行库，请稍候。

仓库存储有单文件大小限制，因此使用了五个程序分卷。不要单独打开 `.part01` 等分卷，也不要只下载启动脚本。

`examples` 提供九类仪器的合成演示表；`plugins/_example.py` 为默认不加载的扩展示例。修改计算原理前应进行工程结果比对。真实工程模板及 Excel 高级对象仍需专项验收。

程序：MonitoringDesk 1.0.0，Windows 10/11 x64。

原始 exe SHA-256：`b1a79aabbe992d9e0516f52aca6245070c408f229d4b66683a75aeebc586aa8d`。
