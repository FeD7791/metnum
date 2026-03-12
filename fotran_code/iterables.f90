module iterables
    implicit none
    
contains
    function arange(a, b, step) result(arr)
        real(kind=4), intent(in) :: a, b, step
        integer(kind=4) :: n, k
        real(kind=4), allocatable :: arr(:)
        ! no intent out on functions

        n = int((b - a) / step) + 1
        arr = [(a + step*(k-1), k = 1, n)]
    end function arange

    function linspace(a, b, n_values) result(arr)

        real(kind=4), intent(in) :: a, b
        integer(kind=4), intent(in) :: n_values
        real(kind=4) :: step
        integer(kind=4) :: n, k
        real(kind=4), allocatable :: arr(:)

        step = (b - a) / n_values
        arr = [(a + step*(k-1), k = 1, n)]

    end function linspace
end module iterables