#!/bin/bash
npm run build
git add -f dist && git commit -m "update"
git subtree push --prefix dist origin gh-pages
