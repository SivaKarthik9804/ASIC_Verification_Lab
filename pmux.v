module mux#(parameter n=8,parameter sel=3)(
    input [n-1:0]i,
    input [sel-1:0]s,
    output  y
  );
 assign y = i[s];
 endmodule

 module tb;
 parameter n=4;
 parameter sel=2;
   reg [n-1:0]i;
   reg [sel-1:0]s;
   wire y;
   integer pass,fail;
   integer x;
   reg y1;

   mux#(n,sel)dut(i,s,y);

      task mux1(
        input [n-1:0]ti,
        input [sel-1:0]ts
      );
     begin
     i=ti;
     s=ts;
     #10;
     y1 = ti[ts];
     if(y == y1) begin
       $display("pass----> i=%b---> sel=%b---->y=%b",i,s,y);
     pass = pass+1;
   end
     else begin
       $display("fail----> i=%b---> sel=%b---->y=%b",i,s,y);
     fail = fail+1;
   end
     end
   endtask

     
   initial begin
     pass =0;fail=0;
       for(x=0;x<(2**(n+sel));x=x+1)begin
         {i,s} = x;
         mux1(i,s);
         #1;
       end
           $display("-------------------------");
     $display("pass=%0d<---->fail=%0d<---->total=%0d",pass,fail,pass+fail);
   end
 endmodule
