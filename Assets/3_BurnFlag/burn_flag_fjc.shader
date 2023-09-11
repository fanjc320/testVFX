// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "burn_flag_fjc"
{
	Properties
	{
		_NoiseTex("NoiseTex", 2D) = "white" {}
		_NoiseIntensity("NoiseIntensity", Float) = 0
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_TextureSample2("Texture Sample 2", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _TextureSample2;
		uniform half4 _TextureSample2_ST;
		SamplerState sampler_TextureSample2;
		uniform sampler2D _TextureSample1;
		uniform sampler2D _NoiseTex;
		uniform half _NoiseIntensity;


		float recycle78( float speedY, float jianGe )
		{
			return speedY%jianGe-1;
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TextureSample2 = i.uv_texcoord * _TextureSample2_ST.xy + _TextureSample2_ST.zw;
			half4 tex2DNode95 = tex2D( _TextureSample2, uv_TextureSample2 );
			float speedY78 = _Time.y;
			float jianGe78 = 0.0;
			float localrecycle78 = recycle78( speedY78 , jianGe78 );
			half2 appendResult83 = (half2(0.0 , localrecycle78));
			half2 panner88 = ( 1.0 * _Time.y * half2( 0,0 ) + i.uv_texcoord);
			half4 lerpResult84 = lerp( half4( ( i.uv_texcoord + appendResult83 ), 0.0 , 0.0 ) , tex2D( _NoiseTex, panner88 ) , _NoiseIntensity);
			half4 color93 = IsGammaSpace() ? half4(0.990566,0.9578586,0.9578586,0) : half4(0.9786729,0.9067997,0.9067997,0);
			o.Albedo = ( ( tex2DNode95 + ( tex2DNode95.a * tex2D( _TextureSample1, lerpResult84.rg ) * color93 ) ) * i.vertexColor ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18500
172;441;2196;1353;-6198.253;-480.2528;1.3;True;False
Node;AmplifyShaderEditor.SimpleTimeNode;65;5561.464,1078.218;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;87;5796.675,1663.43;Inherit;False;Constant;_Vector0;Vector 0;6;0;Create;True;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;86;5756.509,1520.379;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;78;5772.746,1077.515;Float;False;return speedY%jianGe-1@;1;False;2;True;speedY;FLOAT;0;In;;Float;False;True;jianGe;FLOAT;0;In;;Float;False;recycle;True;False;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;83;6007.057,1057.451;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;88;6048.394,1481.834;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;81;5533.799,832.002;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;90;6284.902,1456.789;Inherit;True;Property;_NoiseTex;NoiseTex;7;0;Create;True;0;0;False;0;False;-1;None;83c8c0d2d5d6f4c48bd6a5a8ba210f36;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;91;6361.129,1812.101;Inherit;False;Property;_NoiseIntensity;NoiseIntensity;8;0;Create;True;0;0;False;0;False;0;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;82;6260.217,1001.3;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;84;6678.818,1036.316;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;95;7413.675,786.43;Inherit;True;Property;_TextureSample2;Texture Sample 2;10;0;Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;93;7175.675,1299.43;Inherit;False;Constant;_Color1;Color 1;9;0;Create;True;0;0;False;0;False;0.990566,0.9578586,0.9578586,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;92;6989.274,1032.53;Inherit;True;Property;_TextureSample1;Texture Sample 1;9;0;Create;True;0;0;False;0;False;-1;None;8aba6bb20faf8824d9d81946542f1ce1;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;7728.675,1142.43;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;22;-653.6996,84.10001;Inherit;False;2422.147;654.0526;Comment;13;9;10;2;5;3;8;4;7;11;13;6;12;14;UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;64;1404.309,1088.819;Inherit;False;3517;1910;Comment;29;23;24;25;32;36;28;33;35;30;37;58;38;40;43;45;47;46;44;42;39;60;59;63;107;108;109;110;111;112;old;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;85;2744.156,25.84604;Inherit;False;1659.66;708;Comment;7;71;66;74;76;73;75;77;TestGradient;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;96;7927.675,866.43;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;26;1862.514,-129.7829;Inherit;False;665.2192;466.5384;Comment;3;17;21;20;Dissolve0;1,1,1,1;0;0
Node;AmplifyShaderEditor.VertexColorNode;97;7927.675,1055.43;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;79;5290.95,1219.243;Inherit;False;Constant;_Float9;Float 9;6;0;Create;True;0;0;False;0;False;0.6588235;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;2583.308,2070.819;Inherit;False;Constant;_Float3;Float 3;5;0;Create;True;0;0;False;0;False;0.02;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;66;3321.7,148.3678;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;58;3854.31,1138.819;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;3276.11,1116.807;Inherit;False;Constant;_Float6;Float 6;7;0;Create;True;0;0;False;0;False;1000;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-602.6998,134.1;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;80;5361.799,1085.002;Inherit;False;Constant;_AddSpeedY;AddSpeedY;6;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;102;4966.53,1347.062;Inherit;False;Constant;_Float0;Float 0;10;0;Create;True;0;0;False;0;False;0.5764706;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;38;3775.12,1747.754;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;3262.308,2882.818;Inherit;False;Constant;_Float5;Float 5;7;0;Create;True;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;1890.438,2430.663;Inherit;False;Constant;_Float10;Float 10;11;0;Create;True;0;0;False;0;False;0.6588235;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;110;1968.188,2278.163;Inherit;False;Property;_flowSpeed1;flowSpeed;4;0;Create;True;0;0;False;0;False;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;111;2215.438,2435.663;Inherit;False;x@;1;False;1;True;x;FLOAT;0;In;;Inherit;False;test0;True;False;0;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;33;2710.308,1439.819;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;2428.309,1817.819;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;46;3782.829,2636.979;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;104;5625.022,1331.381;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;105;5314.876,1534.904;Inherit;False;return In0@;1;False;1;True;In0;FLOAT;0;InOut;;Inherit;False;My Custom Expression;True;False;0;1;0;FLOAT;0;False;2;FLOAT;0;FLOAT;1
Node;AmplifyShaderEditor.CustomExpressionNode;101;5329.538,1337.475;Float;False;if (x> 0.5)${$ return 0.5@$}$else${$ return 1.0@$};7;False;2;True;x;FLOAT;0;In;;Float;False;True;y;FLOAT;0.5;Out;;Float;False;testFunc;False;False;0;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;2;FLOAT;0;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;74;3327.612,444.8458;Inherit;False;Constant;_Float7;Float 7;6;0;Create;True;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;35;2824.308,1933.819;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;32;2604.308,1818.819;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;4175.12,1559.722;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;1533.448,168.445;Inherit;True;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;23;2202.309,1782.819;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;2207.309,1901.819;Inherit;False;Property;_flowSpeed;flowSpeed;3;0;Create;True;0;0;False;0;False;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;108;2189.188,2194.163;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;109;1963.188,2159.163;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;42;3732.958,2206.497;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;20;2292.732,-23.25055;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;39;3230.308,2258.819;Inherit;True;Property;_Debris05_Noise_01;Debris05_Noise_01;5;0;Create;True;0;0;False;0;False;-1;82833244d6b4f3346b961b7699cbd1f5;a4aa9178b66bffe4aa9a34ec77c358d8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;75;3875.612,88.84603;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;17;1926.058,-79.78286;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;73;3598.612,479.8458;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;45;3214.308,2610.818;Inherit;True;Property;_LDR_LLL1_0;LDR_LLL1_0;6;0;Create;True;0;0;False;0;False;-1;94947df6488af07499d542434acaedf0;94947df6488af07499d542434acaedf0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;21;1912.514,220.7556;Inherit;False;Property;_showProcess;showProcess;2;0;Create;True;0;0;False;0;False;0.4537296;0.7068235;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-40.30001,516.4997;Inherit;False;Constant;_Float2;Float 2;1;0;Create;True;0;0;False;0;False;0.49;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;107;2482.187,2298.163;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4;-311.2998,177.3999;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StepOpNode;8;211.0241,134.5968;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;4532.207,-252.6423;Inherit;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;False;0;False;-1;None;352167e52fa3b0c43ac690f5e2debc2b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;43;3374.308,2498.818;Inherit;False;Constant;_Float4;Float 4;6;0;Create;True;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;71;2794.156,178.2448;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-62.89998,382.7;Inherit;False;Constant;_Float1;Float 1;1;0;Create;True;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;11;948.5981,235.9281;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;28;2400.906,1257.897;Inherit;True;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;106;7998.973,1398.386;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;76;3504.612,75.84603;Inherit;False;Constant;_Float8;Float 8;6;0;Create;True;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;63;3049.793,1234.409;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;8113.676,947.43;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;3484.11,1274.807;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;13;955.0356,522.6764;Inherit;False;Constant;_Color0;Color 0;2;0;Create;True;0;0;False;0;False;1,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;30;3222.308,1422.819;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;14;1522.565,484.1526;Inherit;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;10;649.7129,379.6734;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;77;4168.817,318.3885;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;9;629.678,138.9401;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;4527.12,1433.593;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;37;3342.308,1906.819;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-603.6996,340.8998;Inherit;False;Property;_Float0;Float 0;1;0;Create;True;0;0;False;0;False;-0.25;-0.368312;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;7;224.9425,384.1945;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;8346.232,799.9132;Half;False;True;-1;2;ASEMaterialInspector;0;0;Standard;burn_flag_fjc;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;1;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;78;0;65;0
WireConnection;83;1;78;0
WireConnection;88;0;86;0
WireConnection;88;2;87;0
WireConnection;90;1;88;0
WireConnection;82;0;81;0
WireConnection;82;1;83;0
WireConnection;84;0;82;0
WireConnection;84;1;90;0
WireConnection;84;2;91;0
WireConnection;92;1;84;0
WireConnection;94;0;95;4
WireConnection;94;1;92;0
WireConnection;94;2;93;0
WireConnection;96;0;95;0
WireConnection;96;1;94;0
WireConnection;66;0;71;2
WireConnection;58;0;59;0
WireConnection;38;0;37;0
WireConnection;38;1;30;0
WireConnection;111;0;112;0
WireConnection;33;0;28;2
WireConnection;25;0;23;0
WireConnection;25;1;24;0
WireConnection;46;0;45;1
WireConnection;46;1;47;0
WireConnection;104;0;105;0
WireConnection;105;0;102;0
WireConnection;101;0;102;0
WireConnection;35;0;32;0
WireConnection;35;1;36;0
WireConnection;32;0;25;0
WireConnection;40;0;58;0
WireConnection;40;1;38;0
WireConnection;12;0;11;0
WireConnection;12;1;13;0
WireConnection;108;0;109;0
WireConnection;108;1;110;0
WireConnection;42;0;39;1
WireConnection;42;1;43;0
WireConnection;20;0;17;2
WireConnection;20;1;21;0
WireConnection;75;0;76;0
WireConnection;75;1;66;0
WireConnection;73;0;66;0
WireConnection;73;1;74;0
WireConnection;107;0;111;0
WireConnection;4;0;2;0
WireConnection;4;1;3;0
WireConnection;8;0;4;0
WireConnection;8;1;5;0
WireConnection;11;0;10;0
WireConnection;11;1;9;0
WireConnection;98;0;96;0
WireConnection;98;1;97;0
WireConnection;59;0;60;0
WireConnection;59;1;63;1
WireConnection;30;0;33;0
WireConnection;30;1;32;0
WireConnection;14;0;10;0
WireConnection;10;0;7;0
WireConnection;77;0;75;0
WireConnection;77;1;66;0
WireConnection;9;0;8;0
WireConnection;44;0;30;0
WireConnection;44;1;40;0
WireConnection;37;0;33;0
WireConnection;37;1;35;0
WireConnection;7;0;4;0
WireConnection;7;1;6;0
WireConnection;0;0;98;0
ASEEND*/
//CHKSM=9990F35E9BBB4DC347E838A22CBB6A088C14129F