new_project \
         -name {SF2_MSS_sys} \
         -location {C:\Users\Hiperwall\Desktop\Servo-arm3 - Copy\designer\SF2_MSS_sys\SF2_MSS_sys_fp} \
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
