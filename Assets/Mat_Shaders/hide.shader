Shader "Unlit/Hide"
{

	SubShader
	{
		//Tags {"Queue" = "Background"}
		//Tags {"Queue" = "Geometry-1"}
		Tags {"Queue" = "Geometry+1"}
		Blend SrcAlpha OneMinusSrcAlpha
		Lighting Off
		ZWrite On
		ZTest Always 
        Cull Off // 似乎没用，依然是单面有作用

		Pass
		{
			Stencil {
                Ref 2
                Comp equal
            }
			Color(0,0,0,0)
		}
	}
}
