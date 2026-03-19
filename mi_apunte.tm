<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|FORTRAN>>

  Hoy Vamos a ver:

  <\itemize-dot>
    <item>Arreglos

    <item>Lectura y Apertura de Archivos

    <item>Modulos y Subrutinas , Funciones
  </itemize-dot>

  <section|Contenido>

  <subsection|Arreglos>

  En ambos casos debo tener en cuenta que para escribir datos en el vector o
  matriz tengo que reservar memoria. Las sentencias <verbatim|allocatable> y
  <verbatim|allocate> hacen referencia a esto.

  <strong|Sintaxis declarativa>:

  <verbatim|real(kind=4), allocatable :: vector(:)> ! Para declarar un vector

  <verbatim|real(kind=4), allocatable :: matriz(: , :)> ! Para declarar una
  matriz

  \;

  <strong|Ahora pedimos reservar espacios especificos de memoria>:

  <verbatim|allocate(vector(10))> ! vector de largo 10

  <verbatim|allocate(matriz(10 , 11))> ! matriz de 10 x 11

  \;

  <with|font-series|bold|Asignacion de valores:>\ 

  <verbatim|vector(1) = 10>

  <verbatim|vector(2) = 11>

  <text-dots>

  <verbatim|matriz(1,1) = 9>

  <verbatim|matriz(1,2) = 3>

  <verbatim|deallocate>(<verbatim|vector>)\ 

  <verbatim|deallocate>(<verbatim|matriz>)

  <subsection|Lectura y escritura>

  <subsubsection|Datos>

  Las instrucciones de lectura y escritura son las siguientes:

  <\itemize-minus>
    <item>print *, var1, var2

    <item>write(* , <with|color|blue|*>) (O bien write(6, *) ) var1 , var2

    <item>read(<with|color|red|*> , *) (O bien read(5, *)) var1, var2
  </itemize-minus>

  En general con write nos va a interesar poder escribir con un determinado
  formato.

  <verbatim|write(*, '(<with|color|blue|F><with|color|red|4>.<with|color|dark
  green|1>,"+",F4.1,"i")') x1,x2>

  <\itemize-dot>
    <item>Formato Punto Fijo: F10.4\ 

    <item>Formato Punto Flotante (notacion exponencial): En.d

    <item>Entero: In\ 
  </itemize-dot>

  Como escribir n numeros con el mismo formato:

  <verbatim|write(*,'(<with|color|red|5>F6.2)') a, b, c, d, e>

  <strong|Agregar espacios y cambios de linea>:

  Espacios: Se agrega nX , para agregar n espacios.

  <verbatim|write(*,'(F6.2,<with|color|red|1X>,F6.2,<with|color|red|1X>,F6.2)')
  a, b, c>

  <strong|Cambios de linea> /

  <verbatim|write(*,'(F6.2,<with|color|red|/>,F6.2,/,F6.2)') a, b, c>

  <strong|Continuacion de linea> <with|color|red|&>

  <\verbatim>
    write(20,*) ``This is a very long line that we want to ''<with|color|red|
    //&>

    "continue on the next line"
  </verbatim>

  write(20,*)

  write(20,*)

  write(20,*)

  write(20,*)

  <strong|Concatenar>: Unir variables tipo string en una sola

  Mantencion de linea (signo peso)

  23

  F4.1 \U\<gtr\> 023.0

  F6.2 \U\<gtr\> 0023.00

  <subsubsection|Archivos>

  Sintaxis:

  <\verbatim>
    <with|color|red|open>(20, file='path/<abbr|>archivo.dat',
    status='unknown', action='write', position='append')
  </verbatim>

  Buena practica: Empezar desde el 10, y ordenadamente en adelante.

  a = integer

  newunit : le dice a open que es una nueva unidad.

  unit: el archivo ya existe

  <verbatim|<with|color|red|open>(newunit=a, file='path/<abbr|>archivo.dat',
  status=\<less\>status\<gtr\>, action=\<less\>action\<gtr\>,
  position=\<less\>position\<gtr\>)>

  <verbatim|<with|color|red|open>(unit=a, file='path/<abbr|>archivo.dat',
  status=\<less\>status\<gtr\>, action=\<less\>action\<gtr\>,
  position=\<less\>position\<gtr\>)>

  <verbatim|close (\<less\>numero\<gtr\>)>

  \;

  Elementos:

  <\itemize-minus>
    <item>\<less\>numero\<gtr\> : integer, distinto de 0 ,5 y 6

    <item>'path/<abbr|>archivo.dat' : character

    <item>\<less\>status\<gtr\> es uno de los siguientes:

    <\itemize-minus>
      <item>'unknown' : Si no existe lo crea y si ya existe lo mantiene

      <item>'old' : Asume que el archivo existe, si no, da error

      <item>'new' : Asume que el archivo no existe, si ya existe lo pisa

      <item>'replace' : Reemplaza el archivo existente por uno nuevo
    </itemize-minus>

    <item>\<less\>action\<gtr\> es uno de los siguientes:

    <\itemize-minus>
      <item>'readwrite'

      <item>'read'

      <item>'write'
    </itemize-minus>

    <item>\<less\>position\<gtr\> es alguno de los siguientes:

    <\itemize-minus>
      <item>'asis'

      <item>'rewind' : Se mueve a la primera linea

      <item>'append' : linea posterior a la ultima
    </itemize-minus>
  </itemize-minus>

  <strong|No hacer esto>

  do i=1, 100, 1

  open(20<text-dots>)

  close(20)

  end do

  <subsection|Subrutinas, Modulos, Funciones>

  sqrt(15)

  Jerarquia:

  <\itemize-dot>
    <item>En main (Funciones, subrutinas) (Las subrutinas pueden contener
    varias funciones)

    <item>Modulo (archivo separado siempre) (Puede contener varias
    subrutinas)

    <item>Las funciones pueden estar afuera de subrutinas.

    <item>Permite orden y legibilidad

    <item>No hay palabras reservadas en fortran, tratar de no pisar palabras
    conocidas como real, integer, etc

    <item>La funcion idealmente no debe cambiar las variables de entrada.

    <item>Las subrutinas en cambio si pueden cambiar el estado de las
    variables de entrada.

    <item>Las variables en subrutinas funciones y modulos son variables
    mudas!

    <item>Documentar las variables que utilicen.
  </itemize-dot>

  \<gtr\> Main program

  \<gtr\> Modulos \<less\> \U funciones y subrutinas

  \<gtr\> Llamenlas o usenlas en el Main

  <subsubsection|Subrutinas>

  <\verbatim>
    subroutine square_sub(x, result)

    real, <with|color|red|intent(in)> :: x

    real,<with|color|red| intent(out)> :: result

    real:: a,b,c

    result = x**2

    end subroutine square_sub
  </verbatim>

  Forma de uso: En el programa principal:

  <verbatim|use \<less\>modulo\<gtr\>>

  implicit none

  <verbatim|<strong|call> square_sub(3.0, y)>

  \<gtr\> Dos subrutinas en el mismo modulo se pueden llamar.

  <subsubsection|Modulos>

  <\verbatim>
    module \<less\>nombre\<gtr\>

    \ \ \ \ use \<less\>otro modulo eventual\<gtr\>

    \ \ \ \ implicit none ! Es un archivo nuevo!

    \ \ \ \ 

    contains

    \ \ \ \ \<less\>funciones\<gtr\>

    \ \ \ \ \<less\>subrutinas\<gtr\>

    end module \<less\>nombre\<gtr\>
  </verbatim>

  <subsubsection|Funciones>

  <\verbatim>
    \ \ \ \ function vector_n(n_range) result(vector_1)

    \ \ \ \ \ \ \ \ integer(kind=4), <with|color|red|intent(in)> :: n_range

    \ \ \ \ \ \ \ \ integer(kind=4)::i

    \ \ \ \ \ \ \ \ real(kind=pr), allocatable :: vector_1(:)

    \;

    \ \ \ \ \ \ \ \ allocate(vector(n_range))

    \ \ \ \ \ \ \ \ <with|color|red|return >! Exit anticipado

    \ \ \ \ \ \ \ \ do i=1, n_range, 1

    \ \ \ \ \ \ \ \ \ \ \ \ if (mod(i,2)==0) then

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ vector(i)=2

    \ \ \ \ \ \ \ \ \ \ \ \ else

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ vector(i)=3

    \ \ \ \ \ \ \ \ \ \ \ \ end if

    \ \ \ \ \ \ \ \ end do

    \ \ \ \ end function vector_n
  </verbatim>

  \;

  En el programa principal la llamamos como:

  use modulo

  implicit none

  <verbatim|variable = vector_n(n_range=variable0)>

  Claramente variable debe ser del mismo tipo que el resultado (vector) de la
  funcion.

  <section|Ejemplo Minimalista>

  En este ejemplo:

  <\itemize-dot>
    <item>modulo1: Contiene la variable de asignacion de precision

    <item>modulo2: Contiene funciones y subrutinas

    <item>programa principal

    <item>Script
  </itemize-dot>

  <subsection|modulo1>

  <\verbatim>
    module precision

    \ implicit none

    \ integer, parameter::pr=4

    end module precision
  </verbatim>

  <subsection|modulo2>

  <\verbatim>
    module funciones

    \ use precision

    \ implicit none

    contains

    \ ! En estos ejemplos las dos primeras funciones hacen practicamente lo
    mismo

    \ ! Una lo hace con sintaxis de funcion

    \ ! La otra lo hace con sintaxis de subrutina

    \ function sumar_elementos_funcion(arr) result(result)

    \ ! Funcion que Suma los elementos del arreglo arr

    \ real(kind=pr), intent(in) :: arr(:)

    \ real(kind=pr)::result

    <next-line>

    \ result = arr(1) + arr(2) + arr(3)

    \ end function sumar_elementos_funcion

    <next-line>

    \ subroutine sumar_elementos_subrutina(arr, result)

    \ ! Subrutina que Suma los elementos del arreglo arr

    \ real(kind=pr), intent(in) :: arr(:)

    \ real(kind=pr), intent(out) :: result

    <next-line>

    \ result = arr(1) + arr(2) + arr(3)

    \;

    \ end subroutine sumar_elementos_subrutina

    <next-line>

    \ subroutine write_in_file(arr)

    \ ! Escribe en un archivo data.dat (carpeta local) el arreglo arr

    \ real(kind=pr), intent(in):: arr(:)

    <next-line>

    \ open(10, file="data.dat", status='unknown')

    \ write(10, ``(3F8.2)") arr

    \ close(10)

    \ end subroutine write_in_file

    <next-line>

    end module funciones
  </verbatim>

  <subsection|Programa principal>

  Notas: Recuerde que para usar los elementos alojados en el modulo, debe
  incluirlos usando <strong|use> antes de implicit none.

  Programa principal:

  <\verbatim>
    program ejemplo

    \ use precision

    \ use funciones

    \ implicit none

    \;

    \ real(kind=pr):: a, b, c

    \ real(kind=pr), allocatable:: arr(:)

    \ write(*,*) ``ingrese 3 numeros"

    \ read(*,*) a, b, c

    <next-line>

    \ allocate(arr(3))

    \ arr(1)=a

    \ arr(2)=b

    \ arr(3)=c

    <next-line>

    \ call write_in_file(arr=arr)

    <next-line>

    end program ejemplo
  </verbatim>

  <subsection|Script>

  Se utiliza para ejecutar cualquier comando de terminal bash.

  <\verbatim>
    gfortran modulo_1.f90 modulo_2.f90 programa_ejemplo.f90 -o ejem.x

    ./ejem.x
  </verbatim>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-10|<tuple|2|?|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-11|<tuple|2.1|?|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-12|<tuple|2.2|?|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-13|<tuple|2.3|?|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-14|<tuple|2.4|?|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-4|<tuple|1.2.1|1|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-5|<tuple|1.2.2|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-6|<tuple|1.3|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-7|<tuple|1.3.1|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-8|<tuple|1.3.2|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-9|<tuple|1.3.3|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Contenido>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Arreglos
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Lectura y escritura
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Datos
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Archivos
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Subrutinas, Modulos,
      Funciones <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.3.1<space|2spc>Subrutinas
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.3.2<space|2spc>Modulos
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|1.3.3<space|2spc>Funciones
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>
    </associate>
  </collection>
</auxiliary>