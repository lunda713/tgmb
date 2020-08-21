#!/bin/sh
echo "==========================================="
echo "          欢迎来到Akilarの糖果屋！"
echo "==========================================="
HexoPath=$(cd "$(dirname "$0")"; pwd)
cd ${HexoPath}
echo " "
printf "\033[32m Blog 根目录："${HexoPath}"\033[0m"
echo " "
echo " "
echo "[0] 切换到主菜单"
echo "[1] 开启本地预览"
echo "[2] 从Github拉取最新版本"
echo "[3] 提交本地修改到GitHub"
echo "[4] 重新编译后开启本地预览"
echo "[5] 部署页面到博客网站"
echo "[6] 重新安装Hexo"
echo "[7] 重新安装ssh密钥"
echo "[8] 验证ssh密钥"
echo " "
printf "请选择需要的功能，默认选择[1]"
echo " "
echo " "
printf "选择："
read answer
if [ "$answer" = "1" ] || [ "$answer" == "" ]; then
	echo " "
	printf "\033[32mINFO \033[0m 正在启动本地预览...\n"
	echo " "
	printf "\033[32mINFO \033[0m Hexo will run at \033[4mhttp://localhost:4000\033[0m . Press Ctrl+C to stop.\n"
	hexo s
	echo " "
	exec ${HexoPath}/menu.sh
else
	if [ "$answer" = "2" ]; then
		echo " "
		printf "\033[32mINFO \033[0m 正在从Github拉取最新版本...\n"
		echo " "
		git pull origin source
		echo " "
		printf "\033[32mINFO \033[0m 拉取完毕，您的博客已是最新版本！\n"
		sleep 1s
		echo " "
		exec ${HexoPath}/menu.sh
	else
		if [ "$answer" = "3" ]; then
			echo " "
			printf "\033[32mINFO \033[0m 准备提交最新修改到GitHub ...\n"
			echo " "
			git add .
			git commit -m "Update posts' content"
			git push origin source
			echo " "
			printf "\033[32mINFO \033[0m 提交完毕，您的修改已上传至Github！\n"
			sleep 1s
			echo " "
			exec ${HexoPath}/menu.sh
					else
					if [ "$answer" = "4" ]; then
						echo " "
						printf "\033[32mINFO \033[0m 正在清理本地缓存并重新编译开启预览 ...\n"
						echo " "
						Hexo clean
						printf "\033[32mINFO \033[0m 正在重新编译静态页面 ...\n"
						echo " "
						hexo g
						printf "\033[32mINFO \033[0m Hexo will run at \033[4mhttp://localhost:4000\033[0m . Press Ctrl+C to stop.\n"
						Hexo s
						echo " "
						exec ${HexoPath}/menu.sh
					else
						if [ "$answer" = "5" ]; then
							echo " "
							printf "\033[32mINFO \033[0m 正在清理本地缓存并重新编译开启预览 ...\n"
							echo " "
							hexo clean
							printf "\033[32mINFO \033[0m 正在重新编译静态页面 ...\n"
							echo " "
							hexo g
							printf "\033[32mINFO \033[0m 正在准备将最新修改部署至Hexo...\n"
							echo " "
							hexo deploy
							echo " "
							printf "\033[32mINFO \033[0m 部署完成，您的网站已经是最新版本！\n"
							sleep 1s
							echo " "
							exec ${HexoPath}/menu.sh
						else
							if [ "$answer" = "6" ]; then
								echo " "
								printf "\033[32mINFO \033[0m 已将npm源替换为阿里云镜像 ...\n"
								echo " "
								git remote set-url origin https://github.com/Akilarlxh/Akilarlxh.github.io.git # 因为原版本可能是从gitee的镜像clone过来的，重设一下远程仓库
								npm config set registry http://registry.npm.taobao.org # 替换NPM源为阿里镜像
								printf "\033[32mINFO \033[0m Hexo恢复中 ...\n"
								echo " "
								npm install -g hexo-cli
								npm install
								npm install hexo-deployer-git
								echo " "
								printf "\033[32mINFO \033[0m 恢复完成，您可以开始您的Hexo之旅了！\n"
								sleep 1s
								echo " "
								exec ${HexoPath}/menu.sh
							else
								if [ "$answer" = "7" ]; then
									echo " "
									printf "\033[32mINFO \033[0m 正在重新设置github global config...\n"
									echo " "
									git config --global user.name "akilarlxh" # 记得替换用户名为自己的
									git config --global user.email "akilarlxh@gmail.com" # 记得替换邮箱为自己的
									ssh-keygen -t rsa -C akilarlxh@gmail.com # 记得替换邮箱为自己的
									printf "\033[32mINFO \033[0m 即将打开sshkey，可按 Ctrl+D 返回...\n"
									echo " "
									less ~/.ssh/id_rsa.pub
									echo " "
									printf "\033[32mINFO \033[0m 配置完成，请将sshkey添加到Github！\n"
									sleep 1s
									echo " "
									exec ${HexoPath}/menu.sh
								else
									if [ "$answer" = "8" ]; then
										echo " "
										printf "\033[32mINFO \033[0m 准备验证SSHkey是否配置成功 ...\n"
										echo " "
										ssh -T git@github.com
										echo " "
										printf "\033[32mINFO \033[0m 验证完毕，您的SSHkey已绑定至Github！\n"
										sleep 1s
										echo " "
										exec ${HexoPath}/menu.sh
								else
									if [ "$answer" = "0" ]; then
										echo " "
										printf "\033[32mINFO \033[0m 准备切换到主菜单...\n"
										sleep 1s
										echo " "
										exec ${HexoPath}/menu.sh
						else
							echo " "
							printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
							sleep 1s
							echo " "
							exec ${HexoPath}/menu.sh
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi
fi
