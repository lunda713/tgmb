git add .
git commit -m "deploy from hexo-admin"
git push origin source
hexo clean
hexo g
hexo d
