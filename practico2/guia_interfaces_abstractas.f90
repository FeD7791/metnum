! En un modulo las interfaces abstractas pueden definirse como siguie

module ejemplo_interfaz_abstracta
    implicit none
    integer, parameter::pr=4


    abstract interface

        ! La funcion se incluye dentro de la interface, tampoco hay
        ! sentencia result
        function funcion_tipo(x)
            import pr
            real(kind=pr) :: funcion_tipo
            real(kind=pr), intent(in) :: x

            ! No se escribe ninguna interpretacion concreta de la funcion
        end function funcion_tipo
    end interface



contains
    ! Funciones
    ! Subrutinas


    ! Subrutina que recibe una función como argumento
    function apply_function(f, x) result(res)
        real, intent(in) :: x
        real :: res
        procedure(func) :: f   ! <- usa la interfaz abstracta

        res = f(x)
    end function apply_function
end module ejemplo_interfaz_abstracta