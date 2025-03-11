# -*- coding: utf-8 -*-
"""
Created on Thu Nov  2 13:51:44 2023

@author: mohiu
"""

import hoomd
import hoomd.md
import time
import multiprocessing as mp
import gsd.hoomd
import gsd.fl
import numpy as np
import scipy.io as sio
import os
import random

#import force_field

"""
test parameters to see who the simulations evolve
"""
epi_array=[5]

for epi_ind in range(1,len(epi_array)+1):
   
    g_array=np.linspace(0.2,2,10)
    
    for g_ind in range(1,len(g_array)+1):       #len(g_array)
    
        kT_array=np.linspace(0.2,3.8,10)
        
        for kT_ind in range(1,len(kT_array)+1):  
            
            def simu(arg):
                seed_in = arg
                print(seed_in)
                hoomd.context.initialize("");
                lbox = 10
                nparticles=3                          #int(nlattice[0])*int(nlattice[1])
                m_in = 1.0                            #particle mass
                TMAX= 1e7                             #nb of steps
                d_t=0.1                               #time step
                r_cut_in=4.99                         #cutoff distance for interaction : if r>=r_cut, there is no interaction
                alpha_in=1.2
                re=1                                  #equilibrium bonded distance
                epi_in=epi_array[epi_ind-1]
                kT_in=kT_array[kT_ind-1]                               #thermal noise, you might want to increase it a little to add some noise
                gamma_in =g_array[g_ind-1]            #drag coefficient in langevin equation, it's not set to 0 to avoid divergence, but if you set the thermal noise to 0 you should also put the drag at 0
                
                ### Initialize the lattice with random initial positions
                
                hoomd.init.create_lattice(unitcell=hoomd.lattice.unitcell(N=nparticles,a1=[lbox,0,0],a2=[0,lbox,0],a3=[0,0,1]\
                     ,dimensions=2,type_name = ['A', 'B', 'C'],position=[[lbox*(random.random()-0.5),lbox*(random.random()-0.5),0]\
                            for var in range(nparticles)],mass=[m_in for i in range(nparticles)]),n=1)     #, n=[int(nlattice[0]), int(nlattice[1])]);
                
                hoomd.md.update.enforce2d
            
                # special force, potential
                
                nl = hoomd.md.nlist.cell(r_buff=False)
                morse = hoomd.md.pair.morse(r_cut=r_cut_in, nlist=nl)
                morse.pair_coeff.set('A', 'A', D0=epi_in, alpha=alpha_in, r0=re, r_cut=r_cut_in)
                morse.pair_coeff.set('A', 'B', D0=epi_in, alpha=alpha_in, r0=re, r_cut=r_cut_in)               # particle A and B have a harmonic interaction
                morse.pair_coeff.set('A', 'C', D0=0.0, alpha=alpha_in, r0=re, r_cut=r_cut_in)                  # particle A and C have no interaction
                morse.pair_coeff.set('B', 'B', D0=epi_in, alpha=alpha_in, r0=re, r_cut=r_cut_in)
                morse.pair_coeff.set('B', 'C', D0=epi_in, alpha=alpha_in, r0=re, r_cut=r_cut_in)               # particle B and C have a harmonic interaction
                morse.pair_coeff.set('C', 'C', D0=epi_in, alpha=alpha_in, r0=re, r_cut=r_cut_in)
                morse.enable()
                hoomd.md.integrate.mode_standard(dt=d_t);
                all = hoomd.group.all();
                obj1 = hoomd.md.integrate.langevin(group=all, kT=kT_in, seed=seed_in);                            #integration of system
                obj1.set_gamma(a='A',gamma=gamma_in)
                obj1.set_gamma(a='B',gamma=gamma_in)
                obj1.set_gamma(a='C',gamma=gamma_in)
                hoomd.dump.gsd(f"trajectory_{seed_in}.gsd", period=1, group=all, overwrite=True, dynamic=["momentum"]); #save trajectory to "trajectory_seed.gsd"
                hoomd.run(TMAX);
            
                t=gsd.hoomd.open(name=f"trajectory_{seed_in}.gsd", mode='r')
            
                vx=np.zeros((nparticles,int(TMAX)))
                vy=np.zeros((nparticles,int(TMAX)))
            
                xdata=np.zeros((nparticles,int(TMAX)))
                ydata=np.zeros((nparticles,int(TMAX)))
            
                for i in range(0,len(t)):
                    p = t[i].particles
                    v = p.velocity
                    pos = p.position
                    vx[:,i]=v[:,0]
                    vy[:,i]=v[:,1]
                    xdata[:,i]=pos[:,0]
                    ydata[:,i]= pos[:,1]
                        
                sio.savemat('result_3_parts/l_10_epi_'+str(epi_in)+'_g_'+str(g_ind)+'_dt_'+str(d_t)+'_kT_'+str(kT_ind)+'_trail_'+str(seed_in)+'.mat',\
                            {'vx':vx,'vy':vy})
                os.remove(f"trajectory_{seed_in}.gsd")
            
            
            if __name__ == '__main__' :
                ti = time.time()
                proc = []
                args =  (s for s in range(1,21)) # increase number of trails by changing 1
                nb_threads = os.cpu_count()*2
                for arg in args :
                    while len(proc)>=nb_threads:
                        proc = [p for p in proc if p.is_alive()]
                        if len(proc)>=nb_threads :
                            time.sleep(0.1)
                    proc.append(mp.Process(target = simu,args = (arg,)))
                    proc[-1].start()
                for pro in proc :
                    pro.join()
                print(time.time()-ti)
            
