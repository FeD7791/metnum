program numpy
    implicit none

    integer(kind=4)::min_, max_, counter, i
    real(kind=4), allocatable :: arr(:)

    min_ = 0
    max_ = 10 ! 10.0 - el punto cuenta asi que en el formato serian 4 chars
    counter = 1

    arr = [(i, i=min_, max_, counter)]
    ! idx = 1
    ! do i = min_, max_, counter
    !     arr(idx) = i
    !     idx = idx + 1
    ! end do

    write (*, '(F6.1)') arr
end program numpy


