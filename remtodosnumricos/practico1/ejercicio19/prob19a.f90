program calculo_Pi

implicit none

integer, parameter		:: pr=kind(1.d0)
real(pr)	 		:: pint_n, pext_n, pint_2n, pext_2n
integer 			:: n , k

n=6

pint_n=3._pr

pext_n=2._pr*sqrt(3._pr)

do k=1,20
		
	n=n*2

	pext_2n = (2._pr*pint_n*pext_n)/(pint_n+pext_n)

	pint_2n = sqrt(pext_2n*pint_n)

	write(*,*)k,n,pint_2n, pext_2n, pext_2n - pint_2n

	pint_n=pint_2n
	pext_n=pext_2n

enddo

end program calculo_Pi
