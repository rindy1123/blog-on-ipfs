#! /bin/sh
cp  _redirects.template public/_redirects
ipfs add -r public
ipfs add -Qr --only-hash public | xargs ipfs pin add
echo "/ipfs/$(ipfs add -Qr --only-hash public)" | xargs ipfs name publish
