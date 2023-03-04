module IMEM (
    address, inst
);

input [31:0] address;
output [31:0] inst;

reg [7:0] array[1024:0];

//hướng dẫn 32bit được tổng hợp từ các giá trị trong 4 địa chỉ liên tiếp
assign inst = {array[address+3], array[address+2], array[address+1], array[address]};

initial begin
// add x18,x19,x10
array[0] = 8'b00110011;
array[1] = 8'b10001001;
array[2] = 8'b10101001;
array[3] = 8'b00000000;
// addi x15,x1,-50
array[4] = 8'b10010011;
array[5] = 8'b10000111;
array[6] = 8'b11100000;
array[7] = 8'b11111100;
// sw x14, 8(x2)
array[8] = 8'b00100011;
array[9] = 8'b00100100;
array[10] = 8'b11100001;
array[11] = 8'b00000000;
// lw x14, 8(x2)
array[12]  = 8'b00000011;
array[13]  = 8'b00100111;
array[14] = 8'b10000001;
array[15] = 8'b00000000;

// // bne x19,x10,16
// array[16] = 8'b01100011;
// array[17] = 8'b10011000;
// array[18] = 8'b10101001;
// array[19] = 8'b00000000;

//jalr x15,x1,-16
// array[16] = 8'b01100111;
// array[17] = 8'b11000000;
// array[18] = 8'b00001011;
// array[19] = 8'b00000001;

// //jal x5, 16
// array[16] = 8'b11101111;
// array[17] = 8'b00000010;
// array[18] = 8'b00000000;
// array[19] = 8'b00000001;

// lui x10, 0xEDAB3
array[16] = 8'b00110111;
array[17] = 8'b00110101;
array[18] = 8'b10101011;
array[19] = 8'b11101101;

end


endmodule