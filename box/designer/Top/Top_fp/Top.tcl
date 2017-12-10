open_project -project {C:\Users\Hiperwall\Desktop\microsemilab\box\designer\Top\Top_fp\Top.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S090} \
    -fpga {C:\Users\Hiperwall\Desktop\microsemilab\box\designer\Top\Top.map} \
    -header {C:\Users\Hiperwall\Desktop\microsemilab\box\designer\Top\Top.hdr} \
    -spm {C:\Users\Hiperwall\Desktop\microsemilab\box\designer\Top\Top.spm} \
    -dca {C:\Users\Hiperwall\Desktop\microsemilab\box\designer\Top\Top.dca}
set_programming_file -name {M2S090} -no_file
save_project
close_project
