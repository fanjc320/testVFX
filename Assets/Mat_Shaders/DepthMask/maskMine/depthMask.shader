//都不起作用，还不是因为用的是urp？
// https://forum.unity.com/threads/depth-mask-shader-in-urp.855136/
//Shader "Masked/DepthMask" {
//    SubShader {
//        // Render the mask after regular geometry, but before masked geometry and
//        // transparent things.
//        Tags {"Queue" = "Geometry+10" }
//        /*
//        Tags {"Queue" = "Geometry-10" }
//        ZTest LEqual
//        */
//        // Don't draw in the RGBA channels; just the depth buffer
//        ColorMask 0
//        ZWrite On
//        //cull off
//        // Do nothing specific in the pass:
//        Pass {}
//    }
//}


//不过URP里面普通的Lit shader不支持设置render queue了，需要通过render feature实现修改渲染顺序
//https://developer.unity.cn/ask/question/5fb8960dedbc2a1250820d54

//Shader "Custom/DepthMask" {
//    SubShader {
//        Tags {"Queue" = "Geometry-1" }
//        //ColorMask 0
//        ZWrite On
// 
//        Pass {}
//    }
//}


// "Invisible" Unity Occlusion Shader. Useful for AR, Masking, etc
// Mark Johns / Doomlaser - https://twitter.com/Doomlaser
//https://github.com/doomlaser/DepthMask-Unity-Shader/blob/master/DepthMask.shader    

Shader "DepthMask"
{
    Properties
    {
    }
    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
            //"Queue" = "Geometry-1"
        }
        Pass
        {
            //ColorMask 0

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct v2f
            {
                float4 pos : SV_POSITION;
            };

            v2f vert(appdata_base v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }

            half4 frag(v2f i) : COLOR
            {
                return float4(1,1,1,1);
            }
            ENDCG
        }
    }
}
