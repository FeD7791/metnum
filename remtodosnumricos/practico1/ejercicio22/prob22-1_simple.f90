program test_igualdad
implicit none
integer, parameter      :: pr=kind(1.0)    ! pr puede ser simple o doble

if(19.08_pr + 2.01_pr == 21.09_pr)then
    write(*,*)'19.08 + 2.01 = 1.09'
else
    write(*,*)'19.08 + 2.01 /= 1.09'
endif
end program test_igualdad

