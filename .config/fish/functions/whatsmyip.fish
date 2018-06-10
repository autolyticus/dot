function whatsmyip
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	# Internal IP Lookup
	echo -ne "Internal IP:\n"
	ip a | grep inet | awk '{print $2}'

	# External IP Lookup
	echo -ne "External IP:\n"
	curl ipecho.net/plain
	echo
end

