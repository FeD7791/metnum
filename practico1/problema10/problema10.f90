program problema10
    use parametros
    use functions

    implicit none
    
    real(kind=pr)::base
    integer(kind=4)::index
    real, allocatable :: arr(:)


    allocate(arr(5))
    write(*,*) "Enter: base"
    read(*,*) base

    do index=1, 5, 1
        arr(index) = powers(base, index)
    end do

    write(*,*) arr
end program problema10