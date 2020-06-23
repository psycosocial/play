#!/bin/sh
ipwan=$(ifconfig | grep -A 2 'wlan0' | awk '/inet addr/{print substr($2,6)}')
mac=$(ifconfig | grep -A 1 'wlan0' | awk '/^[a-z]/ { mac=$NF; next } /inet addr:/ { print mac }')
echo Username anda $(uci get auto.setting.user)
echo Password anda $(uci get auto.setting.pass)

function login(){
    curl -s -X POST \
        --url 'https://welcome2.wifi.id/authnew/login/check_login.php?ipc='$ipwan'&gw_id='$(uci get auto.setting.gw_id)'&mac='$mac'&redirect=&wlan=' \
        -H 'Host: welcome2.wifi.id' \
        -H 'Accept: application/json, text/javascript, */*; q=0.01' \
        -H 'X-Requested-With: XMLHttpRequest' \
        -H 'User-Agent: Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36' \
        -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
        -H 'Origin: https://welcome2.wifi.id' \
        -H 'Sec-Fetch-Site: same-origin' \
        -H 'Sec-Fetch-Mode: cors' \
        -H 'Sec-Fetch-Dest: empty' \
        -H 'Referer: https://welcome2.wifi.id/login/?gw_id='$(uci get auto.setting.gw_id)'&client_mac='$mac'&wlan=&sessionid=' \
        -H 'Accept-Encoding: gzip, deflate, br' \
        -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
        -d 'username='$(uci get auto.setting.user)'&password='$(uci get auto.setting.pass)'&landURL=' \
        --cookie-jar $cok -b $cok
        
while :
do
curl -s --connect-timeout 10 'https://www.google.com' &> /dev/null
if [[ $? -eq 0 ]]; then
    echo "Connected"
    logger "Connected"
	break
else
	echo "Not Connected ... Mencoba Login"
	logger "Not Connected ... Mencoba Login"
	login
	sleep 5
fi
rm $cok
done
