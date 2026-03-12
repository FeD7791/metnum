program cambio_de_base

implicit none
integer 			:: n,b,i,cociente,resto,nd,j,ninputs
integer, dimension(1:50)	:: digitos
character(len=50) 		:: resultado
character(len=1) 		:: d	

do ninputs=1,20

	write(*,*)'Ingrese la nueva base: b. (0 para terminar)'
	read(*,*)b

	if(b==0) exit 

	do while(b>16.or.b<2)
		write(*,*)'Por favor, que sea un numero entero entre 2 y 16'
		write(*,*)'Ingrese la nueva base: b. (0 para terminar)'
		read(*,*)b
		
	enddo
	
	
	write(*,*)'Ingrese el numero natural, n,' 
	write(*,*)'que desea convertir a la base b.'
	read(*,*)n

	write(*,*)' '

	resto=n
	cociente=0
	i=0
	do while(n>0)
		i=i+1	
		cociente=n/b
!		resto=n-cociente*b
		resto=mod(n,b)
		write(*,*)'numero=',n,'; cociente=',cociente,'; resto=',resto
		n=cociente
		digitos(i)=resto
	enddo
	nd=i

	write(*,*)' '
	write(*,*)(digitos(i),i=nd,1,-1)
	write(*,*)' '

	resultado=''

	do i=1,nd
		j=digitos(i)
		select case(j)
   		    case(10)
        		d='a'
    		case(11)
        		d='b'
    		case(12)
        		d='c'
    		case(13)
        		d='d'
    		case(14)
        		d='e'
    		case(15)
        		d='f'
    		case default
                	write(d,'(I1)')j
		end select
		
		resultado=d//resultado
	enddo

	write(*,*)resultado   
enddo 

end	
