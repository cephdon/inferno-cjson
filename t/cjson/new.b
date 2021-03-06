implement T;

include "opt/powerman/tap/module/t.m";
include "cjson.m";
	cjson: CJSON;
	JSON2Token: import cjson;

t: ref JSON2Token;

test()
{
	cjson = load CJSON CJSON->PATH;
	if(cjson == nil)
		bail_out("fail to load CJSON");

	plan(4);

	mem:=getmem(); for(i:=0; i<10000; i++)
	t = JSON2Token.new(array of byte "  true  ");
	t = nil; ok_mem(mem);
	
	t = JSON2Token.new(array of byte "  true  ");
	ok(t != nil, "t not nil");
	eq_int(t.pos, 2, "skipped spaces");

	t = JSON2Token.new(array of byte "[1,2]");
	eq_int(t.pos, 0, "nothing to skip");
}

