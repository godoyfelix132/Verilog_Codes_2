module Demux(

    input sel,

    input data,

    output y0,

    output y1

    );

wire sn;

not(sn,sel);

and(y0,sn,data);

and(y1,sel,data);

endmodule