Shader "TSS/MapTile"
{
    Properties
    {
        _Color ("Main Color", Color) = (0.5, 0.5, 0.5, 1)
		_RelationColor ("Relation Color", Color) = (1, 1, 1, 1)
        _ObjectTex ("Object (RGB) Trans (A)", 2D) = "white" { }
		_BaseTex ("Base (RGB) Trans (A)", 2D) = "white" { }
    }

    Category
    {
		Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
        ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		Cull Off
        SubShader
		{
			Material
			{
				Diffuse [_Color]
			}
			Pass
			{
				ColorMaterial AmbientAndDiffuse
				Lighting Off

				SetTexture[_BaseTex]
				{
					constantColor [_RelationColor]
					combine texture * constant
				}
				SetTexture[_ObjectTex]
				{
					combine texture lerp (texture) previous, previous + texture
				}
				SetTexture[_]
				{
					constantColor [_Color]
					combine previous * constant
				}
				SetTexture[_BaseTex]
				{
					combine previous * primary DOUBLE
				}
			}
        }
    }
}