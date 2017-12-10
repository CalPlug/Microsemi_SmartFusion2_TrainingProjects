new_project \
         -name {top} \
         -location {C:\Users\Hiperwall\Desktop\microsemilab\tofupurefpga\designer\top\top_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
