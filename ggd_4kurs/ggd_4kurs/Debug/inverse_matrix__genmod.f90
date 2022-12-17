        !COMPILER-GENERATED INTERFACE MODULE: Tue Dec 13 20:26:29 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INVERSE_MATRIX__genmod
          INTERFACE 
            SUBROUTINE INVERSE_MATRIX(A,C,N)
              INTEGER(KIND=4) :: N
              REAL(KIND=4) :: A(N,N)
              REAL(KIND=4) :: C(N,N)
            END SUBROUTINE INVERSE_MATRIX
          END INTERFACE 
        END MODULE INVERSE_MATRIX__genmod
