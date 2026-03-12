program calculo_Pi

implicit none
real*8 		:: Pimitad, Pi, error
real*8, parameter	:: pi_exact=acos(-1.d0)
integer	 	:: n 

write(*,*)"Pi exacto=", pi_exact

n=1

Pimitad=1.d0

do n=1,1000000
		
	Pimitad=Pimitad*(dfloat(2*n))**2/((dfloat(2*n))**2-1.d0)

	Pi=Pimitad*2.d0
		
	error=abs(Pi-pi_exact)

	write(*,*)n,Pimitad, Pi, error

enddo

end program calculo_Pi
