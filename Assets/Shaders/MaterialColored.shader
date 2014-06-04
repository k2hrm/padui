Shader "TSS/Common/MaterialColored"
{
    Properties
    {
		_TintColor ("Tint Color", Color) = (0.5, 0.5, 0.5, 0.5)
		_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
    }

    Category
    {
		Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
        Blend SrcAlpha OneMinusSrcAlpha
		Cull Off
		Lighting Off
		ZWrite Off

        SubShader
		{
			Pass
			{
				SetTexture[_MainTex]
				{
					constantColor [_TintColor]
					combine texture * constant DOUBLE
				}
			}
        }
    }
}