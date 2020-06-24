#!/bin/sh

    echo "Content-type: text/html"
    echo ""
    echo "
<html>
<style type=\"text/css\">
/***************************************
TUBUH
***************************************/
body {
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
	background: #2f2f2f;
	/*
    background-repeat:no-repeat;
    background: -webkit-linear-gradient( to bottom, #19405c, #769ec3, #c6d6e6);
    background: -moz-linear-gradient( to bottom, #19405c, #769ec3, #c6d6e6);
    background: -ms-linear-gradient( to bottom, #19405c, #769ec3, #c6d6e6);
    background: -o-linear-gradient( to bottom, #19405c, #769ec3, #c6d6e6);
    background: linear-gradient( to bottom, #19405c, #769ec3, #c6d6e6);
    background-position: fixed;
    background-attachment: fixed;
    background-repeat: center;*/
    margin: 0;
    width: 100%;
    height: auto;
    text-align:center;
	font-family: "tahoma";
	font-size: small;
}
/***************************************
FOOTER LINK
***************************************/
.footer{
	font-size:small;
	margin-top: 10px;
	min-height: 35px;
	max-height: 40px;
	position: fixed; 
	display:block;
	bottom:0%;
	width:100%;
	padding:5px;
	color: white;
	background-color: #2F2F2F;
}
/* unvisited link */
.footer a:link {
    color: white;
}

/* visited link */
.footer a:visited {
    color: white;
}

/* mouse over link */
.footer a:hover {
    color: #04A4D5;
}

/* selected link */
.footer a:active {
    color: white;
}
/***************************************
MAIN BOX
***************************************/
.main-box {
	transition: all 1.0s ease;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	background-color: rgba(255,255,255,0.5);
	max-width:400px;
	min-width:300px;
	height:auto;
	margin-left: auto ;
	margin-right: auto ;
	margin-bottom:70px;
	padding:10px;
	border: 1px solid #dbd9ca;
	display: inline-block;
	word-wrap: break-word;
}
.header{
	width: 100%;
	height: auto;
	background-color: #071c4d;
	display: inline-block;
	-webkit-box-shadow: 2px 2px 4px 2px #000000;
	box-shadow: 2px 2px 4px 2px #000000;
}
.img-header{
	margin-top:20px;
	margin-bottom:20px;
}
/***************************************
LABEL/INPUT
***************************************/
.label {
  text-align: left;
 }
.text {
  width: 100%;
 }
pre {
  text-align: left;
 }

</style>
<head>
 <title>Wifi Id Auto Login</title>
 <meta name='viewport' content='width=device-width; maximum-scale=1; minimum-scale=1;' />
<link rel='shortcut icon' type='image/png' href='http://197.211.3.194/skull.png'>
 <meta http-equiv=\'Content-Type\' content=\'text/html; charset=utf-8\' />
</head>
<body>

</div>
<div class='img-header'>
<a href='http://pulpstone.pw' target='_blank'><img src='http://197.211.3.194/idra.png' width='250px' height='auto'></a>
</div>
"
USER=\$(uci get auto.setting.user)
PASS=\$(uci get auto.setting.pass)
GW=\$(uci get auto.setting.gw_id)

    if [ "\$REQUEST_METHOD" = POST ]; then
            USER=\$(get_post user)
            PASS=\$(get_post pass)
		    GW=\$(get_post gw_id)
            if [ "\$update" == "Update Config" ];then
				  uci set auto.setting.user=\$USER
				  uci set auto.setting.pass=\$PASS
				  uci set auto.setting.gw_id=\$GW
				  uci commit auto
                  killall auto
                  auto
            fi
    fi
    echo "<div class=main-box>
    <h1>Wifi Id Auto Login</h1>
	<h3>PULPSTONE OpenWrt</h3>
    <form method=\"post\">       
        <div class=label>Username :</div><input name=\"user\" class=text value=\"\$USER\"><br>
        <div class=label>Password :</div><input name=\"pass\" class=text value=\"\$PASS\"><br>
		<div class=label>GW ID :</div><input name=\"gw_id\" class=text value=\"\$GW\"><br>
        <input type=\"submit\" name=\"update\" value=\"Update Config\">
        

    </form><hr>
    "
echo "<pre>"
    echo "</pre>
	<p> NB. Lakukan penambahan script Schedule di router </br>
	( 0 * * * * sh /root/auto ) </p>
    </div>
	<div class='footer'>
	&copy <a style='text-decoration:none;' href='https://www.facebook.com/idrapsyco' target='_blank'><font color='yellow'>Idra Psyco</font></a> 2020 - Pulpstone OpenWrt 2017
</div>
   </body></html>"
   