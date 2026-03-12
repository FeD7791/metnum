program test
implicit none
integer, parameter 	:: pr = kind(1.0)  ! simple precision
real(pr)		:: sum0,sum1
integer 		:: i

sum0 = 0._pr ; sum1 = 1._pr
do i=1,10000
	sum0 = sum0 + 1.e-8_pr
	sum1 = sum1 + 1.e-8_pr
end do
sum0 = sum0 + 1._pr
write(*,*) sum0, sum1
end program test
