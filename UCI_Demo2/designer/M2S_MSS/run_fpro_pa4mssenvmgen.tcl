set_device \
    -fam SmartFusion2 \
    -die PA4M7500_TS \
    -pkg fg484
set_input_cfg \
	-path {C:/Users/Hiperwall/Desktop/microsemilab/UCI_Demo2/component/work/M2S_MSS_sb_MSS/ENVM.cfg}
set_output_efc \
    -path {C:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2\designer\M2S_MSS\M2S_MSS.efc}
set_proj_dir \
    -path {C:\Users\Hiperwall\Desktop\microsemilab\UCI_Demo2}
gen_prg -use_init false
