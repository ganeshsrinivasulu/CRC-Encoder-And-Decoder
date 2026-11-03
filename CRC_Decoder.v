module CRC_Decoder(
    input [11:0] code_in,
    output [7:0] data_out,
    output error
);
    reg [3:0] crc;
    integer i;
    always @(*) begin
        crc = 0;
        for(i=11; i>=0; i=i-1) begin
            if(crc[3] ^ code_in[i])
                crc = {crc[2:0], 1'b0} ^ 4'b1011;
            else
                crc = {crc[2:0], 1'b0};
        end
    end
    assign data_out = code_in[11:4];
    assign error = |crc;
endmodule