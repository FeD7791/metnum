program contrasenia

implicit none
integer, parameter      :: pr=kind(1.d0)
character(len=3)        :: contra,prueba
integer                 :: n

write(*,*)'Ingrese una contrasenia de tres digitos'
read(*,*)contra

write(*,*)'Cual es la contrasenia? (Tiene tres oportunidades)'

do n=1,3
    read(*,*)prueba
    if(prueba==contra)then
        write(*,*)'Correcto!'
        exit
    else
        write(*,*)'Lo siento, contrasenia equivocada'
    endif
enddo    


end program contrasenia
