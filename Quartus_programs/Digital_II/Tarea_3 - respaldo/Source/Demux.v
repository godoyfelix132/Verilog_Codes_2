module Demux(

    input sel,

    input data,

    output y0,

    output y1

    );

not(sn,sel);

and(y0,sn,data);

and(y1,sel,data);

endmodule