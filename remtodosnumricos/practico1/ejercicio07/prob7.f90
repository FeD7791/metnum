program problema7
implicit none
integer         :: n

write(*,*)'Ingrese un numero entero'
read(*,*)n 



if(mod(n,2)==0)then
    write(*,*)'El numero ingresado es multilplo de 2' 
else 
    write(*,*)'El numero ingresado no es multilplo de 2' 
endif


if(mod(n,5)==0)then
    write(*,*)'El numero ingresado es multilplo de 5' 
else 
    write(*,*)'El numero ingresado no es multilplo de 5' 
endif


end program

