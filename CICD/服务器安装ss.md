https://brickyang.github.io/2017/01/14/CentOS-7-%E5%AE%89%E8%A3%85-Shadowsocks-%E5%AE%A2%E6%88%B7%E7%AB%AF/



pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U


https://github.com/shadowsocksrr/shadowsocks-rss/wiki/libsodium



https://www.5yun.org/14197.html



守护进程启动

vim /etc/rc.d/rc.local
nohup sslocal -c ~/shadowsocks/shadowsocks.json &
privoxy --user privoxy /etc/privoxy/config




jx install --provider alibaba --default-admin-password=admin --default-environment-prefix=jx-rocks-china --tekton --docker-registry=registry.cn-beijing.aliyuncs.com --docker-registry-org=jx-rocks --cloud-environment-repo=https://github.com/carlossg/jenkins-x-cloud-environments-alibaba-china.git -b 