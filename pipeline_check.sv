module pipeline_check (
    input logic clk,
    input logic rst,
    input logic in_valid,
    output logic in_ready,
  input logic [31:0]data_in,
    output logic out_valid,
    input  logic out_ready,
  output logic [31:0]data_out
);
  logic [31:0] data_q;
  
   logic full;
   assign in_ready = !full || out_ready;
   assign out_valid = full;
   assign data_out  = data_q;
   always_ff @(posedge clk) begin
        if (rst) begin
            full   <= 1'b0;
            data_q <= '0;
        end
        else 
          begin
          if (in_valid && in_ready)
            begin
                data_q <= data_in;
                full   <= 1'b1;
            end
          
            else if (out_ready && full) 
              begin
                full <= 1'b0;
            end
        end
    end

endmodule
