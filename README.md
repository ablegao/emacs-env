# Emacs Config
Only run emacs 25.x +


## Instal
	
	git clone git@github.com:ablegao/emacs_config.git

	mv emacs_config ~/.emacs.d 

## upgrade 

	golang support
	python support
	


###python 

	pip install rope
	pip install jedi
	pip install flake8
	pip install importmagic
	pip install autopep8
	pip install yap
	pip install yapf


## pandoc
apt install texlive-xetex pandoc



#keymap


## global

    
    f6 固定当前buffer ,不会被拆分和替换
    f7 multi-term
    f8 neotree
    f9 speedbar
     
    C-r 向上查找 
    C-s 向下查找 
    C-s C-w 向下查找，光标位置的单词作为查找字符串 
    C-s C-y 向下查找，光标位置到行尾作为查找字符串 
    C-s RET <查找字符串> RET 非递增查找 
    C-s RET C-w 不受换行、空格、标点影响 
    C-M-s 正则式向下查找

### 窗口

    C-x 0 关掉当前窗口 
    C-x 1 关掉其他窗口 
    C-x o 切换窗口 
    C-x 2 水平两分窗口 
    C-x 3 垂直两分窗口 
    C-x 5 2 新frame

### 矩形区块 
用这些快捷键要先关闭cua-mode 

    
    C-x r t 用串填充矩形区域 
    C-x r o 插入空白的矩形区域 
    C-x r y 插入之前删除的矩形区域, 粘贴时，矩形左上角对齐光标 
    C-x r k 删除矩形区域 
    C-x r c 将当前矩形区域清空
    
### 帮助
    
    C-h k 显示你将按下的键执行的function. 
    C-h f 列出function的功能说明。 
    C-h b 列出目前所有的快捷键。 
    C-h m 列出目前的mode的特殊说明. 
    C-c C-h 列出以C-c 开头的所有快捷键.

## golang

    
    C-x f 文件测试
    C-x t 单元测试 
    C-x p 执行目录下所有测试
    C-x b 压力测试
    C-x x 执行
    
    C-c c compile编译

## dot shell 

    C-c c conversion png 


## markdown 
    
    C-c c  在w3m 中预览
    C-c C-c m  在buffer 中预览
    C-c C-c p  在浏览器中预览



## python 

    C-c C-c ipython 中运行

