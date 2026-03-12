program tiro_oblicuo

use preci

use funciones

implicit none

real(pr)		     :: g		        ! en m/s**2
real(pr)                    :: vxini, vyini		! en m/s
real(pr)                    :: vini, tita_deg, tita_rad
real(pr)                    :: tfinal, t, deltat	! en s
real(pr), parameter	     :: pi=acos(-1._pr)
real(pr)                    :: deg_2_rad = 2._pr*pi/360._pr
integer(8)                  :: i
character(40)               :: salida


common/veloc/vxini,vyini,g


g=9.8_pr		       ! en m/s**2


salida='./datos/salida_tiro_oblicuo.dat'

open(20,file=salida)


write(*,*)'ingrese la velocidad inicial (en m/s)'
read(*,*)vini
write(*,*)'ingrese el angulo (en grados)'
read(*,*)tita_deg


tita_rad=tita_deg*deg_2_rad


write(*,*)'vini=',vini,'; tita_deg=',tita_deg 
write(*,*)'tita_rad=',tita_rad

vxini=vini*cos(tita_rad)
vyini=vini*sin(tita_rad)


tfinal= 2._pr*vyini/g

deltat=tfinal/600._pr


write(*,*)'vxini=',vxini,'; vyini=',vyini,'; t_final =',tfinal


t=0._pr

write(20,*)'# tiempo		x		  y		  vx		  vy'

do i=0,600
	write(20,10)t,x(t),y(t),vx(t),vy(t)
	t=t+deltat
enddo

10	format(5e15.6)

 close(20)
 
 
end program tiro_oblicuo


