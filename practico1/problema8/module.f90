module baskhara
    implicit none
    
contains
    subroutine baskhara_(a,b,c, x1, x2)
        real(kind=4),intent(in)::a,b,c
        real(kind=4),intent(out)::x1,x2

        x1 = (-b + sqrt(b**2 - 4*a*c)) / 2*a
        x2 = (-b - sqrt(b**2 - 4*a*c)) / 2*a
    end subroutine baskhara_
end module baskhara