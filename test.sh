# !/bin/bash
echo "1、请输入需要监测的域名，多个域名，请用空格隔开。"
read -p "域名：" domains  #提示用户输入数字
# if [ -z $domains ];then             #判断用户是否输入，如果未输入则打印error
#   echo "Error"
#   exit
arr=(${domains})
for i in ${arr[@]}
do
    echo $i
done
echo -e "\n"
echo "2、开始访问网站，读取所需信息。"
cd check-ssl
chmod +x ./checker.sh
source ./checker.sh "${domains}"
# echo "3、处理信息中..."
# 复制 ct.json
cp -rf ./output/ct.json ../public/ct.json
cd ..
cp -rf ./src/index.html ./public/index.html
echo -e "\n"
echo "4、读取成功，脚本执行完毕！"
# echo "ssl.seeyue.top" > ./public/CNAME