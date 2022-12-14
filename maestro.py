import os                                                                       
from multiprocessing import Pool

processes = ('10m_xaa.sh', '10m_xab.sh', '10m_xac.sh')      

def run_process(process):                                                             
    os.system('bash {}'.format(process))    

pool = Pool(processes=3)                                                        
pool.map(run_process, processes) 
