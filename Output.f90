!************************************************************************************************
       SUBROUTINE Output_Fields(IO,NI,NJ,X,Y,U,V,P,R_n,C_f)
         IMPLICIT NONE
 
         INTEGER NI,NJ,IO, j
         REAL,DIMENSION(NI,NJ):: X,Y
         REAL,DIMENSION(NI,NJ):: U,V,P,R_n, C_f
         Write(IO,*) 'VARIABLES = "X", "Y", "U", "V", "P", "RHO", "C_f" ' 
         Write(IO,*) 'ZONE I=',NI,', J=',NJ, ', DATAPACKING=BLOCK'
         Write(IO,'(100E25.16)') X(1:NI,1:NJ) 
         Write(IO,'(100E25.16)') Y(1:NI,1:NJ)
         Write(IO,'(100E25.16)') U(1:NI,1:NJ)
         Write(IO,'(100E25.16)') V(1:NI,1:NJ)
         Write(IO,'(100E25.16)') P(1:NI,1:NJ)
         Write(IO,'(100E25.16)') R_n(1:NI,1:NJ)
         Write(IO,'(100E25.16)') C_f(1:NI,1:NJ)
    END  SUBROUTINE 

!************************************************************************************************
