program test

use subru

implicit none
real(kind(1.))      :: x,y,s
integer             :: i,j

i=6; j=3; x=4. ; y=8.
call sum(i,x,s)
write(*,'(f4.1," + ",f4.1," = ",f5.1)') real(i),x,s

end program test
