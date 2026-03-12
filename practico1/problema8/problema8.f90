program problema8
    use baskhara
    implicit none
    real(kind=4)::a,b,c,x1,x2

    write(*,*) "introduce a,b,c"
    read(*,*) a,b,c

    call baskhara_(a,b,c,x1,x2)

    write(s, '(F4.1,"+",F4.1,"i")') x1,x2
end program problema8