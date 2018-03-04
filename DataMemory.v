module dataMemory (address,writeData,readData,memWrite,memRead,clk);
  
  input [31:0] address, writeData;
    input memWrite,memRead,clk;
    output reg [31:0] readData ;
    reg [31:0] DMEMORY [0:1023] ; //1k words of 32 bit memory 
    
    initial 
      begin
        
        DMEMORY[0]<=1;
        DMEMORY[1]<=2;
        DMEMORY[2]<=100;
        DMEMORY[3]<=-500;
        DMEMORY[4]<=300;
        DMEMORY[16]<=16;
        DMEMORY[17]<=17;
        DMEMORY[18]<=18;
        DMEMORY[19]<=19; 
        DMEMORY[21]<=21; 
        DMEMORY[22]<=22;
        DMEMORY[23]<=23;
        DMEMORY[24]<=24;
        DMEMORY[25]<=25;
        DMEMORY[26]<=26;
        DMEMORY[27]<=27;
        DMEMORY[28]<=28;
        DMEMORY[29]<=29;
        DMEMORY[30]<=30;
        DMEMORY[31]<=31;
        DMEMORY[39]<=39;
        DMEMORY[33]<=33;
        DMEMORY[32]<=32;
        DMEMORY[34]<=34;
        DMEMORY[44]<=44;
      end
    always @(address)
      begin
        if(memRead==1'b1)
         readData <= DMEMORY[address] ;       
      end
       always @(negedge clk)
           begin
         if (memWrite==1'b1)
             DMEMORY[address]<=writeData;   
           end        
        endmodule
