#include <iostream>
#include <cmath>
#include <mex.h>
#include <math.h>


using namespace std;



#define a(i,j) a[(i) + (j)*numrows]

void mexFunction(
        int          nlhs,
        mxArray      *plhs[],
        int          nrhs,
        const mxArray *prhs[]
        )
{
    mwSize M;
    double *all_birds_x;
    double *all_birds_y;
    double *r_vals;
    int num_r;

    int bird_num;
    double lbox;
    double r;
    bool *out;
    //inputs: all birds x, all birds y, curr bird x, curr bird y
    //outputs: the hypotenuse

    all_birds_x = mxGetPr(prhs[0]);
    all_birds_y = mxGetPr(prhs[1]);
    bird_num = mxGetScalar(prhs[2]);
    lbox = mxGetScalar(prhs[3]);
    r = mxGetScalar(prhs[4]);



    M = mxGetM(prhs[0]);

    int numrows=M;
    double curr_x=all_birds_x[bird_num-1];
    double curr_y = all_birds_y[bird_num-1];



    // mwSize* numM;
    // numM[0]=M;
    // numM[1]=1;
    // plhs[0] =  mxCreateLogicalArray( 2, numM);
    plhs[0] = mxCreateLogicalMatrix( M, (mwSize)1);

    out = mxGetLogicals(plhs[0]);

    // out = all_birds_x;

    double curr_diffx;
    double curr_diffy;
    double curr_min1;
    double curr_min2;
    for(int s_ind=0; s_ind <M; s_ind++){
        out[s_ind]=0;
        curr_diffx = abs(curr_x - all_birds_x[s_ind]);
        curr_diffy = abs(curr_y - all_birds_y[s_ind]);

        curr_min1 = min(curr_diffx,lbox-curr_diffx);
        curr_min2 = min(curr_diffy,lbox-curr_diffy);
        double curr_dist = sqrt(pow(curr_min1,2)+pow(curr_min2,2));
        if(isless(curr_min1,r) & isless(curr_min2, r)){
            out[s_ind]=isless(curr_dist,r);

        }





        //    out[s_ind]=0.0;


    }

//


    return;
}
