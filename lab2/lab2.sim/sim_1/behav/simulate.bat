@echo off
set xv_path=D:\\Xlinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim lab2_2_t_behav -key {Behavioral:sim_1:Functional:lab2_2_t} -tclbatch lab2_2_t.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
