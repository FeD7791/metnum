module func

use param

contains

real(pr) function pot(x,n)

real(pr),intent(in)		:: x
integer,intent(in)		:: n
integer			:: i

pot=1._pr

do i=1,n
	pot=pot*x
enddo



end function pot


end module func
