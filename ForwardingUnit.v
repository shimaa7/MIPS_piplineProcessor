
module forwardUnit ( clk,decodeRS,decodeRT,executeRD,memoryRD,execute_registerWrite ,memory_registerWrite ,muxA,muxB);
  
  
  input execute_registerWrite ,memory_registerWrite,clk ;
  input [4:0] decodeRS,decodeRT,executeRD,memoryRD;
  output reg  [1:0] muxA,muxB;

     
  // EXE HAZARD
  always @(*)
    begin
  
  if ((execute_registerWrite==1)  && ( executeRD !=0) && (( executeRD== decodeRS)|| (executeRD== decodeRT)))  
  
    begin
       muxA <= 2;
       muxB <= 2;  //let alu output goes to the mux 
      
    end
  //MEMORY HAZARD 
  
  else if ( (memory_registerWrite==1) && ( memoryRD !=0) && (( memoryRD ==decodeRS)||(memoryRD==decodeRT))  )
      begin
       muxA <= 1 ;
       muxB <= 1 ; 
       end
      else
        begin
        muxA <= 0 ;
       muxB <= 0 ; 
        end
    end
endmodule
