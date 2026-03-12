program problema8
implicit none
integer, parameter      :: pr=kind(7.0)
real(pr)                :: A,B,C
real(pr)                :: determinante

write(*,*)'Dado un polinomio de segundo grado: A*X**2+B*x+C...'
write(*,*)'Ingrese A'
read(*,*)A
write(*,*)'Ingrese B'
read(*,*)B
write(*,*)'Ingrese C'
read(*,*)C

if(A==0._pr)then
    write(*,*)'Error, no es cuadratica'
    stop
endif


determinante=B*B-4._pr*A*C 

write(*,*)"Formula usual:"

if(determinante>0._pr)then
    write(*,*)'Raiz 1 =', (-B-sqrt(determinante))/(2._pr*A)
    write(*,*)'Raiz 2 =', (-B+sqrt(determinante))/(2._pr*A)
else if(determinante==0._pr)then
    write(*,*)'Raiz doble =', -B/(2._pr*A)
else
    write(*,*)'Raiz 1 =', -B/(2._pr*A) , '-  i * ', sqrt(-determinante)/(2._pr*A)
    write(*,*)'Raiz 2 =', -B/(2._pr*A) , '+  i * ', sqrt(-determinante)/(2._pr*A)
endif


write(*,*)"Formula racionalizada:"

if(determinante>0._pr)then
    write(*,*)'Raiz 1 =', (-2*C)/(B+sqrt(determinante))
    write(*,*)'Raiz 2 =', (2*C)/(-B+sqrt(determinante))
else if(determinante==0._pr)then
    write(*,*)'Raiz doble =', -B/(2._pr*A)
else
    write(*,*)'Raiz 1 =', -B/(2._pr*A) , '-  i * ', sqrt(-determinante)/(2._pr*A)
    write(*,*)'Raiz 2 =', -B/(2._pr*A) , '+  i * ', sqrt(-determinante)/(2._pr*A)
endif



end program

