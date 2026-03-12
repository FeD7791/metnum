program problema13
    use parameters
    use functions
    implicit none
    integer(kind=pr)::base, number
    character(len=1), allocatable::number_base_b(:)
    real(kind=pr)::number_in_base_10

    write(*,*) "Ingrese la base y el numero a transformar: "
    read(*,*) base, number

    number_base_b = transform_from_base_10_to_base_b(base=base, number=number)
    write(*,*) number_base_b

    number_in_base_10 = transform_from_base_b_to_base_10(number_in_base_b=number_base_b, base=base)
    write(*,*) number_in_base_10
end program problema13