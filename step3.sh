
# 啟動並啟用 Kibana 服務
echo "啟動並啟用 Kibana 服務..."
sudo systemctl daemon-reload
sudo systemctl enable kibana.service
sudo systemctl start kibana.service

