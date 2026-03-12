program numfor
    use iterables
    implicit none

    real(kind=4) :: a, b, step
    real(kind=4) , allocatable :: x(:), y(:)
    integer(kind=4) :: n_values
    
    a = 0
    b = 100
    step = 5
    n_values = 50


    x = arange(a, b, step)
    y = linspace(a, b, n_values)

    print *, x

    print *, y

end program numfor