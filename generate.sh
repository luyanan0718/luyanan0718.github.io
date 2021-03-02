echo "clean"
hexo clean
echo "pull notes"
path=source/_posts
cd $path
gitDir=.git_bak
#判断文件夹是否存在
if [ -d $gitDir ];then
  echo "文件夹存在"
  mv .git_bak .git
  git pull
  mv .git  .git_bak
else
  echo "文件夹不存在,克隆项目"
  cd ..
  git clone git@github.com:lyn-workspace/notes.git _posts
  cd _posts
  mv .git .git_bak
fi
echo "notes 更新成功,将代码更新到source/_posts目录下"
echo "重新编译,上传到服务器"
hexo g
hexo d

