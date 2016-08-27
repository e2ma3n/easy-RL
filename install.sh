#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# Documents : http://oslearn.ir/easy-RL/
# Demo : https://www.youtube.com/
# License : GPL v3.0
# html templates by http://startbootstrap.com/
# easy-RL v1.0 - Installer [Easy Reading Logs]
# --------------------------------------------------------------- #

# check root privilege
[ "`whoami`" != "root" ] && echo '[-] Please use root user or sudo' && exit 1

function up {
	awk -v line=$1 -v new_content="$2" '{
		if (NR == line) {
				print new_content;
		} else {
				print $0;
		}
	}' $3
}

# help function
function help_f {
	echo 'Usage: '
	echo '	sudo ./install.sh -i [install program]'
	echo '	sudo ./install.sh -u [help to uninstall program]'
	echo '	sudo ./install.sh -c [check dependencies]'
}

# uninstall program from system
function uninstall_f {
	echo 'For uninstall program:'
	echo '	sudo rm -rf /opt/easy-RL_v1.0/'
	echo '	sudo rm -rf /YOUR-WEB-SERVER-DIRECTORY/easy-RL/'
}

# check dependencies in system
function check_f {
	echo '[+] check dependencies in system:  '
	for program in whoami awk which sleep mkdir cp mv tac rm cat ls sed cut head tail grep sort uniq tr wc gzip
	do
		if [ ! -z `which $program 2> /dev/null` ] ; then
			echo "[+] $program found"
		else
			echo "[-] Error: $program not found"
		fi
		sleep 0.5
	done
}

