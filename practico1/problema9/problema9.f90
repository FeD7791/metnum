program problema9
    implicit none

    integer, parameter:: pr=8
    ! Moraleja del problema: las operaciones dan distintas segun la precision.
    ! Se obtiene un resultado mas certero en la segunda suma pues suma primero
    ! Numeros mas chicos
    ! En precision simple tenemos unas 7 cifras de precision
    ! En precision doble tenemos unas 15

    ! Otros:
    ! Conversion del numero entero a real de precision pr: real(i, pr)
    ! 0._pr indica la precision del float
    ! 1.123456789_pr lo mismo pero para digitos que vienen despues del punto.
    integer(kind=4)::i
    real(kind=pr)::x, y
    ! Tener cuidado con utilizar el 1 en lugar del 1., si no, nos da 1 por siempre.
    x = 0._pr
    do i = 1, 10000000, 1
        x = x + (1._pr / real(i, pr))
    end do
    write(*, *) x

    y = 0._pr
    do i = 10000000, 1, -1
        y = y + (1._pr / real(i, pr))
    end do
    write(*,*) y

    write(*,*) 1.123456789_pr ! Fiel hasta aca: 1.123456
    ! Con doble: 1.1234567890000000
end program problema9