module functions
    use parametros
    implicit none
contains
    function powers(base, pwr) result(retval)
        real(kind=pr), intent(in) :: base
        integer(kind=pr), intent(in) :: pwr
        real(kind=pr) :: retval
        
        retval = base**pwr
        
    end function powers
end module functions