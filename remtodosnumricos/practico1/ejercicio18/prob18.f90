program dias_del_mes

implicit none
integer,parameter       :: pr=kind(1.d0)
character(len=16)       :: mes
integer                 :: anio
integer                 :: num_dias

write(*,*)'Ingrese el año'
read(*,*)anio

write(*,*)'Ingrese el nombre del mes (todo con minuscula)'
read(*,*)mes 

select case(mes)
    case('abril','junio','septiembre','noviembre')
        num_dias=30
    case('enero','marzo','mayo','julio','agosto','octubre','diciembre')
        num_dias=31
    case('febrero')
        if(mod(anio,4)==0)then
            if(mod(anio,100)==0)then
                if(mod(anio,1000)==0)then
                    num_dias=29
                else
                    num_dias=28
                endif
            else
                num_dias=29
            endif
        else
            num_dias=28
        endif
    case default
        write(*,*)'Mes equivocado'
        num_dias=0
end select
    
    
    
write(*,"('El mes de ',a20,' de ',i4,' tiene ',i2,' dias')")mes,anio,num_dias

end program dias_del_mes
