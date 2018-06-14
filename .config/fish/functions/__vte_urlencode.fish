function __vte_urlencode --argument-names str --description="encodes url byte-by-byte"
  perl6 -MURI::Encode -e "say uri_encode($PWD)"
end
