#! /bin/sh
hugo
cp  _redirects.template public/_redirects
ipfs add -r --cid-version 1 public
ipfs add -Qr --cid-version 1 --only-hash public | xargs ipfs pin add
echo "/ipfs/$(ipfs add -Qr --cid-version 1 --only-hash public)" | xargs ipfs name publish
w3 up public/
