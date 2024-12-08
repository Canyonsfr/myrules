{
  "log": {
    "disabled": false,
    "level": "info",
    "timestamp": true
  },
  
  "experimental": {
    "clash_api": {
      "external_controller": "0.0.0.0:9095",
      "external_ui": "/etc/sing-box/ui",
      "secret": "",
      "external_ui_download_url": "https://ghp.ci/https://github.com/MetaCubeX/metacubexd/archive/refs/heads/gh-pages.zip",
      "external_ui_download_detour": "🎯 全球直连",
      "default_mode": "rule"
    },
  "cache_file": {
    "enabled": true,
    "path": "/etc/sing-box/cache.db",
    "store_fakeip": false
    }
  },
  
  "dns": {
    "servers": [
      {"tag": "proxyDns", "address": "https://dns.google/dns-query", "address_resolver": "defaultDns", "address_strategy": "ipv4_only", "detour": "🚀 节点选择"},
      {"tag": "localDns", "address": "223.5.5.5", "address_resolver": "defaultDns", "address_strategy": "ipv4_only", "detour": "🎯 全球直连"},
      {"tag": "defaultDns", "address": "223.5.5.5", "address_strategy": "ipv4_only", "detour": "🎯 全球直连"}
    ],
    "rules": [
      { "outbound": "any", "server": "defaultDns", "disable_cache": true },
      { "clash_mode": "direct", "server": "localDns" },
      { "clash_mode": "global", "server": "proxyDns" },
      { "rule_set": "geosite-cn", "server": "localDns" },
      { "rule_set": "geosite-geolocation-!cn", "server": "proxyDns" }
    ],
    "final": "localDns",
    "strategy": "ipv4_only"
  },

    "inbounds": [
    {
      "type": "tun",
      "address": "172.19.0.1/30",
      "mtu": 9000,
      "auto_route": true,
      "sniff": true,
      "stack": "system",
      "platform": {
        "http_proxy": {
          "enabled": true,
          "server": "127.0.0.1",
          "server_port": 2080
        }
      }
    },
    {
      "type": "mixed",
      "listen": "127.0.0.1",
      "listen_port": 2080,
      "sniff": true,
      "users": []
    }
  ],

  "outbounds": [
    { "tag": "🚀 节点选择", "type": "selector", "outbounds": ["🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换", "♻️ 自动选择", "🎯 全球直连"] },
    { "tag": "📹 YouTube", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "🤖 OpenAI", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "🍀 Google", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "👨‍💻 Github", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "🪟 Microsoft", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🎯 全球直连"] },
    { "tag": "🐬 OneDrive", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "🎵 TikTok", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "🎥 Netflix", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "📲 Telegram", "type": "selector", "outbounds": ["🚀 节点选择", "♻️ 自动选择", "🔯 香港自动", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点", "🐸 手动切换"] },
    { "tag": "🍏 Apple", "type": "selector", "outbounds": ["🎯 全球直连", "🇭🇰 香港节点", "🇯🇵 日本节点", "🇺🇲 美国节点"] },
    { "tag": "🐠 漏网之鱼", "type": "selector", "outbounds": ["🚀 节点选择","🎯 全球直连"] },
    { "tag": "🐸 手动切换", "type": "selector", "outbounds": ["{all}"]},
    { "tag": "🇸🇬 新加坡节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["新加坡|singapore|sg|狮城|滨海湾|sentosa"] }] },
    { "tag": "🇯🇵 日本节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["日本|japan|jp|东京|tokyo|大阪|osaka|京都|kyoto"] }] },
    { "tag": "🇰🇷 韩国节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["韩国|korea|kr|首尔|seoul|釜山|busan|济州岛|jeju"] }] },
    { "tag": "🇹🇼 台湾节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["台湾|taiwan|tw|台北|taipei|高雄|kaohsiung|台中|taichung"] }] },
    { "tag": "🇺🇸 美国节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["美国|united states|us|洛杉矶|los angeles|纽约|new york|芝加哥|chicago|旧金山|san francisco"] }] },
    { "tag": "🇭🇰 香港节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["香港|hong kong|hk|中环|central|尖沙咀|tssim sha tsui"] }] },
    { "tag": "🇹🇭 泰国节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["泰国|thailand|th|曼谷|bangkok|清迈|chiang mai|普吉岛|phuket"] }] },
    { "tag": "🇨🇦 加拿大节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["加拿大|canada|ca|多伦多|toronto|温哥华|vancouver|蒙特利尔|montreal"] }] },
    { "tag": "🇬🇧 英国节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["英国|united kingdom|gb|伦敦|london|曼彻斯特|manchester|爱丁堡|edinburgh"] }] },
    { "tag": "🇹🇷 土耳其节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["土耳其|turkey|tr|伊斯坦布尔|istanbul|安卡拉|ankara"] }] },
    { "tag": "🇮🇳 印度节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["印度|india|in|新德里|new delhi|孟买|mumbai|班加罗尔|bangalore"] }] },
    { "tag": "🇳🇱 荷兰节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["荷兰|netherlands|nl|阿姆斯特丹|amsterdam|鹿特丹|rotterdam"] }] },
    { "tag": "🇫🇷 法国节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["法国|france|fr|巴黎|paris|里昂|lyon|尼斯|nice"] }] },
    { "tag": "🇩🇪 德国节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["德国|germany|de|柏林|berlin|慕尼黑|munich|法兰克福|frankfurt"] }] },
    { "tag": "🇻🇳 越南节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["越南|vietnam|vn|胡志明市|ho chi minh city|河内|hanoi|岘港|da nang"] }] },
    { "tag": "🇲🇾 马来西亚节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["马来西亚|malaysia|my|吉隆坡|kuala lumpur|槟城|penang|沙巴|sabah"] }] },
    { "tag": "🇸🇦 沙特节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["沙特|saudi arabia|sa|利雅得|riyadh|吉达|jeddah|麦加|mecca"] }] },
    { "tag": "🇧🇷 巴西节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["巴西|brazil|br|圣保罗|sao paulo|里约热内卢|rio de janeiro"] }] },
    { "tag": "🇦🇪 迪拜节点", "type": "selector", "outbounds": ["    {all}"], "filter": [    { "action": "include", "keywords": ["迪拜|dubai|ae|阿联酋|united arab emirates|阿布扎比|abu dhabi"] }] }
	{ "tag": "🔯 香港自動", "type": "urltest", "outbounds": ["{all}"], "filter": [{ "action": "include", "keywords": ["🇭🇰|HK|hk|香港|港|HongKong"] }], "url": "http://www.gstatic.com/generate_204", "interval": "10m", "tolerance": 50 },
    { "tag": "🔯 日本自動", "type": "urltest", "outbounds": ["{all}"], "filter": [{ "action": "include", "keywords": ["🇯🇵|JP|jp|日本|日|Japan"] }], "url": "http://www.gstatic.com/generate_204", "interval": "10m", "tolerance": 50 },
    { "tag": "🔯 新加坡自動", "type": "urltest", "outbounds": ["{all}"], "filter": [{ "action": "include", "keywords": ["🇸🇬|SG|sg|新加坡|新|Singapore"] }], "url": "http://www.gstatic.com/generate_204", "interval": "10m", "tolerance": 50 },
    { "tag": "🔯 韓國自動", "type": "urltest", "outbounds": ["{all}"], "filter": [{ "action": "include", "keywords": ["🇰🇷|KR|kr|韓國|韓|Korea"] }], "url": "http://www.gstatic.com/generate_204", "interval": "10m", "tolerance": 50 },
    { "tag": "♻️ 自动选择", "type": "urltest", "outbounds": ["{all}"], "filter": [{ "action": "exclude", "keywords": ["网站|地址|剩余|过期|时间|有效"] }], "url": "http://www.gstatic.com/generate_204", "interval": "10m", "tolerance": 50 },
    { "tag": "GLOBAL", "type": "selector", "outbounds": ["{all}"]},
    { "tag": "🎯 全球直连", "type": "direct" },
    { "tag": "dns-out", "type": "dns" }
  ],
  
  "route": {
        "auto_detect_interface": true,
        "final": "🐠 漏网之鱼",
    "rules": [
      { "type": "logical", "mode": "or", "rules": [{ "port": 53 }, { "protocol": "dns" }], "outbound": "dns-out" },
      { "clash_mode": "direct", "outbound": "🎯 全球直连" },
      { "clash_mode": "global", "outbound": "GLOBAL" },
      { "domain": ["clash.razord.top", "yacd.metacubex.one", "yacd.haishan.me", "d.metacubex.one"], "outbound": "🎯 全球直连" },
      { "rule_set": ["geosite-private", "geoip-private"], "outbound": "🎯 全球直连" },
      { "rule_set": "geosite-chat", "outbound": "🤖 OpenAI" },
      { "rule_set": "geosite-github", "outbound": "👨‍💻 Github" },
      { "rule_set": "geosite-youtube", "outbound": "📹 YouTube" },
      { "rule_set": "geosite-onedrive", "outbound": "🐬 OneDrive" }, 
      { "rule_set": "geosite-microsoft", "outbound": "🪟 Microsoft" }, 
      { "rule_set": ["geoip-google", "geosite-google"], "outbound": "🍀 Google" },
      { "rule_set": "geosite-tiktok", "outbound": "🎵 TikTok" },
      { "rule_set": ["geoip-apple", "geosite-apple"], "outbound": "🍏 Apple" },
      { "rule_set": ["geoip-netflix", "geosite-netflix"], "outbound": "🎥 Netflix" },
      { "rule_set": ["geoip-telegram", "geosite-telegram"], "outbound": "📲 Telegram" },
      { "rule_set": "geosite-geolocation-!cn", "outbound": "🚀 节点选择" },
      { "rule_set": ["geoip-cn", "geosite-cn"], "outbound": "🎯 全球直连" }
    ],
    
    "rule_set": [
      { "tag": "geosite-chat", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/category-ai-chat-!cn.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-youtube", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/youtube.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-google", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/google.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-github", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/github.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-telegram", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/telegram.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-tiktok", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/tiktok.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-netflix", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/netflix.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-apple", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/apple.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-microsoft", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/microsoft.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-onedrive", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/onedrive.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-geolocation-!cn", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/geolocation-!cn.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-cn", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/cn.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geosite-private", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/private.srs", "download_detour": "🎯 全球直连" },
            
      { "tag": "geoip-google", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/google.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geoip-telegram", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/telegram.srs", "download_detour": "🎯 全球直连" },     
      { "tag": "geoip-netflix", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/netflix.srs", "download_detour": "🎯 全球直连" },     
      { "tag": "geoip-apple", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo-lite/geoip/apple.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geoip-cn", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/cn.srs", "download_detour": "🎯 全球直连" },
      { "tag": "geoip-private", "type": "remote", "format": "binary", "url": "https://ghp.ci/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/private.srs", "download_detour": "🎯 全球直连" }
    ]
  }
}