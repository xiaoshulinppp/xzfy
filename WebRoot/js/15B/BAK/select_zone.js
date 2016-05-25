//选择框的名字
selector = [ "s1", "s2", "s3" ];

 

//选择项: "名字", "值", 子选择
menu = [
"北京","BJ",
 [
 "直辖区","BJ-1",
  [
  "东城区","BJ-1-a",null,
	    "西城区","BJ-1-b",null,
	    "宣武区","BJ-1-c",null
   
  ],
 "县","BJ-2",
  [
  "平谷县","BJ-2-a",null,
		"顺义县","BJ-2-b",null,
	    "昌平县","BJ-2-c",null
   
  ]
 ],
"天津","TJ",
 [
 "直辖区","TJ-1",
  [
  "河东区","TJ-1-a",null,
		 "河西区","TJ-1-b",null,
		 "和平区","TJ-1-c",null
  ],
  "县","BJ-2",
  [
  "静安县","BJ-2-a",null,
		"河西县","BJ-2-b",null,
	    "县","BJ-2-c",null
   
  ]
 ]
];


function wizz(level)
{
 if( level == 0 )
  a = menu;
 else
 {
  str = "menu";
  for( i=0; i<level; i++ )
   str += "[" + (document.all[selector[i]].selectedIndex * 3 + 2)  + "]";
  a = eval(str);
 }
 if( a == null ) return;
 
 s = document.all[selector[level]];
 i = s.length;
 while( i > 0 ) s.options[--i] = null;
 while( i < Math.floor(a.length/3) )
  s.options[i] = Option( a[i*3], a[i++*3+1] );
 s.onchange = Function("wizz(" + (level+1) + ")");
 wizz(level+1);
}

wizz(0);