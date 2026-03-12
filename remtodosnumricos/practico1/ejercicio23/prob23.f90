!	Problema 11 del practico 1
!	Ingresar valor de N. 
!	matriz NxN triangular superior, con sus elementos 1, y 3 en la diagonal.
! 	vector con elementos pares iguales a 2 y elementos impares iguales a 3.

program matriz_vector

use preci

use subru

implicit none

integer, allocatable, dimension(:,:) :: M

integer, allocatable, dimension(:) :: V,R

integer :: N,i,j			! dimension del vector y la matriz

write(*,*)'Ingrese N, la dimension del vector y la matriz'

read(*,*)N

if(N<2.or.N>1000)then
    write(*,*)'fuera de rango'
    stop
endif

allocate(V(N))

allocate(R(N))

allocate(M(N,N))

V(1:N:2)=3
V(2:N:2)=2

write(*,*)' '

do i=1,N
    write(*,*)V(i)
enddo

write(*,*)' '


forall( i =1: n , j =2: n , j > i )   M(i,j) = 1
forall( i =1: n , j =1: n-1 , j < i ) M(i,j) = 0
forall( i =1: n ) M(i,i) = 3

do i=1,N
    write(*,*)(M(i,j),j=1,N)

enddo

call multi(N,V,M,R)

write(*,*)' '

do i=1,N
    write(*,*)R(i)
enddo


deallocate(V,R,M)


end program matriz_vector


