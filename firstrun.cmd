@echo off
del README.md
echo Unpacking Git and Python... & start /wait git_python.part01.exe & del git_python.part01.exe & del git_python.part*.rar

set path=git\cmd;python;venv\scripts
set appdata=tmp
set userprofile=tmp
set temp=tmp

git init .
git remote add origin https://github.com/bmaltais/kohya_ss.git
git pull origin master

git clone https://github.com/kohya-ss/sd-scripts

python -m venv venv
call venv\Scripts\activate.bat

pip install --use-pep517 -U -r requirements_pytorch_windows.txt
python -m pip install --upgrade pip

webui.cmd

pause