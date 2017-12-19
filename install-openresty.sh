#安装基本类库
yum install readline-devel pcre-devel openssl-devel gcc git -y

#创建目标文件夹
mkdir /opt/software
cd /opt/software

#安装openresty
wget https://openresty.org/download/openresty-1.13.6.1.tar.gz
tar -zxvf openresty-1.13.6.1.tar.gz
cd openresty-1.13.6.1
./configure
make
sudo make install

#安装redis-lua连接池
git clone https://github.com/javashop/resty-redis-cluster.git
cd resty-redis-cluster/lib
gcc redis_slot.c -fPIC -shared -o redis_slot.so
mv redis_slot.so /usr/local/openresty/lualib/
mv rediscluster.lua /usr/local/openresty/lualib/resty/
mkdir /usr/local/openresty/nginx/lua
mv redis_connector.lua /usr/local/openresty/nginx/lua/
