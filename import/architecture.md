
    ddr_axi_ctrl -------------------
    (Basics)        |               /\
                    |               |
                    \/              |
                ddr_axi_read--->ddr_rd_fifo        
                    /\              
                    |                 
                    |       
                    \/      
                    -------------
                    |    MIG    |

    ddr_axi_ctrl -------------------
    (Basics)        |               |
                    |               |
                    \/              \/
                ddr_axi_write<---ddr_wr_fifo        
                    /\              
                    |                 
                    |       
                    \/      
                    -------------
                    |    MIG    |


**ddr_fifo2out** is responsible for 
1. Processing SIMPLE, DIRECT DDR accessing command (r/w) from outside (*any functional/computing module*)
2. Instruct DDR RD/WR FIFO to perform well

**ddr_axi_top** is instantiation module, exposing SIMPLE, DIRECT DDR accessing command (r/w) to UI.