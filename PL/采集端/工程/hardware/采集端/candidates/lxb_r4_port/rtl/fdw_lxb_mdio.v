`timescale 1ns / 1ps

module fdw_lxb_mdio (
    input wire mdio_o,
    input wire mdio_t,
    output wire mdio_i,
    inout wire mdio
);
    IOBUF mdio_pad (.I(mdio_o), .O(mdio_i), .T(mdio_t), .IO(mdio));
endmodule
