new_project \
         -name {Top} \
         -location {C:\Users\Hiperwall\Desktop\microsemilab\box\designer\Top\Top_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S090} \
         -name {M2S090}
enable_device \
         -name {M2S090} \
         -enable {TRUE}
save_project
close_project
