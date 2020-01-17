function whatsmyip
    echo -ne "Internal IP:\n"
    ip a | grep inet | awk '{print $2}'

    # External IP Lookup
    echo -ne "External IP:\n"
    curl ipecho.net/plain
    echo
end
