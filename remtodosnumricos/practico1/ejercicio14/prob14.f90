program millon_precision

implicit none
integer,parameter	:: pr=kind(1.0)
integer, parameter	:: nmax=1000000
integer, parameter	:: nmax1=1000, nmax2=1000
real(pr)		:: suma_a, suma_b, suma_c, suma_d, error
real(pr)   		:: constante=0.1_pr
integer			:: n,n1,n2

open(30,file='salida_prob14b.dat')
open(40,file='salida_prob14c.dat')

suma_a=constante*nmax

suma_b=0._pr
do n=1,nmax
	suma_b=suma_b+constante
	if(mod(n,1000)==0)then
		error=abs(suma_b - n*constante)
		write(30,'(i8,2f14.5)')n,suma_b,error
	endif
enddo

suma_c=0._pr
do n1=1,nmax1
	suma_d=0._pr
	do n2=1,nmax2
		suma_d=suma_d+constante
	enddo
	suma_c=suma_c+suma_d
	error=abs(suma_c-n1*nmax2*constante)
	write(40,'(i8,2f14.5)')n1*1000,suma_c,error
enddo

write(*,*)suma_a, suma_b, suma_c

end program millon_precision
