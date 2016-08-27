#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# Documents : http://oslearn.ir/easy-RL/
# Demo : https://www.youtube.com/
# License : GPL v3.0
# html templates by http://startbootstrap.com/
# easy-RL v1.0 - core [Easy Reading Logs]
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

webserver=''

for (( ;; )) ; do
	update=`echo -n 'Last Update : ' ; date +'%e %b %Y - %H:%M:%S'`

	# Update last update in post.html (tinyproxy)
	tac /opt/easy-RL_v1.0/html/tinyproxy/post.html > /opt/easy-RL_v1.0/temp/post.html
	up 5 "<p></p><font size=2>$update</font>" /opt/easy-RL_v1.0/temp/post.html > /opt/easy-RL_v1.0/temp/1.html
	tac /opt/easy-RL_v1.0/temp/1.html > /opt/easy-RL_v1.0/temp/post.html
	rm /opt/easy-RL_v1.0/temp/1.html
	mv /opt/easy-RL_v1.0/temp/post.html /opt/easy-RL_v1.0/html/tinyproxy/post.html

	# Update last update in get.html (tinyproxy)
	tac /opt/easy-RL_v1.0/html/tinyproxy/get.html > /opt/easy-RL_v1.0/temp/get.html
	up 5 "<p></p><font size=2>$update</font>" /opt/easy-RL_v1.0/temp/get.html > /opt/easy-RL_v1.0/temp/1.html
	tac /opt/easy-RL_v1.0/temp/1.html > /opt/easy-RL_v1.0/temp/get.html
	rm /opt/easy-RL_v1.0/temp/1.html
	mv /opt/easy-RL_v1.0/temp/get.html /opt/easy-RL_v1.0/html/tinyproxy/get.html

	# Update last update in index.html (tinyproxy)
	up 41 "<p></p><font size=2>$update</font>" /opt/easy-RL_v1.0/html/tinyproxy/index.html > /opt/easy-RL_v1.0/temp/index.html
	mv /opt/easy-RL_v1.0/temp/index.html $webserver/easy-RL/tinyproxy/index.html

	# Update last update in index.html (main index)
	up 41 "<p></p><font size=2>$update</font>" /opt/easy-RL_v1.0/html/index.html > /opt/easy-RL_v1.0/temp/index.html
	mv /opt/easy-RL_v1.0/temp/index.html $webserver/easy-RL/index.html

	# Extract Tinyproxy log file
	ls /var/log/tinyproxy/*.gz &> /dev/null && gzip -d `ls /var/log/tinyproxy/*.gz`

	# Tinyproxy log address
	log_file=`cat $(ls /var/log/tinyproxy/tinyproxy.log* | sort -r | grep -v gz) | tr -s ' '`

	# POST method
	url=`echo "$log_file" | grep -o -P '.{0,0}POST.{0,}' | cut -d '/' -f 3 | sort | uniq -c | tr -s ' ' | sort -nr`
	n=`echo "$url" | wc -l`

	cp /opt/easy-RL_v1.0/html/tinyproxy/post.html /opt/easy-RL_v1.0/temp/0.html
	for (( i=$n ; i >= 1 ; i-- )) ; do

		site=`echo "$url" | head -n $i | tail -n 1 | cut -d ' ' -f 3`
		visit=`echo "$url" | head -n $i | tail -n 1 | cut -d ' ' -f 2`


		sed "30i <tr>" /opt/easy-RL_v1.0/temp/0.html > /opt/easy-RL_v1.0/temp/1.html

		sed "31i <td data-title='ID'>$i</td>" /opt/easy-RL_v1.0/temp/1.html > /opt/easy-RL_v1.0/temp/2.html
		rm /opt/easy-RL_v1.0/temp/1.html

		sed "32i <td data-title='URL'>$site</td>" /opt/easy-RL_v1.0/temp/2.html > /opt/easy-RL_v1.0/temp/3.html
		rm /opt/easy-RL_v1.0/temp/2.html

		sed "33i <td data-title='Connections'>$visit</td>" /opt/easy-RL_v1.0/temp/3.html > /opt/easy-RL_v1.0/temp/4.html
		rm /opt/easy-RL_v1.0/temp/3.html

		sed "34i </tr>" /opt/easy-RL_v1.0/temp/4.html > /opt/easy-RL_v1.0/temp/5.html
		rm /opt/easy-RL_v1.0/temp/4.html

		mv /opt/easy-RL_v1.0/temp/5.html /opt/easy-RL_v1.0/temp/0.html

	done

	mv /opt/easy-RL_v1.0/temp/0.html $webserver/easy-RL/tinyproxy/post.html


	# GET method
	url=`echo "$log_file" | grep -o -P '.{0,0}GET.{0,}' | cut -d '/' -f 3 | sort | uniq -c | tr -s ' ' | sort -nr`
	n=`echo "$url" | wc -l`

	cp /opt/easy-RL_v1.0/html/tinyproxy/get.html /opt/easy-RL_v1.0/temp/0.html
	for (( i=$n ; i >= 1 ; i-- )) ; do

		site=`echo "$url" | head -n $i | tail -n 1 | cut -d ' ' -f 3`
		visit=`echo "$url" | head -n $i | tail -n 1 | cut -d ' ' -f 2`


		sed "30i <tr>" /opt/easy-RL_v1.0/temp/0.html > /opt/easy-RL_v1.0/temp/1.html

		sed "31i <td data-title='ID'>$i</td>" /opt/easy-RL_v1.0/temp/1.html > /opt/easy-RL_v1.0/temp/2.html
		rm /opt/easy-RL_v1.0/temp/1.html

		sed "32i <td data-title='URL'>$site</td>" /opt/easy-RL_v1.0/temp/2.html > /opt/easy-RL_v1.0/temp/3.html
		rm /opt/easy-RL_v1.0/temp/2.html

		sed "33i <td data-title='Connections'>$visit</td>" /opt/easy-RL_v1.0/temp/3.html > /opt/easy-RL_v1.0/temp/4.html
		rm /opt/easy-RL_v1.0/temp/3.html

		sed "34i </tr>" /opt/easy-RL_v1.0/temp/4.html > /opt/easy-RL_v1.0/temp/5.html
		rm /opt/easy-RL_v1.0/temp/4.html

		mv /opt/easy-RL_v1.0/temp/5.html /opt/easy-RL_v1.0/temp/0.html

	done

	mv /opt/easy-RL_v1.0/temp/0.html $webserver/easy-RL/tinyproxy/get.html

	sleep 30
done
