module utilidades
    implicit none
    integer,parameter::pr=4
contains
    function factorial(n) result(fact)
        integer(kind=pr), intent(in) :: n
        integer(kind=pr)::i
        real(kind=pr) :: fact

        fact = 1._pr
        do i = 2, n
            fact = fact * real(i, kind=pr)
        end do
    end function


    function single_term(n, x) result(valor)
        integer(kind=pr), intent(in) :: n
        real(kind=pr), intent(in) :: x
        integer(kind=pr):: nn
        real(kind=pr)::valor1, valor2, valor3, valor
        nn = (2*n) + 1
        valor1 = ((-1)**n)
        valor2 = factorial(nn)
        valor3 = x**nn
        valor = (valor1 * valor3) / valor2


    end function single_term


    subroutine writte_in_file(format, arg1, arg2, unit)
        character(len=*), intent(in) :: format
        real(kind=pr), intent(in):: arg1, arg2
        integer, intent(in) :: unit


        write(unit, format) arg1, arg2

    
        
    end subroutine writte_in_file

end module utilidades