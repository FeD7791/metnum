module compare
    implicit none
contains

    subroutine comparer(a, b, c, flag)
        real(kind=4), intent(in)  :: a, b
        real(kind=4), intent(out) :: c
        character(len=3), intent(out) :: flag

        if (a > b) then
            c = a
            flag = "a>b"
        else if (a < b) then
            c = b
            flag = "a<b"
        else
            c = a
            flag = "a=b"
        end if

    end subroutine comparer

end module compare
