module functions
    use parameters
    implicit none
    
contains
    !> Converts a number from base 10 to base `b`.
    !!
    !! This function performs an iterative decomposition of a decimal number
    !! into its representation in another base `b`. The algorithm repeatedly
    !! computes the remainder of the division by `b` using the `mod` intrinsic
    !! and stores the resulting digits. The digits are then reversed to obtain
    !! the correct positional order of the representation.
    !!
    !! @param base
    !!   Target base for the conversion. Must be greater than 1.
    !!
    !! @param number
    !!   Decimal number to be transformed.
    !!
    !! @return transformed_number
    !!   Value representing the number written in base `b`.
    !!
    !! @note
    !!   The algorithm stores intermediate remainders in the array
    !!   `remainder_values`, which is reversed at the end to recover the
    !!   correct digit order.
    !!
    !! @warning
    !!   This implementation assumes positive inputs and does not
    !!   currently handle negative numbers or fractional bases.
    function transform_from_base_10_to_base_b(base, number) result(transformed_number)

        integer(kind=pr), intent(in) :: base, number
        integer(kind=pr) :: n, remainder, counter
        integer(kind=pr), allocatable :: remainder_values(:)
        character(len=1), allocatable :: transformed_number(:)

        n = number
        counter = 0

        ! count digits
        do while (n > 0)
            n = n / base
            counter = counter + 1
        end do

        allocate(remainder_values(counter))

        n = number
        counter = 1

        do while (n > 0)
            remainder = mod(n, base)
            remainder_values(counter) = remainder
            n = n / base
            counter = counter + 1
        end do

        remainder_values = remainder_values(size(remainder_values):1:-1)

        transformed_number = selector(remainder_values)

    end function

    function transform_from_base_b_to_base_10(number_in_base_b, base) result(number_in_base_10)
        character(len=1), intent(in)::number_in_base_b(:)
        integer(kind=pr), allocatable::number_in_base_b_(:)
        integer(kind=pr), intent(in)::base
        integer(kind=pr)::i
        real(kind=pr)::number_in_base_10
        real(kind=pr)::partial_sum

        number_in_base_b_ = reverse_selector(number_in_base_b)
        partial_sum=0
        do i = size(number_in_base_b), 0 , -1
            partial_sum = partial_sum + number_in_base_b_(size(number_in_base_b)-i)*base**i
        end do
        number_in_base_10 = partial_sum
    end function transform_from_base_b_to_base_10

    function selector(remainder_values_array) result(remainder_values_transformed)
        integer(kind=pr), intent(in)::remainder_values_array(:)
        character(len=1), allocatable:: remainder_values_transformed(:)
        integer(kind=pr)::i
        
        allocate(remainder_values_transformed(size(remainder_values_array)))
        do i=1, size(remainder_values_array), 1
            select case(remainder_values_array(i))
            case(0:9)
                remainder_values_transformed(i) = achar(remainder_values_array(i) + 48)
                ! achar requires +48 cause for example 49 = 1, 50 = 2 etc
            case (10)
                remainder_values_transformed(i) = 'A'
            case (11)
                remainder_values_transformed(i) = 'B'
            case (12)
                remainder_values_transformed(i) = 'C'
            case (13)
                remainder_values_transformed(i) = 'D'
            case (14)
                remainder_values_transformed(i) = 'E'
            case (15)
                remainder_values_transformed(i) = 'F'
            case default
                remainder_values_transformed(i) = '?'
            end select
        end do
    end function selector

    function reverse_selector(chars_array) result(int_values)

        character(len=1), intent(in) :: chars_array(:)
        integer(kind=pr), allocatable :: int_values(:)
        integer(kind=pr) :: i
    
        allocate(int_values(size(chars_array)))
    
        do i = 1, size(chars_array)
    
            select case(chars_array(i))
    
            case ('0':'9')
                int_values(i) = iachar(chars_array(i)) - 48
    
            case ('A')
                int_values(i) = 10
            case ('B')
                int_values(i) = 11
            case ('C')
                int_values(i) = 12
            case ('D')
                int_values(i) = 13
            case ('E')
                int_values(i) = 14
            case ('F')
                int_values(i) = 15
    
            case default
                int_values(i) = -1   ! error value
    
            end select
    
        end do
    
    end function reverse_selector


end module functions