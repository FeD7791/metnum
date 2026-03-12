program problema5
implicit none

real        :: A,B,C,D,E,F,G

A = 5/2 + 20/6
B = 4*6/2 - 15/2
C = 5*15/2/(4-2)
D = 1+1/4
E = 1.+1/4
F = 1+1./4
G = 1.+1./4.

write(*,*)'5/2 + 20/6 =', A
write(*,*)'4*6/2 - 15/2 =', B
write(*,*)'5*15/2/(4-2) =', C
write(*,*)'1+1/4 =', D
write(*,*)'1.+1/4 =', E
write(*,*)'1+1./4 =', F
write(*,*)'1.+1./4. =', G

end program
