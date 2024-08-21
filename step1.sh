#!/bin/bash
# 創建 Kibana 用戶
echo "創建 Kibana 用戶..."
sudo useradd -m -p kibana kibana
KIBANA_VERSION=8.15.0
# 解壓 Kibana
echo "解壓 Kibana..."
mv /tmp/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz /home/kibana
cd /home/kibana
tar -xzf kibana-8.15.0-linux-x86_64.tar.gz
chown -R kibana:kibana kibana-8.15.0
cd kibana-8.15.0

#備份kibanasearch 設定檔

echo "備份kibanasearch 設定檔"
mv /home/kibana/kibana-$KIBANA_VERSION/config/kibana.yml /home/kibana/kibana-$KIBANA_VERSION/config/kibana.yml.bak


# 配置防火牆
echo "配置防火牆..."
firewall-cmd --zone=public --permanent --add-port=5601/tcp
firewall-cmd --reload



