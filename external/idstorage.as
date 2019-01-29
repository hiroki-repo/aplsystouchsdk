#module
#deffunc sceIdStorageReadLeaf int key, var idsbuffer
moduleoption2=moduleoption
nowdir=dir_cur
repeat
nowdir2=dir_cur
nowdir3=strmid(nowdir2,-1,9)
if nowdir3="squwattos"{break}
chdir ".."
loop
bload "vs0/app/SQFS00025/idstorage"+str(key)+".img",idsbuffer,512,0
chdir nowdir
return

#deffunc sceIdStorageLookup int key, int offset, var idsbuffer, int idslength
sdim idsbuffer2,512
sceIdStorageReadLeaf key,idsbuffer2
for i,0,idslength,1
poke idsbuffer,i,peek(idsbuffer2,i+offset)
next
return
#global
