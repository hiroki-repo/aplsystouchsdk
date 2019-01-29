#module
#defcfunc ppeke int pal1
    t=""
    poke t,0,pal1
    return t
#global
#module
#defcfunc getmp3tag str fn,int pal2
;P1:ファイルネーム
;P2: 0:title 
;    1:Author
    sdim tt,1025
    exist fn
    ss=strsize
    if strsize=-1:return ""
    if getpath(fn,2)!".mp3":return ""
    bload ""+fn,tt,1024,0
    A=(peek (tt,0)=255&peek (tt,1)=16*15+11)
    B=(""+ppeke (peek (tt,0))+""+ppeke (peek (tt,1))+""+ppeke (peek (tt,2))+""="ID3")
    C=(""+ppeke (peek (tt,9))+""+ppeke (peek (tt,10))+""+ppeke (peek (tt,11))+""+ppeke (peek (tt,12))+""+ppeke (peek (tt,13))+""="vTIT2")
    if pal2=0{
        if ((A|B)!C){
            gosub *footerload
            return a
        }
        if B&C=1{
            a=""

            st=peek (tt,17)
            s=peek (tt,21)
            s2=peek (tt,22)
            if s>224&s2>224:gosub *footerload:return a
            
            repeat st-1
                a+=ppeke (peek (tt,21+cnt))
            loop
            return a
        }
    }
    if pal2=1{
        repeat 1020
            if ppeke (peek (tt,cnt))="T"{
                c=cnt
                ff=""+ppeke (peek (tt,c))+""+ppeke (peek (tt,c+1))+""+ppeke (peek (tt,c+2))+""+ppeke (peek (tt,c+3))+""
                
                if ff="TPE1"{
                    
                    a=""
                    st=peek (tt,c+7)
                    repeat st-1
                        a+=ppeke (peek (tt,c+11+cnt))
                    loop
                    break
                }
            }
        loop
        return a
    }
    return ""
*footerload
    bload ""+fn,tt,1024,ss-1024
    breakf=0
    repeat 1024
        if ppeke (peek (tt,cnt))="T"{
            if ppeke (peek (tt,cnt+1))="A"&ppeke (peek (tt,cnt+2))="G"{
                P=cnt+3
                repeat 1000
                    f=(peek (tt,p+cnt)=' ' & peek (tt,p+cnt+1)=' ' & peek (tt,p+cnt+2)=' ')
                    if  peek (tt,p+cnt)=0|f=1{
                        a=""
                        
                        repeat cnt
                            a+=ppeke (peek (tt,P+cnt))
                        loop
                        breakf=1
                        break
                    }
                loop
            }
        }
        if breakf=1:break
        if cnt=1023 :a="":break
    loop
    return
#global
/*Sample
    dialog "mp3",16
    fn=refstr
    if stat=0:end
    mes "title =["+getmp3tag(fn,0)+"]"
    mes "author=["+getmp3tag(fn,1)+"]"
*/