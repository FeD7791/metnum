module funciones

use preci

contains

	real(pr) function x(t)

	implicit none

	real(pr) :: g	! en m/s**2
	real(pr) :: vxini, vyini
	real(pr) :: t

	common/veloc/vxini,vyini,g

	x=vxini*t
	
	end function


	real(pr) function y(t)

	implicit none

	real(pr) :: g	! en m/s**2
	real(pr) :: vxini, vyini
	real(pr) :: t

	common/veloc/vxini,vyini,g

	y=vyini*t - 0.5_pr*g*t**2
	
	end function


	real(pr) function vx(t)

	implicit none

	real(pr) :: g	! en m/s**2
	real(pr) :: vxini, vyini
	real(pr) :: t

	common/veloc/vxini,vyini,g

	vx=vxini
	
	end function


	real(pr) function vy(t)

	implicit none

	real(pr) :: g	! en m/s**2
	real(pr) :: vxini, vyini
	real(pr) :: t

	common/veloc/vxini,vyini,g

	vy=vyini - g*t
	
	end function

end module funciones

