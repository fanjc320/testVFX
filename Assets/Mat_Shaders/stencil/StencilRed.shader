Shader "Unlit/StencilRed"
{
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Pass
        {
            Stencil
            {
                Ref 2
                Comp Greater
                Pass replace
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            struct appdata
            {
                float4 vertex : POSITION;
            };
            struct v2f
            {
                float4 vertex : SV_POSITION;
            };
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag (v2f i) : SV_Target
            {
                return fixed4(1,0,0,1);
            }
            ENDCG
        }
    }
}


//I¡¯ve written some pseudo code how the stencil test, stencil operations and the actual rendering are connected:
//
//if (depthTestPass)
//{
//    if (stencilTest()){
//        PASS_Operation();
//    } else {
//        FAIL_Operation();
//        return;
//    }
//    RenderPixel();
//}
//else if (stencilTest())
//{
//    if (stencilTest()) {
//        ZFAIL_Operation();
//    }
//}
