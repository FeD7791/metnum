program problema09_sumatoria

    implicit none
    integer, parameter      :: pr=4
    real(pr)                :: suma1,suma2,m,suma3
    integer                 :: n,nmax
    
    nmax=10000000
    
    suma1=0._pr
    suma2=0._pr
    
    do n=1,nmax
        suma1=suma1+1._pr/(1._pr*n)
    enddo
    
    
    
    write(*,*)suma1
    
    suma3=0._pr
    m=1._pr
    
    do while(m<=10000000._pr)
      suma3=suma3+1._pr/m
      m=m+1._pr
    enddo
    
    
    
    write(*,*)suma3
    
    do n=nmax,1,-1
        suma2=suma2+1._pr/real(n,pr)
    enddo
    
    write(*,*)suma2
    
    end program