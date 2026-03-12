program problema6
    use compare
    implicit none
    real(kind=4)::a,b,c
    character(len=3)::flag

    write(*,*) "Provide a, b:"
    read(*,*) a, b

    call comparer(a,b,c,flag)

    write(*,*) c
    write(*,*) flag
    ! gfortran compare.f90 main.f90 -o main
end program problema6