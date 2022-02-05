#
api_url="https://api.opensea.io/api/v1/assets?offset=0&limit=1&token_ids"

if [ ! -e "$1" ]; then
tokenid=$1
curl -s $api_url=$tokenid -o nft.json
echo "--- # $(cat nft.json | jq -r .assets[0].name)"
png=$(cat nft.json | jq -r .assets[0].external_link)
curl -s $png | convert png:- ppm:- | tail +4 | tee decoded.out | less
else
  convert $1 ppm:- | tail +4 > decoded.out
fi
