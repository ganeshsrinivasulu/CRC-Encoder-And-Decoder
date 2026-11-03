module CRC_Encoder(
    input [7:0] data_in,
    output [11:0] code_out
);
    reg [3:0] crc;
    integer i;
    always @(*) begin
        crc = 0;
        for(i=7; i>=0; i=i-1) begin
            if(crc[3] ^ data_in[i])
                crc = {crc[2:0], 1'b0} ^ 4'b1011;
            else
                crc = {crc[2:0], 1'b0};
        end
    end
    assign code_out = {data_in, crc};
endmodule