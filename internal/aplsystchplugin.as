#module
#defcfunc moduleload str modulefilename, str moduleoption
moduleoption2=moduleoption
nowdir=dir_cur
repeat
nowdir2=dir_cur
nowdir3=strmid(nowdir2,-1,9)
if nowdir3="squwattos"{break}
chdir ".."
loop
notesel moduleoption2:notesave "./tm0/modulecalloption"
moduleloadstartoptionexeccallfile=dir_cur
notesel hwndmainwnd:noteload "./hwndmainwnd"
notesel isquitready:isquitready="0":notesave "./tm0/quitreadyforplugin"
notesel aplsystchpluginenabler:aplsystchpluginenabler="1":notesave "./tm0/aplsystchpluginexec.txt"
chdir nowdir
modulefilename2=modulefilename
notesel modulefilename2:notesave moduleloadstartoptionexeccallfile+"\\execappapi"+hwndmainwnd
repeat
notesel isquitready:noteload nowdir2+"\\tm0/quitreadyforplugin"
if isquitready="1"{break}
loop
bload "./tm0/aplsystchpluginoutput.txt",moduleoutput,-1,-1
return moduleoutput
#global