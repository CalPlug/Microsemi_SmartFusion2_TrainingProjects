new_project \
         -name {M2S_MSS} \
         -location {C:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\designer\M2S_MSS\M2S_MSS_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S090TS} \
         -name {M2S090TS}
enable_device \
         -name {M2S090TS} \
         -enable {TRUE}
save_project
close_project
