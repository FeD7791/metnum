module functions
    use parametros
    implicit none
    
contains
    subroutine save_columns(filename, size_n, arr, file_unit)
        implicit none
        character(len=*), intent(in) :: filename
        integer(kind=pr), intent(in) :: size_n, file_unit
        real(kind=pr), allocatable:: arr(:)

        integer :: i, n_unit

        n_unit = file_unit
        open(newunit=n_unit, file=filename, status="replace", action="write")

        do i = 1, size_n, 1
            write(n_unit,*) arr(i)
        end do

        close(n_unit)
    end subroutine save_columns

    function read_column(filename, size_n) result(arr)
        character(len=*), intent(in) :: filename
        integer(kind=pr), intent(in) :: size_n
        real(kind=pr),allocatable::arr(:)
        integer(kind=4)::i

        allocate(arr(size_n))
        open(unit=10, file=filename, status="old")
        do i=1,size_n,1
            read(10, *) arr(i)
        end do
        close(10)
    end function read_column

    function mean(arr, n_size) result(mean_)
        real(kind=pr), allocatable, intent(in)::arr(:)
        real(kind=pr)::mean_
        integer(kind=pr), intent(in)::n_size
        integer(kind=pr)::i

        mean_ = 0._pr
        do i=1, n_size, 1
            mean_ = mean_ + arr(i)
        end do
        mean_ = mean_ / n_size
    end function mean

    function std(arr, n_size, mean_) result(std_)
        real(kind=pr), allocatable, intent(in)::arr(:)
        integer(kind=pr), intent(in)::n_size
        real(kind=pr), intent(in)::mean_

        integer(kind=4)::i
        real(kind=pr)::std_

        std_=0._pr
        do i=1, n_size, 1
            std_ = std_ + (arr(i) - mean_)**2
        end do
        std_ = std_ / (n_size - 1)
        std_ = sqrt(std_)



    end function std


end module functions