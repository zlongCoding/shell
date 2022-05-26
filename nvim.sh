#!/bin/bash
bashPath='/Users/longzhang'

nvimPath="${bashPath}/Desktop/nvim"
nvimConfig="${bashPath}/.config/nvim"
zshrcPath="${bashPath}/.zshrc"
nvimGitPath='https://github.com/neovim/neovim'
if [ -d "$nvimPath" ]; then
  echo "文件已经存在"
  rm -rf $nvimPath
  exit 0;
fi
mkdir -p $nvimPath && cd $_
touch aaa.sh
echo "$nvimPath --->文件创建成功"
exit 0



# git and make
git clone $nvimGitPath
cd neovim && make
sudo make install
# 移除local bin 下面的文件，自己通过alias生成
mv /usr/local/bin /usr/local/bin_bank


# 生成alias
echo 'alias vi="nvim"' >> $zshrcPath
echo 'alias vim="nvim"' >> $zshrcPath
echo "alias nvim='$nvimPath/build/bin/nvim'" >> $zshrcPath

source $zshrcPath

# 删除缓存文件
rm -rf "$bashPath/.config/nvim"
rm -rf "$bashPath/.local/share/nvim"
rm -rf "$bashPath/.cache/nvim"
# 下载配置文件到本地
mkdir -p $nvimConfig && cd $_
git clone 'https://github.com/zlongCoding/nvim.git'


