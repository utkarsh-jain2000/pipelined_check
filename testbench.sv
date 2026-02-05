module tb;
    logic clk;
    logic rst;
    logic in_valid;
    logic in_ready;
    logic [31:0] data_in;
    logic out_valid;
    logic out_ready;
  logic [31:0] data_out;
  
    pipeline_check dut (
        .clk(clk),
        .rst(rst),
        .in_valid(in_valid),
        .in_ready(in_ready),
        .data_in(data_in),
        .out_valid(out_valid),
        .out_ready(out_ready),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        clk = 0;
        rst = 1;
        in_valid = 0;
        out_ready = 0;
        data_in = 0;

        #20 rst = 0;

        repeat (5) begin
            @(posedge clk);
            in_valid = 1;
            out_ready = 1;
            data_in = $urandom;
        end

        @(posedge clk);
        in_valid = 0;

        @(posedge clk);
        out_ready = 0;
        repeat (3) @(posedge clk);
        out_ready = 1;
        #40 $finish;
    end

endmodule
