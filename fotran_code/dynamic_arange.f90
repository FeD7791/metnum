program arange
    implicit none
    real(kind=4)::a,b,step
    integer(kind=4)::k,n
    real(kind=4), allocatable::arr(:)

    print *, "min, max, pass :"
    ! read (unit, format) list
    ! unit: where does it come from, * = keyboard
    ! format : the format of the data
    ! save to list of variables

    !read(*, '(3E7.3)') a, b, step

    read(*, *) a, b, step


    n = int((b - a) / step) + 1
    arr = [(a + step*(k-1), k = 1, n)]

    open(unit=7, &
        file="/home/jorgefederico/Fede/metnum/fotran_code/arange.txt", &
        status="old", position="append"&
        )

    write(7, '(E10.1)') arr
    !write(*, '(E10.1)') arr

    close(7)
end program arange