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
        Cull Off // �ƺ�û�ã���Ȼ�ǵ���������

		Pass
		{
			//�������stencil������պеĵط�����©�ɺ�ɫ��,
			//�����Ժ�ֻ��©ͨ��stencil�����������
			//Stencil {
            //    Ref 2
            //    Comp equal
            //}
			Color(0,0,0,0)
		}
	}
}
