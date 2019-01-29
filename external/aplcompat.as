;===================================
;=Aplsys Touch PSP Compat API v0.01=
;===================================
#module
#defcfunc AplCompatGetPspSystemSoftwareVersion
LF="":poke LF,0,0x0A
exist "../../../vs0/app/SQFS00025/flash0/vsh/etc/version.txt"
sdim pspversiontxtdata,strsize
bload "../../../vs0/app/SQFS00025/flash0/vsh/etc/version.txt",pspversiontxtdata,-1,-1
pspversiontxtdata3=""
for i,0,strlen(pspversiontxtdata),1
pspversiontxtdata2=strmid(pspversiontxtdata,i,1)
if pspversiontxtdata2=LF{pspversiontxtdata3=pspversiontxtdata3+"\n"}else{pspversiontxtdata3=pspversiontxtdata3+pspversiontxtdata2}
next
notesel pspversiontxtdata3
for i,0,notemax,1
noteget pspversions,i
if strmid(pspversions,0,8)="release:"{pspversion=strmid(pspversions,8,strlen(pspversions)-9)}
next
return pspversion

#defcfunc AplCompatVUmdChange str filename
exist "../../../umd.iso":if strsize=-1{}else{delete "../../../umd.iso"}
exist "../../../"+filename:if strsize=-1{success=0:bcopy "../../../vs0/res/null.iso.bak","../../../umd.iso"}else{success=1:bcopy "../../../"+filename,"../../../umd.iso"}
return success
#global