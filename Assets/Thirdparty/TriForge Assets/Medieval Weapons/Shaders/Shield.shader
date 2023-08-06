// Made with Amplify Shader Editor v1.9.0.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Medieval Weapons/Shield"
{
	Properties
	{
		_MainTex("Albedo", 2D) = "white" {}
		_MaskMap("Mask Map", 2D) = "white" {}
		_Metallicstrength("Metallic strength", Float) = 0
		_Smoothnessstrength("Smoothness strength", Float) = 0
		_Normal("Normal", 2D) = "bump" {}
		_DecalMask("Decal Mask", 2D) = "black" {}
		_DecalBackgroundColor("Decal Background Color", Color) = (0.7058823,0.7058823,0.7058823,0)
		_DecalBackgroundRoughness("Decal Background Roughness", Range( 0 , 2)) = 0.5
		_Layer1DecalMask("Layer 1 Decal Mask", 2D) = "black" {}
		_Layer1Color1("Layer 1 Color 1", Color) = (0,0.006896496,1,0)
		_Layer1Color2("Layer 1 Color 2", Color) = (0.03448272,1,0,0)
		_Layer1Color3("Layer 1 Color 3", Color) = (0.8897059,0.6074544,0,0)
		_Layer1Color4("Layer 1 Color 4", Color) = (0,0.7824035,0.8161765,0)
		_Layer1Size("Layer 1 Size", Float) = 1
		_Layer1Offset("Layer 1 Offset", Vector) = (0.5,0.5,0,0)
		_Layer2DecalMask("Layer 2 Decal Mask", 2D) = "black" {}
		_Layer2Color1("Layer 2 Color 1", Color) = (0,0.006896496,1,0)
		_Layer2Color2("Layer 2 Color 2", Color) = (0.03448272,1,0,0)
		_Layer2Color3("Layer 2 Color 3", Color) = (0.8897059,0.6074544,0,0)
		_Layer2Color4("Layer 2 Color 4", Color) = (0,0.7824035,0.8161765,0)
		_Layer2Size("Layer 2 Size", Float) = 1
		_Layer2Offset("Layer 2 Offset", Vector) = (0.5,0.5,0,0)
		_Layer3DecalMask("Layer 3 Decal Mask", 2D) = "black" {}
		_Layer3Color1("Layer 3 Color 1", Color) = (0,0.006896496,1,0)
		_Layer3Color2("Layer 3 Color 2", Color) = (0.03448272,1,0,0)
		_Layer3Color3("Layer 3 Color 3", Color) = (0.8897059,0.6074544,0,0)
		_Layer3Color4("Layer 3 Color 4", Color) = (0,0.7824035,0.8161765,0)
		_Layer3Size("Layer 3 Size", Float) = 1
		_Layer3Offset("Layer 3 Offset", Vector) = (0.5,0.5,0,0)
		_Layer4DecalMask("Layer 4 Decal Mask", 2D) = "black" {}
		_Layer4Color1("Layer 4 Color 1", Color) = (0,0.006896496,1,0)
		_Layer4Color2("Layer 4 Color 2", Color) = (0.03448272,1,0,0)
		_Layer4Color3("Layer 4 Color 3", Color) = (0.8897059,0.6074544,0,0)
		_Layer4Color4("Layer 4 Color 4", Color) = (0,0.7824035,0.8161765,0)
		_Layer4Size("Layer 4 Size", Float) = 1
		_Layer4Offset("Layer 4 Offset", Vector) = (0.5,0.5,0,0)
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma exclude_renderers xboxseries playstation switch nomrt 
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float2 uv3_texcoord3;
		};

		uniform sampler2D _Normal;
		uniform float4 _Normal_ST;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float4 _DecalBackgroundColor;
		uniform float4 _Layer1Color1;
		uniform float4 _Layer1Color2;
		uniform sampler2D _Layer1DecalMask;
		uniform float _Layer1Size;
		uniform float2 _Layer1Offset;
		uniform float4 _Layer1Color3;
		uniform float4 _Layer1Color4;
		uniform float4 _Layer2Color1;
		uniform float4 _Layer2Color2;
		uniform sampler2D _Layer2DecalMask;
		uniform float _Layer2Size;
		uniform float2 _Layer2Offset;
		uniform float4 _Layer2Color3;
		uniform float4 _Layer2Color4;
		uniform float4 _Layer3Color1;
		uniform float4 _Layer3Color2;
		uniform sampler2D _Layer3DecalMask;
		uniform float _Layer3Size;
		uniform float2 _Layer3Offset;
		uniform float4 _Layer3Color3;
		uniform float4 _Layer3Color4;
		uniform float4 _Layer4Color1;
		uniform float4 _Layer4Color2;
		uniform sampler2D _Layer4DecalMask;
		uniform float _Layer4Size;
		uniform float2 _Layer4Offset;
		uniform float4 _Layer4Color3;
		uniform float4 _Layer4Color4;
		uniform sampler2D _DecalMask;
		uniform float _Metallicstrength;
		uniform sampler2D _MaskMap;
		uniform float4 _MaskMap_ST;
		uniform float _Smoothnessstrength;
		uniform float _DecalBackgroundRoughness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normal = i.uv_texcoord * _Normal_ST.xy + _Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Normal, uv_Normal ) );
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode47 = tex2D( _Layer1DecalMask, ( ( (float2( -0.5,-0.5 ) + (i.uv3_texcoord3 - float2( 0,0 )) * (float2( 0.5,0.5 ) - float2( -0.5,-0.5 )) / (float2( 1,1 ) - float2( 0,0 ))) * _Layer1Size ) + _Layer1Offset ) );
			float4 lerpResult87 = lerp( _Layer1Color1 , _Layer1Color2 , tex2DNode47.r);
			float4 lerpResult88 = lerp( lerpResult87 , _Layer1Color3 , tex2DNode47.g);
			float4 lerpResult89 = lerp( lerpResult88 , _Layer1Color4 , tex2DNode47.b);
			float4 tex2DNode95 = tex2D( _Layer2DecalMask, ( ( (float2( -0.5,-0.5 ) + (i.uv3_texcoord3 - float2( 0,0 )) * (float2( 0.5,0.5 ) - float2( -0.5,-0.5 )) / (float2( 1,1 ) - float2( 0,0 ))) * _Layer2Size ) + _Layer2Offset ) );
			float4 lerpResult90 = lerp( _Layer2Color1 , _Layer2Color2 , tex2DNode95.r);
			float4 lerpResult96 = lerp( lerpResult90 , _Layer2Color3 , tex2DNode95.g);
			float4 lerpResult97 = lerp( lerpResult96 , _Layer2Color4 , tex2DNode95.b);
			float4 lerpResult98 = lerp( lerpResult89 , lerpResult97 , tex2DNode95.a);
			float4 tex2DNode112 = tex2D( _Layer3DecalMask, ( ( (float2( -0.5,-0.5 ) + (i.uv3_texcoord3 - float2( 0,0 )) * (float2( 0.5,0.5 ) - float2( -0.5,-0.5 )) / (float2( 1,1 ) - float2( 0,0 ))) * _Layer3Size ) + _Layer3Offset ) );
			float4 lerpResult111 = lerp( _Layer3Color1 , _Layer3Color2 , tex2DNode112.r);
			float4 lerpResult110 = lerp( lerpResult111 , _Layer3Color3 , tex2DNode112.g);
			float4 lerpResult108 = lerp( lerpResult110 , _Layer3Color4 , tex2DNode112.b);
			float4 lerpResult113 = lerp( lerpResult98 , lerpResult108 , tex2DNode112.a);
			float4 tex2DNode128 = tex2D( _Layer4DecalMask, ( ( (float2( -0.5,-0.5 ) + (i.uv3_texcoord3 - float2( 0,0 )) * (float2( 0.5,0.5 ) - float2( -0.5,-0.5 )) / (float2( 1,1 ) - float2( 0,0 ))) * _Layer4Size ) + _Layer4Offset ) );
			float4 lerpResult131 = lerp( _Layer4Color1 , _Layer4Color2 , tex2DNode128.r);
			float4 lerpResult134 = lerp( lerpResult131 , _Layer4Color3 , tex2DNode128.g);
			float4 lerpResult135 = lerp( lerpResult134 , _Layer4Color4 , tex2DNode128.b);
			float4 lerpResult136 = lerp( lerpResult113 , lerpResult135 , tex2DNode128.a);
			float4 lerpResult70 = lerp( _DecalBackgroundColor , lerpResult136 , saturate( pow( ( tex2DNode47.a + tex2DNode95.a + tex2DNode112.a + tex2DNode128.a ) , 7.09 ) ));
			float4 tex2DNode11 = tex2D( _DecalMask, i.uv3_texcoord3 );
			float4 lerpResult12 = lerp( tex2D( _MainTex, uv_MainTex ) , lerpResult70 , tex2DNode11);
			o.Albedo = lerpResult12.rgb;
			float2 uv_MaskMap = i.uv_texcoord * _MaskMap_ST.xy + _MaskMap_ST.zw;
			float4 tex2DNode2 = tex2D( _MaskMap, uv_MaskMap );
			o.Metallic = ( _Metallicstrength * tex2DNode2.r );
			float temp_output_5_0 = ( _Smoothnessstrength * tex2DNode2.a );
			float lerpResult19 = lerp( temp_output_5_0 , ( temp_output_5_0 * _DecalBackgroundRoughness ) , tex2DNode11.r);
			o.Smoothness = lerpResult19;
			o.Occlusion = tex2DNode2.g;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=19001
