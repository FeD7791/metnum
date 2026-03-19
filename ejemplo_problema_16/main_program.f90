program transformar_base_10_base_b
    use precision
    use utilidades
    implicit none
    integer(kind=pr)::base, number ! Entradas
    character(len=1), allocatable::number_base_b_char(:)
    integer(kind=pr), allocatable::number_base_b(:)

    write(*,*) "Ingrese la base y el numero a transformar: "
    read(*,*) base, number
    call verificar_entradas(numero=number, base=base)

    number_base_b = transform_from_base_10_to_base_b(base=base, number=number)
    number_base_b_char = selector_digito(remainder_values_array=number_base_b)
    write(*,*) number_base_b_char

end program transformar_base_10_base_b