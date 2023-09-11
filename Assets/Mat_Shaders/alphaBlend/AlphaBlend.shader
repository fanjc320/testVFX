// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/TestAlphaBlend"
{
   Properties{
        _Color("Color", Color) = (1, 1, 1, 1)
        _MainTex("MainTex", 2D) = "White" {}
        _AlphaScale("AlphaScale", Range(0, 1)) = 1
    }

    SubShader{
        Tags{
            "Queue" = "Transparent"
            "Ignoreprojector" = "True"
            "RenderType" = "Transparent"
        }
        Pass{
            ZWrite off
//          Blend SrcAlpha OneMinusSrcAlpha
//          Blend OneMinusDstColor One
          Blend DstColor Zero
//          Blend DstColor SrcColor
            //BlendOp Max //????
//          Blend One One
//          Blend OneMinusDstColor One
            //Blend One Zero
            //Blend Zero One
            //Blend SrcFactor DstFactor ›]ÓÐß@‚€

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            fixed4 _Color;
            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _AlphaScale;

            struct a2v{
                float4 pos : POSITION;
                float4 normal : NORMAL;
                float texcoord : TEXCOORD0;
            };

            struct v2f{
                float4 pos : SV_POSITION;
                float3 worldNormal : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
                float4 uv : TEXCOORD2;
            };

            v2f vert(a2v v){
                v2f o;
                o.pos = UnityObjectToClipPos(v.pos);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target{
                return fixed4(_Color.rgb, _Color.a * _AlphaScale);
            }

            ENDCG
        }
    }
    Fallback "Diffuse"
}
