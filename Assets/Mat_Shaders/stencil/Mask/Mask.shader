Shader "Custom/Mask"
{
	Properties{}

	SubShader{

		Tags {
			"RenderType" = "Opaque"
		}

		Pass {
			ZWrite Off
		}
	}
}

//https://theslidefactory.com/see-through-objects-with-stencil-buffers-using-unity-urp/
