module utilidades
    use precision
    implicit none
contains


    subroutine verificar_entradas(numero, base)
        integer(kind=pr), intent(in) :: numero, base

        if (numero < 0) then
            print *, "Error: el numero no es positivo"
            stop

        elseif (base < 2 .or. base > 16) then
            print *, "La base debe cumplir 2 <= base <= 16"
            stop
        endif

    end subroutine verificar_entradas


    function transform_from_base_10_to_base_b(base, number) result(transformed_number)

        !> Funcion que transforma un numero natural base 10 a un numero base
        ! maxima 16.

        ! Entradas:
        ! base: Numero tipo integer, comprendido entre 2 y 16
        ! numero: Numero a transformar , tipo integer y positivo

        ! Salida:
        ! Arreglo con un tamaño igual a la cantidad de digitos de converison
        ! El arreglo es de tipo integer.

        ! Nota:
        ! Para bases mayores a 10, se retorna arreglo con elementos como:
        ! [10, 11, 2, 3, etc]

        integer(kind=pr), intent(in) :: base, number
        integer(kind=pr) :: n, remainder, counter
        integer(kind=pr), allocatable :: remainder_values(:)
        integer(kind=pr), allocatable :: transformed_number(:)

        ! renombro otra variable n porque no quiero cambiar el estado de la
        ! misma
        n = number
        counter = 0

        ! Este paso toma mi numero base 10 (n) y lo divide reiteradas veces
        ! por la base, con el objetivo de contar cuantos digitos tendra mi
        ! numero.

        do while (n > 0)
            n = n / base
            counter = counter + 1
        end do

        ! Como ya conozco la cantidad de digitos que tendra mi numero reservo
        ! ese espacio de memoria para mi arreglo.
        allocate(remainder_values(counter))

        ! Reinicio mi numero y contador (De otra forma tendrian los valores
        ! obtenidos en el pasado do)
        n = number
        counter = 1

        ! Reitero el proceso anterior, solo que ahora voy asignando los digitos
        ! a mi arreglo.
        do while (n > 0)
            ! mod(a,b) retorna el resto de la division a/b
            remainder = mod(n, base)
            ! Guardo el resto en mi arreglo de restos
            remainder_values(counter) = remainder
            ! calculo el cociente para la siguiente iteracion
            n = n / base
            ! Agrego +1 a mi contador
            counter = counter + 1
        end do

        ! Reordeno los elementos del arreglo de [r1, r2, ..., rn] a 
        ! [rn, ..., r2, r1]
        ! sintaxis 1: size(<arreglo>) da el tamaño del arreglo.
        ! sintaxis 2: <arreglo>(start: end: step) ; itera sobre el arreglo
        ! guardandolo en el mismo.
        transformed_number = remainder_values(size(remainder_values):1:-1)

    end function

    function selector_digito(remainder_values_array) result(remainder_values_transformed)
        ! El objetivo de esta funcion es llevar un arreglo de valores enteros
        ! a un arreglo de valores character para la escritura o representacion

        ! Entradas:
        ! remainder_values_array : Arreglo de digitos de valores enteros
        ! remainder_values_transformed : Arreglo de digitos de valor character
        
        integer(kind=pr), intent(in)::remainder_values_array(:)
        character(len=1), allocatable:: remainder_values_transformed(:)
        integer(kind=pr)::i
        
        ! Generamos espacio para nuestro arreglo de salida, tal que tenga el
        ! mismo tamaño que nuestro arreglo de entrada.
        allocate(remainder_values_transformed(size(remainder_values_array)))
        do i=1, size(remainder_values_array), 1
            select case(remainder_values_array(i))
            case (10)
                remainder_values_transformed(i) = 'A'
            case (11)
                remainder_values_transformed(i) = 'B'
            case (12)
                remainder_values_transformed(i) = 'C'
            case (13)
                remainder_values_transformed(i) = 'D'
            case (14)
                remainder_values_transformed(i) = 'E'
            case (15)
                remainder_values_transformed(i) = 'F'
            case default
                remainder_values_transformed(i) = achar(remainder_values_array(i) + 48)
            end select
        end do
    end function selector_digito
end module utilidades