7;96;1920;923;1798.737;4.906044;1.3;True;True
Node;AmplifyShaderEditor.RangedFloatNode;115;-4707.693,1927.353;Float;False;Property;_Layer2Size;Layer 2 Size;20;0;Create;True;0;0;0;False;0;False;1;0.85;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;116;-4720.693,2013.353;Float;False;Property;_Layer2Offset;Layer 2 Offset;21;0;Create;True;0;0;0;False;0;False;0.5,0.5;0.5,1.46;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;100;-4724.639,845.2894;Float;False;Property;_Layer1Size;Layer 1 Size;13;0;Create;True;0;0;0;False;0;False;1;2.19;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;102;-4737.639,931.2894;Float;False;Property;_Layer1Offset;Layer 1 Offset;14;0;Create;True;0;0;0;False;0;False;0.5,0.5;3.04,-0.09;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;117;-4434.774,1918.166;Inherit;False;ScaleOffset;-1;;4;896b7808dd8c5494192b57d288447e89;0;2;7;FLOAT;1;False;8;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;118;-4708.94,3024.648;Float;False;Property;_Layer3Size;Layer 3 Size;27;0;Create;True;0;0;0;False;0;False;1;2.24;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;119;-4720.063,3110.648;Float;False;Property;_Layer3Offset;Layer 3 Offset;28;0;Create;True;0;0;0;False;0;False;0.5,0.5;0.95,0.91;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;104;-4451.72,836.1019;Inherit;False;ScaleOffset;-1;;5;896b7808dd8c5494192b57d288447e89;0;2;7;FLOAT;1;False;8;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;94;-4068.426,2131.153;Float;False;Property;_Layer2Color1;Layer 2 Color 1;16;0;Create;True;0;0;0;False;0;False;0,0.006896496,1,0;0.8490566,0.8490566,0.8490566,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;95;-4137.787,1916.6;Inherit;True;Property;_Layer2DecalMask;Layer 2 Decal Mask;15;0;Create;True;0;0;0;False;0;False;-1;None;58dca6ece8e6829468bebf9e70e4ba22;True;2;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;120;-4434.144,3015.46;Inherit;False;ScaleOffset;-1;;6;896b7808dd8c5494192b57d288447e89;0;2;7;FLOAT;1;False;8;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;27;-4060.083,1222.236;Float;False;Property;_Layer1Color2;Layer 1 Color 2;10;0;Create;True;0;0;0;False;0;False;0.03448272,1,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;91;-4066.237,2330.321;Float;False;Property;_Layer2Color2;Layer 2 Color 2;17;0;Create;True;0;0;0;False;0;False;0.03448272,1,0,0;0.03448272,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;126;-4699.76,4201.112;Float;False;Property;_Layer4Offset;Layer 4 Offset;35;0;Create;True;0;0;0;False;0;False;0.5,0.5;0.95,0.91;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.ColorNode;26;-4062.272,1023.067;Float;False;Property;_Layer1Color1;Layer 1 Color 1;9;0;Create;True;0;0;0;False;0;False;0,0.006896496,1,0;0.7735849,0.5677534,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;47;-4131.633,808.5133;Inherit;True;Property;_Layer1DecalMask;Layer 1 Decal Mask;8;0;Create;True;0;0;0;False;0;False;-1;None;9648718ac237c004db4ef261e55b5543;True;2;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;125;-4686.76,4115.112;Float;False;Property;_Layer4Size;Layer 4 Size;34;0;Create;True;0;0;0;False;0;False;1;2.24;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;92;-4058.766,2559.706;Float;False;Property;_Layer2Color3;Layer 2 Color 3;18;0;Create;True;0;0;0;False;0;False;0.8897059,0.6074544,0,0;0.8897059,0.6074544,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;112;-4110.94,3009.134;Inherit;True;Property;_Layer3DecalMask;Layer 3 Decal Mask;22;0;Create;True;0;0;0;False;0;False;-1;None;651ff69d699c3bd4bab579b337557cc8;True;2;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;107;-4041.579,3223.687;Float;False;Property;_Layer3Color1;Layer 3 Color 1;23;0;Create;True;0;0;0;False;0;False;0,0.006896496,1,0;0.6980392,0.1137255,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;90;-3713.595,2301.783;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;109;-4039.389,3428.093;Float;False;Property;_Layer3Color2;Layer 3 Color 2;24;0;Create;True;0;0;0;False;0;False;0.03448272,1,0,0;1,0.6172372,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;127;-4413.842,4105.924;Inherit;False;ScaleOffset;-1;;7;896b7808dd8c5494192b57d288447e89;0;2;7;FLOAT;1;False;8;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;87;-3716.611,1198.091;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;28;-4052.612,1451.621;Float;False;Property;_Layer1Color3;Layer 1 Color 3;11;0;Create;True;0;0;0;False;0;False;0.8897059,0.6074544,0,0;0.985294,0.6727181,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;111;-3701.704,3333.488;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;129;-4019.085,4518.558;Float;False;Property;_Layer4Color2;Layer 4 Color 2;31;0;Create;True;0;0;0;False;0;False;0.03448272,1,0,0;1,0.6172372,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;130;-4021.275,4314.151;Float;False;Property;_Layer4Color1;Layer 4 Color 1;30;0;Create;True;0;0;0;False;0;False;0,0.006896496,1,0;0.6980392,0.1137255,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;106;-4031.918,3652.24;Float;False;Property;_Layer3Color3;Layer 3 Color 3;25;0;Create;True;0;0;0;False;0;False;0.8897059,0.6074544,0,0;0.6981132,0.1135172,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;88;-3718.038,1420.245;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;29;-4048.992,1675.203;Float;False;Property;_Layer1Color4;Layer 1 Color 4;12;0;Create;True;0;0;0;False;0;False;0,0.7824035,0.8161765,0;0.1495605,0.6196077,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;128;-4090.637,4099.599;Inherit;True;Property;_Layer4DecalMask;Layer 4 Decal Mask;29;0;Create;True;0;0;0;False;0;False;-1;None;651ff69d699c3bd4bab579b337557cc8;True;2;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;96;-3713.022,2528.937;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;93;-4055.146,2781.165;Float;False;Property;_Layer2Color4;Layer 2 Color 4;19;0;Create;True;0;0;0;False;0;False;0,0.7824035,0.8161765,0;0.1626023,0.2444251,0.5471698,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;110;-3703.131,3555.642;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;132;-4011.614,4746.133;Float;False;Property;_Layer4Color3;Layer 4 Color 3;32;0;Create;True;0;0;0;False;0;False;0.8897059,0.6074544,0,0;0.6981132,0.1135172,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;105;-4028.298,3873.699;Float;False;Property;_Layer3Color4;Layer 3 Color 4;26;0;Create;True;0;0;0;False;0;False;0,0.7824035,0.8161765,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;131;-3681.4,4423.952;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;89;-3718.257,1646.483;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;97;-3712.883,2757.544;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;108;-3703.35,3781.879;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;133;-4007.994,4964.163;Float;False;Property;_Layer4Color4;Layer 4 Color 4;33;0;Create;True;0;0;0;False;0;False;0,0.7824035,0.8161765,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;98;-3290.064,2131.029;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;124;-3721.629,583.3232;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;134;-3682.827,4646.106;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-750.7452,366.6012;Float;False;Property;_Smoothnessstrength;Smoothness strength;3;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;121;-3462.757,584.8297;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;7.09;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;113;-3288.354,2373.687;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;135;-3683.046,4872.343;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;-1042.099,370.895;Inherit;True;Property;_MaskMap;Mask Map;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-651.7452,443.6012;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;136;-3284.074,2636.099;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;15;-4087.556,276.5779;Float;False;Property;_DecalBackgroundColor;Decal Background Color;6;0;Create;True;0;0;0;False;0;False;0.7058823,0.7058823,0.7058823,0;0.1359469,0.2136405,0.6132076,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;114;-3192.568,584.9644;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-3048.281,-307.8402;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-4126.155,464.8506;Float;False;Property;_DecalBackgroundRoughness;Decal Background Roughness;7;0;Create;True;0;0;0;False;0;False;0.5;0.75;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;11;-2771.597,-336.8877;Inherit;True;Property;_DecalMask;Decal Mask;5;0;Create;True;0;0;0;False;0;False;-1;None;None;True;2;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-2771.719,-555.4841;Inherit;True;Property;_MainTex;Albedo;0;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;70;-2863.567,281.2935;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-715.7452,188.6012;Float;False;Property;_Metallicstrength;Metallic strength;2;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-484.3362,442.6351;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;9;-713.8578,960.6437;Inherit;True;Property;_Normal;Normal;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;19;-323.7801,417.1645;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;12;-2419.161,-366.004;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;17;-130.6311,907.924;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-649.7452,265.6014;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Medieval Weapons/Shield;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;d3d9;d3d11_9x;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;ps4;psp2;n3ds;wiiu;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;117;7;115;0
WireConnection;117;8;116;0
WireConnection;104;7;100;0
WireConnection;104;8;102;0
WireConnection;95;1;117;0
WireConnection;120;7;118;0
WireConnection;120;8;119;0
WireConnection;47;1;104;0
WireConnection;112;1;120;0
WireConnection;90;0;94;0
WireConnection;90;1;91;0
WireConnection;90;2;95;1
WireConnection;127;7;125;0
WireConnection;127;8;126;0
WireConnection;87;0;26;0
WireConnection;87;1;27;0
WireConnection;87;2;47;1
WireConnection;111;0;107;0
WireConnection;111;1;109;0
WireConnection;111;2;112;1
WireConnection;88;0;87;0
WireConnection;88;1;28;0
WireConnection;88;2;47;2
WireConnection;128;1;127;0
WireConnection;96;0;90;0
WireConnection;96;1;92;0
WireConnection;96;2;95;2
WireConnection;110;0;111;0
WireConnection;110;1;106;0
WireConnection;110;2;112;2
WireConnection;131;0;130;0
WireConnection;131;1;129;0
WireConnection;131;2;128;1
WireConnection;89;0;88;0
WireConnection;89;1;29;0
WireConnection;89;2;47;3
WireConnection;97;0;96;0
WireConnection;97;1;93;0
WireConnection;97;2;95;3
WireConnection;108;0;110;0
WireConnection;108;1;105;0
WireConnection;108;2;112;3
WireConnection;98;0;89;0
WireConnection;98;1;97;0
WireConnection;98;2;95;4
WireConnection;124;0;47;4
WireConnection;124;1;95;4
WireConnection;124;2;112;4
WireConnection;124;3;128;4
WireConnection;134;0;131;0
WireConnection;134;1;132;0
WireConnection;134;2;128;2
WireConnection;121;0;124;0
WireConnection;113;0;98;0
WireConnection;113;1;108;0
WireConnection;113;2;112;4
WireConnection;135;0;134;0
WireConnection;135;1;133;0
WireConnection;135;2;128;3
WireConnection;5;0;6;0
WireConnection;5;1;2;4
WireConnection;136;0;113;0
WireConnection;136;1;135;0
WireConnection;136;2;128;4
WireConnection;114;0;121;0
WireConnection;11;1;16;0
WireConnection;70;0;15;0
WireConnection;70;1;136;0
WireConnection;70;2;114;0
WireConnection;20;0;5;0
WireConnection;20;1;18;0
WireConnection;19;0;5;0
WireConnection;19;1;20;0
WireConnection;19;2;11;0
WireConnection;12;0;1;0
WireConnection;12;1;70;0
WireConnection;12;2;11;0
WireConnection;17;0;9;0
WireConnection;3;0;4;0
WireConnection;3;1;2;1
WireConnection;0;0;12;0
WireConnection;0;1;17;0
WireConnection;0;3;3;0
WireConnection;0;4;19;0
WireConnection;0;5;2;2
ASEEND*/
//CHKSM=5C8FB5DF5B491852C1A09B222A146FD48067100C