# install program in system
function install_f {

	# print header
	sleep 1.5
	echo '[+] Easy Reading Logs [easy-RL v1.0]'
	sleep 1.5
	echo '[+] Tested on all popular linux distributions such as debian 7, debian 8, ubuntu server, CentOS 6 and CentOS 7'
	sleep 1.5
	echo -en '[+] Press enter for continue or press ctrl+c for exit' ; read
	sleep 4

	# Create main directory
	echo '[+]'
	[ ! -d /opt/easy-RL_v1.0/ ] && mkdir -p /opt/easy-RL_v1.0/ && echo '[+] Main Directory created' || echo '[-] Error: /opt/easy-RL_v1.0/ exist'
	sleep 1

	# Create temp directory
	[ ! -d /opt/easy-RL_v1.0/temp ] && mkdir -p /opt/easy-RL_v1.0/temp && echo '[+] Temp Directory created' || echo '[-] Error: /opt/easy-RL_v1.0/temp exist'
	sleep 1

	# Create html directory
	[ ! -d /opt/easy-RL_v1.0/html ] && mkdir -p /opt/easy-RL_v1.0/html/css && echo '[+] Html Directory created' || echo '[-] Error: /opt/easy-RL_v1.0/html exist'
	sleep 1

	# Create tinyproxy directory
	[ ! -d /opt/easy-RL_v1.0/html/tinyproxy ] && mkdir -p /opt/easy-RL_v1.0/html/tinyproxy/css && echo '[+] Tinyproxy Directory created' || echo '[-] Error: /opt/easy-RL_v1.0/html/tinyproxy exist'
	sleep 1

	# Create squid directory
	[ ! -d /opt/easy-RL_v1.0/html/squid ] && mkdir -p /opt/easy-RL_v1.0/html/squid/css && echo '[+] Squid Directory created' || echo '[-] Error: /opt/easy-RL_v1.0/html/squid exist'
	sleep 1

	# Copy normalize.css and style.css in CSS directory
	[ ! -f /opt/easy-RL_v1.0/html/css/style.css ] && cp style.css /opt/easy-RL_v1.0/html/css/ && chmod 644 /opt/easy-RL_v1.0/html/css/style.css && echo '[+] style.css copied' || echo "[-] Error: /opt/easy-RL_v1.0/html/css/style.css exist"
	sleep 1
	[ ! -f /opt/easy-RL_v1.0/html/css/normalize.css ] && cp normalize.css /opt/easy-RL_v1.0/html/css/ && chmod 644 /opt/easy-RL_v1.0/html/css/normalize.css && echo '[+] normalize.css copied' || echo "[-] Error: /opt/easy-RL_v1.0/html/css/normalize.css exist"
	sleep 1

	# Copy normalize.css and style.css in CSS directory
	[ ! -f /opt/easy-RL_v1.0/html/tinyproxy/css/style.css ] && cp style.css /opt/easy-RL_v1.0/html/tinyproxy/css/ && chmod 644 /opt/easy-RL_v1.0/html/tinyproxy/css/style.css && echo '[+] style.css copied' || echo "[-] Error: /opt/easy-RL_v1.0/html/tinyproxy/css/style.css exist"
	sleep 1
	[ ! -f /opt/easy-RL_v1.0/html/tinyproxy/css/normalize.css ] && cp normalize.css /opt/easy-RL_v1.0/html/tinyproxy/css/ && chmod 644 /opt/easy-RL_v1.0/html/tinyproxy/css/normalize.css && echo '[+] normalize.css copied' || echo "[-] Error: /opt/easy-RL_v1.0/html/tinyproxy/css/normalize.css exist"
	sleep 1

	# Copy normalize.css and style.css in CSS directory
	[ ! -f /opt/easy-RL_v1.0/html/squid/css/style.css ] && cp style.css /opt/easy-RL_v1.0/html/squid/css/ && chmod 644 /opt/easy-RL_v1.0/html/squid/css/style.css && echo '[+] style.css copied' || echo "[-] Error: /opt/easy-RL_v1.0/html/squid/css/style.css exist"
	sleep 1
	[ ! -f /opt/easy-RL_v1.0/html/squid/css/normalize.css ] && cp normalize.css /opt/easy-RL_v1.0/html/squid/css/ && chmod 644 /opt/easy-RL_v1.0/html/squid/css/normalize.css && echo '[+] normalize.css copied' || echo "[-] Error: /opt/easy-RL_v1.0/html/squid/css/normalize.css exist"
	sleep 1

	# Copy main index.html
	[ ! -f /opt/easy-RL_v1.0/html/index.html ] && cp index_main.html /opt/easy-RL_v1.0/html/index.html && chmod 644 /opt/easy-RL_v1.0/html/index.html && echo '[+] index_main.html copied' || echo '[-] Error: /opt/easy-RL_v1.0/html/index.html exist'
	sleep 1

	# Copy tinyproxy index.html
	[ ! -f /opt/easy-RL_v1.0/html/tinyproxy/index.html ] && cp index_tinyproxy.html /opt/easy-RL_v1.0/html/tinyproxy/index.html && chmod 644 /opt/easy-RL_v1.0/html/tinyproxy/index.html && echo '[+] index_tinyproxy.html copied' || echo '[-] Error: /opt/easy-RL_v1.0/html/tinyproxy/index.html exist'
	sleep 1

	# Copy squid index.html
	[ ! -f /opt/easy-RL_v1.0/html/squid/index.html ] && cp index_squid.html /opt/easy-RL_v1.0/html/squid/index.html && chmod 644 /opt/easy-RL_v1.0/html/squid/index.html && echo '[+] index_squid.html copied' || echo '[-] Error: /opt/easy-RL_v1.0/html/squid/index.html exist'
	sleep 1

	# Copy Tinyproxy get.html
	[ ! -f /opt/easy-RL_v1.0/html/tinyproxy/get.html ] && cp get_tinyproxy.html /opt/easy-RL_v1.0/html/tinyproxy/get.html && chmod 644 /opt/easy-RL_v1.0/html/tinyproxy/get.html && echo '[+] get_tinyproxy.html copied' || echo '[-] Error: /opt/easy-RL_v1.0/html/tinyproxy/get.html exist'
	sleep 1

	# Copy Tinyproxy post.html
	[ ! -f /opt/easy-RL_v1.0/html/tinyproxy/post.html ] && cp post_tinyproxy.html /opt/easy-RL_v1.0/html/tinyproxy/post.html && chmod 644 /opt/easy-RL_v1.0/html/tinyproxy/post.html && echo '[+] post_tinyproxy.html copied' || echo '[-] Error: /opt/easy-RL_v1.0/html/tinyproxy/post.html exist'
	sleep 1

	# Add easy-RL.sh to crontab file
	[ -f /etc/crontab ] && echo '@reboot root /opt/easy-RL_v1.0/easy-RL.sh' >> /etc/crontab && echo -e "[+] easy-RL.sh added to crontab file\n[+] easy-RL.sh automatically running at boot\n[+] Restart server or restart cron services" || echo -e "[-] Error: /etc/crontab not found\n[-] You can start program manually or starting up script as a daemon using another way."
	sleep 1

	# Copy README
	[ ! -f /opt/easy-RL_v1.0/README ] && cp README /opt/easy-RL_v1.0/README && chmod 644 /opt/easy-RL_v1.0/README && echo '[+] README copied' || echo '[-] Error: /opt/easy-RL_v1.0/README exist'
	sleep 1

	# Insert web server directory
	for (( ;; )) ; do
		echo '[+] Enter web server directory. For example, /var/www/html'
		echo '[!] Warning: If index.html and css directory exists in your address, Please taking backup from them.'
		sleep 3
		echo -en '[+] Enter address: ' ; read www
		echo -en "[+] Web server directory is $www. Are you sure ? [y/n]: " ; read question
		if [ "$question" = "y" ] ; then
			# Insert web server directory to 'easy-RL.sh'
			up 25 "webserver=$www" easy-RL.sh > easy-RL_new.sh
			mv easy-RL_new.sh easy-RL.sh
			echo '[+] easy-RL.sh Updated'
			break
		else
			echo '[+]'
		fi
	done


	# Create easy-RL directory in web server
	[ ! -d $www/easy-RL ] && mkdir -p $www/easy-RL && echo '[+] easy-RL Directory created in web server' || echo '[-] Error: $www/easy-RL exist'
	sleep 1
	cp -r /opt/easy-RL_v1.0/html/* $www/easy-RL/

	# Delay
	for (( ;; )) ; do
		echo -en '[+] Delay between each check [by Second]: ' ; read delay
		echo -en "[+] Delay time is $delay second. Are you sure ? [y/n]: " ; read question
		if [ "$question" = "y" ] ; then
			# Insert delay time in 'easy-RL.sh'
			up 121 "sleep $delay" easy-RL.sh > easy-RL_new.sh
			mv easy-RL_new.sh easy-RL.sh
			echo '[+] easy-RL.sh Updated'
			break
		else
			echo '[+]'
		fi
	done

	# Copy easy-RL.sh
	[ ! -f /opt/easy-RL_v1.0/easy-RL.sh ] && cp easy-RL.sh /opt/easy-RL_v1.0/easy-RL.sh && chmod 755 /opt/easy-RL_v1.0/easy-RL.sh && echo '[+] easy-RL.sh copied' || echo '[-] Error: /opt/easy-RL_v1.0/easy-RL.sh exist'
	sleep 1

	# echo footer
	echo '[+]'
	echo '[+] Please see README'
	sleep 0.5
	echo '[!] Warning: You should run program as root.'
	sleep 0.5
	echo '[+] You can view source code from /opt/easy-RL_v1.0/easy-RL.sh'
	echo '[+] Done'

}

case $1 in
	-i) install_f ;;
	-c) check_f ;;
	-u) uninstall_f ;;
	*) help_f ;;
esac
