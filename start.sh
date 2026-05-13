#!/bin/bash

echo "启动飞书TODO应用服务器..."
echo "======================================"
echo "应用包含以下功能："
echo "1. TODO列表管理（添加/完成/删除）"
echo "2. 语音录入功能（中文语音转文字）"
echo "3. 番茄时钟（25分钟工作+5分钟休息）"
echo "4. 简洁界面，适配飞书嵌入"
echo "======================================"
echo ""
echo "选择启动方式："
echo "1. Python HTTP服务器（默认端口8080）"
echo "2. Node.js服务器（需要安装serve）"
echo "3. 仅显示访问信息"
read -p "请输入选择 (1/2/3): " choice

case $choice in
    1)
        echo "启动Python服务器..."
        python3 -m http.server 8080
        ;;
    2)
        if command -v npx &> /dev/null; then
            echo "启动Node.js服务器..."
            npx serve -s . -l 3000
        else
            echo "错误：npx未安装，请先安装Node.js"
            echo "使用Python服务器替代..."
            python3 -m http.server 8080
        fi
        ;;
    3)
        echo ""
        echo "访问信息："
        echo "本地访问: file://$(pwd)/index.html"
        echo "如需服务器访问，请选择选项1或2启动服务器"
        echo ""
        echo "嵌入飞书代码："
        echo '<iframe src="YOUR_SERVER_URL" width="100%" height="600px" frameborder="0" allow="microphone" title="TODO应用"></iframe>'
        ;;
    *)
        echo "无效选择，使用Python服务器..."
        python3 -m http.server 8080
        ;;
esac