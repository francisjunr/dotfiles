message=$(curl 'https://api.casioindiashop.com/api/v1/check-pincode-service' \
  -H 'accept: application/json' \
  -H 'accept-language: en-GB,en;q=0.9' \
  -H 'authorization: Il9eRmkWQSO8WC0HGO3cwr5LmKvtJA90' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json;charset=UTF-8' \
  -H 'origin: https://www.casioindiashop.com' \
  -H 'pragma: no-cache' \
  -H 'priority: u=1, i' \
  -H 'referer: https://www.casioindiashop.com/' \
  -H 'sec-ch-ua: "Brave";v="137", "Chromium";v="137", "Not/A)Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-gpc: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36' \
  --data-raw '{"product_sku":"D246","shipping_mode":"Express","category_seller_code":"wat","pincode":"695583","is_bundle":0,"is_exclusive":0,"is_new_product":0}' | jq -r '.message')

out_of_stock="Currently out of stock in this area"
if [ "$message" != "$out_of_stock" ]; then
  osascript -e 'display notification "Your Damn watch is available" with title "f91W Available"'
fi
