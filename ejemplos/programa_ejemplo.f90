program ejemplo
    use precision
    use funciones
    implicit none
    
    real(kind=pr):: a, b, c
    real(kind=pr), allocatable:: arr(:)
    write(*,*) "ingrese 3 numeros"
    read(*,*) a, b, c

    allocate(arr(3))
    arr(1)=a
    arr(2)=b
    arr(3)=c

    call write_in_file(arr=arr)

end program ejemplo