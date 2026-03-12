program two_five_mod
    implicit none
    real(kind=4)::a,b,c
    character(len=:),allocatable::divisible_2, divisible_5

    write(*,*) "Provide a"
    read(*,*) a
    b = mod(a,2.)
    c = mod(a,5.)

    if (b == 0) then
        divisible_2 = "Div 2"
    else
        divisible_2 = "Not Div 2"
    end if

    if (c == 0) then
        divisible_5 = "Div 5"
    else
        divisible_5 = "Not Div 5"
    end if

    write(*,*) divisible_2
    write(*,*) divisible_5

end program two_five_mod