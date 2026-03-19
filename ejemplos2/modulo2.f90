module utilidades
    use precision
    implicit none
    
contains
    function raiz_cuadrada(arg) result(raiz)
        real(kind=pr), intent(in) :: arg
        real(kind=pr) :: raiz

        raiz = arg**0.5
    
        
    end function raiz_cuadrada

    subroutine routine(arg1,  arg2)
        real(kind=pr), intent(in) :: arg1
        real(kind=pr), intent(out) ::  arg2
        ! cosas 
        
    end subroutine routine
end module utilidades