`timescale 10ns / 1ns

module tsync;

reg reset, clk;

wire [7:0]char_count;
wire [11:0]line_count;
wire hsync;
wire vsync;
wire visible;

hvsync hvsync_inst(
	reset,
	clk,
	char_count[7:0],
	line_count[11:0],
	hsync,
	vsync,
	visible
	);

always
    #100 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1'b1;
    #10;
    reset = 1'b0;
end

initial
begin
	#40000000 $finish;
end

initial
begin
    $dumpfile("out.vcd");
    $dumpvars(0,tsync);
end
    
endmodule    
