#packopt name "eboot"
notesel hwndmainwnd:noteload "../../../hwndmainwnd"
title "hirokisquwattosappflameworkorw"+hwndmainwnd
notesel dispresoluation:noteload "../../../vs0/res/resoluation.txt":noteget windowforpspresx,0:noteget windowforpspresy,1:noteget windowforfullscreen,2
bgscr 0,int(windowforpspresx),int(windowforpspresy):if windowforfullscreen="1"{bgscr 0,int(windowforpspresx),int(windowforpspresy),0,0,0:gsel 0,2}else{gsel 0,0}
