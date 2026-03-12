program ejericio5
    implicit none
    
    real(kind=4)::a,b,c,d,e,f,g,h

    a = 5/2 + 20/6 ! Fortran realiza division entera, descarta todo lo que esta luego del punto.
    b = 4 * 6 / 2 -15 / 2
    c = 5 * 15 / 2 / (4 - 2)
    d = 1 + 1/4
    e = 1. + 1/4
    f = 1 + 1./4
    g = 1. + 1./4.

    ! write(*,*) a ,b, c, d, e ,f, g
    write(*,*) d, e

end program ejericio5