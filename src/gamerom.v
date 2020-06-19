module gamerom (
  input            clk,
  input [13:0]     addr,
  output reg [7:0] dout,
  input            we_b,
  input [7:0]      din_b,
  input [15:0]     addr_b
);

  parameter MEM_INIT_FILE = "";
   
  reg [7:0] rom [0:16383];

  initial
    if (MEM_INIT_FILE != "")
      $readmemh(MEM_INIT_FILE, rom);
   
  always @(posedge clk) begin
    dout <= rom[addr];
  end

  always @(posedge clk) begin
    if (we_b)
      ram[addr_b] <= din_b;
  end

endmodule
