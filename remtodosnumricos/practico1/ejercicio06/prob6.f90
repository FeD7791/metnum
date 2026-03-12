program prob6

implicit none

real		:: a,b

write(*,*)'ingrese dos numeros reales (primero uno, despues otro)'

read(*,*)a
read(*,*)b

if(a>b)then
	write(*,*)'El mayor es:',a
else if(b>a)then
	write(*,*)'El mayor es:',b
else
	write(*,*)'ambos son iguales'
endif

end program

