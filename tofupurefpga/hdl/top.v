module top(cloooock,led1,led2);
input cloooock;
output reg led1='b0;
output reg led2='b0;

int counter='d0;

always @ (posedge cloooock) begin
    counter+='d1;
end

always @(counter=='d2000000) begin
    if (led1=='b1) begin
        led1<='b0;
        led2<='b1;
    end
    else begin
        led1<='b1;
        led2<='b0;
    end
    counter='d0;
end

//<statements>

endmodule

