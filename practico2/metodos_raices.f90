module raices
    implicit none
    integer, parameter::pr=4


    abstract interface
        function funcion_tipo(x)
            import pr
            real(kind=pr) :: funcion_tipo
            real(kind=pr), intent(in) :: x
        end function funcion_tipo
    end interface



contains






!> Evalúa si se cumple un criterio de detención basado en un método de error.
!! 
!! Esta función selecciona un tipo de error a partir del string `method`
!! y evalúa si cumple la condición de corte utilizando `detention_criteria`.
!!
!! Métodos disponibles:
!! - "abs_err"  : error absoluto entre iteraciones
!! - "rel_err"  : error relativo
!! - "abs_func" : valor absoluto de la función evaluada
!! - "max_iter" : número máximo de iteraciones (esperado en err_array)
!!
!! @param[in] err_array  Arreglo de errores. Se espera:
!!                      err_array(1) -> error absoluto
!!                      err_array(2) -> error relativo
!!                      err_array(3) -> error funcional
!!                      err_array(4) -> contador de iteraciones (opcional)
!!
!! @param[in] method     String que indica el criterio a utilizar
!! @param[in] condition  Umbral de tolerancia para el criterio
!!
!! @return b_crit        `.true.` si se cumple el criterio de detención,
!!                      `.false.` en caso contrario
!!
    function error_criteria_handler(err_array, method, &
        condition) result(b_crit)

        character(len=*), intent(in)::method
        real(kind=pr), intent(in)::err_array(:)
        real(kind=pr), intent(in)::condition
        logical::b_crit

        SELECT CASE(method)
        CASE("abs_err")
            b_crit = detention_criteria(value=err_array(1), condition=condition)
        CASE("rel_err")
            b_crit = detention_criteria(value=err_array(2), condition=condition)
        CASE("abs_func")
            b_crit = detention_criteria(value=err_array(3), condition=condition)
        CASE("max_iter")
            b_crit = detention_criteria(value=err_array(4), condition=condition)
        END SELECT
    
    end function error_criteria_handler












!> Genera distintos tipos de error entre dos iteraciones consecutivas.
!!
!! Calcula:
!! - Error absoluto: |an1 - an0|
!! - Error relativo: |an1 - an0| / |an1|
!! - Error funcional: |f(an1)|
!!
!! @param[in] an0   Valor anterior de la iteración
!! @param[in] an1   Valor actual de la iteración
!! @param[in] func  Función a evaluar (interfaz `funcion_tipo`)
!!
!! @return err      Arreglo de tamaño 3 con:
!!                  err(1) -> error absoluto
!!                  err(2) -> error relativo
!!                  err(3) -> error funcional
!!
    function error_generator(an0, an1, func) result(err)
        ! Retorna los errores absouto, relativo y funcional absoluto
        real(kind=pr), intent(in):: an0, an1
        real(kind=pr)::err_abs, err_rel, err_func
        real(kind=pr), dimension(3):: err
        procedure(funcion_tipo) :: func

        err_abs = abs(an1 - an0)
        err_rel = err_abs / abs(an1)
        err_func = abs(func(an1))

        err(1) = err_abs
        err(2) = err_rel
        err(3) = err_func

    end function error_generator









