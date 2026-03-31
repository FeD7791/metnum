program problema15
    use utilidades
    implicit none
    real(kind=pr)::sin1, sin2, fact
    integer(kind=pr)::i
    character(len=200)::path_file


    path_file = "/home/jorgefederico/Fede/metnum/otherdir/metnum/practico1/problema15/factorial.dat"

    open(37, file=path_file, status="unknown")
    sin1 = 0._pr
    do i=0,8,1
        sin1 = sin1 + single_term(n=i, x=0.1_pr)
        fact = factorial(n=i)
        call writte_in_file(format='(F15.8, 3X, F15.8)', arg1=sin1, arg2=fact, unit=37)
    end do

    sin2 = 0._pr
    do i=8,0,-1
        sin2 = sin2 + single_term(n=i, x=0.1_pr)
    end do

    write(*,*) sin1, sin2, sin(0.1)
    close(37)
end program problema15