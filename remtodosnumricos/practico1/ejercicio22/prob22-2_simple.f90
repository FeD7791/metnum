program test_igualdad2
implicit none
integer, parameter      :: pr=kind(1.0)    ! pr puede ser simple o doble
real(pr)                :: a

a=2.05_pr
if(a*100._pr==205._pr)then
    write(*,*)'2.05*100 = 205'
else
    write(*,*)'2.05*100 /= 205'
endif
end program test_igualdad2

