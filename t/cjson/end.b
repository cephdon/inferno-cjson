implement T;

include "opt/powerman/tap/module/t.m";
include "cjson.m";
	cjson: CJSON;
	JSON2Token: import cjson;

test()
{
	cjson = load CJSON CJSON->PATH;
	if(cjson == nil)
		bail_out("fail to load CJSON");

	plan(3);

	json1 := array of byte "  ";

	mem:=getmem(); for(i:=0; i<10000; i++)
	{ t1 := JSON2Token.new(json1); t1.end(); }
	ok_mem(mem);
	
	t := JSON2Token.new(array of byte " null ");
	{ t.end(); } exception e { "*" => catched(e); }
	raised("cjson:expected EOF", nil);

	t = JSON2Token.new(array of byte "  ");
	t.end();
	ok(1, "got EOF");
}

