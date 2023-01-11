    SUBROUTINE Progonka(n,a,b,c,d,U)
        INTEGER:: i,j,n
        REAL:: U(n),a(n),b(n),c(n),d(n),alf(n),bet(n)

        alf(1)=-c(1)/b(1);bet(1)=d(1)/b(1)
        DO i=2,n-1
        alf(i)=-c(i)/(b(i)+a(i)*alf(i-1))
        bet(i)=(d(i)-a(i)*bet(i-1))/(b(i)+a(i)*alf(i-1))
        END DO
        
        U(n)=(d(n)-a(n)*bet(n-1))/(b(n)+a(n)*alf(n-1))
        DO i=n-1,1,-1
          U(i)=alf(i)*U(i+1)+bet(i)
        END DO
    END SUBROUTINE
    
    subroutine C_f_calculation(NU, RHO, NI, NJ, dy, U0, U_n, C_f)
    implicit none
    integer NI, NJ, i
    real:: NU, dy, U0
    real:: RHO(NI), U_n(NI,NJ), C_f(NI, NJ)
    do i = 1, NI
    C_f(i, :) = abs(NU*RHO(i)*(3*U_n(i,NJ) - 4*U_n(i,NJ-1) + U_n(i, NJ-2))/(2*dy)/(0.5*RHO(i)*U0**2))   
    end do
    end subroutine 
    
