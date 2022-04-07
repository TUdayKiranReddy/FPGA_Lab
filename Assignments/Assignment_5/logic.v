module logic(
input p,
input q,
input r,
input s,
output h,
);

assign h = (~q&~s)|(~q&~r)|(~p&s)|(p&q&r);

endmodule