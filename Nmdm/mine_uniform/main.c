#include<stdio.h>
#include<stdlib.h>
#include<math.h>

#define N 200
#define iter 1000
#define L 11e-6
#define epsi 8.854e-12
#define er 11.7
#define ev 1.602e-19
#define Na 1e20
#define Nd 1e21
#define Vapp 0
#define Kb 1.38e-23
#define T 300
#define Nc 2.8e25
#define Nv 1.04e25
#define Ni 1.5e16
#define muN 0.135 //0.02835
#define muP 0.048 //0.1339
#define tau_n 2e-6
#define tau_p 2e-6
#define delta_x L/(N-1)
#define delta_t 1e-9
#define Eg 1.12

long double F(long double v_prev, long double v_pres, long double v_next, long double n, long double p, int side){
  long double func;
  if (side == 0) func = (v_prev - 2*v_pres + v_next)/pow(delta_x,2) + ev*(-Na + p - n)/(er*epsi);
  else if(side == 1) func = (v_prev - 2*v_pres + v_next)/pow(delta_x,2) + ev*(Nd + p - n)/(er*epsi);
  return func;  
}

int main(){

      long double n[N] = {0};
      long double p[N] = {0};
      long double V[N] = {0};
      
      V[0] = Vapp - Eg - (Kb*T/ev)*log(Na/Nv);
      V[N-1] = (Kb*T/ev)*log(Nd/Nc);
      
      long double jacob_matrix[N][N] = {0};
      long double deltaV_matrix[N] = {0};
      long double rho[N] = {0};
      long double F_matrix[N] = {0};
  
      for(int a=0;a<iter;a++){
      
            for(int b=1;b<N-1;b++){
                  if(b<=(int)((N+1)/2)) F_matrix[b] = (-1)*(F(V[b-1],V[b],V[b+1],n[b],p[b],0));
                  else F_matrix[b] = (-1)*(F(V[b-1],V[b],V[b+1],n[b],p[b],1));
                }
                
            F_matrix[0] = 0;
            F_matrix[N-1] = 0;
                
            jacob_matrix[0][0] = 1;
            jacob_matrix[N-1][N-1] = 1;
                  
            for(int i=1;i<N-1;i++){
                  for(int j=0;j<N;j++){
                        if(fabs(i-j)==1){
                              jacob_matrix[i][j] = 1/pow(delta_x,2);
                            }
                        else if(i==j){
                              jacob_matrix[i][j] = -2/pow(delta_x,2) - pow(ev,2)*(n[i] + p[i])/(er*epsi*Kb*T);
                            }                       
                        }
                    }
                    
            for(int i=0;i<N-1;i++){      
                  for(int j=i+1;j<N;j++){              
                        long double factor = jacob_matrix[j][i]/jacob_matrix[i][i];
                        for(int k=i;k<N;k++){
                              jacob_matrix[j][k] -= factor*jacob_matrix[i][k];
                          }
                        F_matrix[j] -= factor*F_matrix[i];
                    }
              }
                
            for(int p=N-1;p>=0;p--){
                  float sum = 0;
                  for(int q=p+1;q<N;q++){
                        sum += jacob_matrix[p][q]*deltaV_matrix[q];     
                    }
                  deltaV_matrix[p] = (F_matrix[p] - sum)/jacob_matrix[p][p];
              }
            
            deltaV_matrix[0] = 0;
            deltaV_matrix[N-1] = 0;
            
            for(int i=0;i<N;i++){
                  V[i] += deltaV_matrix[i];
              }      
              
            for(int i=0;i<N;i++){
                  n[i] = Nc*exp(ev*V[i]/(Kb*T));
                  p[i] = Nv*exp(-ev*(V[i]+Eg)/(Kb*T));
                  printf("%Le %Le %Le\n",n[i],p[i],V[i]);
              }
                      
            for(int i=0;i<N;i++){
                  for(int j=0;j<N;j++){
                        jacob_matrix[i][j]=0;
                    }
              }
        }
      
      /*for(int i=0;i<N;i++){
            printf("%Le %Le %Le\n",n[i],p[i],V[i]);
      }*/
             
      FILE *nfile = fopen("n.txt", "w");
      FILE *pfile = fopen("p.txt", "w");
      FILE *vfile = fopen("v.txt", "w");

      for(int i = 0; i < N; i++) {
            fprintf(nfile, "%Le\n",n[i]);
            fprintf(pfile, "%Le\n",p[i]);
            fprintf(vfile, "%Lf\n",V[i]);
        }

      fclose(nfile);
      fclose(pfile);
      fclose(vfile);
      
  return 0;
}
