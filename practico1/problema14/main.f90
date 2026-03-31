program problema14
    use precision
    implicit none
    
    real(kind=pr)::var1, var2, var3, sum1, sum2, sum3
    integer(kind=pr)::i,j

    ! Errores
    real(kind=pr)::std1, std2, abs1, abs2

    ! Claramente esta variable nos da el resultado verdadero
    ! 100000
    var1 = 1000000_pr * 0.1_pr

    open(37, file="errores_1.dat")
    open(38, file="errores_2.dat")

    sum1 = 0._pr
    do i = 1_pr, 1000000_pr, 1_pr
        sum1 = sum1 + 0.1_pr
        if (mod(i, 1000)==0) then
            write(37, '(i8, 2F14.5)') i, abs(i*0.1_pr - sum1), abs(i*0.1_pr - sum1) / (i*0.1_pr)
        end if
    end do
    var2 = sum1

    ! write(37, *) "index" , "error"
    ! write(38, *) "index" , "error"

    sum2 = 0._pr
    sum3 = 0._pr
    do i = 1_pr, 1000_pr, 1_pr

        do j = 1_pr, 1000_pr, 1_pr
            sum2 = sum2 + 0.1_pr
        end do
        sum3 = sum3 + sum2

        write(38, '(i8, 2F14.5)') i*1000, abs(i*1000*0.1 - sum3), abs(i*1000*0.1 - sum3) / (i*1000*0.1)

    end do

    var3 = sum3

    ! Dar valor a los errores
    std1 = abs(var1 - var2) / var1
    std2 = abs(var1 - var3) / var1

    abs1 = abs(var1 - var2)
    abs2 = abs(var1 - var3)

    write(*, *) 0.1_pr
    write(*, '("Var1:", F12.5, 2X, "Var2:", F12.5, 2X, "Var3:", F12.5)') var1, var2, var3
    write(*, '("rel1", F12.5, 2X, "rel2", F12.5)') std1*100, std2*100
    write(*, '("abs1", F12.5, 2X, "abs2", F12.5)') abs1, abs2

    close(37)
    close(38)

end program problema14