program sin_x

!  recordar que sin(x)= sum_{n=0}^{infty} (-1.)**n * x**(2n+1) / (2n+1)!

use ISO_FORTRAN_ENV

implicit none

integer(kind = int8), parameter :: is = int8, id = int16, il = int32, ix = int64
integer(kind = int8), parameter :: rs = real32, rd = real64, rl = real128
! s : Short, d : Double, l : Large, x : eXtralarge

!integer , parameter :: pr = rd ! double con gfortran
integer , parameter :: pr = rs ! simple con gfortran

integer, parameter              	:: nmax=8
real(pr)                        	:: x, sum_x1, sum_x2
integer                         	:: n
real(kind=pr),dimension(0:2*nmax+1)   :: fact
character(len=20)               	:: salida


salida='p15.dat'

x=0.1_pr 

open(20,file=salida)

fact(0)=1._pr
do n=1,2*nmax+1
    fact(n)=fact(n-1)*real(n,pr)
    write(*,*)fact(n)
enddo


write(20,*)'#      sin(x)            sum_x1          |sin(x) - sum_x1|'


sum_x1=0._pr
do n=0,nmax
    sum_x1=sum_x1 + (-1._pr)**n*x**(2*n+1)/fact(2*n+1)
    write(20,"(i2,3e18.8)")n,sin(x),sum_x1,abs(sin(x)-sum_x1)
enddo

sum_x2=0._pr
do n=nmax,0,-1
    sum_x2=sum_x2 + (-1._pr)**n*x**(2*n+1)/fact(2*n+1)
enddo



write(*,*)'sum_x1=',sum_x1
write(*,*)'sum_x2=',sum_x2
write(*,*)'sin(x)=',sin(x)


 close(20)


end program sin_x
