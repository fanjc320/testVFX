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
        Cull Off // �ƺ�û�ã���Ȼ�ǵ���������

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
