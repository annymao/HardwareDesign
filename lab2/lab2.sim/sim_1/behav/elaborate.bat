@echo off
set xv_path=D:\\Xlinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto ec0161f62ce349e0be44c6b553ac9ca3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot lab2_2_t_behav xil_defaultlib.lab2_2_t xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
