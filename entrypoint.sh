#!/bin/bash
cd /home/container

# Fetch System Info
ISP=$(curl -s http://ip-api.com/line?fields=isp || echo "Unknown ISP")
IPV4=$(curl -s http://ip-api.com/line?fields=query || echo "Unknown IP")
COUNTRY=$(curl -s http://ip-api.com/line?fields=country || echo "Unknown Country")
OS_KERN="$(uname -s)"
UPTIME=$(uptime -p | sed 's/up //')
NODE_VER=$(node -v || echo "Not Installed")
PYTHON_VER=$(python3 --version | awk '{print $2}' || echo "Not Installed")
BUN_VER=$(bun --version 2>/dev/null || echo "Not Installed")
CPU_CORES=$(nproc)
ARCH=$(uname -m)

echo -e "\e[1;31m"
echo -e "  __  ___  ____  ___  ____ ____ _  _  __  ___ "
echo -e " /  \|   \(_  / | _ \| __// ___| || |/  \| _ \\"
echo -e "| () | |  )/ /  |   /| _| \___ \ __ | () |  _/"
echo -e " \__/|___/____| |_|_\|___|____/||_|| \__/|_|  "
echo -e "                  \e[1;31mC L I E N T\e[0m"
echo -e "             \e[1;37mPowered By ODZRESHOP © 2024\e[0m"
echo -e "       \e[36m[ SYSTEM INFO ]\e[0m \e[34m-----------------------\e[0m"
echo -e "\e[90m╰─\e[0m \e[37mISP\e[0m      : \e[34m$ISP\e[0m"
echo -e "\e[90m╰─\e[0m \e[37mIPv4\e[0m     : \e[34m$IPV4\e[0m"
echo -e "\e[90m╰─\e[0m \e[37mCountry\e[0m  : \e[31m$COUNTRY\e[0m"
echo -e "\e[90m╰─\e[0m \e[37mOS/Kern\e[0m  : \e[34m$OS_KERN\e[0m"
echo -e "\e[90m╰─\e[0m \e[37mUptime\e[0m   : \e[31m$UPTIME\e[0m"
echo -e "\e[34m----------------------------------------------\e[0m"
echo -e "\e[90m╰─\e[0m \e[37mNodeJS\e[0m   : \e[33m$NODE_VER\e[0m"
echo -e "      \e[36m[ SERVER USAGE ]\e[0m \e[34m-----------------------\e[0m"
echo -e "\e[90m╰─\e[0m \e[37mCPU Cores\e[0m: \e[37m$CPU_CORES Core(s) [$ARCH]\e[0m"
echo -e "\e[34m----------------------------------------------\e[0m"
echo -e " \e[36mINSTALLED:\e[0m \e[37mCHROMIUM, YT-DLP, FFMPEG\e[0m"
echo -e "\e[34m----------------------------------------------\e[0m"
echo -e "\e[32mjalankan perintah startup...\e[0m"

# Replace Startup Variables
MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo -e "\e[90m:\/home\/container$ \e[37m${MODIFIED_STARTUP}\e[0m"

# Run the Server
eval ${MODIFIED_STARTUP}
