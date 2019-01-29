;========================================
;=Aplsys Touch Virtual UMD Changer v0.01=
;========================================
#module
#defcfunc AplVUmdChange str filename
exist "../../../umd.iso":if strsize=-1{}else{delete "../../../umd.iso"}
exist "../../../"+filename:if strsize=-1{success=0:bcopy "../../../vs0/res/null.iso.bak","../../../umd.iso"}else{success=1:bcopy "../../../"+filename,"../../../umd.iso"}
return success
#global