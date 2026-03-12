program problema11
    use parametros
    use functions
    implicit none
    
    integer(kind=pr)::n_range
    real(kind=pr), allocatable:: t_sup_m(:,:)
    real(kind=pr), allocatable:: arr(:), matmul_result(:)
    write(*,*) "Provide n_range"
    read(*,*) n_range

    ! Do not allocate t_sup_m that is done in the function
    t_sup_m = triangular_superior_matrix_n_x_n(n_range)
    arr = vector_n(n_range)

    matmul_result = matmul(t_sup_m, arr)

    call print_matrix(t_sup_m)

end program problema11