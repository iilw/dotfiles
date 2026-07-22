# ==============================================================
# ~/.config/zsh/proxy.zsh
# 终端默认代理模块 (默认全开 + 防火墙保护 + 快捷开关)
# ==============================================================

# 1. 设定代理端口 (根据你的代理软件修改，如 Clash: 7890, Surge: 6152)
export TERMINAL_PROXY_PORT="7890"

# 2. 核心代理开启与关闭函数
proxy_on() {
    export http_proxy="http://127.0.0.1:${TERMINAL_PROXY_PORT}"
    export https_proxy="http://127.0.0.1:${TERMINAL_PROXY_PORT}"
    export all_proxy="socks5://127.0.0.1:${TERMINAL_PROXY_PORT}"
    
    # 关键防撞网：防止本地开发服务 (localhost/Vite/Docker等) 走代理报错
    export no_proxy="localhost,127.0.0.1,::1,local,*.local,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12"
    export NO_PROXY="$no_proxy"
}

proxy_off() {
    unset http_proxy https_proxy all_proxy no_proxy NO_PROXY
    echo "🔴 终端代理已临时关闭"
}

proxy_test() {
    echo "正在测试网络连通性..."
    curl -I -m 5 https://www.google.com
}

# 3. 默认全局开启 (在 Shell 交互启动时自动调用一次)
proxy_on

# 4. 快捷别名
alias proxy="proxy_on"
alias proxyoff="proxy_off"
alias proxytest="proxy_test"
