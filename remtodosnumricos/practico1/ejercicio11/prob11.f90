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

do i=1,N,2
	V(i)=3
enddo

do i=2,N,2
	V(i)=2
enddo


write(*,*)' '

do i=1,N
    write(*,*)V(i)
enddo

write(*,*)' '

do i=1,N
	do j=1,i-1
		M(i,j)=0
	enddo
	M(i,i)=3
	do j=i+1,N
		M(i,j)=1
	enddo
enddo


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


