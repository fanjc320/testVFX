Shader "Unlit/Hide"
{

	SubShader
	{
		//Tags {"Queue" = "Geometry+1"}
		Tags {"Queue" = "Transparent+1"}
		Blend SrcAlpha OneMinusSrcAlpha
		Lighting Off
		ZWrite On
		ZTest Always 
        Cull Off // 似乎没用，依然是单面有作用

		Pass
		{
			//不加这个stencil，在天空盒的地方，被漏成黑色了,
			//加了以后只会漏通过stencil的最近的物体
			//Stencil {
            //    Ref 2
            //    Comp equal
            //}
			Color(0,0,0,0)
		}
	}
}
