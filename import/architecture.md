
    ddr_axi_ctrl -------------------
    (Basics)        |               /\
                    |               |
                    \/              |
                ddr_axi_read--->ddr_rd_fifo        
-                   /\              
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
-                   /\              
                    |                 
                    |       
                    \/      
                    -------------
                    |    MIG    |