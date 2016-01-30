bh_unshortenit() {

    local BaseUrl="http://unshorten.it/"
    local RequestUrl="$BaseUrl/main/get_long_url"
    local ShortUrl="$(bh_urlencode $1)"
    local csrf="$(wget -T 30 -q -O - \
                  $BaseUrl \
                  --save-cookie="/tmp/unshort.it" \
                  --user-agent='Mozilla/5.0 (X11: Linux x86_64) AppleWebKit/537.36 (KHTML, like Geco) Chrome/47.0.2526.111 Safari/537.36' \
                    | grep 'csrf' \
                    | cut -d \' -f6)"

    wget -T 30 \
        --load-cookie="/tmp/unshort.it" \
        -q -O - "$RequestUrl" \
        --user-agent='Mozilla/5.0 (X11: Linux x86_64) AppleWebKit/537.36 (KHTML, like Geco) Chrome/47.0.2526.111 Safari/537.36' \
        --post-data="short-url=$ShortUrl&csrfmiddlewaretoken=$csrf" \
            | cut -d \" -f8

    rm -f /tmp/unshort.it

}
