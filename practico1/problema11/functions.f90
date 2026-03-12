module functions
    use parametros
    implicit none
    
contains
    function triangular_superior_matrix_n_x_n(n_range) result(matrix)
        integer(kind=4), intent(in) :: n_range
        integer(kind=4) :: i, j
        real(kind=pr), allocatable :: matrix(:,:)

        allocate(matrix(n_range, n_range))

        do i = 1, n_range
            do j = 1, n_range
                if (i == j) then
                    matrix(i,j) = 3._pr
                else if (i < j) then
                    matrix(i,j) = 1._pr
                else
                    matrix(i,j) = 0._pr
                end if
            end do
        end do

    end function triangular_superior_matrix_n_x_n

    function vector_n(n_range) result(vector)
        integer(kind=4), intent(in) :: n_range
        integer(kind=4)::i
        real(kind=pr), allocatable :: vector(:)

        allocate(vector(n_range))

        do i=1, n_range, 1
            if (mod(i,2)==0) then
                vector(i)=2
            else
                vector(i)=3
            end if
        end do
    end function vector_n

    subroutine print_matrix(A)
        implicit none
        real, intent(in) :: A(:,:)
        integer :: i
    
        do i = 1, size(A,1)
            print *, A(i,:)
        end do
    end subroutine print_matrix


end module functions