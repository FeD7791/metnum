module funciones
    use precision
    implicit none
contains
    ! En estos ejemplos las dos primeras funciones hacen practicamente lo mismo
    ! Una lo hace con sintaxis de funcion
    ! La otra lo hace con sintaxys de subrutina
    function sumar_elementos_funcion(arr) result(result)
        ! Funcion que Suma los elementos del arreglo arr
        real(kind=pr), intent(in) :: arr(:)
        real(kind=pr)::result

        result = arr(1) + arr(2) + arr(3)
    end function sumar_elementos_funcion

    subroutine sumar_elementos_subrutina(arr, result)
        ! Subrutina que Suma los elementos del arreglo arr
        real(kind=pr), intent(in) :: arr(:)
        real(kind=pr), intent(out) :: result

        result = arr(1) + arr(2) + arr(3)
        
    end subroutine sumar_elementos_subrutina

    subroutine write_in_file(arr)
        ! Escribe en un archivo data.dat (carpeta local) el arreglo arr
        real(kind=pr), intent(in):: arr(:)

        open(10, file="data.dat", status='unknown')
        write(10, "(3F8.2)") arr
        close(10)
    end subroutine write_in_file

end module funciones