!> Evalúa si un valor cumple una condición de tolerancia.
!!
!! Retorna `.true.` si `value <= condition`, lo que típicamente
!! indica que se alcanzó el criterio de convergencia.
!!
!! @param[in] value      Valor a evaluar
!! @param[in] condition  Umbral de tolerancia
!!
!! @return cond_res      Resultado lógico de la evaluación
!!
    function detention_criteria(value, condition) result(cond_res)
        real(kind=pr), intent(in)::value, condition
        logical::cond_res


        if (value <= condition) then
            cond_res = .true.
        else
            cond_res = .false.
        end if

    end function detention_criteria


    function iteracion_punto_fijo(func, x0, nmax, tol) result(resultado)
        ! Variables de entrada
        ! func(function) : Funcion a realizar la iteracion de punto fijo
        ! x0(real) : Punto inicial para realizar la iteracion punto fijo
        ! n(integer) : Numero maximo de iteraciones para realizar el algoritmo
        ! tol(real) : Tolerancia minima para la convergencia.
        real(kind=pr), intent(in) :: x0, tol
        integer:: nmax
        procedure(funcion_tipo) :: func

        ! Variable de salida
        ! resultado(allocatable(:,:)) : Matriz 2 x i donde la primera fila
        ! contiene errores y la seguna fila los valores.
        real(kind=pr), allocatable :: resultado(:,:)

        ! Variables internas
        integer::i !Contador para el ciclo do while
        real(kind=pr):: fn, x, error !Variables de guardado parciales
        real(kind=pr),allocatable::error_arr(:), values_arr(:) !arreglos de
        ! guardado parciales.

        call punto_fijo_teoremas() ! Recordamos las condiciones de punto fijo.
        ! 1. Inicializo las variables de arreglo para guardar
        allocate(error_arr(nmax))
        allocate(values_arr(nmax))
        ! 2.
        i = 1 ! Inicio contador
        x = func(x0) ! Cargo el primer valor
        values_arr(1) = x

        do while(i<=nmax)
            ! Este ciclo se ejecute mientras no se alcance la tolerancia.
            fn = func(x)

            ! Calculo el error utilizado en la condicion de tolerancia
            error = abs(fn - x)

            ! Guardo el error (para graficar mas tarde)
            error_arr(i) = error

            ! Concidionante if para detener el ciclo
            if (error < tol) then
                exit
            end if

            ! Progresion del siguiente termino de la sucesion del algoritmo.
            i = i + 1
            x = fn
            values_arr(i) = fn
        end do
        if (i==nmax) then
            ! Condicion que indica que el metodo ha fallado.
            write(*,*) "El metodo no converge para", nmax , "iteraciones"
        else
            ! Si el metodo es exitoso preparamos la salida en forma de un
            ! arreglo de errores y valores
            ! El ultimo valor de resultado(2,:) es la mejor raiz.
            allocate(resultado(2, i))
            resultado = retrieve_arr(error_arr, values_arr, i)
        end if
    end function iteracion_punto_fijo

    function retrieve_arr(error_arr, values_arr, n) result(return_array)
        real(kind=pr), intent(in):: error_arr(:), values_arr(:)
        integer, intent(in)::n
        real(kind=pr), allocatable:: return_array(:,:)

        allocate(return_array(2, n))

        return_array(1,:) = error_arr(1:n)
        return_array(2,:) = values_arr(1:n)

    end function retrieve_arr


    function linspace(a, b, n) result(x)
        real(kind=pr), intent(in) :: a, b
        integer, intent(in) :: n
        real(kind=pr), allocatable :: x(:)
    
        integer :: i
        real(kind=pr) :: step
    
        if (n <= 1) then
            allocate(x(1))
            x(1) = a
            return
        end if
    
        allocate(x(n))
    
        step = (b - a) / real(n - 1, kind=pr)
    
        do i = 1, n
            x(i) = a + (i - 1) * step
        end do
    end function linspace

    subroutine punto_fijo_teoremas()
        write(*,*) "Condiciones suficientes para iteracion punto fijo:"
        write(*,*) "i) Domf = [a,b] e Imf = [a,b]"
        write(*,*) "ii) Si g'(x) existe en (a,b) y existe 0<k<1 tal que:"
        write(*,*) "|g(x)| <= k entonces hay exactmene un punto fijo en [a,b]"
    
        
    end subroutine punto_fijo_teoremas

    subroutine plotter(func, x)
        real(kind=pr),intent(in)::x(:)
        procedure(funcion_tipo) :: func
        ! Variables internas
        integer::i
        real(kind=pr), allocatable::arr(:)
        allocate(arr(size(x)))

        do i=1,size(x),1
            arr(i) = func(x(i))
        end do

        open(34, file="plot_data.dat")
        do i=1, size(arr), 1
            write(*,*) x(i), arr(i)
        end do
        close(34)
        call write_gnuplot_script("script.gp")
    end subroutine plotter

    subroutine write_gnuplot_script(filename)
        implicit none
        character(len=*), intent(in) :: filename
        integer :: unit
    
        unit = 20
    
        open(unit=unit, file=filename, status='replace', action='write')
    
        write(unit,*) 'set terminal pngcairo size 800,600'
        write(unit,*) 'set output "plot.png"'
        write(unit,*) 'set xlabel "X"'
        write(unit,*) 'set ylabel "Y"'
        write(unit,*) 'set title "Mi grafico"'
        write(unit,*) 'plot "plot_data.dat" using 1:2 with lines lw 2 title "datos"'
    
        close(unit)
    end subroutine write_gnuplot_script

    subroutine classic_newton(func, der_func, method, cond)
        character(len=*), intent(in):: method
        real(kind=pr), intent(in):: cond
        integer::i
        real(kind=pr):: xn0, xn1
        real(kind=pr),dimension(3)::err_arr
        real(kind=pr),dimension(4)::err_arr_
        logical::bool_cond_value
        procedure(funcion_tipo) :: func
        procedure(funcion_tipo) :: der_func



        bool_cond_value = .true.
        i = 1
        open(unit=43, file="results.dat", status="unknown")
        do while(bool_cond_value)
            xn1 = (xn0 - func(xn0)) / der_func(xn0)

            err_arr = error_generator(xn0, xn1, func)
            err_arr_(1:3) = err_arr
            err_arr_(4) = real(i)

            bool_cond_value = error_criteria_handler(err_arr_, method, cond)

            write(43, *) err_arr_
            i = i + 1
        end do
        close(43)

    end subroutine classic_newton


end module raices