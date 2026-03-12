program problema12
    use parametros
    use functions
    implicit none
    real(kind=pr), allocatable:: arr1(:), arr2(:)
    real(kind=pr):: mean_, std_

    
    allocate(arr1(9))
    arr1 = [479.80, 499.10, 510.20, 508.60, 503.30, 501.20, 507.30, 499.90, 468.60]

    call save_columns(filename="datos1.dat", size_n=9, arr=arr1, file_unit=12)
    arr2 = read_column(filename="datos1.dat", size_n=9)

    mean_ = mean(arr=arr2, n_size=9)
    std_ = std(arr=arr2, n_size=9, mean_=mean_)

    write(*,*) mean_
    write(*,*) std_

end program problema12