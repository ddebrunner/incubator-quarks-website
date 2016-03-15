set -e
cd site
jekyll serve -d ../content_tmp
COMMIT_HASH=`git rev-parse HEAD`
cd ..
git checkout asf-site
rm -rf content
mv content_tmp content
echo "Committing changes to asf-site branch from master branch"
git commit -m "from $COMMIT_HASH"
echo "You are now on the asf-site branch"
echo "Run git push origin asf-site to update the live site."
set +e