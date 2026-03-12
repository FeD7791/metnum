module subru

use preci

contains

	subroutine multi(k,V,M,R)
	
	implicit none

	integer,intent(in)	 		:: k
	integer 				:: i,j
	integer, dimension(k),intent(in) 	:: V
	integer, dimension(k),intent(out) 	:: R
	integer, dimension(k,k),intent(in) 	:: M

	do i=1,k

		R(i)=0

		do j=1,k
			R(i)=R(i)+(V(j)*M(j,i))
		enddo

!		write(*,*)R(i)
	enddo

	return

	end
	
end module subru
	

