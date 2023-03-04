module dmem (
    clk, address, WriteData, ReadData, MemRW
);

input clk, MemRW;
input [31:0] address, WriteData;
output [31:0] ReadData;
reg [31:0] r;

reg [7:0] array [31:0];

always @(posedge clk) begin
    if (MemRW) begin // chia dữ liệu 32bit thành các mảnh 8bit rồi ghi
		array[address] = WriteData[7:0];
		array[address+1] = WriteData[15:8];
		array[address+2] = WriteData[23:16];
		array[address+3] = WriteData[31:24];
    end
end

always @(*) begin // đọc dữ liệu 32bit từ địa chỉ cơ sở
    r = {array[address+3], array[address+2], array[address+1], array[address]};
end

assign ReadData = r;

initial begin
        array[0] = 8'd10;
        array[1] = 8'd20;
        array[2] = 8'd30;
        array[3] = 8'd40;
        array[4] = 8'd50;
        array[5] = 8'd60;
        array[6] = 8'd70;
        array[7] = 8'd80;
        array[8] = 8'd90;
        array[9] = 8'd100;
        array[10] = 8'd101;
        array[11] = 8'd102;
        array[12] = 8'd103;
        array[13] = 8'd104;
        array[14] = 8'd105;
        array[15] = 8'd106;
        array[16] = 8'd107;
        array[17] = 8'd108;
        array[18] = 8'd109;
        array[19] = 8'd200;
        array[20] = 8'd201;
        array[21] = 8'd202;
        array[22] = 8'd203;
        array[23] = 8'd204;
        array[24] = 8'd205;
        array[25] = 8'd206;
        array[26] = 8'd207;
        array[27] = 8'd208;
        array[28] = 8'd209;
        array[29] = 8'd300;
        array[30] = 8'd301;
        array[31] = 8'd302;
end

endmodule