program datos

implicit none
integer, parameter		:: pr=kind(1.d0)	! precision
integer			:: numdatos
integer			:: n
real(pr),dimension(:),allocatable		:: x
real(pr)			:: suma_x, suma_x2
real(pr)			:: x_prom, dev
character(len=30)		:: entrada, salida


entrada="datos1.dat"
salida="resultados1.dat" 

write(*,*)"Número de datos?"
read(*,*)numdatos

allocate(x(numdatos))

open(20,file=entrada)

do n=1,numdatos
	read(20,*)x(n)
enddo

 close(20)


suma_x=0._pr
suma_x2=0._pr

do n=1,numdatos
	suma_x=suma_x+x(n)
	suma_x2=suma_x2+x(n)**2
enddo

x_prom=suma_x/real(numdatos, pr)

dev=sqrt( (suma_x2 - numdatos*x_prom**2)/real(numdatos-1,pr) )

open(30,file=salida)

write(*,10)x_prom
write(30,10)x_prom
write(*,20)dev
write(30,20)dev

10	format("promedio             =", f12.4)
20	format("desviacion estandard =", f12.4)

 close(30)


end program datos

