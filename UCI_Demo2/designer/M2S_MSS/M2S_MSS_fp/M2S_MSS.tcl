open_project -project {C:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\designer\M2S_MSS\M2S_MSS_fp\M2S_MSS.pro}
set_programming_file -name {M2S090TS} -file {C:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\designer\M2S_MSS\M2S_MSS.ipd}
enable_device -name {M2S090TS} -enable 1
set_programming_action -action {PROGRAM} -name {M2S090TS} 
run_selected_actions
set_programming_file -name {M2S090TS} -no_file
save_project
close_project
