3dAutomask -prefix am_letter letter.nii 
3dcalc -prefix am2_letter -a letter.nii -b am_letter+orig. -expr 'a*b'
3dmerge -prefix letter.reg.SM -1blur_sigma 3 -doall am2_letter+orig.
3dTsmooth -prefix letter.reg.SM.rlt.tem -lin letter.reg.SM+orig.