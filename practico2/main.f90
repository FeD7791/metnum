program main
    use raices
    implicit none

    real(kind=pr), allocatable :: resultado(:,:)
    real(kind=pr), allocatable ::arr(:)

    resultado = iteracion_punto_fijo(mi_funcion, 1.0_pr, 100, 1e-6_pr)
    arr = linspace(0._pr, 1._pr, 50)

    call plotter(mi_funcion, arr)

    open(unit=43, file="results.dat", status="unknown")
    write(43, *) resultado(1,:)
    write(43, *) resultado(2,:)
    close(43)

    print *, resultado

contains

    function mi_funcion(x) result(res)
        real(kind=pr), intent(in) :: x
        real(kind=pr) :: res

        res = cos(x)   ! ejemplo clásico de punto fijo
    end function mi_funcion

end program main