Shader "Custom/Universal Render Pipeline/LitStencilMask"
{
   //每个都不挡
   // SubShader
   // {
   // 	Tags {"RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline"}
   // 	Tags {"Queue" = "Transparent+1"}
   // 	Blend SrcAlpha OneMinusSrcAlpha
   // 	Lighting Off
   // 	ZWrite On
   // 	ZTest Always 
   //     Cull Off // 似乎没用，依然是单面有作用

   // 	Pass
   // 	{
   //     /*
   // 		Stencil {
   //             Ref 2
   //             Comp equal
   //         }
   //         */
   //               /*
   //             Stencil {
   //             Ref 2
   //             Comp always 
   //             Pass Replace
   //         }
   //         */
   // 		Color(0,0,0,0)//完全透明，que越小越黑，que更大的,会被显示黑色，否则透明;数值越小意味着越先被渲染，也就会被后面渲染的对象遮挡。
   // 	}
   // } 

//SubShader
//	{
//		Tags {"RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline"}
//		//Tags {"Queue" = "Background"} //z遮挡掉opaque 和 tranparent
//		//Tags {"Queue" = "Opaque-1"} //同Background z遮挡掉opaque 和 tranparent
//		//Tags {"Queue" = "Transparent-1"}// z遮挡掉transparent,不遮挡opque
//		Tags {"Queue" = "Transparent+1"}// 都没影响，即使是强行制定物体 Tags {"Queue" = "Transparent+2"}
//		Blend SrcAlpha OneMinusSrcAlpha
//		Lighting Off
//		ZWrite On
//		ZTest Always 
//        Cull Off // 似乎没用，依然是单面有作用
//
//		Pass
//		{
//            /*
//			Stencil {
//                Ref 2
//                Comp equal
//            }
//            */
//              /*
//                Stencil {
//                Ref 2
//                Comp always 
//                Pass Replace
//            }
//            */
//			Color(0,0,0,0)//完全透明，que更小的透明不会被遮挡，que更大的,会被透明挡掉;但这个结论似乎只对SurfaceType有效，也就是Queue只能在Opaque或者Transparent前后有效，更改物体shader的queque并不起作用
//            //数值越小意味着越先被渲染，也就会被后面渲染的对象遮挡。
//		}
//	}

SubShader
	{
		Tags {"RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline"}
		//Tags {"Queue" = "Transparent-1"}// z遮挡掉transparent,不遮挡opque
		Tags {"Queue" = "Transparent+1"}// 都没影响，即使是强行制定物体 Tags {"Queue" = "Transparent+2"}
		//Tags {"Queue" = "Geometry+1"}// 
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
              /*
                Stencil {
                Ref 2
                Comp always 
                Pass Replace
            }
            */
			Color(0,0,0,0)//完全透明，que更小的透明不会被遮挡，que更大的,会被透明挡掉;但这个结论似乎只对SurfaceType有效，也就是Queue只能在Opaque或者Transparent前后有效，更改物体shader的queque并不起作用
            //数值越小意味着越先被渲染，也就会被后面渲染的对象遮挡。
		}
	}
}
