program potencia

use param
use func

implicit none
real(pr)		:: x
integer		:: n
real(pr)		:: pot_x

write(*,*)"Ingrese un numero real:"
read(*,*)x

do n=1,5
	pot_x=pot(x,n)
	write(*,10)x,n,pot_x
enddo
	
10	format(f12.6,"^",i1,"= ",f16.6)

end program potencia



