// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Billboards/Cross Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledBanner(Cross Standard Lit)]_Banner("Banner", Float) = 0
		[StyledCategory(Render Settings)]_RenderingCat("[ Rendering Cat ]", Float) = 0
		[Enum(Opaque,0,Transparent,1)]_render_mode("Render Mode", Float) = 0
		[Enum(Both,0,Back,1,Front,2)]_render_cull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,None,2)]_render_normals("Render Normals", Float) = 0
		[StyledInteractive(_render_mode, 1)]_RenderMode_TransparentInteractive("# RenderMode_TransparentInteractive", Float) = 0
		[Enum(Alpha,0,Premultiply,1)]_render_blend("Render Blending", Float) = 0
		[Enum(Off,0,On,1)]_render_zw("Render ZWrite", Float) = 1
		[StyledInteractive(ON)]_RenderMode_ResetInteractive("# RenderMode_ResetInteractive", Float) = 0
		[Toggle][Space(10)]_render_clip("Alpha Clipping", Float) = 0
		[StyledInteractive(_render_clip, 1)]_AlphaClipInteractive("# AlphaClipInteractive", Float) = 0
		_Cutoff("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledCategory(Global Settings)]_GlobalSettingsCat("[ Global Settings Cat ]", Float) = 0
		_GlobalColors("Global Colors", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalHealthiness("Global Healthiness", Range( 0 , 1)) = 1
		_GlobalSize("Global Size", Range( 0 , 1)) = 1
		_GlobalSizeFade("Global Size Fade", Range( 0 , 1)) = 0
		[StyledCategory(Material Shading)]_MaterialShadingCat("[ Material Shading Cat ]", Float) = 0
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (0.3315085,0.490566,0,1)
		[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		_SubsurfaceMinValue("Subsurface Min", Range( 0 , 1)) = 0
		_SubsurfaceMaxValue("Subsurface Max", Range( 0 , 1)) = 1
		[Space(10)]_SubsurfaceViewValue("Subsurface View", Range( 0 , 8)) = 1
		_SubsurfaceAngleValue("Subsurface Angle", Range( 0 , 16)) = 8
		[StyledSpace(10)]_MaterialShadingSpaceDrawer("# Material Shading Space", Float) = 0
		[Space(10)]_OverlayContrast("Overlay Contrast", Range( 0 , 10)) = 1
		[StyledCategory(Main Shading)]_MainShadingCat("[ Main Shading Cat ]", Float) = 0
		_MainColor("Main Color", Color) = (1,1,1,1)
		[NoScaleOffset]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset]_MainNormalTex("Main Normal", 2D) = "gray" {}
		[NoScaleOffset]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion (G)", Range( 0 , 1)) = 1
		_MainSmoothnessValue("Main Smoothness (A)", Range( 0 , 1)) = 1
		[StyledCategory(Motion Settings)]_MotionCat("[ Motion Cat ]", Float) = 0
		_Motion_10("Motion Bending", Range( 0 , 1)) = 1
		[HideInInspector][Space(10)]_MotionAmplitude_10("Primary Bending", Float) = 0
		[HideInInspector][IntRange]_MotionSpeed_10("Primary Speed", Float) = 2
		[HideInInspector]_MotionScale_10("Primary Elasticity", Float) = 0
		[HideInInspector]_MotionVariation_10("Primary Variation", Float) = 0
		[HideInInspector][Space(10)]_MotionAmplitude_20("Secundary Rolling", Float) = 0
		[HideInInspector]_MotionVertical_20("Secundary Vertical", Float) = 0
		[HideInInspector][IntRange]_MotionSpeed_20("Secundary Speed", Float) = 5
		[HideInInspector]_MotionScale_20("Secundary Elasticity", Float) = 0
		[HideInInspector]_MotionVariation_20("Secundary Variation", Range( 0 , 5)) = 0
		[HideInInspector][Space(10)]_MotionAmplitude_30("Leaves Amplitude", Float) = 0
		[HideInInspector][Space(10)]_MotionAmplitude_32("Flutter Amplitude", Float) = 0
		[HideInInspector][IntRange]_MotionSpeed_30("Leaves Speed", Float) = 15
		[HideInInspector][IntRange]_MotionSpeed_32("Flutter Speed", Float) = 30
		[HideInInspector]_MotionScale_32("Flutter Elasticity", Float) = 30
		[HideInInspector]_MotionScale_30("Leaves Scale", Float) = 30
		[HideInInspector]_MotionVariation_32("Flutter Variation", Float) = 30
		[HideInInspector]_MotionVariation_30("Leaves Variation", Float) = 30
		[HideInInspector]_InteractionAmplitude("Interaction Bending", Float) = 0
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat]", Float) = 0
		[IntRange]_render_priority("Priority", Range( -50 , 50)) = 0
		[HideInInspector]_render_src("render_src", Float) = 1
		[HideInInspector]_render_dst("render_dst", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_Color("_Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("_MainTex", 2D) = "white" {}
		[HideInInspector][Enum(Both,0,Back,1,Front,2)]__cull("__cull", Float) = 0
		[HideInInspector][Enum(Opaque,0,Transparent,1)]__surface("__surface", Float) = 0
		[HideInInspector][Enum(Off,0,On,1)]__zw("__zw", Float) = 1
		[HideInInspector][Enum(Flip,0,Mirror,1,None,2)]__normals("__normals", Float) = 0
		[HideInInspector][Enum(Alpha,0,Premultiply,1)]__blend("__blend", Float) = 0
		[HideInInspector][Toggle][Space(10)]__clip("__clip", Float) = 0
		[HideInInspector][IntRange]__priority("__priority", Float) = 0
		[HideInInspector]__src("__src", Float) = 1
		[HideInInspector]__dst("__dst", Float) = 0
		[HideInInspector]__premul("__premul", Float) = 0
		[HideInInspector]_VertexOcclusion("_VertexOcclusion", Float) = 0
		[HideInInspector]_MainMaskValue("_MainMaskValue", Float) = 0
		[HideInInspector][Enum(Translucency,0,Thickness,1)]_SubsurfaceMode("_SubsurfaceMode", Float) = 0
		[HideInInspector]_ObjectThicknessValue("_ObjectThicknessValue", Float) = 0
		[HideInInspector][Enum(Constant,0,Variation,1)]_MainColorMode("_MainColorMode", Float) = 1
		[HideInInspector]_MaxBoundsInfo("_MaxBoundsInfo", Vector) = (1,1,1,1)
		[HideInInspector]_render_normals_options("_render_normals_options", Vector) = (1,1,1,0)
		[HideInInspector]_Cutoff("_Cutoff", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 141
		[HideInInspector]_IsUniversalPipeline("_IsUniversalPipeline", Float) = 1
		[StyledMessage(Warning, When batching is enabled the object position data is lost and some features will not work properly. Use this feature for small plants or grass only. Check the documentation for more information., _material_batching, 1 , 10,0)]_BatchingMessage("Batching Message", Float) = 0
		[Toggle][Space(10)]_material_batching("Enable Batching Support", Float) = 0
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
		[HideInInspector]_IsAnyPathShader("_IsAnyPathShader", Float) = 1
		[HideInInspector]_IsCrossShader("_IsCrossShader", Float) = 1
		[HideInInspector]_Cutoff("_Cutoff", Float) = 0.5
		[HideInInspector][Enum(Both,0,Back,1,Front,2)]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }
		Cull [_render_cull]
		HLSLINCLUDE
		#pragma target 3.0

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend [_render_src] [_render_dst] , One Zero
			ZWrite [_render_zw]
			ZTest LEqual
			Offset 0 , -1
			ColorMask RGBA
			

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLETVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _SubsurfaceColor;
			half3 _render_normals_options;
			half _BatchingMessage;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _IsAnyPathShader;
			half _InteractionAmplitude;
			half _IsStandardShader;
			half _IsLitShader;
			half _Banner;
			half _IsVersion;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionVariation_30;
			float _MotionScale_20;
			half _IsCrossShader;
			half _Motion_10;
			half _GlobalSize;
			half _GlobalSizeFade;
			half _MainSmoothnessValue;
			half __premul;
			half _GlobalOverlay;
			half _OverlayContrast;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _GlobalColors;
			half _IsUniversalPipeline;
			half __surface;
			half _MotionCat;
			float _MotionSpeed_32;
			half _MotionAmplitude_30;
			half _GlobalWetness;
			half _MaterialShadingCat;
			half __zw;
			half __blend;
			half _render_mode;
			half __clip;
			half _render_priority;
			half _render_dst;
			half _GlobalSettingsCat;
			half _render_clip;
			half _AdvancedCat;
			half _MainMaskValue;
			half _ObjectThicknessValue;
			half _RenderingCat;
			half _RenderMode_ResetInteractive;
			half _IsTVEShader;
			half _VertexOcclusion;
			half _material_batching;
			half _render_blend;
			half _render_zw;
			half _Cutoff;
			half _RenderMode_TransparentInteractive;
			float _MotionSpeed_30;
			float _MotionScale_30;
			half _MotionAmplitude_20;
			half _MotionVertical_20;
			float _MotionSpeed_20;
			half _MotionAmplitude_32;
			half _MainColorMode;
			half __dst;
			half _MotionVariation_20;
			half _render_cull;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __src;
			half __normals;
			half __cull;
			half _render_normals;
			half _AlphaClipInteractive;
			half _MainOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			half TVE_Amplitude1;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;
			sampler2D TVE_ColorsTex;
			half4 TVE_ColorsCoord;
			sampler2D _MainMaskTex;
			half4 TVE_OverlayColor;
			sampler2D _MainNormalTex;
			half TVE_OverlayIntensity;
			half TVE_OverlaySmoothness;
			float TVE_Wetness;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				half3 VertexPos40_g18273 = v.vertex.xyz;
				float3 appendResult74_g18273 = (float3(VertexPos40_g18273.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g18273 = appendResult74_g18273;
				float3 break84_g18273 = VertexPos40_g18273;
				float3 appendResult81_g18273 = (float3(0.0 , break84_g18273.y , break84_g18273.z));
				half3 VertexPosOtherAxis82_g18273 = appendResult81_g18273;
				float ObjectData20_g18309 = 3.14;
				float Bounds_Height374_g16972 = _MaxBoundsInfo.y;
				float WorldData19_g18309 = ( Bounds_Height374_g16972 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18309 = WorldData19_g18309;
				#else
				float staticSwitch14_g18309 = ObjectData20_g18309;
				#endif
				float Motion_Max_Bending1133_g16972 = staticSwitch14_g18309;
				half Global_Amplitude_136_g16972 = TVE_Amplitude1;
				float temp_output_4_0_g18291 = 1.0;
				float temp_output_5_0_g18291 = ( temp_output_4_0_g18291 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g18290 = GetObjectToWorldMatrix();
				float3 appendResult20_g18290 = (float3(break19_g18290[ 0 ][ 3 ] , break19_g18290[ 1 ][ 3 ] , break19_g18290[ 2 ][ 3 ]));
				half3 ObjectData20_g18292 = appendResult20_g18290;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g18292 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18292 = WorldData19_g18292;
				#else
				float3 staticSwitch14_g18292 = ObjectData20_g18292;
				#endif
				float2 panner73_g18289 = ( temp_output_5_0_g18291 * temp_cast_0 + ( (staticSwitch14_g18292).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g18289 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g18289, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g16972 = break142_g18289.r;
				float4x4 break19_g18268 = GetObjectToWorldMatrix();
				float3 appendResult20_g18268 = (float3(break19_g18268[ 0 ][ 3 ] , break19_g18268[ 1 ][ 3 ] , break19_g18268[ 2 ][ 3 ]));
				half3 ObjectData20_g18267 = appendResult20_g18268;
				half3 WorldData19_g18267 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18267 = WorldData19_g18267;
				#else
				float3 staticSwitch14_g18267 = ObjectData20_g18267;
				#endif
				float3 break322_g18294 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g18267).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g18294 = (float3(break322_g18294.x , 0.0 , break322_g18294.y));
				float3 temp_output_324_0_g18294 = (appendResult323_g18294*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g18295 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g18294 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g18295 = temp_output_324_0_g18294;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18295 = WorldData19_g18295;
				#else
				float3 staticSwitch14_g18295 = ObjectData20_g18295;
				#endif
				float2 temp_output_1976_320_g16972 = (staticSwitch14_g18295).xz;
				half2 Motion_DirectionOS39_g16972 = temp_output_1976_320_g16972;
				half Input_Speed62_g18245 = _MotionSpeed_10;
				float temp_output_4_0_g18246 = Input_Speed62_g18245;
				float temp_output_5_0_g18246 = ( temp_output_4_0_g18246 * _TimeParameters.x );
				float temp_output_349_0_g18245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g18249 = GetObjectToWorldMatrix();
				float3 appendResult20_g18249 = (float3(break19_g18249[ 0 ][ 3 ] , break19_g18249[ 1 ][ 3 ] , break19_g18249[ 2 ][ 3 ]));
				float3 break9_g18249 = appendResult20_g18249;
				float ObjectData20_g18248 = ( temp_output_349_0_g18245 + ( break9_g18249.x + break9_g18249.z ) );
				float WorldData19_g18248 = temp_output_349_0_g18245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18248 = WorldData19_g18248;
				#else
				float staticSwitch14_g18248 = ObjectData20_g18248;
				#endif
				half Motion_Variation284_g18245 = staticSwitch14_g18248;
				float2 appendResult344_g18245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g18245 = ( _MotionScale_10 * appendResult344_g18245 );
				half2 Sine_MinusOneToOne281_g18245 = sin( ( temp_output_5_0_g18246 + Motion_Variation284_g18245 + Motion_Scale287_g18245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g18245 = Global_NoiseTex_R34_g16972;
				float2 lerpResult321_g18245 = lerp( Sine_MinusOneToOne281_g18245 , temp_cast_4 , Input_Turbulence327_g18245);
				float2 temp_output_84_0_g16972 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g16972 ) * Global_Amplitude_136_g16972 * Global_NoiseTex_R34_g16972 * Motion_DirectionOS39_g16972 * lerpResult321_g18245 );
				float temp_output_1976_333_g16972 = break322_g18294.z;
				half2 Motion_Interaction53_g16972 = ( _InteractionAmplitude * Motion_Max_Bending1133_g16972 * temp_output_1976_320_g16972 * temp_output_1976_333_g16972 * temp_output_1976_333_g16972 );
				half Motion_InteractionMask66_g16972 = temp_output_1976_333_g16972;
				float2 lerpResult109_g16972 = lerp( temp_output_84_0_g16972 , Motion_Interaction53_g16972 , Motion_InteractionMask66_g16972);
				half Mesh_Motion_182_g16972 = v.ase_texcoord3.x;
				half Motion_Use1056_g16972 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g16972 = ( lerpResult109_g16972 * Mesh_Motion_182_g16972 * Motion_Use1056_g16972 );
				half Motion_Z190_g16972 = break143_g16972.y;
				half Angle44_g18273 = Motion_Z190_g16972;
				half3 VertexPos40_g18281 = ( VertexPosRotationAxis50_g18273 + ( VertexPosOtherAxis82_g18273 * cos( Angle44_g18273 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g18273 ) * sin( Angle44_g18273 ) ) );
				float3 appendResult74_g18281 = (float3(0.0 , 0.0 , VertexPos40_g18281.z));
				half3 VertexPosRotationAxis50_g18281 = appendResult74_g18281;
				float3 break84_g18281 = VertexPos40_g18281;
				float3 appendResult81_g18281 = (float3(break84_g18281.x , break84_g18281.y , 0.0));
				half3 VertexPosOtherAxis82_g18281 = appendResult81_g18281;
				half Motion_X216_g16972 = break143_g16972.x;
				half Angle44_g18281 = -Motion_X216_g16972;
				float3 Vertex_Motion_Object833_g16972 = ( VertexPosRotationAxis50_g18281 + ( VertexPosOtherAxis82_g18281 * cos( Angle44_g18281 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g18281 ) * sin( Angle44_g18281 ) ) );
				half3 ObjectData20_g18272 = Vertex_Motion_Object833_g16972;
				float3 appendResult2043_g16972 = (float3(Motion_X216_g16972 , 0.0 , Motion_Z190_g16972));
				float3 Vertex_Motion_World1118_g16972 = ( v.vertex.xyz + appendResult2043_g16972 );
				half3 WorldData19_g18272 = Vertex_Motion_World1118_g16972;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18272 = WorldData19_g18272;
				#else
				float3 staticSwitch14_g18272 = ObjectData20_g18272;
				#endif
				float4x4 break19_g18274 = GetObjectToWorldMatrix();
				float3 appendResult20_g18274 = (float3(break19_g18274[ 0 ][ 3 ] , break19_g18274[ 1 ][ 3 ] , break19_g18274[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g16972 = TVE_SizeFadeEnd;
				float temp_output_7_0_g18269 = Global_SizeFadeEnd287_g16972;
				half Global_SizeFadeStart276_g16972 = TVE_SizeFadeStart;
				float lerpResult348_g16972 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g18274 ) - temp_output_7_0_g18269 ) / ( Global_SizeFadeStart276_g16972 - temp_output_7_0_g18269 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g18278 = lerpResult348_g16972;
				float WorldData19_g18278 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18278 = WorldData19_g18278;
				#else
				float staticSwitch14_g18278 = ObjectData20_g18278;
				#endif
				float Vertex_SizeFade1740_g16972 = staticSwitch14_g18278;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g16972 = tex2DNode7_g18297.g;
				float lerpResult346_g16972 = lerp( 1.0 , Global_ExtrasTex_G305_g16972 , _GlobalSize);
				float ObjectData20_g18270 = lerpResult346_g16972;
				float WorldData19_g18270 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18270 = WorldData19_g18270;
				#else
				float staticSwitch14_g18270 = ObjectData20_g18270;
				#endif
				half Vertex_Size1741_g16972 = staticSwitch14_g18270;
				float3 Final_Vertex890_g16972 = ( ( staticSwitch14_g18272 * Vertex_SizeFade1740_g16972 * Vertex_Size1741_g16972 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				o.ase_texcoord7 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g16972;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord1 = v.texcoord1;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN , half ase_vface : VFACE ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				float3 WorldNormal = normalize( IN.tSpace0.xyz );
				float3 WorldTangent = IN.tSpace1.xyz;
				float3 WorldBiTangent = IN.tSpace2.xyz;
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				#if SHADER_HINT_NICE_QUALITY
					WorldViewDirection = SafeNormalize( WorldViewDirection );
				#endif

				float2 Main_UVs15_g16972 = ( ( IN.ase_texcoord7.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g16972 = tex2D( _MainAlbedoTex, Main_UVs15_g16972 );
				float4 temp_output_51_0_g16972 = ( _MainColor * tex2DNode29_g16972 );
				half3 Main_AlbedoRaw99_g16972 = (temp_output_51_0_g16972).rgb;
				float3 temp_cast_0 = (1.0).xxx;
				float4x4 break19_g18287 = GetObjectToWorldMatrix();
				float3 appendResult20_g18287 = (float3(break19_g18287[ 0 ][ 3 ] , break19_g18287[ 1 ][ 3 ] , break19_g18287[ 2 ][ 3 ]));
				half3 ObjectData20_g18286 = appendResult20_g18287;
				half3 WorldData19_g18286 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18286 = WorldData19_g18286;
				#else
				float3 staticSwitch14_g18286 = ObjectData20_g18286;
				#endif
				float4 tex2DNode7_g18285 = tex2D( TVE_ColorsTex, ( (TVE_ColorsCoord).xy + ( TVE_ColorsCoord.z * (staticSwitch14_g18286).xz ) ) );
				half3 Global_ColorsTex_RGB1700_g16972 = (tex2DNode7_g18285).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g18255 = 2.0;
				#else
				float staticSwitch1_g18255 = 4.594794;
				#endif
				float4 tex2DNode35_g16972 = tex2D( _MainMaskTex, Main_UVs15_g16972 );
				half Main_Mask57_g16972 = tex2DNode35_g16972.b;
				float temp_output_7_0_g18283 = _SubsurfaceMinValue;
				half Subsurface_Mask1557_g16972 = saturate( ( ( Main_Mask57_g16972 - temp_output_7_0_g18283 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g18283 ) ) );
				float3 lerpResult108_g16972 = lerp( temp_cast_0 , ( Global_ColorsTex_RGB1700_g16972 * staticSwitch1_g18255 ) , ( _GlobalColors * Subsurface_Mask1557_g16972 ));
				half3 Global_Colors1954_g16972 = lerpResult108_g16972;
				float3 temp_output_123_0_g16972 = ( Main_AlbedoRaw99_g16972 * Global_Colors1954_g16972 );
				half3 Main_AlbedoColored863_g16972 = temp_output_123_0_g16972;
				half3 Blend_Albedo265_g16972 = Main_AlbedoColored863_g16972;
				float3 temp_cast_1 = (0.5).xxx;
				float3 temp_output_799_0_g16972 = (_SubsurfaceColor).rgb;
				half Global_ColorsTex_A1701_g16972 = tex2DNode7_g18285.a;
				half Global_HealthinessValue1780_g16972 = _GlobalHealthiness;
				float lerpResult1720_g16972 = lerp( 1.0 , Global_ColorsTex_A1701_g16972 , Global_HealthinessValue1780_g16972);
				float3 lerpResult1698_g16972 = lerp( temp_cast_1 , temp_output_799_0_g16972 , lerpResult1720_g16972);
				half3 Subsurface_Color1722_g16972 = lerpResult1698_g16972;
				float lerpResult1779_g16972 = lerp( 1.0 , Global_ColorsTex_A1701_g16972 , Global_HealthinessValue1780_g16972);
				half AutoRegister_MaterialShadingSpace1208_g16972 = _MaterialShadingSpaceDrawer;
				half Subsurface_Intensity1752_g16972 = ( ( _SubsurfaceValue * lerpResult1779_g16972 ) + AutoRegister_MaterialShadingSpace1208_g16972 );
				half Overlay_Mask_Subsurface1492_g16972 = 0.0;
				half3 Subsurface_Transmission884_g16972 = ( Subsurface_Color1722_g16972 * Subsurface_Intensity1752_g16972 * Subsurface_Mask1557_g16972 * ( 1.0 - Overlay_Mask_Subsurface1492_g16972 ) );
				float3 normalizeResult1983_g16972 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g16972 = dot( -SafeNormalize(_MainLightPosition.xyz) , normalizeResult1983_g16972 );
				float saferPower1624_g16972 = max( (dotResult785_g16972*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g16972 = 0.0;
				#else
				float staticSwitch1602_g16972 = ( pow( saferPower1624_g16972 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g16972 = staticSwitch1602_g16972;
				half3 Subsurface_Deferred1693_g16972 = ( Subsurface_Transmission884_g16972 * Mask_Subsurface_View782_g16972 );
				half3 Blend_AlbedoAndSubsurface149_g16972 = ( Blend_Albedo265_g16972 + Subsurface_Deferred1693_g16972 );
				float3 temp_output_44_0_g18258 = (TVE_OverlayColor).rgb;
				half3 Global_OverlayColor1758_g16972 = temp_output_44_0_g18258;
				float4 tex2DNode117_g16972 = tex2D( _MainNormalTex, Main_UVs15_g16972 );
				float2 appendResult88_g18301 = (float2(tex2DNode117_g16972.a , tex2DNode117_g16972.g));
				float2 temp_output_90_0_g18301 = ( (appendResult88_g18301*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g18301 = (float3(temp_output_90_0_g18301 , 1.0));
				float3 Main_Normal137_g16972 = appendResult91_g18301;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal1085_g16972 = Main_Normal137_g16972;
				float3 worldNormal1085_g16972 = float3(dot(tanToWorld0,tanNormal1085_g16972), dot(tanToWorld1,tanNormal1085_g16972), dot(tanToWorld2,tanNormal1085_g16972));
				half Overlay_Contrast1405_g16972 = _OverlayContrast;
				half Global_OverlayIntensity154_g16972 = TVE_OverlayIntensity;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ) );
				half Global_ExtrasTex_B156_g16972 = tex2DNode7_g18297.b;
				float temp_output_1025_0_g16972 = ( Global_OverlayIntensity154_g16972 * _GlobalOverlay * Global_ExtrasTex_B156_g16972 );
				half Overlay_Commons1365_g16972 = temp_output_1025_0_g16972;
				half Overlay_Mask269_g16972 = saturate( ( saturate( ( IN.ase_color.a + ( worldNormal1085_g16972.y * Overlay_Contrast1405_g16972 ) ) ) - ( 1.0 - Overlay_Commons1365_g16972 ) ) );
				float3 lerpResult336_g16972 = lerp( Blend_AlbedoAndSubsurface149_g16972 , Global_OverlayColor1758_g16972 , Overlay_Mask269_g16972);
				half3 Final_Albedo359_g16972 = lerpResult336_g16972;
				half Main_Alpha316_g16972 = (temp_output_51_0_g16972).a;
				float lerpResult354_g16972 = lerp( 1.0 , Main_Alpha316_g16972 , __premul);
				half Final_Premultiply355_g16972 = lerpResult354_g16972;
				
				float3 temp_output_13_0_g18300 = Main_Normal137_g16972;
				float3 switchResult12_g18300 = (((ase_vface>0)?(temp_output_13_0_g18300):(( temp_output_13_0_g18300 * _render_normals_options ))));
				half3 Blend_Normal312_g16972 = switchResult12_g18300;
				half3 Final_Normal366_g16972 = Blend_Normal312_g16972;
				
				half Main_Smoothness227_g16972 = ( tex2DNode35_g16972.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g16972 = Main_Smoothness227_g16972;
				half Global_OverlaySmoothness311_g16972 = TVE_OverlaySmoothness;
				float lerpResult343_g16972 = lerp( Blend_Smoothness314_g16972 , Global_OverlaySmoothness311_g16972 , Overlay_Mask269_g16972);
				half Final_Smoothness371_g16972 = lerpResult343_g16972;
				half Global_Wetness1016_g16972 = ( TVE_Wetness * _GlobalWetness );
				half Global_ExtrasTex_A1033_g16972 = tex2DNode7_g18297.a;
				float lerpResult1037_g16972 = lerp( Final_Smoothness371_g16972 , saturate( ( Final_Smoothness371_g16972 + Global_Wetness1016_g16972 ) ) , Global_ExtrasTex_A1033_g16972);
				
				float lerpResult240_g16972 = lerp( 1.0 , tex2DNode35_g16972.g , _MainOcclusionValue);
				half Main_Occlusion247_g16972 = lerpResult240_g16972;
				half Blend_Occlusion323_g16972 = Main_Occlusion247_g16972;
				
				float localCustomAlphaClip9_g18277 = ( 0.0 );
				half Main_AlphaRaw1203_g16972 = tex2DNode29_g16972.a;
				half Alpha5_g18277 = Main_AlphaRaw1203_g16972;
				float Alpha9_g18277 = Alpha5_g18277;
				float AlphaClipThreshold9_g18277 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g18277 - AlphaClipThreshold9_g18277);
				#endif
				half Final_Clip914_g16972 = localCustomAlphaClip9_g18277;
				
				float3 Albedo = ( Final_Albedo359_g16972 * Final_Premultiply355_g16972 );
				float3 Normal = Final_Normal366_g16972;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = lerpResult1037_g16972;
				float Occlusion = Blend_Occlusion323_g16972;
				float Alpha = Main_Alpha316_g16972;
				float AlphaClipThreshold = Final_Clip914_g16972;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					inputData.normalWS = normalize(TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal )));
				#else
					#if !SHADER_HINT_NICE_QUALITY
						inputData.normalWS = WorldNormal;
					#else
						inputData.normalWS = normalize( WorldNormal );
					#endif
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.lightmapUVOrVertexSH.xyz, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLETVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _SubsurfaceColor;
			half3 _render_normals_options;
			half _BatchingMessage;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _IsAnyPathShader;
			half _InteractionAmplitude;
			half _IsStandardShader;
			half _IsLitShader;
			half _Banner;
			half _IsVersion;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionVariation_30;
			float _MotionScale_20;
			half _IsCrossShader;
			half _Motion_10;
			half _GlobalSize;
			half _GlobalSizeFade;
			half _MainSmoothnessValue;
			half __premul;
			half _GlobalOverlay;
			half _OverlayContrast;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _GlobalColors;
			half _IsUniversalPipeline;
			half __surface;
			half _MotionCat;
			float _MotionSpeed_32;
			half _MotionAmplitude_30;
			half _GlobalWetness;
			half _MaterialShadingCat;
			half __zw;
			half __blend;
			half _render_mode;
			half __clip;
			half _render_priority;
			half _render_dst;
			half _GlobalSettingsCat;
			half _render_clip;
			half _AdvancedCat;
			half _MainMaskValue;
			half _ObjectThicknessValue;
			half _RenderingCat;
			half _RenderMode_ResetInteractive;
			half _IsTVEShader;
			half _VertexOcclusion;
			half _material_batching;
			half _render_blend;
			half _render_zw;
			half _Cutoff;
			half _RenderMode_TransparentInteractive;
			float _MotionSpeed_30;
			float _MotionScale_30;
			half _MotionAmplitude_20;
			half _MotionVertical_20;
			float _MotionSpeed_20;
			half _MotionAmplitude_32;
			half _MainColorMode;
			half __dst;
			half _MotionVariation_20;
			half _render_cull;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __src;
			half __normals;
			half __cull;
			half _render_normals;
			half _AlphaClipInteractive;
			half _MainOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			half TVE_Amplitude1;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;


			
			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				half3 VertexPos40_g18273 = v.vertex.xyz;
				float3 appendResult74_g18273 = (float3(VertexPos40_g18273.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g18273 = appendResult74_g18273;
				float3 break84_g18273 = VertexPos40_g18273;
				float3 appendResult81_g18273 = (float3(0.0 , break84_g18273.y , break84_g18273.z));
				half3 VertexPosOtherAxis82_g18273 = appendResult81_g18273;
				float ObjectData20_g18309 = 3.14;
				float Bounds_Height374_g16972 = _MaxBoundsInfo.y;
				float WorldData19_g18309 = ( Bounds_Height374_g16972 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18309 = WorldData19_g18309;
				#else
				float staticSwitch14_g18309 = ObjectData20_g18309;
				#endif
				float Motion_Max_Bending1133_g16972 = staticSwitch14_g18309;
				half Global_Amplitude_136_g16972 = TVE_Amplitude1;
				float temp_output_4_0_g18291 = 1.0;
				float temp_output_5_0_g18291 = ( temp_output_4_0_g18291 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g18290 = GetObjectToWorldMatrix();
				float3 appendResult20_g18290 = (float3(break19_g18290[ 0 ][ 3 ] , break19_g18290[ 1 ][ 3 ] , break19_g18290[ 2 ][ 3 ]));
				half3 ObjectData20_g18292 = appendResult20_g18290;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g18292 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18292 = WorldData19_g18292;
				#else
				float3 staticSwitch14_g18292 = ObjectData20_g18292;
				#endif
				float2 panner73_g18289 = ( temp_output_5_0_g18291 * temp_cast_0 + ( (staticSwitch14_g18292).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g18289 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g18289, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g16972 = break142_g18289.r;
				float4x4 break19_g18268 = GetObjectToWorldMatrix();
				float3 appendResult20_g18268 = (float3(break19_g18268[ 0 ][ 3 ] , break19_g18268[ 1 ][ 3 ] , break19_g18268[ 2 ][ 3 ]));
				half3 ObjectData20_g18267 = appendResult20_g18268;
				half3 WorldData19_g18267 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18267 = WorldData19_g18267;
				#else
				float3 staticSwitch14_g18267 = ObjectData20_g18267;
				#endif
				float3 break322_g18294 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g18267).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g18294 = (float3(break322_g18294.x , 0.0 , break322_g18294.y));
				float3 temp_output_324_0_g18294 = (appendResult323_g18294*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g18295 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g18294 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g18295 = temp_output_324_0_g18294;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18295 = WorldData19_g18295;
				#else
				float3 staticSwitch14_g18295 = ObjectData20_g18295;
				#endif
				float2 temp_output_1976_320_g16972 = (staticSwitch14_g18295).xz;
				half2 Motion_DirectionOS39_g16972 = temp_output_1976_320_g16972;
				half Input_Speed62_g18245 = _MotionSpeed_10;
				float temp_output_4_0_g18246 = Input_Speed62_g18245;
				float temp_output_5_0_g18246 = ( temp_output_4_0_g18246 * _TimeParameters.x );
				float temp_output_349_0_g18245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g18249 = GetObjectToWorldMatrix();
				float3 appendResult20_g18249 = (float3(break19_g18249[ 0 ][ 3 ] , break19_g18249[ 1 ][ 3 ] , break19_g18249[ 2 ][ 3 ]));
				float3 break9_g18249 = appendResult20_g18249;
				float ObjectData20_g18248 = ( temp_output_349_0_g18245 + ( break9_g18249.x + break9_g18249.z ) );
				float WorldData19_g18248 = temp_output_349_0_g18245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18248 = WorldData19_g18248;
				#else
				float staticSwitch14_g18248 = ObjectData20_g18248;
				#endif
				half Motion_Variation284_g18245 = staticSwitch14_g18248;
				float2 appendResult344_g18245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g18245 = ( _MotionScale_10 * appendResult344_g18245 );
				half2 Sine_MinusOneToOne281_g18245 = sin( ( temp_output_5_0_g18246 + Motion_Variation284_g18245 + Motion_Scale287_g18245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g18245 = Global_NoiseTex_R34_g16972;
				float2 lerpResult321_g18245 = lerp( Sine_MinusOneToOne281_g18245 , temp_cast_4 , Input_Turbulence327_g18245);
				float2 temp_output_84_0_g16972 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g16972 ) * Global_Amplitude_136_g16972 * Global_NoiseTex_R34_g16972 * Motion_DirectionOS39_g16972 * lerpResult321_g18245 );
				float temp_output_1976_333_g16972 = break322_g18294.z;
				half2 Motion_Interaction53_g16972 = ( _InteractionAmplitude * Motion_Max_Bending1133_g16972 * temp_output_1976_320_g16972 * temp_output_1976_333_g16972 * temp_output_1976_333_g16972 );
				half Motion_InteractionMask66_g16972 = temp_output_1976_333_g16972;
				float2 lerpResult109_g16972 = lerp( temp_output_84_0_g16972 , Motion_Interaction53_g16972 , Motion_InteractionMask66_g16972);
				half Mesh_Motion_182_g16972 = v.ase_texcoord3.x;
				half Motion_Use1056_g16972 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g16972 = ( lerpResult109_g16972 * Mesh_Motion_182_g16972 * Motion_Use1056_g16972 );
				half Motion_Z190_g16972 = break143_g16972.y;
				half Angle44_g18273 = Motion_Z190_g16972;
				half3 VertexPos40_g18281 = ( VertexPosRotationAxis50_g18273 + ( VertexPosOtherAxis82_g18273 * cos( Angle44_g18273 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g18273 ) * sin( Angle44_g18273 ) ) );
				float3 appendResult74_g18281 = (float3(0.0 , 0.0 , VertexPos40_g18281.z));
				half3 VertexPosRotationAxis50_g18281 = appendResult74_g18281;
				float3 break84_g18281 = VertexPos40_g18281;
				float3 appendResult81_g18281 = (float3(break84_g18281.x , break84_g18281.y , 0.0));
				half3 VertexPosOtherAxis82_g18281 = appendResult81_g18281;
				half Motion_X216_g16972 = break143_g16972.x;
				half Angle44_g18281 = -Motion_X216_g16972;
				float3 Vertex_Motion_Object833_g16972 = ( VertexPosRotationAxis50_g18281 + ( VertexPosOtherAxis82_g18281 * cos( Angle44_g18281 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g18281 ) * sin( Angle44_g18281 ) ) );
				half3 ObjectData20_g18272 = Vertex_Motion_Object833_g16972;
				float3 appendResult2043_g16972 = (float3(Motion_X216_g16972 , 0.0 , Motion_Z190_g16972));
				float3 Vertex_Motion_World1118_g16972 = ( v.vertex.xyz + appendResult2043_g16972 );
				half3 WorldData19_g18272 = Vertex_Motion_World1118_g16972;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18272 = WorldData19_g18272;
				#else
				float3 staticSwitch14_g18272 = ObjectData20_g18272;
				#endif
				float4x4 break19_g18274 = GetObjectToWorldMatrix();
				float3 appendResult20_g18274 = (float3(break19_g18274[ 0 ][ 3 ] , break19_g18274[ 1 ][ 3 ] , break19_g18274[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g16972 = TVE_SizeFadeEnd;
				float temp_output_7_0_g18269 = Global_SizeFadeEnd287_g16972;
				half Global_SizeFadeStart276_g16972 = TVE_SizeFadeStart;
				float lerpResult348_g16972 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g18274 ) - temp_output_7_0_g18269 ) / ( Global_SizeFadeStart276_g16972 - temp_output_7_0_g18269 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g18278 = lerpResult348_g16972;
				float WorldData19_g18278 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18278 = WorldData19_g18278;
				#else
				float staticSwitch14_g18278 = ObjectData20_g18278;
				#endif
				float Vertex_SizeFade1740_g16972 = staticSwitch14_g18278;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g16972 = tex2DNode7_g18297.g;
				float lerpResult346_g16972 = lerp( 1.0 , Global_ExtrasTex_G305_g16972 , _GlobalSize);
				float ObjectData20_g18270 = lerpResult346_g16972;
				float WorldData19_g18270 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18270 = WorldData19_g18270;
				#else
				float staticSwitch14_g18270 = ObjectData20_g18270;
				#endif
				half Vertex_Size1741_g16972 = staticSwitch14_g18270;
				float3 Final_Vertex890_g16972 = ( ( staticSwitch14_g18272 * Vertex_SizeFade1740_g16972 * Vertex_Size1741_g16972 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				o.ase_texcoord2 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g16972;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 Main_UVs15_g16972 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g16972 = tex2D( _MainAlbedoTex, Main_UVs15_g16972 );
				float4 temp_output_51_0_g16972 = ( _MainColor * tex2DNode29_g16972 );
				half Main_Alpha316_g16972 = (temp_output_51_0_g16972).a;
				
				float localCustomAlphaClip9_g18277 = ( 0.0 );
				half Main_AlphaRaw1203_g16972 = tex2DNode29_g16972.a;
				half Alpha5_g18277 = Main_AlphaRaw1203_g16972;
				float Alpha9_g18277 = Alpha5_g18277;
				float AlphaClipThreshold9_g18277 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g18277 - AlphaClipThreshold9_g18277);
				#endif
				half Final_Clip914_g16972 = localCustomAlphaClip9_g18277;
				
				float Alpha = Main_Alpha316_g16972;
				float AlphaClipThreshold = Final_Clip914_g16972;

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLETVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _SubsurfaceColor;
			half3 _render_normals_options;
			half _BatchingMessage;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _IsAnyPathShader;
			half _InteractionAmplitude;
			half _IsStandardShader;
			half _IsLitShader;
			half _Banner;
			half _IsVersion;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionVariation_30;
			float _MotionScale_20;
			half _IsCrossShader;
			half _Motion_10;
			half _GlobalSize;
			half _GlobalSizeFade;
			half _MainSmoothnessValue;
			half __premul;
			half _GlobalOverlay;
			half _OverlayContrast;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _GlobalColors;
			half _IsUniversalPipeline;
			half __surface;
			half _MotionCat;
			float _MotionSpeed_32;
			half _MotionAmplitude_30;
			half _GlobalWetness;
			half _MaterialShadingCat;
			half __zw;
			half __blend;
			half _render_mode;
			half __clip;
			half _render_priority;
			half _render_dst;
			half _GlobalSettingsCat;
			half _render_clip;
			half _AdvancedCat;
			half _MainMaskValue;
			half _ObjectThicknessValue;
			half _RenderingCat;
			half _RenderMode_ResetInteractive;
			half _IsTVEShader;
			half _VertexOcclusion;
			half _material_batching;
			half _render_blend;
			half _render_zw;
			half _Cutoff;
			half _RenderMode_TransparentInteractive;
			float _MotionSpeed_30;
			float _MotionScale_30;
			half _MotionAmplitude_20;
			half _MotionVertical_20;
			float _MotionSpeed_20;
			half _MotionAmplitude_32;
			half _MainColorMode;
			half __dst;
			half _MotionVariation_20;
			half _render_cull;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __src;
			half __normals;
			half __cull;
			half _render_normals;
			half _AlphaClipInteractive;
			half _MainOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			half TVE_Amplitude1;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				half3 VertexPos40_g18273 = v.vertex.xyz;
				float3 appendResult74_g18273 = (float3(VertexPos40_g18273.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g18273 = appendResult74_g18273;
				float3 break84_g18273 = VertexPos40_g18273;
				float3 appendResult81_g18273 = (float3(0.0 , break84_g18273.y , break84_g18273.z));
				half3 VertexPosOtherAxis82_g18273 = appendResult81_g18273;
				float ObjectData20_g18309 = 3.14;
				float Bounds_Height374_g16972 = _MaxBoundsInfo.y;
				float WorldData19_g18309 = ( Bounds_Height374_g16972 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18309 = WorldData19_g18309;
				#else
				float staticSwitch14_g18309 = ObjectData20_g18309;
				#endif
				float Motion_Max_Bending1133_g16972 = staticSwitch14_g18309;
				half Global_Amplitude_136_g16972 = TVE_Amplitude1;
				float temp_output_4_0_g18291 = 1.0;
				float temp_output_5_0_g18291 = ( temp_output_4_0_g18291 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g18290 = GetObjectToWorldMatrix();
				float3 appendResult20_g18290 = (float3(break19_g18290[ 0 ][ 3 ] , break19_g18290[ 1 ][ 3 ] , break19_g18290[ 2 ][ 3 ]));
				half3 ObjectData20_g18292 = appendResult20_g18290;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g18292 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18292 = WorldData19_g18292;
				#else
				float3 staticSwitch14_g18292 = ObjectData20_g18292;
				#endif
				float2 panner73_g18289 = ( temp_output_5_0_g18291 * temp_cast_0 + ( (staticSwitch14_g18292).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g18289 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g18289, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g16972 = break142_g18289.r;
				float4x4 break19_g18268 = GetObjectToWorldMatrix();
				float3 appendResult20_g18268 = (float3(break19_g18268[ 0 ][ 3 ] , break19_g18268[ 1 ][ 3 ] , break19_g18268[ 2 ][ 3 ]));
				half3 ObjectData20_g18267 = appendResult20_g18268;
				half3 WorldData19_g18267 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18267 = WorldData19_g18267;
				#else
				float3 staticSwitch14_g18267 = ObjectData20_g18267;
				#endif
				float3 break322_g18294 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g18267).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g18294 = (float3(break322_g18294.x , 0.0 , break322_g18294.y));
				float3 temp_output_324_0_g18294 = (appendResult323_g18294*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g18295 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g18294 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g18295 = temp_output_324_0_g18294;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18295 = WorldData19_g18295;
				#else
				float3 staticSwitch14_g18295 = ObjectData20_g18295;
				#endif
				float2 temp_output_1976_320_g16972 = (staticSwitch14_g18295).xz;
				half2 Motion_DirectionOS39_g16972 = temp_output_1976_320_g16972;
				half Input_Speed62_g18245 = _MotionSpeed_10;
				float temp_output_4_0_g18246 = Input_Speed62_g18245;
				float temp_output_5_0_g18246 = ( temp_output_4_0_g18246 * _TimeParameters.x );
				float temp_output_349_0_g18245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g18249 = GetObjectToWorldMatrix();
				float3 appendResult20_g18249 = (float3(break19_g18249[ 0 ][ 3 ] , break19_g18249[ 1 ][ 3 ] , break19_g18249[ 2 ][ 3 ]));
				float3 break9_g18249 = appendResult20_g18249;
				float ObjectData20_g18248 = ( temp_output_349_0_g18245 + ( break9_g18249.x + break9_g18249.z ) );
				float WorldData19_g18248 = temp_output_349_0_g18245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18248 = WorldData19_g18248;
				#else
				float staticSwitch14_g18248 = ObjectData20_g18248;
				#endif
				half Motion_Variation284_g18245 = staticSwitch14_g18248;
				float2 appendResult344_g18245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g18245 = ( _MotionScale_10 * appendResult344_g18245 );
				half2 Sine_MinusOneToOne281_g18245 = sin( ( temp_output_5_0_g18246 + Motion_Variation284_g18245 + Motion_Scale287_g18245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g18245 = Global_NoiseTex_R34_g16972;
				float2 lerpResult321_g18245 = lerp( Sine_MinusOneToOne281_g18245 , temp_cast_4 , Input_Turbulence327_g18245);
				float2 temp_output_84_0_g16972 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g16972 ) * Global_Amplitude_136_g16972 * Global_NoiseTex_R34_g16972 * Motion_DirectionOS39_g16972 * lerpResult321_g18245 );
				float temp_output_1976_333_g16972 = break322_g18294.z;
				half2 Motion_Interaction53_g16972 = ( _InteractionAmplitude * Motion_Max_Bending1133_g16972 * temp_output_1976_320_g16972 * temp_output_1976_333_g16972 * temp_output_1976_333_g16972 );
				half Motion_InteractionMask66_g16972 = temp_output_1976_333_g16972;
				float2 lerpResult109_g16972 = lerp( temp_output_84_0_g16972 , Motion_Interaction53_g16972 , Motion_InteractionMask66_g16972);
				half Mesh_Motion_182_g16972 = v.ase_texcoord3.x;
				half Motion_Use1056_g16972 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g16972 = ( lerpResult109_g16972 * Mesh_Motion_182_g16972 * Motion_Use1056_g16972 );
				half Motion_Z190_g16972 = break143_g16972.y;
				half Angle44_g18273 = Motion_Z190_g16972;
				half3 VertexPos40_g18281 = ( VertexPosRotationAxis50_g18273 + ( VertexPosOtherAxis82_g18273 * cos( Angle44_g18273 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g18273 ) * sin( Angle44_g18273 ) ) );
				float3 appendResult74_g18281 = (float3(0.0 , 0.0 , VertexPos40_g18281.z));
				half3 VertexPosRotationAxis50_g18281 = appendResult74_g18281;
				float3 break84_g18281 = VertexPos40_g18281;
				float3 appendResult81_g18281 = (float3(break84_g18281.x , break84_g18281.y , 0.0));
				half3 VertexPosOtherAxis82_g18281 = appendResult81_g18281;
				half Motion_X216_g16972 = break143_g16972.x;
				half Angle44_g18281 = -Motion_X216_g16972;
				float3 Vertex_Motion_Object833_g16972 = ( VertexPosRotationAxis50_g18281 + ( VertexPosOtherAxis82_g18281 * cos( Angle44_g18281 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g18281 ) * sin( Angle44_g18281 ) ) );
				half3 ObjectData20_g18272 = Vertex_Motion_Object833_g16972;
				float3 appendResult2043_g16972 = (float3(Motion_X216_g16972 , 0.0 , Motion_Z190_g16972));
				float3 Vertex_Motion_World1118_g16972 = ( v.vertex.xyz + appendResult2043_g16972 );
				half3 WorldData19_g18272 = Vertex_Motion_World1118_g16972;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18272 = WorldData19_g18272;
				#else
				float3 staticSwitch14_g18272 = ObjectData20_g18272;
				#endif
				float4x4 break19_g18274 = GetObjectToWorldMatrix();
				float3 appendResult20_g18274 = (float3(break19_g18274[ 0 ][ 3 ] , break19_g18274[ 1 ][ 3 ] , break19_g18274[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g16972 = TVE_SizeFadeEnd;
				float temp_output_7_0_g18269 = Global_SizeFadeEnd287_g16972;
				half Global_SizeFadeStart276_g16972 = TVE_SizeFadeStart;
				float lerpResult348_g16972 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g18274 ) - temp_output_7_0_g18269 ) / ( Global_SizeFadeStart276_g16972 - temp_output_7_0_g18269 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g18278 = lerpResult348_g16972;
				float WorldData19_g18278 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18278 = WorldData19_g18278;
				#else
				float staticSwitch14_g18278 = ObjectData20_g18278;
				#endif
				float Vertex_SizeFade1740_g16972 = staticSwitch14_g18278;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g16972 = tex2DNode7_g18297.g;
				float lerpResult346_g16972 = lerp( 1.0 , Global_ExtrasTex_G305_g16972 , _GlobalSize);
				float ObjectData20_g18270 = lerpResult346_g16972;
				float WorldData19_g18270 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18270 = WorldData19_g18270;
				#else
				float staticSwitch14_g18270 = ObjectData20_g18270;
				#endif
				half Vertex_Size1741_g16972 = staticSwitch14_g18270;
				float3 Final_Vertex890_g16972 = ( ( staticSwitch14_g18272 * Vertex_SizeFade1740_g16972 * Vertex_Size1741_g16972 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				o.ase_texcoord2 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g16972;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 Main_UVs15_g16972 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g16972 = tex2D( _MainAlbedoTex, Main_UVs15_g16972 );
				float4 temp_output_51_0_g16972 = ( _MainColor * tex2DNode29_g16972 );
				half Main_Alpha316_g16972 = (temp_output_51_0_g16972).a;
				
				float localCustomAlphaClip9_g18277 = ( 0.0 );
				half Main_AlphaRaw1203_g16972 = tex2DNode29_g16972.a;
				half Alpha5_g18277 = Main_AlphaRaw1203_g16972;
				float Alpha9_g18277 = Alpha5_g18277;
				float AlphaClipThreshold9_g18277 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g18277 - AlphaClipThreshold9_g18277);
				#endif
				half Final_Clip914_g16972 = localCustomAlphaClip9_g18277;
				
				float Alpha = Main_Alpha316_g16972;
				float AlphaClipThreshold = Final_Clip914_g16972;

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLETVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _SubsurfaceColor;
			half3 _render_normals_options;
			half _BatchingMessage;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _IsAnyPathShader;
			half _InteractionAmplitude;
			half _IsStandardShader;
			half _IsLitShader;
			half _Banner;
			half _IsVersion;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionVariation_30;
			float _MotionScale_20;
			half _IsCrossShader;
			half _Motion_10;
			half _GlobalSize;
			half _GlobalSizeFade;
			half _MainSmoothnessValue;
			half __premul;
			half _GlobalOverlay;
			half _OverlayContrast;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _GlobalColors;
			half _IsUniversalPipeline;
			half __surface;
			half _MotionCat;
			float _MotionSpeed_32;
			half _MotionAmplitude_30;
			half _GlobalWetness;
			half _MaterialShadingCat;
			half __zw;
			half __blend;
			half _render_mode;
			half __clip;
			half _render_priority;
			half _render_dst;
			half _GlobalSettingsCat;
			half _render_clip;
			half _AdvancedCat;
			half _MainMaskValue;
			half _ObjectThicknessValue;
			half _RenderingCat;
			half _RenderMode_ResetInteractive;
			half _IsTVEShader;
			half _VertexOcclusion;
			half _material_batching;
			half _render_blend;
			half _render_zw;
			half _Cutoff;
			half _RenderMode_TransparentInteractive;
			float _MotionSpeed_30;
			float _MotionScale_30;
			half _MotionAmplitude_20;
			half _MotionVertical_20;
			float _MotionSpeed_20;
			half _MotionAmplitude_32;
			half _MainColorMode;
			half __dst;
			half _MotionVariation_20;
			half _render_cull;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __src;
			half __normals;
			half __cull;
			half _render_normals;
			half _AlphaClipInteractive;
			half _MainOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			half TVE_Amplitude1;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;
			sampler2D TVE_ColorsTex;
			half4 TVE_ColorsCoord;
			sampler2D _MainMaskTex;
			half4 TVE_OverlayColor;
			sampler2D _MainNormalTex;
			half TVE_OverlayIntensity;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				half3 VertexPos40_g18273 = v.vertex.xyz;
				float3 appendResult74_g18273 = (float3(VertexPos40_g18273.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g18273 = appendResult74_g18273;
				float3 break84_g18273 = VertexPos40_g18273;
				float3 appendResult81_g18273 = (float3(0.0 , break84_g18273.y , break84_g18273.z));
				half3 VertexPosOtherAxis82_g18273 = appendResult81_g18273;
				float ObjectData20_g18309 = 3.14;
				float Bounds_Height374_g16972 = _MaxBoundsInfo.y;
				float WorldData19_g18309 = ( Bounds_Height374_g16972 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18309 = WorldData19_g18309;
				#else
				float staticSwitch14_g18309 = ObjectData20_g18309;
				#endif
				float Motion_Max_Bending1133_g16972 = staticSwitch14_g18309;
				half Global_Amplitude_136_g16972 = TVE_Amplitude1;
				float temp_output_4_0_g18291 = 1.0;
				float temp_output_5_0_g18291 = ( temp_output_4_0_g18291 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g18290 = GetObjectToWorldMatrix();
				float3 appendResult20_g18290 = (float3(break19_g18290[ 0 ][ 3 ] , break19_g18290[ 1 ][ 3 ] , break19_g18290[ 2 ][ 3 ]));
				half3 ObjectData20_g18292 = appendResult20_g18290;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g18292 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18292 = WorldData19_g18292;
				#else
				float3 staticSwitch14_g18292 = ObjectData20_g18292;
				#endif
				float2 panner73_g18289 = ( temp_output_5_0_g18291 * temp_cast_0 + ( (staticSwitch14_g18292).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g18289 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g18289, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g16972 = break142_g18289.r;
				float4x4 break19_g18268 = GetObjectToWorldMatrix();
				float3 appendResult20_g18268 = (float3(break19_g18268[ 0 ][ 3 ] , break19_g18268[ 1 ][ 3 ] , break19_g18268[ 2 ][ 3 ]));
				half3 ObjectData20_g18267 = appendResult20_g18268;
				half3 WorldData19_g18267 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18267 = WorldData19_g18267;
				#else
				float3 staticSwitch14_g18267 = ObjectData20_g18267;
				#endif
				float3 break322_g18294 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g18267).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g18294 = (float3(break322_g18294.x , 0.0 , break322_g18294.y));
				float3 temp_output_324_0_g18294 = (appendResult323_g18294*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g18295 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g18294 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g18295 = temp_output_324_0_g18294;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18295 = WorldData19_g18295;
				#else
				float3 staticSwitch14_g18295 = ObjectData20_g18295;
				#endif
				float2 temp_output_1976_320_g16972 = (staticSwitch14_g18295).xz;
				half2 Motion_DirectionOS39_g16972 = temp_output_1976_320_g16972;
				half Input_Speed62_g18245 = _MotionSpeed_10;
				float temp_output_4_0_g18246 = Input_Speed62_g18245;
				float temp_output_5_0_g18246 = ( temp_output_4_0_g18246 * _TimeParameters.x );
				float temp_output_349_0_g18245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g18249 = GetObjectToWorldMatrix();
				float3 appendResult20_g18249 = (float3(break19_g18249[ 0 ][ 3 ] , break19_g18249[ 1 ][ 3 ] , break19_g18249[ 2 ][ 3 ]));
				float3 break9_g18249 = appendResult20_g18249;
				float ObjectData20_g18248 = ( temp_output_349_0_g18245 + ( break9_g18249.x + break9_g18249.z ) );
				float WorldData19_g18248 = temp_output_349_0_g18245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18248 = WorldData19_g18248;
				#else
				float staticSwitch14_g18248 = ObjectData20_g18248;
				#endif
				half Motion_Variation284_g18245 = staticSwitch14_g18248;
				float2 appendResult344_g18245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g18245 = ( _MotionScale_10 * appendResult344_g18245 );
				half2 Sine_MinusOneToOne281_g18245 = sin( ( temp_output_5_0_g18246 + Motion_Variation284_g18245 + Motion_Scale287_g18245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g18245 = Global_NoiseTex_R34_g16972;
				float2 lerpResult321_g18245 = lerp( Sine_MinusOneToOne281_g18245 , temp_cast_4 , Input_Turbulence327_g18245);
				float2 temp_output_84_0_g16972 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g16972 ) * Global_Amplitude_136_g16972 * Global_NoiseTex_R34_g16972 * Motion_DirectionOS39_g16972 * lerpResult321_g18245 );
				float temp_output_1976_333_g16972 = break322_g18294.z;
				half2 Motion_Interaction53_g16972 = ( _InteractionAmplitude * Motion_Max_Bending1133_g16972 * temp_output_1976_320_g16972 * temp_output_1976_333_g16972 * temp_output_1976_333_g16972 );
				half Motion_InteractionMask66_g16972 = temp_output_1976_333_g16972;
				float2 lerpResult109_g16972 = lerp( temp_output_84_0_g16972 , Motion_Interaction53_g16972 , Motion_InteractionMask66_g16972);
				half Mesh_Motion_182_g16972 = v.ase_texcoord3.x;
				half Motion_Use1056_g16972 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g16972 = ( lerpResult109_g16972 * Mesh_Motion_182_g16972 * Motion_Use1056_g16972 );
				half Motion_Z190_g16972 = break143_g16972.y;
				half Angle44_g18273 = Motion_Z190_g16972;
				half3 VertexPos40_g18281 = ( VertexPosRotationAxis50_g18273 + ( VertexPosOtherAxis82_g18273 * cos( Angle44_g18273 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g18273 ) * sin( Angle44_g18273 ) ) );
				float3 appendResult74_g18281 = (float3(0.0 , 0.0 , VertexPos40_g18281.z));
				half3 VertexPosRotationAxis50_g18281 = appendResult74_g18281;
				float3 break84_g18281 = VertexPos40_g18281;
				float3 appendResult81_g18281 = (float3(break84_g18281.x , break84_g18281.y , 0.0));
				half3 VertexPosOtherAxis82_g18281 = appendResult81_g18281;
				half Motion_X216_g16972 = break143_g16972.x;
				half Angle44_g18281 = -Motion_X216_g16972;
				float3 Vertex_Motion_Object833_g16972 = ( VertexPosRotationAxis50_g18281 + ( VertexPosOtherAxis82_g18281 * cos( Angle44_g18281 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g18281 ) * sin( Angle44_g18281 ) ) );
				half3 ObjectData20_g18272 = Vertex_Motion_Object833_g16972;
				float3 appendResult2043_g16972 = (float3(Motion_X216_g16972 , 0.0 , Motion_Z190_g16972));
				float3 Vertex_Motion_World1118_g16972 = ( v.vertex.xyz + appendResult2043_g16972 );
				half3 WorldData19_g18272 = Vertex_Motion_World1118_g16972;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18272 = WorldData19_g18272;
				#else
				float3 staticSwitch14_g18272 = ObjectData20_g18272;
				#endif
				float4x4 break19_g18274 = GetObjectToWorldMatrix();
				float3 appendResult20_g18274 = (float3(break19_g18274[ 0 ][ 3 ] , break19_g18274[ 1 ][ 3 ] , break19_g18274[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g16972 = TVE_SizeFadeEnd;
				float temp_output_7_0_g18269 = Global_SizeFadeEnd287_g16972;
				half Global_SizeFadeStart276_g16972 = TVE_SizeFadeStart;
				float lerpResult348_g16972 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g18274 ) - temp_output_7_0_g18269 ) / ( Global_SizeFadeStart276_g16972 - temp_output_7_0_g18269 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g18278 = lerpResult348_g16972;
				float WorldData19_g18278 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18278 = WorldData19_g18278;
				#else
				float staticSwitch14_g18278 = ObjectData20_g18278;
				#endif
				float Vertex_SizeFade1740_g16972 = staticSwitch14_g18278;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g16972 = tex2DNode7_g18297.g;
				float lerpResult346_g16972 = lerp( 1.0 , Global_ExtrasTex_G305_g16972 , _GlobalSize);
				float ObjectData20_g18270 = lerpResult346_g16972;
				float WorldData19_g18270 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18270 = WorldData19_g18270;
				#else
				float staticSwitch14_g18270 = ObjectData20_g18270;
				#endif
				half Vertex_Size1741_g16972 = staticSwitch14_g18270;
				float3 Final_Vertex890_g16972 = ( ( staticSwitch14_g18272 * Vertex_SizeFade1740_g16972 * Vertex_Size1741_g16972 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g16972;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 Main_UVs15_g16972 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g16972 = tex2D( _MainAlbedoTex, Main_UVs15_g16972 );
				float4 temp_output_51_0_g16972 = ( _MainColor * tex2DNode29_g16972 );
				half3 Main_AlbedoRaw99_g16972 = (temp_output_51_0_g16972).rgb;
				float3 temp_cast_0 = (1.0).xxx;
				float4x4 break19_g18287 = GetObjectToWorldMatrix();
				float3 appendResult20_g18287 = (float3(break19_g18287[ 0 ][ 3 ] , break19_g18287[ 1 ][ 3 ] , break19_g18287[ 2 ][ 3 ]));
				half3 ObjectData20_g18286 = appendResult20_g18287;
				half3 WorldData19_g18286 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18286 = WorldData19_g18286;
				#else
				float3 staticSwitch14_g18286 = ObjectData20_g18286;
				#endif
				float4 tex2DNode7_g18285 = tex2D( TVE_ColorsTex, ( (TVE_ColorsCoord).xy + ( TVE_ColorsCoord.z * (staticSwitch14_g18286).xz ) ) );
				half3 Global_ColorsTex_RGB1700_g16972 = (tex2DNode7_g18285).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g18255 = 2.0;
				#else
				float staticSwitch1_g18255 = 4.594794;
				#endif
				float4 tex2DNode35_g16972 = tex2D( _MainMaskTex, Main_UVs15_g16972 );
				half Main_Mask57_g16972 = tex2DNode35_g16972.b;
				float temp_output_7_0_g18283 = _SubsurfaceMinValue;
				half Subsurface_Mask1557_g16972 = saturate( ( ( Main_Mask57_g16972 - temp_output_7_0_g18283 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g18283 ) ) );
				float3 lerpResult108_g16972 = lerp( temp_cast_0 , ( Global_ColorsTex_RGB1700_g16972 * staticSwitch1_g18255 ) , ( _GlobalColors * Subsurface_Mask1557_g16972 ));
				half3 Global_Colors1954_g16972 = lerpResult108_g16972;
				float3 temp_output_123_0_g16972 = ( Main_AlbedoRaw99_g16972 * Global_Colors1954_g16972 );
				half3 Main_AlbedoColored863_g16972 = temp_output_123_0_g16972;
				half3 Blend_Albedo265_g16972 = Main_AlbedoColored863_g16972;
				float3 temp_cast_1 = (0.5).xxx;
				float3 temp_output_799_0_g16972 = (_SubsurfaceColor).rgb;
				half Global_ColorsTex_A1701_g16972 = tex2DNode7_g18285.a;
				half Global_HealthinessValue1780_g16972 = _GlobalHealthiness;
				float lerpResult1720_g16972 = lerp( 1.0 , Global_ColorsTex_A1701_g16972 , Global_HealthinessValue1780_g16972);
				float3 lerpResult1698_g16972 = lerp( temp_cast_1 , temp_output_799_0_g16972 , lerpResult1720_g16972);
				half3 Subsurface_Color1722_g16972 = lerpResult1698_g16972;
				float lerpResult1779_g16972 = lerp( 1.0 , Global_ColorsTex_A1701_g16972 , Global_HealthinessValue1780_g16972);
				half AutoRegister_MaterialShadingSpace1208_g16972 = _MaterialShadingSpaceDrawer;
				half Subsurface_Intensity1752_g16972 = ( ( _SubsurfaceValue * lerpResult1779_g16972 ) + AutoRegister_MaterialShadingSpace1208_g16972 );
				half Overlay_Mask_Subsurface1492_g16972 = 0.0;
				half3 Subsurface_Transmission884_g16972 = ( Subsurface_Color1722_g16972 * Subsurface_Intensity1752_g16972 * Subsurface_Mask1557_g16972 * ( 1.0 - Overlay_Mask_Subsurface1492_g16972 ) );
				float3 normalizeResult1983_g16972 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g16972 = dot( -SafeNormalize(_MainLightPosition.xyz) , normalizeResult1983_g16972 );
				float saferPower1624_g16972 = max( (dotResult785_g16972*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g16972 = 0.0;
				#else
				float staticSwitch1602_g16972 = ( pow( saferPower1624_g16972 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g16972 = staticSwitch1602_g16972;
				half3 Subsurface_Deferred1693_g16972 = ( Subsurface_Transmission884_g16972 * Mask_Subsurface_View782_g16972 );
				half3 Blend_AlbedoAndSubsurface149_g16972 = ( Blend_Albedo265_g16972 + Subsurface_Deferred1693_g16972 );
				float3 temp_output_44_0_g18258 = (TVE_OverlayColor).rgb;
				half3 Global_OverlayColor1758_g16972 = temp_output_44_0_g18258;
				float4 tex2DNode117_g16972 = tex2D( _MainNormalTex, Main_UVs15_g16972 );
				float2 appendResult88_g18301 = (float2(tex2DNode117_g16972.a , tex2DNode117_g16972.g));
				float2 temp_output_90_0_g18301 = ( (appendResult88_g18301*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g18301 = (float3(temp_output_90_0_g18301 , 1.0));
				float3 Main_Normal137_g16972 = appendResult91_g18301;
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1085_g16972 = Main_Normal137_g16972;
				float3 worldNormal1085_g16972 = float3(dot(tanToWorld0,tanNormal1085_g16972), dot(tanToWorld1,tanNormal1085_g16972), dot(tanToWorld2,tanNormal1085_g16972));
				half Overlay_Contrast1405_g16972 = _OverlayContrast;
				half Global_OverlayIntensity154_g16972 = TVE_OverlayIntensity;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ) );
				half Global_ExtrasTex_B156_g16972 = tex2DNode7_g18297.b;
				float temp_output_1025_0_g16972 = ( Global_OverlayIntensity154_g16972 * _GlobalOverlay * Global_ExtrasTex_B156_g16972 );
				half Overlay_Commons1365_g16972 = temp_output_1025_0_g16972;
				half Overlay_Mask269_g16972 = saturate( ( saturate( ( IN.ase_color.a + ( worldNormal1085_g16972.y * Overlay_Contrast1405_g16972 ) ) ) - ( 1.0 - Overlay_Commons1365_g16972 ) ) );
				float3 lerpResult336_g16972 = lerp( Blend_AlbedoAndSubsurface149_g16972 , Global_OverlayColor1758_g16972 , Overlay_Mask269_g16972);
				half3 Final_Albedo359_g16972 = lerpResult336_g16972;
				half Main_Alpha316_g16972 = (temp_output_51_0_g16972).a;
				float lerpResult354_g16972 = lerp( 1.0 , Main_Alpha316_g16972 , __premul);
				half Final_Premultiply355_g16972 = lerpResult354_g16972;
				
				float localCustomAlphaClip9_g18277 = ( 0.0 );
				half Main_AlphaRaw1203_g16972 = tex2DNode29_g16972.a;
				half Alpha5_g18277 = Main_AlphaRaw1203_g16972;
				float Alpha9_g18277 = Alpha5_g18277;
				float AlphaClipThreshold9_g18277 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g18277 - AlphaClipThreshold9_g18277);
				#endif
				half Final_Clip914_g16972 = localCustomAlphaClip9_g18277;
				
				
				float3 Albedo = ( Final_Albedo359_g16972 * Final_Premultiply355_g16972 );
				float3 Emission = 0;
				float Alpha = Main_Alpha316_g16972;
				float AlphaClipThreshold = Final_Clip914_g16972;

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend [_render_src] [_render_dst] , One Zero
			ZWrite [_render_zw]
			ZTest LEqual
			Offset 0 , -1
			ColorMask RGBA

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define TVE_DISABLETVE_DISABLE_ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70201

			#pragma enable_d3d11_debug_symbols
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _MainColor;
			half4 _MainUVs;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			half4 _SubsurfaceColor;
			half3 _render_normals_options;
			half _BatchingMessage;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _IsAnyPathShader;
			half _InteractionAmplitude;
			half _IsStandardShader;
			half _IsLitShader;
			half _Banner;
			half _IsVersion;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionVariation_30;
			float _MotionScale_20;
			half _IsCrossShader;
			half _Motion_10;
			half _GlobalSize;
			half _GlobalSizeFade;
			half _MainSmoothnessValue;
			half __premul;
			half _GlobalOverlay;
			half _OverlayContrast;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _SubsurfaceAngleValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _GlobalColors;
			half _IsUniversalPipeline;
			half __surface;
			half _MotionCat;
			float _MotionSpeed_32;
			half _MotionAmplitude_30;
			half _GlobalWetness;
			half _MaterialShadingCat;
			half __zw;
			half __blend;
			half _render_mode;
			half __clip;
			half _render_priority;
			half _render_dst;
			half _GlobalSettingsCat;
			half _render_clip;
			half _AdvancedCat;
			half _MainMaskValue;
			half _ObjectThicknessValue;
			half _RenderingCat;
			half _RenderMode_ResetInteractive;
			half _IsTVEShader;
			half _VertexOcclusion;
			half _material_batching;
			half _render_blend;
			half _render_zw;
			half _Cutoff;
			half _RenderMode_TransparentInteractive;
			float _MotionSpeed_30;
			float _MotionScale_30;
			half _MotionAmplitude_20;
			half _MotionVertical_20;
			float _MotionSpeed_20;
			half _MotionAmplitude_32;
			half _MainColorMode;
			half __dst;
			half _MotionVariation_20;
			half _render_cull;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __src;
			half __normals;
			half __cull;
			half _render_normals;
			half _AlphaClipInteractive;
			half _MainOcclusionValue;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			half TVE_Amplitude1;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;
			sampler2D TVE_ColorsTex;
			half4 TVE_ColorsCoord;
			sampler2D _MainMaskTex;
			half4 TVE_OverlayColor;
			sampler2D _MainNormalTex;
			half TVE_OverlayIntensity;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				half3 VertexPos40_g18273 = v.vertex.xyz;
				float3 appendResult74_g18273 = (float3(VertexPos40_g18273.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g18273 = appendResult74_g18273;
				float3 break84_g18273 = VertexPos40_g18273;
				float3 appendResult81_g18273 = (float3(0.0 , break84_g18273.y , break84_g18273.z));
				half3 VertexPosOtherAxis82_g18273 = appendResult81_g18273;
				float ObjectData20_g18309 = 3.14;
				float Bounds_Height374_g16972 = _MaxBoundsInfo.y;
				float WorldData19_g18309 = ( Bounds_Height374_g16972 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18309 = WorldData19_g18309;
				#else
				float staticSwitch14_g18309 = ObjectData20_g18309;
				#endif
				float Motion_Max_Bending1133_g16972 = staticSwitch14_g18309;
				half Global_Amplitude_136_g16972 = TVE_Amplitude1;
				float temp_output_4_0_g18291 = 1.0;
				float temp_output_5_0_g18291 = ( temp_output_4_0_g18291 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g18290 = GetObjectToWorldMatrix();
				float3 appendResult20_g18290 = (float3(break19_g18290[ 0 ][ 3 ] , break19_g18290[ 1 ][ 3 ] , break19_g18290[ 2 ][ 3 ]));
				half3 ObjectData20_g18292 = appendResult20_g18290;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g18292 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18292 = WorldData19_g18292;
				#else
				float3 staticSwitch14_g18292 = ObjectData20_g18292;
				#endif
				float2 panner73_g18289 = ( temp_output_5_0_g18291 * temp_cast_0 + ( (staticSwitch14_g18292).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g18289 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g18289, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g16972 = break142_g18289.r;
				float4x4 break19_g18268 = GetObjectToWorldMatrix();
				float3 appendResult20_g18268 = (float3(break19_g18268[ 0 ][ 3 ] , break19_g18268[ 1 ][ 3 ] , break19_g18268[ 2 ][ 3 ]));
				half3 ObjectData20_g18267 = appendResult20_g18268;
				half3 WorldData19_g18267 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18267 = WorldData19_g18267;
				#else
				float3 staticSwitch14_g18267 = ObjectData20_g18267;
				#endif
				float3 break322_g18294 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g18267).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g18294 = (float3(break322_g18294.x , 0.0 , break322_g18294.y));
				float3 temp_output_324_0_g18294 = (appendResult323_g18294*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g18295 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g18294 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g18295 = temp_output_324_0_g18294;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18295 = WorldData19_g18295;
				#else
				float3 staticSwitch14_g18295 = ObjectData20_g18295;
				#endif
				float2 temp_output_1976_320_g16972 = (staticSwitch14_g18295).xz;
				half2 Motion_DirectionOS39_g16972 = temp_output_1976_320_g16972;
				half Input_Speed62_g18245 = _MotionSpeed_10;
				float temp_output_4_0_g18246 = Input_Speed62_g18245;
				float temp_output_5_0_g18246 = ( temp_output_4_0_g18246 * _TimeParameters.x );
				float temp_output_349_0_g18245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g18249 = GetObjectToWorldMatrix();
				float3 appendResult20_g18249 = (float3(break19_g18249[ 0 ][ 3 ] , break19_g18249[ 1 ][ 3 ] , break19_g18249[ 2 ][ 3 ]));
				float3 break9_g18249 = appendResult20_g18249;
				float ObjectData20_g18248 = ( temp_output_349_0_g18245 + ( break9_g18249.x + break9_g18249.z ) );
				float WorldData19_g18248 = temp_output_349_0_g18245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18248 = WorldData19_g18248;
				#else
				float staticSwitch14_g18248 = ObjectData20_g18248;
				#endif
				half Motion_Variation284_g18245 = staticSwitch14_g18248;
				float2 appendResult344_g18245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g18245 = ( _MotionScale_10 * appendResult344_g18245 );
				half2 Sine_MinusOneToOne281_g18245 = sin( ( temp_output_5_0_g18246 + Motion_Variation284_g18245 + Motion_Scale287_g18245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g18245 = Global_NoiseTex_R34_g16972;
				float2 lerpResult321_g18245 = lerp( Sine_MinusOneToOne281_g18245 , temp_cast_4 , Input_Turbulence327_g18245);
				float2 temp_output_84_0_g16972 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g16972 ) * Global_Amplitude_136_g16972 * Global_NoiseTex_R34_g16972 * Motion_DirectionOS39_g16972 * lerpResult321_g18245 );
				float temp_output_1976_333_g16972 = break322_g18294.z;
				half2 Motion_Interaction53_g16972 = ( _InteractionAmplitude * Motion_Max_Bending1133_g16972 * temp_output_1976_320_g16972 * temp_output_1976_333_g16972 * temp_output_1976_333_g16972 );
				half Motion_InteractionMask66_g16972 = temp_output_1976_333_g16972;
				float2 lerpResult109_g16972 = lerp( temp_output_84_0_g16972 , Motion_Interaction53_g16972 , Motion_InteractionMask66_g16972);
				half Mesh_Motion_182_g16972 = v.ase_texcoord3.x;
				half Motion_Use1056_g16972 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g16972 = ( lerpResult109_g16972 * Mesh_Motion_182_g16972 * Motion_Use1056_g16972 );
				half Motion_Z190_g16972 = break143_g16972.y;
				half Angle44_g18273 = Motion_Z190_g16972;
				half3 VertexPos40_g18281 = ( VertexPosRotationAxis50_g18273 + ( VertexPosOtherAxis82_g18273 * cos( Angle44_g18273 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g18273 ) * sin( Angle44_g18273 ) ) );
				float3 appendResult74_g18281 = (float3(0.0 , 0.0 , VertexPos40_g18281.z));
				half3 VertexPosRotationAxis50_g18281 = appendResult74_g18281;
				float3 break84_g18281 = VertexPos40_g18281;
				float3 appendResult81_g18281 = (float3(break84_g18281.x , break84_g18281.y , 0.0));
				half3 VertexPosOtherAxis82_g18281 = appendResult81_g18281;
				half Motion_X216_g16972 = break143_g16972.x;
				half Angle44_g18281 = -Motion_X216_g16972;
				float3 Vertex_Motion_Object833_g16972 = ( VertexPosRotationAxis50_g18281 + ( VertexPosOtherAxis82_g18281 * cos( Angle44_g18281 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g18281 ) * sin( Angle44_g18281 ) ) );
				half3 ObjectData20_g18272 = Vertex_Motion_Object833_g16972;
				float3 appendResult2043_g16972 = (float3(Motion_X216_g16972 , 0.0 , Motion_Z190_g16972));
				float3 Vertex_Motion_World1118_g16972 = ( v.vertex.xyz + appendResult2043_g16972 );
				half3 WorldData19_g18272 = Vertex_Motion_World1118_g16972;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18272 = WorldData19_g18272;
				#else
				float3 staticSwitch14_g18272 = ObjectData20_g18272;
				#endif
				float4x4 break19_g18274 = GetObjectToWorldMatrix();
				float3 appendResult20_g18274 = (float3(break19_g18274[ 0 ][ 3 ] , break19_g18274[ 1 ][ 3 ] , break19_g18274[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g16972 = TVE_SizeFadeEnd;
				float temp_output_7_0_g18269 = Global_SizeFadeEnd287_g16972;
				half Global_SizeFadeStart276_g16972 = TVE_SizeFadeStart;
				float lerpResult348_g16972 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g18274 ) - temp_output_7_0_g18269 ) / ( Global_SizeFadeStart276_g16972 - temp_output_7_0_g18269 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g18278 = lerpResult348_g16972;
				float WorldData19_g18278 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18278 = WorldData19_g18278;
				#else
				float staticSwitch14_g18278 = ObjectData20_g18278;
				#endif
				float Vertex_SizeFade1740_g16972 = staticSwitch14_g18278;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g16972 = tex2DNode7_g18297.g;
				float lerpResult346_g16972 = lerp( 1.0 , Global_ExtrasTex_G305_g16972 , _GlobalSize);
				float ObjectData20_g18270 = lerpResult346_g16972;
				float WorldData19_g18270 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g18270 = WorldData19_g18270;
				#else
				float staticSwitch14_g18270 = ObjectData20_g18270;
				#endif
				half Vertex_Size1741_g16972 = staticSwitch14_g18270;
				float3 Final_Vertex890_g16972 = ( ( staticSwitch14_g18272 * Vertex_SizeFade1740_g16972 * Vertex_Size1741_g16972 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g16972;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 Main_UVs15_g16972 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g16972 = tex2D( _MainAlbedoTex, Main_UVs15_g16972 );
				float4 temp_output_51_0_g16972 = ( _MainColor * tex2DNode29_g16972 );
				half3 Main_AlbedoRaw99_g16972 = (temp_output_51_0_g16972).rgb;
				float3 temp_cast_0 = (1.0).xxx;
				float4x4 break19_g18287 = GetObjectToWorldMatrix();
				float3 appendResult20_g18287 = (float3(break19_g18287[ 0 ][ 3 ] , break19_g18287[ 1 ][ 3 ] , break19_g18287[ 2 ][ 3 ]));
				half3 ObjectData20_g18286 = appendResult20_g18287;
				half3 WorldData19_g18286 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18286 = WorldData19_g18286;
				#else
				float3 staticSwitch14_g18286 = ObjectData20_g18286;
				#endif
				float4 tex2DNode7_g18285 = tex2D( TVE_ColorsTex, ( (TVE_ColorsCoord).xy + ( TVE_ColorsCoord.z * (staticSwitch14_g18286).xz ) ) );
				half3 Global_ColorsTex_RGB1700_g16972 = (tex2DNode7_g18285).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g18255 = 2.0;
				#else
				float staticSwitch1_g18255 = 4.594794;
				#endif
				float4 tex2DNode35_g16972 = tex2D( _MainMaskTex, Main_UVs15_g16972 );
				half Main_Mask57_g16972 = tex2DNode35_g16972.b;
				float temp_output_7_0_g18283 = _SubsurfaceMinValue;
				half Subsurface_Mask1557_g16972 = saturate( ( ( Main_Mask57_g16972 - temp_output_7_0_g18283 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g18283 ) ) );
				float3 lerpResult108_g16972 = lerp( temp_cast_0 , ( Global_ColorsTex_RGB1700_g16972 * staticSwitch1_g18255 ) , ( _GlobalColors * Subsurface_Mask1557_g16972 ));
				half3 Global_Colors1954_g16972 = lerpResult108_g16972;
				float3 temp_output_123_0_g16972 = ( Main_AlbedoRaw99_g16972 * Global_Colors1954_g16972 );
				half3 Main_AlbedoColored863_g16972 = temp_output_123_0_g16972;
				half3 Blend_Albedo265_g16972 = Main_AlbedoColored863_g16972;
				float3 temp_cast_1 = (0.5).xxx;
				float3 temp_output_799_0_g16972 = (_SubsurfaceColor).rgb;
				half Global_ColorsTex_A1701_g16972 = tex2DNode7_g18285.a;
				half Global_HealthinessValue1780_g16972 = _GlobalHealthiness;
				float lerpResult1720_g16972 = lerp( 1.0 , Global_ColorsTex_A1701_g16972 , Global_HealthinessValue1780_g16972);
				float3 lerpResult1698_g16972 = lerp( temp_cast_1 , temp_output_799_0_g16972 , lerpResult1720_g16972);
				half3 Subsurface_Color1722_g16972 = lerpResult1698_g16972;
				float lerpResult1779_g16972 = lerp( 1.0 , Global_ColorsTex_A1701_g16972 , Global_HealthinessValue1780_g16972);
				half AutoRegister_MaterialShadingSpace1208_g16972 = _MaterialShadingSpaceDrawer;
				half Subsurface_Intensity1752_g16972 = ( ( _SubsurfaceValue * lerpResult1779_g16972 ) + AutoRegister_MaterialShadingSpace1208_g16972 );
				half Overlay_Mask_Subsurface1492_g16972 = 0.0;
				half3 Subsurface_Transmission884_g16972 = ( Subsurface_Color1722_g16972 * Subsurface_Intensity1752_g16972 * Subsurface_Mask1557_g16972 * ( 1.0 - Overlay_Mask_Subsurface1492_g16972 ) );
				float3 normalizeResult1983_g16972 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g16972 = dot( -SafeNormalize(_MainLightPosition.xyz) , normalizeResult1983_g16972 );
				float saferPower1624_g16972 = max( (dotResult785_g16972*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g16972 = 0.0;
				#else
				float staticSwitch1602_g16972 = ( pow( saferPower1624_g16972 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g16972 = staticSwitch1602_g16972;
				half3 Subsurface_Deferred1693_g16972 = ( Subsurface_Transmission884_g16972 * Mask_Subsurface_View782_g16972 );
				half3 Blend_AlbedoAndSubsurface149_g16972 = ( Blend_Albedo265_g16972 + Subsurface_Deferred1693_g16972 );
				float3 temp_output_44_0_g18258 = (TVE_OverlayColor).rgb;
				half3 Global_OverlayColor1758_g16972 = temp_output_44_0_g18258;
				float4 tex2DNode117_g16972 = tex2D( _MainNormalTex, Main_UVs15_g16972 );
				float2 appendResult88_g18301 = (float2(tex2DNode117_g16972.a , tex2DNode117_g16972.g));
				float2 temp_output_90_0_g18301 = ( (appendResult88_g18301*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g18301 = (float3(temp_output_90_0_g18301 , 1.0));
				float3 Main_Normal137_g16972 = appendResult91_g18301;
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1085_g16972 = Main_Normal137_g16972;
				float3 worldNormal1085_g16972 = float3(dot(tanToWorld0,tanNormal1085_g16972), dot(tanToWorld1,tanNormal1085_g16972), dot(tanToWorld2,tanNormal1085_g16972));
				half Overlay_Contrast1405_g16972 = _OverlayContrast;
				half Global_OverlayIntensity154_g16972 = TVE_OverlayIntensity;
				float4x4 break19_g18298 = GetObjectToWorldMatrix();
				float3 appendResult20_g18298 = (float3(break19_g18298[ 0 ][ 3 ] , break19_g18298[ 1 ][ 3 ] , break19_g18298[ 2 ][ 3 ]));
				half3 ObjectData20_g18299 = appendResult20_g18298;
				half3 WorldData19_g18299 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g18299 = WorldData19_g18299;
				#else
				float3 staticSwitch14_g18299 = ObjectData20_g18299;
				#endif
				float4 tex2DNode7_g18297 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g18299).xz ) ) );
				half Global_ExtrasTex_B156_g16972 = tex2DNode7_g18297.b;
				float temp_output_1025_0_g16972 = ( Global_OverlayIntensity154_g16972 * _GlobalOverlay * Global_ExtrasTex_B156_g16972 );
				half Overlay_Commons1365_g16972 = temp_output_1025_0_g16972;
				half Overlay_Mask269_g16972 = saturate( ( saturate( ( IN.ase_color.a + ( worldNormal1085_g16972.y * Overlay_Contrast1405_g16972 ) ) ) - ( 1.0 - Overlay_Commons1365_g16972 ) ) );
				float3 lerpResult336_g16972 = lerp( Blend_AlbedoAndSubsurface149_g16972 , Global_OverlayColor1758_g16972 , Overlay_Mask269_g16972);
				half3 Final_Albedo359_g16972 = lerpResult336_g16972;
				half Main_Alpha316_g16972 = (temp_output_51_0_g16972).a;
				float lerpResult354_g16972 = lerp( 1.0 , Main_Alpha316_g16972 , __premul);
				half Final_Premultiply355_g16972 = lerpResult354_g16972;
				
				float localCustomAlphaClip9_g18277 = ( 0.0 );
				half Main_AlphaRaw1203_g16972 = tex2DNode29_g16972.a;
				half Alpha5_g18277 = Main_AlphaRaw1203_g16972;
				float Alpha9_g18277 = Alpha5_g18277;
				float AlphaClipThreshold9_g18277 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g18277 - AlphaClipThreshold9_g18277);
				#endif
				half Final_Clip914_g16972 = localCustomAlphaClip9_g18277;
				
				
				float3 Albedo = ( Final_Albedo359_g16972 * Final_Premultiply355_g16972 );
				float Alpha = Main_Alpha316_g16972;
				float AlphaClipThreshold = Final_Clip914_g16972;

				half4 color = half4( Albedo, Alpha );

				//#ifdef _ALPHATEST_ON
				//	clip(Alpha - AlphaClipThreshold);
				//#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	/*ase_lod*/
	CustomEditor "TVEShaderCoreGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18103
1927;7;1906;1015;3591.686;1161.948;1.647135;True;False
Node;AmplifyShaderEditor.FunctionNode;267;-2176,256;Inherit;False;Base Batching;144;;16971;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1984,-896;Half;False;Property;_IsCrossShader;_IsCrossShader;150;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;155;1;[HideInInspector];Fetch;True;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;147;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_Cutoff;_Cutoff;151;1;[HideInInspector];Fetch;False;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.719;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-1568,-896;Half;False;Property;_IsLitShader;_IsLitShader;148;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;268;-1392,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;149;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;152;2;[HideInInspector];[Enum];Fetch;True;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;154;1;[HideInInspector];Fetch;True;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;153;1;[HideInInspector];Fetch;True;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;264;-2176,-128;Inherit;False;Base Shader;1;;16972;856f7164d1c579d43a5cf4968a75ca43;51,1271,1,1300,1,1298,1,1962,1,1708,1,1712,3,1964,1,1969,1,1723,1,1719,1,893,0,1745,1,1742,1,1714,1,1718,1,1715,1,1717,1,1728,1,1732,0,916,0,1949,1,1762,0,1763,0,1776,0,1966,0,1736,0,1735,0,1734,0,1737,0,1968,0,1733,0,878,0,1550,0,1646,1,1690,1,1757,0,1669,1,1981,0,1759,0,860,1,2055,1,2031,1,2054,0,2032,0,2057,0,2033,0,2036,0,2060,0,2039,0,2062,0,1785,1;0;14;FLOAT3;0;FLOAT3;528;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Cross Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;273;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;269;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;270;-1376,-128;Float;False;True;-1;2;TVEShaderCoreGUI;0;2;BOXOPHOBIC/The Vegetation Engine/Billboards/Cross Standard Lit;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;16;False;False;False;True;2;True;10;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;17;True;0;False;-1;True;True;0;False;-1;-1;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;33;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Transmission;0;  Transmission Shadow;0.5,True,278;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;0;0;6;False;True;True;True;True;True;False;;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;271;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;272;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;274;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;True;True;True;True;True;0;False;-1;False;True;1;True;17;True;0;False;-1;True;True;0;False;-1;-1;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-256;Inherit;False;1024.392;100;Final;0;;0.3439424,0.5960785,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;266;-2176,-640;Inherit;False;1026.438;100;Features;0;;1,0.252,0,1;0;0
WireConnection;270;0;264;0
WireConnection;270;1;264;528
WireConnection;270;4;264;530
WireConnection;270;5;264;531
WireConnection;270;6;264;532
WireConnection;270;7;264;653
WireConnection;270;8;264;534
ASEEND*/
//CHKSM=6FBAB69760D7954049E98414BA587B0157DE69B0