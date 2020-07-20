// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Vegetation/Leaf Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledBanner(Leaf Standard Lit)]_Banner("Banner", Float) = 0
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
		_GlobalLeaves("Global Leaves", Range( 0 , 1)) = 1
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
		_ObjectOcclusionValue("Object Occlusion", Range( 0 , 8)) = 0
		[Space(10)]_OverlayContrast("Overlay Contrast", Range( 0 , 10)) = 1
		_OverlayVariation("Overlay Variation", Range( 0 , 1)) = 0
		_OverlayUVTilling("Overlay Tilling", Range( 0 , 10)) = 1
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
		_Motion_20("Motion Rolling", Range( 0 , 1)) = 1
		_Motion_30("Motion Leaves", Range( 0 , 1)) = 1
		_Motion_32("Motion Flutter", Range( 0 , 1)) = 1
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
		[HideInInspector]_IsLeafShader("_IsLeafShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsAnyPathShader("_IsAnyPathShader", Float) = 1
		[HideInInspector]_IsLitShader("_IsLitShader", Float) = 1
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _ALPHATEST_ON
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half3 _render_normals_options;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _Motion_30;
			half _MotionAmplitude_30;
			float _MotionSpeed_30;
			half _Motion_32;
			float _MotionScale_30;
			half _MotionVertical_20;
			half _MotionCat;
			half _Motion_10;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionVariation_30;
			half _GlobalSizeFade;
			half _VertexOcclusion;
			half _IsUniversalPipeline;
			half _ObjectOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half __premul;
			half _OverlayContrast;
			half _OverlayUVTilling;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _GlobalSize;
			half _SubsurfaceAngleValue;
			half _GlobalOverlay;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _GlobalColors;
			half _MotionAmplitude_10;
			half _OverlayVariation;
			float _MotionScale_20;
			float _MotionSpeed_20;
			half _MainOcclusionValue;
			half _RenderMode_TransparentInteractive;
			half _Cutoff;
			half _render_zw;
			half _render_blend;
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
			half _render_normals;
			half _MotionVariation_20;
			half __cull;
			half __src;
			half _Motion_20;
			half _MotionAmplitude_20;
			half _IsStandardShader;
			half _IsLeafShader;
			half _Banner;
			half _material_batching;
			half _BatchingMessage;
			half _IsAnyPathShader;
			half _IsLitShader;
			half _IsVersion;
			half __surface;
			half _MainColorMode;
			half __dst;
			half _render_cull;
			half _AlphaClipInteractive;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __normals;
			half _GlobalLeaves;
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
			half TVE_Amplitude2;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			half TVE_Amplitude1;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_Amplitude3;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;
			sampler2D TVE_ColorsTex;
			half4 TVE_ColorsCoord;
			sampler2D _MainMaskTex;
			half TVE_OverlayIntensity;
			sampler2D _MainNormalTex;
			half4 TVE_OverlayColor;
			sampler2D TVE_OverlayAlbedoTex;
			half TVE_OverlayUVTilling;
			sampler2D TVE_OverlayNormalTex;
			half TVE_OverlayNormalValue;
			half TVE_OverlaySmoothness;
			float TVE_Wetness;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				half3 VertexPos40_g19266 = v.vertex.xyz;
				float3 appendResult74_g19266 = (float3(0.0 , VertexPos40_g19266.y , 0.0));
				float3 VertexPosRotationAxis50_g19266 = appendResult74_g19266;
				float3 break84_g19266 = VertexPos40_g19266;
				float3 appendResult81_g19266 = (float3(break84_g19266.x , 0.0 , break84_g19266.z));
				float3 VertexPosOtherAxis82_g19266 = appendResult81_g19266;
				float ObjectData20_g19303 = 3.14;
				float Bounds_Radius121_g19244 = _MaxBoundsInfo.x;
				float WorldData19_g19303 = Bounds_Radius121_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19303 = WorldData19_g19303;
				#else
				float staticSwitch14_g19303 = ObjectData20_g19303;
				#endif
				float Motion_Max_Rolling1137_g19244 = staticSwitch14_g19303;
				half Global_Amplitude_270_g19244 = TVE_Amplitude2;
				half Mesh_Motion_260_g19244 = v.ase_texcoord3.y;
				float temp_output_4_0_g19286 = 1.0;
				float temp_output_5_0_g19286 = ( temp_output_4_0_g19286 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g19285 = GetObjectToWorldMatrix();
				float3 appendResult20_g19285 = (float3(break19_g19285[ 0 ][ 3 ] , break19_g19285[ 1 ][ 3 ] , break19_g19285[ 2 ][ 3 ]));
				half3 ObjectData20_g19287 = appendResult20_g19285;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g19287 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19287 = WorldData19_g19287;
				#else
				float3 staticSwitch14_g19287 = ObjectData20_g19287;
				#endif
				float2 panner73_g19284 = ( temp_output_5_0_g19286 * temp_cast_0 + ( (staticSwitch14_g19287).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g19284 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g19284, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g19244 = break142_g19284.r;
				half Global_NoiseTex_G38_g19244 = break142_g19284.g;
				half Motion_Use20162_g19244 = _Motion_20;
				half MotionSpeed265_g19244 = _MotionSpeed_20;
				half Input_Speed62_g19257 = MotionSpeed265_g19244;
				float temp_output_4_0_g19260 = Input_Speed62_g19257;
				float temp_output_5_0_g19260 = ( temp_output_4_0_g19260 * _TimeParameters.x );
				half MotionVariation264_g19244 = _MotionVariation_20;
				float temp_output_342_0_g19257 = ( MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19258 = GetObjectToWorldMatrix();
				float3 appendResult20_g19258 = (float3(break19_g19258[ 0 ][ 3 ] , break19_g19258[ 1 ][ 3 ] , break19_g19258[ 2 ][ 3 ]));
				float3 break9_g19258 = appendResult20_g19258;
				float ObjectData20_g19259 = ( temp_output_342_0_g19257 + ( break9_g19258.x + break9_g19258.z ) );
				float WorldData19_g19259 = temp_output_342_0_g19257;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19259 = WorldData19_g19259;
				#else
				float staticSwitch14_g19259 = ObjectData20_g19259;
				#endif
				float Motion_Variation284_g19257 = staticSwitch14_g19259;
				half MotionScale262_g19244 = _MotionScale_20;
				float Motion_Scale287_g19257 = ( MotionScale262_g19244 * ase_worldPos.x );
				half Motion_Rolling138_g19244 = ( ( _MotionAmplitude_20 * Motion_Max_Rolling1137_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Motion_Use20162_g19244 * sin( ( temp_output_5_0_g19260 + Motion_Variation284_g19257 + Motion_Scale287_g19257 ) ) );
				half Angle44_g19266 = Motion_Rolling138_g19244;
				half3 VertexPos40_g19268 = ( VertexPosRotationAxis50_g19266 + ( VertexPosOtherAxis82_g19266 * cos( Angle44_g19266 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g19266 ) * sin( Angle44_g19266 ) ) );
				float3 appendResult74_g19268 = (float3(VertexPos40_g19268.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g19268 = appendResult74_g19268;
				float3 break84_g19268 = VertexPos40_g19268;
				float3 appendResult81_g19268 = (float3(0.0 , break84_g19268.y , break84_g19268.z));
				half3 VertexPosOtherAxis82_g19268 = appendResult81_g19268;
				float ObjectData20_g19304 = 3.14;
				float Bounds_Height374_g19244 = _MaxBoundsInfo.y;
				float WorldData19_g19304 = ( Bounds_Height374_g19244 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19304 = WorldData19_g19304;
				#else
				float staticSwitch14_g19304 = ObjectData20_g19304;
				#endif
				float Motion_Max_Bending1133_g19244 = staticSwitch14_g19304;
				half Global_Amplitude_136_g19244 = TVE_Amplitude1;
				float4x4 break19_g19263 = GetObjectToWorldMatrix();
				float3 appendResult20_g19263 = (float3(break19_g19263[ 0 ][ 3 ] , break19_g19263[ 1 ][ 3 ] , break19_g19263[ 2 ][ 3 ]));
				half3 ObjectData20_g19262 = appendResult20_g19263;
				half3 WorldData19_g19262 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19262 = WorldData19_g19262;
				#else
				float3 staticSwitch14_g19262 = ObjectData20_g19262;
				#endif
				float3 break322_g19289 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g19262).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g19289 = (float3(break322_g19289.x , 0.0 , break322_g19289.y));
				float3 temp_output_324_0_g19289 = (appendResult323_g19289*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g19290 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g19289 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g19290 = temp_output_324_0_g19289;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19290 = WorldData19_g19290;
				#else
				float3 staticSwitch14_g19290 = ObjectData20_g19290;
				#endif
				float2 temp_output_1976_320_g19244 = (staticSwitch14_g19290).xz;
				half2 Motion_DirectionOS39_g19244 = temp_output_1976_320_g19244;
				half Input_Speed62_g19245 = _MotionSpeed_10;
				float temp_output_4_0_g19246 = Input_Speed62_g19245;
				float temp_output_5_0_g19246 = ( temp_output_4_0_g19246 * _TimeParameters.x );
				float temp_output_349_0_g19245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g19249 = GetObjectToWorldMatrix();
				float3 appendResult20_g19249 = (float3(break19_g19249[ 0 ][ 3 ] , break19_g19249[ 1 ][ 3 ] , break19_g19249[ 2 ][ 3 ]));
				float3 break9_g19249 = appendResult20_g19249;
				float ObjectData20_g19248 = ( temp_output_349_0_g19245 + ( break9_g19249.x + break9_g19249.z ) );
				float WorldData19_g19248 = temp_output_349_0_g19245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19248 = WorldData19_g19248;
				#else
				float staticSwitch14_g19248 = ObjectData20_g19248;
				#endif
				half Motion_Variation284_g19245 = staticSwitch14_g19248;
				float2 appendResult344_g19245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g19245 = ( _MotionScale_10 * appendResult344_g19245 );
				half2 Sine_MinusOneToOne281_g19245 = sin( ( temp_output_5_0_g19246 + Motion_Variation284_g19245 + Motion_Scale287_g19245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g19245 = Global_NoiseTex_R34_g19244;
				float2 lerpResult321_g19245 = lerp( Sine_MinusOneToOne281_g19245 , temp_cast_4 , Input_Turbulence327_g19245);
				float2 temp_output_84_0_g19244 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g19244 ) * Global_Amplitude_136_g19244 * Global_NoiseTex_R34_g19244 * Motion_DirectionOS39_g19244 * lerpResult321_g19245 );
				float temp_output_1976_333_g19244 = break322_g19289.z;
				half2 Motion_Interaction53_g19244 = ( _InteractionAmplitude * Motion_Max_Bending1133_g19244 * temp_output_1976_320_g19244 * temp_output_1976_333_g19244 * temp_output_1976_333_g19244 );
				half Motion_InteractionMask66_g19244 = temp_output_1976_333_g19244;
				float2 lerpResult109_g19244 = lerp( temp_output_84_0_g19244 , Motion_Interaction53_g19244 , Motion_InteractionMask66_g19244);
				half Mesh_Motion_182_g19244 = v.ase_texcoord3.x;
				half Motion_Use1056_g19244 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g19244 = ( lerpResult109_g19244 * Mesh_Motion_182_g19244 * Motion_Use1056_g19244 );
				half Motion_Z190_g19244 = break143_g19244.y;
				half Angle44_g19268 = Motion_Z190_g19244;
				half3 VertexPos40_g19276 = ( VertexPosRotationAxis50_g19268 + ( VertexPosOtherAxis82_g19268 * cos( Angle44_g19268 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g19268 ) * sin( Angle44_g19268 ) ) );
				float3 appendResult74_g19276 = (float3(0.0 , 0.0 , VertexPos40_g19276.z));
				half3 VertexPosRotationAxis50_g19276 = appendResult74_g19276;
				float3 break84_g19276 = VertexPos40_g19276;
				float3 appendResult81_g19276 = (float3(break84_g19276.x , break84_g19276.y , 0.0));
				half3 VertexPosOtherAxis82_g19276 = appendResult81_g19276;
				half Motion_X216_g19244 = break143_g19244.x;
				half Angle44_g19276 = -Motion_X216_g19244;
				half Global_NoiseTex_B132_g19244 = break142_g19284.b;
				half Input_Speed62_g19297 = -MotionSpeed265_g19244;
				float temp_output_4_0_g19300 = Input_Speed62_g19297;
				float temp_output_5_0_g19300 = ( temp_output_4_0_g19300 * _TimeParameters.x );
				float temp_output_342_0_g19297 = ( -MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19298 = GetObjectToWorldMatrix();
				float3 appendResult20_g19298 = (float3(break19_g19298[ 0 ][ 3 ] , break19_g19298[ 1 ][ 3 ] , break19_g19298[ 2 ][ 3 ]));
				float3 break9_g19298 = appendResult20_g19298;
				float ObjectData20_g19299 = ( temp_output_342_0_g19297 + ( break9_g19298.x + break9_g19298.z ) );
				float WorldData19_g19299 = temp_output_342_0_g19297;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19299 = WorldData19_g19299;
				#else
				float staticSwitch14_g19299 = ObjectData20_g19299;
				#endif
				float Motion_Variation284_g19297 = staticSwitch14_g19299;
				float Motion_Scale287_g19297 = ( MotionScale262_g19244 * ase_worldPos.x );
				float3 appendResult2014_g19244 = (float3(0.0 , ( ( _MotionVertical_20 * Bounds_Radius121_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * Motion_Use20162_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_B132_g19244 ) * sin( ( temp_output_5_0_g19300 + Motion_Variation284_g19297 + Motion_Scale287_g19297 ) ) ) , 0.0));
				half3 Motion_Vertical223_g19244 = appendResult2014_g19244;
				half Motion_Scale321_g19270 = ( _MotionScale_30 * 10.0 );
				half Input_Speed62_g19270 = _MotionSpeed_30;
				float temp_output_4_0_g19271 = Input_Speed62_g19270;
				float temp_output_5_0_g19271 = ( temp_output_4_0_g19271 * _TimeParameters.x );
				float Motion_Variation330_g19270 = ( _MotionVariation_30 * v.ase_color.r );
				half Input_Amplitude58_g19270 = ( _MotionAmplitude_30 * Bounds_Radius121_g19244 * 0.2 );
				half Mesh_Motion_3144_g19244 = v.ase_texcoord3.z;
				half Motion_Use302011_g19244 = _Motion_30;
				half3 Motion_Leaves1988_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19270 ) + temp_output_5_0_g19271 + Motion_Variation330_g19270 ) ) * Input_Amplitude58_g19270 * v.ase_normal ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use302011_g19244 * Global_Amplitude_270_g19244 );
				half Motion_Scale321_g19274 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g19274 = _MotionSpeed_32;
				float temp_output_4_0_g19275 = Input_Speed62_g19274;
				float temp_output_5_0_g19275 = ( temp_output_4_0_g19275 * _TimeParameters.x );
				float Motion_Variation330_g19274 = ( _MotionVariation_32 * v.ase_color.r );
				half Input_Amplitude58_g19274 = ( _MotionAmplitude_32 * Bounds_Radius121_g19244 * 0.2 );
				float3 appendResult345_g19274 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_A139_g19244 = break142_g19284.a;
				half Motion_Use322013_g19244 = _Motion_32;
				half Global_Amplitude_3488_g19244 = TVE_Amplitude3;
				half3 Motion_Flutter263_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19274 ) + temp_output_5_0_g19275 + Motion_Variation330_g19274 ) ) * Input_Amplitude58_g19274 * appendResult345_g19274 ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_A139_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use322013_g19244 * Global_Amplitude_3488_g19244 );
				float3 Vertex_Motion_Object833_g19244 = ( ( ( ( VertexPosRotationAxis50_g19276 + ( VertexPosOtherAxis82_g19276 * cos( Angle44_g19276 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g19276 ) * sin( Angle44_g19276 ) ) ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 ObjectData20_g19267 = Vertex_Motion_Object833_g19244;
				float3 appendResult2047_g19244 = (float3(Motion_Rolling138_g19244 , 0.0 , -Motion_Rolling138_g19244));
				float3 appendResult2043_g19244 = (float3(Motion_X216_g19244 , 0.0 , Motion_Z190_g19244));
				float3 Vertex_Motion_World1118_g19244 = ( ( ( ( ( v.vertex.xyz + appendResult2047_g19244 ) + appendResult2043_g19244 ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 WorldData19_g19267 = Vertex_Motion_World1118_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19267 = WorldData19_g19267;
				#else
				float3 staticSwitch14_g19267 = ObjectData20_g19267;
				#endif
				float4x4 break19_g19269 = GetObjectToWorldMatrix();
				float3 appendResult20_g19269 = (float3(break19_g19269[ 0 ][ 3 ] , break19_g19269[ 1 ][ 3 ] , break19_g19269[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g19244 = TVE_SizeFadeEnd;
				float temp_output_7_0_g19264 = Global_SizeFadeEnd287_g19244;
				half Global_SizeFadeStart276_g19244 = TVE_SizeFadeStart;
				float lerpResult348_g19244 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g19269 ) - temp_output_7_0_g19264 ) / ( Global_SizeFadeStart276_g19244 - temp_output_7_0_g19264 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g19273 = lerpResult348_g19244;
				float WorldData19_g19273 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19273 = WorldData19_g19273;
				#else
				float staticSwitch14_g19273 = ObjectData20_g19273;
				#endif
				float Vertex_SizeFade1740_g19244 = staticSwitch14_g19273;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g19244 = tex2DNode7_g19292.g;
				float lerpResult346_g19244 = lerp( 1.0 , Global_ExtrasTex_G305_g19244 , _GlobalSize);
				float ObjectData20_g19265 = lerpResult346_g19244;
				float WorldData19_g19265 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19265 = WorldData19_g19265;
				#else
				float staticSwitch14_g19265 = ObjectData20_g19265;
				#endif
				half Vertex_Size1741_g19244 = staticSwitch14_g19265;
				float3 Final_Vertex890_g19244 = ( ( staticSwitch14_g19267 * Vertex_SizeFade1740_g19244 * Vertex_Size1741_g19244 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				o.ase_texcoord7 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g19244;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 Main_UVs15_g19244 = ( ( IN.ase_texcoord7.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g19244 = tex2D( _MainAlbedoTex, Main_UVs15_g19244 );
				float4 temp_output_51_0_g19244 = ( _MainColor * tex2DNode29_g19244 );
				half3 Main_AlbedoRaw99_g19244 = (temp_output_51_0_g19244).rgb;
				float3 temp_cast_0 = (1.0).xxx;
				float4x4 break19_g19282 = GetObjectToWorldMatrix();
				float3 appendResult20_g19282 = (float3(break19_g19282[ 0 ][ 3 ] , break19_g19282[ 1 ][ 3 ] , break19_g19282[ 2 ][ 3 ]));
				half3 ObjectData20_g19281 = appendResult20_g19282;
				half3 WorldData19_g19281 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19281 = WorldData19_g19281;
				#else
				float3 staticSwitch14_g19281 = ObjectData20_g19281;
				#endif
				float4 tex2DNode7_g19280 = tex2D( TVE_ColorsTex, ( (TVE_ColorsCoord).xy + ( TVE_ColorsCoord.z * (staticSwitch14_g19281).xz ) ) );
				half3 Global_ColorsTex_RGB1700_g19244 = (tex2DNode7_g19280).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g19250 = 2.0;
				#else
				float staticSwitch1_g19250 = 4.594794;
				#endif
				float3 lerpResult108_g19244 = lerp( temp_cast_0 , ( Global_ColorsTex_RGB1700_g19244 * staticSwitch1_g19250 ) , _GlobalColors);
				half3 Global_Colors1954_g19244 = lerpResult108_g19244;
				float3 temp_output_123_0_g19244 = ( Main_AlbedoRaw99_g19244 * Global_Colors1954_g19244 );
				half3 Main_AlbedoColored863_g19244 = temp_output_123_0_g19244;
				half3 Blend_Albedo265_g19244 = Main_AlbedoColored863_g19244;
				float3 temp_cast_1 = (0.5).xxx;
				float3 temp_output_799_0_g19244 = (_SubsurfaceColor).rgb;
				half Global_ColorsTex_A1701_g19244 = tex2DNode7_g19280.a;
				half Global_HealthinessValue1780_g19244 = _GlobalHealthiness;
				float lerpResult1720_g19244 = lerp( 1.0 , Global_ColorsTex_A1701_g19244 , Global_HealthinessValue1780_g19244);
				float3 lerpResult1698_g19244 = lerp( temp_cast_1 , temp_output_799_0_g19244 , lerpResult1720_g19244);
				half3 Subsurface_Color1722_g19244 = lerpResult1698_g19244;
				float lerpResult1779_g19244 = lerp( 1.0 , Global_ColorsTex_A1701_g19244 , Global_HealthinessValue1780_g19244);
				half AutoRegister_MaterialShadingSpace1208_g19244 = _MaterialShadingSpaceDrawer;
				half Subsurface_Intensity1752_g19244 = ( ( _SubsurfaceValue * lerpResult1779_g19244 ) + AutoRegister_MaterialShadingSpace1208_g19244 );
				float4 tex2DNode35_g19244 = tex2D( _MainMaskTex, Main_UVs15_g19244 );
				half Main_Mask57_g19244 = tex2DNode35_g19244.b;
				float temp_output_7_0_g19278 = _SubsurfaceMinValue;
				half Subsurface_Mask1557_g19244 = saturate( ( ( Main_Mask57_g19244 - temp_output_7_0_g19278 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g19278 ) ) );
				half Global_OverlayIntensity154_g19244 = TVE_OverlayIntensity;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ) );
				half Global_ExtrasTex_B156_g19244 = tex2DNode7_g19292.b;
				float temp_output_1025_0_g19244 = ( Global_OverlayIntensity154_g19244 * _GlobalOverlay * Global_ExtrasTex_B156_g19244 );
				float Mesh_Variation16_g19244 = IN.ase_color.r;
				float lerpResult1065_g19244 = lerp( 1.0 , Mesh_Variation16_g19244 , _OverlayVariation);
				half Overlay_Commons1365_g19244 = ( temp_output_1025_0_g19244 * lerpResult1065_g19244 );
				half Overlay_Mask_Subsurface1492_g19244 = saturate( ( saturate( WorldNormal.y ) - ( 1.0 - Overlay_Commons1365_g19244 ) ) );
				half3 Subsurface_Transmission884_g19244 = ( Subsurface_Color1722_g19244 * Subsurface_Intensity1752_g19244 * Subsurface_Mask1557_g19244 * ( 1.0 - Overlay_Mask_Subsurface1492_g19244 ) );
				float3 normalizeResult1983_g19244 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g19244 = dot( -SafeNormalize(_MainLightPosition.xyz) , normalizeResult1983_g19244 );
				float saferPower1624_g19244 = max( (dotResult785_g19244*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g19244 = 0.0;
				#else
				float staticSwitch1602_g19244 = ( pow( saferPower1624_g19244 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g19244 = staticSwitch1602_g19244;
				float4 tex2DNode117_g19244 = tex2D( _MainNormalTex, Main_UVs15_g19244 );
				float2 appendResult88_g19296 = (float2(tex2DNode117_g19244.a , tex2DNode117_g19244.g));
				float2 temp_output_90_0_g19296 = ( (appendResult88_g19296*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g19296 = (float3(temp_output_90_0_g19296 , 1.0));
				float3 Main_Normal137_g19244 = appendResult91_g19296;
				float3 temp_output_13_0_g19288 = Main_Normal137_g19244;
				float3 switchResult12_g19288 = (((ase_vface>0)?(temp_output_13_0_g19288):(( temp_output_13_0_g19288 * _render_normals_options ))));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal2069_g19244 = switchResult12_g19288;
				float3 worldNormal2069_g19244 = normalize( float3(dot(tanToWorld0,tanNormal2069_g19244), dot(tanToWorld1,tanNormal2069_g19244), dot(tanToWorld2,tanNormal2069_g19244)) );
				float dotResult777_g19244 = dot( worldNormal2069_g19244 , SafeNormalize(_MainLightPosition.xyz) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1604_g19244 = 0.0;
				#else
				float staticSwitch1604_g19244 = max( -dotResult777_g19244 , 0.0 );
				#endif
				half Mask_Subsurface_Normal870_g19244 = staticSwitch1604_g19244;
				half3 Subsurface_Deferred1693_g19244 = ( Subsurface_Transmission884_g19244 * ( Mask_Subsurface_View782_g19244 + Mask_Subsurface_Normal870_g19244 ) );
				half3 Blend_AlbedoAndSubsurface149_g19244 = ( Blend_Albedo265_g19244 + Subsurface_Deferred1693_g19244 );
				float3 temp_output_44_0_g19253 = (TVE_OverlayColor).rgb;
				half3 Global_OverlayColor1758_g19244 = temp_output_44_0_g19253;
				float2 temp_output_38_0_g19253 = ( _OverlayUVTilling * IN.ase_texcoord7.xy * TVE_OverlayUVTilling );
				float3 temp_output_34_0_g19253 = (tex2D( TVE_OverlayAlbedoTex, temp_output_38_0_g19253 )).rgb;
				half3 Global_OverlayAlbedo277_g19244 = temp_output_34_0_g19253;
				float3 Blend_NormalRaw1051_g19244 = Main_Normal137_g19244;
				float3 switchResult1063_g19244 = (((ase_vface>0)?(Blend_NormalRaw1051_g19244):(( Blend_NormalRaw1051_g19244 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g19244 = _OverlayContrast;
				float3 appendResult1439_g19244 = (float3(Overlay_Contrast1405_g19244 , Overlay_Contrast1405_g19244 , 1.0));
				float3 tanNormal178_g19244 = ( switchResult1063_g19244 * appendResult1439_g19244 );
				float3 worldNormal178_g19244 = float3(dot(tanToWorld0,tanNormal178_g19244), dot(tanToWorld1,tanNormal178_g19244), dot(tanToWorld2,tanNormal178_g19244));
				half Overlay_Mask269_g19244 = saturate( ( saturate( worldNormal178_g19244.y ) - ( 1.0 - Overlay_Commons1365_g19244 ) ) );
				float3 lerpResult336_g19244 = lerp( Blend_AlbedoAndSubsurface149_g19244 , ( Global_OverlayColor1758_g19244 * Global_OverlayAlbedo277_g19244 ) , Overlay_Mask269_g19244);
				half3 Final_Albedo359_g19244 = lerpResult336_g19244;
				half Main_Alpha316_g19244 = (temp_output_51_0_g19244).a;
				float lerpResult354_g19244 = lerp( 1.0 , Main_Alpha316_g19244 , __premul);
				half Final_Premultiply355_g19244 = lerpResult354_g19244;
				
				float3 temp_output_13_0_g19295 = Main_Normal137_g19244;
				float3 switchResult12_g19295 = (((ase_vface>0)?(temp_output_13_0_g19295):(( temp_output_13_0_g19295 * _render_normals_options ))));
				half3 Blend_Normal312_g19244 = switchResult12_g19295;
				float4 tex2DNode33_g19253 = tex2D( TVE_OverlayNormalTex, temp_output_38_0_g19253 );
				float2 appendResult88_g19254 = (float2(tex2DNode33_g19253.a , tex2DNode33_g19253.g));
				float2 temp_output_90_0_g19254 = ( (appendResult88_g19254*2.0 + -1.0) * TVE_OverlayNormalValue );
				float3 appendResult91_g19254 = (float3(temp_output_90_0_g19254 , 1.0));
				float3 temp_output_84_19_g19253 = appendResult91_g19254;
				half3 Global_OverlayNormal313_g19244 = temp_output_84_19_g19253;
				float3 lerpResult349_g19244 = lerp( Blend_Normal312_g19244 , Global_OverlayNormal313_g19244 , Overlay_Mask269_g19244);
				half3 Final_Normal366_g19244 = lerpResult349_g19244;
				
				half Main_Smoothness227_g19244 = ( tex2DNode35_g19244.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g19244 = Main_Smoothness227_g19244;
				half Global_OverlaySmoothness311_g19244 = TVE_OverlaySmoothness;
				float lerpResult343_g19244 = lerp( Blend_Smoothness314_g19244 , Global_OverlaySmoothness311_g19244 , Overlay_Mask269_g19244);
				half Final_Smoothness371_g19244 = lerpResult343_g19244;
				half Global_Wetness1016_g19244 = ( TVE_Wetness * _GlobalWetness );
				half Global_ExtrasTex_A1033_g19244 = tex2DNode7_g19292.a;
				float lerpResult1037_g19244 = lerp( Final_Smoothness371_g19244 , saturate( ( Final_Smoothness371_g19244 + Global_Wetness1016_g19244 ) ) , Global_ExtrasTex_A1033_g19244);
				
				half Mesh_Occlusion318_g19244 = IN.ase_color.g;
				float saferPower1201_g19244 = max( Mesh_Occlusion318_g19244 , 0.0001 );
				half Vertex_Occlusion648_g19244 = pow( saferPower1201_g19244 , _ObjectOcclusionValue );
				float lerpResult240_g19244 = lerp( 1.0 , tex2DNode35_g19244.g , _MainOcclusionValue);
				half Main_Occlusion247_g19244 = lerpResult240_g19244;
				half Blend_Occlusion323_g19244 = Main_Occlusion247_g19244;
				
				float localCustomAlphaClip9_g19272 = ( 0.0 );
				half Main_AlphaRaw1203_g19244 = tex2DNode29_g19244.a;
				half Global_ExtrasTex_R174_g19244 = tex2DNode7_g19292.r;
				float lerpResult293_g19244 = lerp( 1.0 , ceil( ( ( Mesh_Variation16_g19244 * Mesh_Variation16_g19244 ) - ( 1.0 - Global_ExtrasTex_R174_g19244 ) ) ) , _GlobalLeaves);
				half Mask_Leaves315_g19244 = lerpResult293_g19244;
				half Alpha5_g19272 = ( Main_AlphaRaw1203_g19244 * Mask_Leaves315_g19244 );
				float Alpha9_g19272 = Alpha5_g19272;
				float AlphaClipThreshold9_g19272 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g19272 - AlphaClipThreshold9_g19272);
				#endif
				half Final_Clip914_g19244 = localCustomAlphaClip9_g19272;
				
				float3 Albedo = ( Final_Albedo359_g19244 * Final_Premultiply355_g19244 );
				float3 Normal = Final_Normal366_g19244;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = lerpResult1037_g19244;
				float Occlusion = ( Vertex_Occlusion648_g19244 * Blend_Occlusion323_g19244 );
				float Alpha = Main_Alpha316_g19244;
				float AlphaClipThreshold = Final_Clip914_g19244;
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half3 _render_normals_options;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _Motion_30;
			half _MotionAmplitude_30;
			float _MotionSpeed_30;
			half _Motion_32;
			float _MotionScale_30;
			half _MotionVertical_20;
			half _MotionCat;
			half _Motion_10;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionVariation_30;
			half _GlobalSizeFade;
			half _VertexOcclusion;
			half _IsUniversalPipeline;
			half _ObjectOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half __premul;
			half _OverlayContrast;
			half _OverlayUVTilling;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _GlobalSize;
			half _SubsurfaceAngleValue;
			half _GlobalOverlay;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _GlobalColors;
			half _MotionAmplitude_10;
			half _OverlayVariation;
			float _MotionScale_20;
			float _MotionSpeed_20;
			half _MainOcclusionValue;
			half _RenderMode_TransparentInteractive;
			half _Cutoff;
			half _render_zw;
			half _render_blend;
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
			half _render_normals;
			half _MotionVariation_20;
			half __cull;
			half __src;
			half _Motion_20;
			half _MotionAmplitude_20;
			half _IsStandardShader;
			half _IsLeafShader;
			half _Banner;
			half _material_batching;
			half _BatchingMessage;
			half _IsAnyPathShader;
			half _IsLitShader;
			half _IsVersion;
			half __surface;
			half _MainColorMode;
			half __dst;
			half _render_cull;
			half _AlphaClipInteractive;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __normals;
			half _GlobalLeaves;
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
			half TVE_Amplitude2;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			half TVE_Amplitude1;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_Amplitude3;
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

				half3 VertexPos40_g19266 = v.vertex.xyz;
				float3 appendResult74_g19266 = (float3(0.0 , VertexPos40_g19266.y , 0.0));
				float3 VertexPosRotationAxis50_g19266 = appendResult74_g19266;
				float3 break84_g19266 = VertexPos40_g19266;
				float3 appendResult81_g19266 = (float3(break84_g19266.x , 0.0 , break84_g19266.z));
				float3 VertexPosOtherAxis82_g19266 = appendResult81_g19266;
				float ObjectData20_g19303 = 3.14;
				float Bounds_Radius121_g19244 = _MaxBoundsInfo.x;
				float WorldData19_g19303 = Bounds_Radius121_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19303 = WorldData19_g19303;
				#else
				float staticSwitch14_g19303 = ObjectData20_g19303;
				#endif
				float Motion_Max_Rolling1137_g19244 = staticSwitch14_g19303;
				half Global_Amplitude_270_g19244 = TVE_Amplitude2;
				half Mesh_Motion_260_g19244 = v.ase_texcoord3.y;
				float temp_output_4_0_g19286 = 1.0;
				float temp_output_5_0_g19286 = ( temp_output_4_0_g19286 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g19285 = GetObjectToWorldMatrix();
				float3 appendResult20_g19285 = (float3(break19_g19285[ 0 ][ 3 ] , break19_g19285[ 1 ][ 3 ] , break19_g19285[ 2 ][ 3 ]));
				half3 ObjectData20_g19287 = appendResult20_g19285;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g19287 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19287 = WorldData19_g19287;
				#else
				float3 staticSwitch14_g19287 = ObjectData20_g19287;
				#endif
				float2 panner73_g19284 = ( temp_output_5_0_g19286 * temp_cast_0 + ( (staticSwitch14_g19287).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g19284 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g19284, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g19244 = break142_g19284.r;
				half Global_NoiseTex_G38_g19244 = break142_g19284.g;
				half Motion_Use20162_g19244 = _Motion_20;
				half MotionSpeed265_g19244 = _MotionSpeed_20;
				half Input_Speed62_g19257 = MotionSpeed265_g19244;
				float temp_output_4_0_g19260 = Input_Speed62_g19257;
				float temp_output_5_0_g19260 = ( temp_output_4_0_g19260 * _TimeParameters.x );
				half MotionVariation264_g19244 = _MotionVariation_20;
				float temp_output_342_0_g19257 = ( MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19258 = GetObjectToWorldMatrix();
				float3 appendResult20_g19258 = (float3(break19_g19258[ 0 ][ 3 ] , break19_g19258[ 1 ][ 3 ] , break19_g19258[ 2 ][ 3 ]));
				float3 break9_g19258 = appendResult20_g19258;
				float ObjectData20_g19259 = ( temp_output_342_0_g19257 + ( break9_g19258.x + break9_g19258.z ) );
				float WorldData19_g19259 = temp_output_342_0_g19257;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19259 = WorldData19_g19259;
				#else
				float staticSwitch14_g19259 = ObjectData20_g19259;
				#endif
				float Motion_Variation284_g19257 = staticSwitch14_g19259;
				half MotionScale262_g19244 = _MotionScale_20;
				float Motion_Scale287_g19257 = ( MotionScale262_g19244 * ase_worldPos.x );
				half Motion_Rolling138_g19244 = ( ( _MotionAmplitude_20 * Motion_Max_Rolling1137_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Motion_Use20162_g19244 * sin( ( temp_output_5_0_g19260 + Motion_Variation284_g19257 + Motion_Scale287_g19257 ) ) );
				half Angle44_g19266 = Motion_Rolling138_g19244;
				half3 VertexPos40_g19268 = ( VertexPosRotationAxis50_g19266 + ( VertexPosOtherAxis82_g19266 * cos( Angle44_g19266 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g19266 ) * sin( Angle44_g19266 ) ) );
				float3 appendResult74_g19268 = (float3(VertexPos40_g19268.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g19268 = appendResult74_g19268;
				float3 break84_g19268 = VertexPos40_g19268;
				float3 appendResult81_g19268 = (float3(0.0 , break84_g19268.y , break84_g19268.z));
				half3 VertexPosOtherAxis82_g19268 = appendResult81_g19268;
				float ObjectData20_g19304 = 3.14;
				float Bounds_Height374_g19244 = _MaxBoundsInfo.y;
				float WorldData19_g19304 = ( Bounds_Height374_g19244 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19304 = WorldData19_g19304;
				#else
				float staticSwitch14_g19304 = ObjectData20_g19304;
				#endif
				float Motion_Max_Bending1133_g19244 = staticSwitch14_g19304;
				half Global_Amplitude_136_g19244 = TVE_Amplitude1;
				float4x4 break19_g19263 = GetObjectToWorldMatrix();
				float3 appendResult20_g19263 = (float3(break19_g19263[ 0 ][ 3 ] , break19_g19263[ 1 ][ 3 ] , break19_g19263[ 2 ][ 3 ]));
				half3 ObjectData20_g19262 = appendResult20_g19263;
				half3 WorldData19_g19262 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19262 = WorldData19_g19262;
				#else
				float3 staticSwitch14_g19262 = ObjectData20_g19262;
				#endif
				float3 break322_g19289 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g19262).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g19289 = (float3(break322_g19289.x , 0.0 , break322_g19289.y));
				float3 temp_output_324_0_g19289 = (appendResult323_g19289*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g19290 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g19289 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g19290 = temp_output_324_0_g19289;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19290 = WorldData19_g19290;
				#else
				float3 staticSwitch14_g19290 = ObjectData20_g19290;
				#endif
				float2 temp_output_1976_320_g19244 = (staticSwitch14_g19290).xz;
				half2 Motion_DirectionOS39_g19244 = temp_output_1976_320_g19244;
				half Input_Speed62_g19245 = _MotionSpeed_10;
				float temp_output_4_0_g19246 = Input_Speed62_g19245;
				float temp_output_5_0_g19246 = ( temp_output_4_0_g19246 * _TimeParameters.x );
				float temp_output_349_0_g19245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g19249 = GetObjectToWorldMatrix();
				float3 appendResult20_g19249 = (float3(break19_g19249[ 0 ][ 3 ] , break19_g19249[ 1 ][ 3 ] , break19_g19249[ 2 ][ 3 ]));
				float3 break9_g19249 = appendResult20_g19249;
				float ObjectData20_g19248 = ( temp_output_349_0_g19245 + ( break9_g19249.x + break9_g19249.z ) );
				float WorldData19_g19248 = temp_output_349_0_g19245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19248 = WorldData19_g19248;
				#else
				float staticSwitch14_g19248 = ObjectData20_g19248;
				#endif
				half Motion_Variation284_g19245 = staticSwitch14_g19248;
				float2 appendResult344_g19245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g19245 = ( _MotionScale_10 * appendResult344_g19245 );
				half2 Sine_MinusOneToOne281_g19245 = sin( ( temp_output_5_0_g19246 + Motion_Variation284_g19245 + Motion_Scale287_g19245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g19245 = Global_NoiseTex_R34_g19244;
				float2 lerpResult321_g19245 = lerp( Sine_MinusOneToOne281_g19245 , temp_cast_4 , Input_Turbulence327_g19245);
				float2 temp_output_84_0_g19244 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g19244 ) * Global_Amplitude_136_g19244 * Global_NoiseTex_R34_g19244 * Motion_DirectionOS39_g19244 * lerpResult321_g19245 );
				float temp_output_1976_333_g19244 = break322_g19289.z;
				half2 Motion_Interaction53_g19244 = ( _InteractionAmplitude * Motion_Max_Bending1133_g19244 * temp_output_1976_320_g19244 * temp_output_1976_333_g19244 * temp_output_1976_333_g19244 );
				half Motion_InteractionMask66_g19244 = temp_output_1976_333_g19244;
				float2 lerpResult109_g19244 = lerp( temp_output_84_0_g19244 , Motion_Interaction53_g19244 , Motion_InteractionMask66_g19244);
				half Mesh_Motion_182_g19244 = v.ase_texcoord3.x;
				half Motion_Use1056_g19244 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g19244 = ( lerpResult109_g19244 * Mesh_Motion_182_g19244 * Motion_Use1056_g19244 );
				half Motion_Z190_g19244 = break143_g19244.y;
				half Angle44_g19268 = Motion_Z190_g19244;
				half3 VertexPos40_g19276 = ( VertexPosRotationAxis50_g19268 + ( VertexPosOtherAxis82_g19268 * cos( Angle44_g19268 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g19268 ) * sin( Angle44_g19268 ) ) );
				float3 appendResult74_g19276 = (float3(0.0 , 0.0 , VertexPos40_g19276.z));
				half3 VertexPosRotationAxis50_g19276 = appendResult74_g19276;
				float3 break84_g19276 = VertexPos40_g19276;
				float3 appendResult81_g19276 = (float3(break84_g19276.x , break84_g19276.y , 0.0));
				half3 VertexPosOtherAxis82_g19276 = appendResult81_g19276;
				half Motion_X216_g19244 = break143_g19244.x;
				half Angle44_g19276 = -Motion_X216_g19244;
				half Global_NoiseTex_B132_g19244 = break142_g19284.b;
				half Input_Speed62_g19297 = -MotionSpeed265_g19244;
				float temp_output_4_0_g19300 = Input_Speed62_g19297;
				float temp_output_5_0_g19300 = ( temp_output_4_0_g19300 * _TimeParameters.x );
				float temp_output_342_0_g19297 = ( -MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19298 = GetObjectToWorldMatrix();
				float3 appendResult20_g19298 = (float3(break19_g19298[ 0 ][ 3 ] , break19_g19298[ 1 ][ 3 ] , break19_g19298[ 2 ][ 3 ]));
				float3 break9_g19298 = appendResult20_g19298;
				float ObjectData20_g19299 = ( temp_output_342_0_g19297 + ( break9_g19298.x + break9_g19298.z ) );
				float WorldData19_g19299 = temp_output_342_0_g19297;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19299 = WorldData19_g19299;
				#else
				float staticSwitch14_g19299 = ObjectData20_g19299;
				#endif
				float Motion_Variation284_g19297 = staticSwitch14_g19299;
				float Motion_Scale287_g19297 = ( MotionScale262_g19244 * ase_worldPos.x );
				float3 appendResult2014_g19244 = (float3(0.0 , ( ( _MotionVertical_20 * Bounds_Radius121_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * Motion_Use20162_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_B132_g19244 ) * sin( ( temp_output_5_0_g19300 + Motion_Variation284_g19297 + Motion_Scale287_g19297 ) ) ) , 0.0));
				half3 Motion_Vertical223_g19244 = appendResult2014_g19244;
				half Motion_Scale321_g19270 = ( _MotionScale_30 * 10.0 );
				half Input_Speed62_g19270 = _MotionSpeed_30;
				float temp_output_4_0_g19271 = Input_Speed62_g19270;
				float temp_output_5_0_g19271 = ( temp_output_4_0_g19271 * _TimeParameters.x );
				float Motion_Variation330_g19270 = ( _MotionVariation_30 * v.ase_color.r );
				half Input_Amplitude58_g19270 = ( _MotionAmplitude_30 * Bounds_Radius121_g19244 * 0.2 );
				half Mesh_Motion_3144_g19244 = v.ase_texcoord3.z;
				half Motion_Use302011_g19244 = _Motion_30;
				half3 Motion_Leaves1988_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19270 ) + temp_output_5_0_g19271 + Motion_Variation330_g19270 ) ) * Input_Amplitude58_g19270 * v.ase_normal ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use302011_g19244 * Global_Amplitude_270_g19244 );
				half Motion_Scale321_g19274 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g19274 = _MotionSpeed_32;
				float temp_output_4_0_g19275 = Input_Speed62_g19274;
				float temp_output_5_0_g19275 = ( temp_output_4_0_g19275 * _TimeParameters.x );
				float Motion_Variation330_g19274 = ( _MotionVariation_32 * v.ase_color.r );
				half Input_Amplitude58_g19274 = ( _MotionAmplitude_32 * Bounds_Radius121_g19244 * 0.2 );
				float3 appendResult345_g19274 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_A139_g19244 = break142_g19284.a;
				half Motion_Use322013_g19244 = _Motion_32;
				half Global_Amplitude_3488_g19244 = TVE_Amplitude3;
				half3 Motion_Flutter263_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19274 ) + temp_output_5_0_g19275 + Motion_Variation330_g19274 ) ) * Input_Amplitude58_g19274 * appendResult345_g19274 ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_A139_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use322013_g19244 * Global_Amplitude_3488_g19244 );
				float3 Vertex_Motion_Object833_g19244 = ( ( ( ( VertexPosRotationAxis50_g19276 + ( VertexPosOtherAxis82_g19276 * cos( Angle44_g19276 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g19276 ) * sin( Angle44_g19276 ) ) ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 ObjectData20_g19267 = Vertex_Motion_Object833_g19244;
				float3 appendResult2047_g19244 = (float3(Motion_Rolling138_g19244 , 0.0 , -Motion_Rolling138_g19244));
				float3 appendResult2043_g19244 = (float3(Motion_X216_g19244 , 0.0 , Motion_Z190_g19244));
				float3 Vertex_Motion_World1118_g19244 = ( ( ( ( ( v.vertex.xyz + appendResult2047_g19244 ) + appendResult2043_g19244 ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 WorldData19_g19267 = Vertex_Motion_World1118_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19267 = WorldData19_g19267;
				#else
				float3 staticSwitch14_g19267 = ObjectData20_g19267;
				#endif
				float4x4 break19_g19269 = GetObjectToWorldMatrix();
				float3 appendResult20_g19269 = (float3(break19_g19269[ 0 ][ 3 ] , break19_g19269[ 1 ][ 3 ] , break19_g19269[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g19244 = TVE_SizeFadeEnd;
				float temp_output_7_0_g19264 = Global_SizeFadeEnd287_g19244;
				half Global_SizeFadeStart276_g19244 = TVE_SizeFadeStart;
				float lerpResult348_g19244 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g19269 ) - temp_output_7_0_g19264 ) / ( Global_SizeFadeStart276_g19244 - temp_output_7_0_g19264 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g19273 = lerpResult348_g19244;
				float WorldData19_g19273 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19273 = WorldData19_g19273;
				#else
				float staticSwitch14_g19273 = ObjectData20_g19273;
				#endif
				float Vertex_SizeFade1740_g19244 = staticSwitch14_g19273;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g19244 = tex2DNode7_g19292.g;
				float lerpResult346_g19244 = lerp( 1.0 , Global_ExtrasTex_G305_g19244 , _GlobalSize);
				float ObjectData20_g19265 = lerpResult346_g19244;
				float WorldData19_g19265 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19265 = WorldData19_g19265;
				#else
				float staticSwitch14_g19265 = ObjectData20_g19265;
				#endif
				half Vertex_Size1741_g19244 = staticSwitch14_g19265;
				float3 Final_Vertex890_g19244 = ( ( staticSwitch14_g19267 * Vertex_SizeFade1740_g19244 * Vertex_Size1741_g19244 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g19244;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 Main_UVs15_g19244 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g19244 = tex2D( _MainAlbedoTex, Main_UVs15_g19244 );
				float4 temp_output_51_0_g19244 = ( _MainColor * tex2DNode29_g19244 );
				half Main_Alpha316_g19244 = (temp_output_51_0_g19244).a;
				
				float localCustomAlphaClip9_g19272 = ( 0.0 );
				half Main_AlphaRaw1203_g19244 = tex2DNode29_g19244.a;
				float Mesh_Variation16_g19244 = IN.ase_color.r;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ) );
				half Global_ExtrasTex_R174_g19244 = tex2DNode7_g19292.r;
				float lerpResult293_g19244 = lerp( 1.0 , ceil( ( ( Mesh_Variation16_g19244 * Mesh_Variation16_g19244 ) - ( 1.0 - Global_ExtrasTex_R174_g19244 ) ) ) , _GlobalLeaves);
				half Mask_Leaves315_g19244 = lerpResult293_g19244;
				half Alpha5_g19272 = ( Main_AlphaRaw1203_g19244 * Mask_Leaves315_g19244 );
				float Alpha9_g19272 = Alpha5_g19272;
				float AlphaClipThreshold9_g19272 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g19272 - AlphaClipThreshold9_g19272);
				#endif
				half Final_Clip914_g19244 = localCustomAlphaClip9_g19272;
				
				float Alpha = Main_Alpha316_g19244;
				float AlphaClipThreshold = Final_Clip914_g19244;

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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half3 _render_normals_options;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _Motion_30;
			half _MotionAmplitude_30;
			float _MotionSpeed_30;
			half _Motion_32;
			float _MotionScale_30;
			half _MotionVertical_20;
			half _MotionCat;
			half _Motion_10;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionVariation_30;
			half _GlobalSizeFade;
			half _VertexOcclusion;
			half _IsUniversalPipeline;
			half _ObjectOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half __premul;
			half _OverlayContrast;
			half _OverlayUVTilling;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _GlobalSize;
			half _SubsurfaceAngleValue;
			half _GlobalOverlay;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _GlobalColors;
			half _MotionAmplitude_10;
			half _OverlayVariation;
			float _MotionScale_20;
			float _MotionSpeed_20;
			half _MainOcclusionValue;
			half _RenderMode_TransparentInteractive;
			half _Cutoff;
			half _render_zw;
			half _render_blend;
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
			half _render_normals;
			half _MotionVariation_20;
			half __cull;
			half __src;
			half _Motion_20;
			half _MotionAmplitude_20;
			half _IsStandardShader;
			half _IsLeafShader;
			half _Banner;
			half _material_batching;
			half _BatchingMessage;
			half _IsAnyPathShader;
			half _IsLitShader;
			half _IsVersion;
			half __surface;
			half _MainColorMode;
			half __dst;
			half _render_cull;
			half _AlphaClipInteractive;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __normals;
			half _GlobalLeaves;
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
			half TVE_Amplitude2;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			half TVE_Amplitude1;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_Amplitude3;
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

				half3 VertexPos40_g19266 = v.vertex.xyz;
				float3 appendResult74_g19266 = (float3(0.0 , VertexPos40_g19266.y , 0.0));
				float3 VertexPosRotationAxis50_g19266 = appendResult74_g19266;
				float3 break84_g19266 = VertexPos40_g19266;
				float3 appendResult81_g19266 = (float3(break84_g19266.x , 0.0 , break84_g19266.z));
				float3 VertexPosOtherAxis82_g19266 = appendResult81_g19266;
				float ObjectData20_g19303 = 3.14;
				float Bounds_Radius121_g19244 = _MaxBoundsInfo.x;
				float WorldData19_g19303 = Bounds_Radius121_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19303 = WorldData19_g19303;
				#else
				float staticSwitch14_g19303 = ObjectData20_g19303;
				#endif
				float Motion_Max_Rolling1137_g19244 = staticSwitch14_g19303;
				half Global_Amplitude_270_g19244 = TVE_Amplitude2;
				half Mesh_Motion_260_g19244 = v.ase_texcoord3.y;
				float temp_output_4_0_g19286 = 1.0;
				float temp_output_5_0_g19286 = ( temp_output_4_0_g19286 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g19285 = GetObjectToWorldMatrix();
				float3 appendResult20_g19285 = (float3(break19_g19285[ 0 ][ 3 ] , break19_g19285[ 1 ][ 3 ] , break19_g19285[ 2 ][ 3 ]));
				half3 ObjectData20_g19287 = appendResult20_g19285;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g19287 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19287 = WorldData19_g19287;
				#else
				float3 staticSwitch14_g19287 = ObjectData20_g19287;
				#endif
				float2 panner73_g19284 = ( temp_output_5_0_g19286 * temp_cast_0 + ( (staticSwitch14_g19287).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g19284 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g19284, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g19244 = break142_g19284.r;
				half Global_NoiseTex_G38_g19244 = break142_g19284.g;
				half Motion_Use20162_g19244 = _Motion_20;
				half MotionSpeed265_g19244 = _MotionSpeed_20;
				half Input_Speed62_g19257 = MotionSpeed265_g19244;
				float temp_output_4_0_g19260 = Input_Speed62_g19257;
				float temp_output_5_0_g19260 = ( temp_output_4_0_g19260 * _TimeParameters.x );
				half MotionVariation264_g19244 = _MotionVariation_20;
				float temp_output_342_0_g19257 = ( MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19258 = GetObjectToWorldMatrix();
				float3 appendResult20_g19258 = (float3(break19_g19258[ 0 ][ 3 ] , break19_g19258[ 1 ][ 3 ] , break19_g19258[ 2 ][ 3 ]));
				float3 break9_g19258 = appendResult20_g19258;
				float ObjectData20_g19259 = ( temp_output_342_0_g19257 + ( break9_g19258.x + break9_g19258.z ) );
				float WorldData19_g19259 = temp_output_342_0_g19257;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19259 = WorldData19_g19259;
				#else
				float staticSwitch14_g19259 = ObjectData20_g19259;
				#endif
				float Motion_Variation284_g19257 = staticSwitch14_g19259;
				half MotionScale262_g19244 = _MotionScale_20;
				float Motion_Scale287_g19257 = ( MotionScale262_g19244 * ase_worldPos.x );
				half Motion_Rolling138_g19244 = ( ( _MotionAmplitude_20 * Motion_Max_Rolling1137_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Motion_Use20162_g19244 * sin( ( temp_output_5_0_g19260 + Motion_Variation284_g19257 + Motion_Scale287_g19257 ) ) );
				half Angle44_g19266 = Motion_Rolling138_g19244;
				half3 VertexPos40_g19268 = ( VertexPosRotationAxis50_g19266 + ( VertexPosOtherAxis82_g19266 * cos( Angle44_g19266 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g19266 ) * sin( Angle44_g19266 ) ) );
				float3 appendResult74_g19268 = (float3(VertexPos40_g19268.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g19268 = appendResult74_g19268;
				float3 break84_g19268 = VertexPos40_g19268;
				float3 appendResult81_g19268 = (float3(0.0 , break84_g19268.y , break84_g19268.z));
				half3 VertexPosOtherAxis82_g19268 = appendResult81_g19268;
				float ObjectData20_g19304 = 3.14;
				float Bounds_Height374_g19244 = _MaxBoundsInfo.y;
				float WorldData19_g19304 = ( Bounds_Height374_g19244 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19304 = WorldData19_g19304;
				#else
				float staticSwitch14_g19304 = ObjectData20_g19304;
				#endif
				float Motion_Max_Bending1133_g19244 = staticSwitch14_g19304;
				half Global_Amplitude_136_g19244 = TVE_Amplitude1;
				float4x4 break19_g19263 = GetObjectToWorldMatrix();
				float3 appendResult20_g19263 = (float3(break19_g19263[ 0 ][ 3 ] , break19_g19263[ 1 ][ 3 ] , break19_g19263[ 2 ][ 3 ]));
				half3 ObjectData20_g19262 = appendResult20_g19263;
				half3 WorldData19_g19262 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19262 = WorldData19_g19262;
				#else
				float3 staticSwitch14_g19262 = ObjectData20_g19262;
				#endif
				float3 break322_g19289 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g19262).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g19289 = (float3(break322_g19289.x , 0.0 , break322_g19289.y));
				float3 temp_output_324_0_g19289 = (appendResult323_g19289*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g19290 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g19289 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g19290 = temp_output_324_0_g19289;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19290 = WorldData19_g19290;
				#else
				float3 staticSwitch14_g19290 = ObjectData20_g19290;
				#endif
				float2 temp_output_1976_320_g19244 = (staticSwitch14_g19290).xz;
				half2 Motion_DirectionOS39_g19244 = temp_output_1976_320_g19244;
				half Input_Speed62_g19245 = _MotionSpeed_10;
				float temp_output_4_0_g19246 = Input_Speed62_g19245;
				float temp_output_5_0_g19246 = ( temp_output_4_0_g19246 * _TimeParameters.x );
				float temp_output_349_0_g19245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g19249 = GetObjectToWorldMatrix();
				float3 appendResult20_g19249 = (float3(break19_g19249[ 0 ][ 3 ] , break19_g19249[ 1 ][ 3 ] , break19_g19249[ 2 ][ 3 ]));
				float3 break9_g19249 = appendResult20_g19249;
				float ObjectData20_g19248 = ( temp_output_349_0_g19245 + ( break9_g19249.x + break9_g19249.z ) );
				float WorldData19_g19248 = temp_output_349_0_g19245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19248 = WorldData19_g19248;
				#else
				float staticSwitch14_g19248 = ObjectData20_g19248;
				#endif
				half Motion_Variation284_g19245 = staticSwitch14_g19248;
				float2 appendResult344_g19245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g19245 = ( _MotionScale_10 * appendResult344_g19245 );
				half2 Sine_MinusOneToOne281_g19245 = sin( ( temp_output_5_0_g19246 + Motion_Variation284_g19245 + Motion_Scale287_g19245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g19245 = Global_NoiseTex_R34_g19244;
				float2 lerpResult321_g19245 = lerp( Sine_MinusOneToOne281_g19245 , temp_cast_4 , Input_Turbulence327_g19245);
				float2 temp_output_84_0_g19244 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g19244 ) * Global_Amplitude_136_g19244 * Global_NoiseTex_R34_g19244 * Motion_DirectionOS39_g19244 * lerpResult321_g19245 );
				float temp_output_1976_333_g19244 = break322_g19289.z;
				half2 Motion_Interaction53_g19244 = ( _InteractionAmplitude * Motion_Max_Bending1133_g19244 * temp_output_1976_320_g19244 * temp_output_1976_333_g19244 * temp_output_1976_333_g19244 );
				half Motion_InteractionMask66_g19244 = temp_output_1976_333_g19244;
				float2 lerpResult109_g19244 = lerp( temp_output_84_0_g19244 , Motion_Interaction53_g19244 , Motion_InteractionMask66_g19244);
				half Mesh_Motion_182_g19244 = v.ase_texcoord3.x;
				half Motion_Use1056_g19244 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g19244 = ( lerpResult109_g19244 * Mesh_Motion_182_g19244 * Motion_Use1056_g19244 );
				half Motion_Z190_g19244 = break143_g19244.y;
				half Angle44_g19268 = Motion_Z190_g19244;
				half3 VertexPos40_g19276 = ( VertexPosRotationAxis50_g19268 + ( VertexPosOtherAxis82_g19268 * cos( Angle44_g19268 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g19268 ) * sin( Angle44_g19268 ) ) );
				float3 appendResult74_g19276 = (float3(0.0 , 0.0 , VertexPos40_g19276.z));
				half3 VertexPosRotationAxis50_g19276 = appendResult74_g19276;
				float3 break84_g19276 = VertexPos40_g19276;
				float3 appendResult81_g19276 = (float3(break84_g19276.x , break84_g19276.y , 0.0));
				half3 VertexPosOtherAxis82_g19276 = appendResult81_g19276;
				half Motion_X216_g19244 = break143_g19244.x;
				half Angle44_g19276 = -Motion_X216_g19244;
				half Global_NoiseTex_B132_g19244 = break142_g19284.b;
				half Input_Speed62_g19297 = -MotionSpeed265_g19244;
				float temp_output_4_0_g19300 = Input_Speed62_g19297;
				float temp_output_5_0_g19300 = ( temp_output_4_0_g19300 * _TimeParameters.x );
				float temp_output_342_0_g19297 = ( -MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19298 = GetObjectToWorldMatrix();
				float3 appendResult20_g19298 = (float3(break19_g19298[ 0 ][ 3 ] , break19_g19298[ 1 ][ 3 ] , break19_g19298[ 2 ][ 3 ]));
				float3 break9_g19298 = appendResult20_g19298;
				float ObjectData20_g19299 = ( temp_output_342_0_g19297 + ( break9_g19298.x + break9_g19298.z ) );
				float WorldData19_g19299 = temp_output_342_0_g19297;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19299 = WorldData19_g19299;
				#else
				float staticSwitch14_g19299 = ObjectData20_g19299;
				#endif
				float Motion_Variation284_g19297 = staticSwitch14_g19299;
				float Motion_Scale287_g19297 = ( MotionScale262_g19244 * ase_worldPos.x );
				float3 appendResult2014_g19244 = (float3(0.0 , ( ( _MotionVertical_20 * Bounds_Radius121_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * Motion_Use20162_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_B132_g19244 ) * sin( ( temp_output_5_0_g19300 + Motion_Variation284_g19297 + Motion_Scale287_g19297 ) ) ) , 0.0));
				half3 Motion_Vertical223_g19244 = appendResult2014_g19244;
				half Motion_Scale321_g19270 = ( _MotionScale_30 * 10.0 );
				half Input_Speed62_g19270 = _MotionSpeed_30;
				float temp_output_4_0_g19271 = Input_Speed62_g19270;
				float temp_output_5_0_g19271 = ( temp_output_4_0_g19271 * _TimeParameters.x );
				float Motion_Variation330_g19270 = ( _MotionVariation_30 * v.ase_color.r );
				half Input_Amplitude58_g19270 = ( _MotionAmplitude_30 * Bounds_Radius121_g19244 * 0.2 );
				half Mesh_Motion_3144_g19244 = v.ase_texcoord3.z;
				half Motion_Use302011_g19244 = _Motion_30;
				half3 Motion_Leaves1988_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19270 ) + temp_output_5_0_g19271 + Motion_Variation330_g19270 ) ) * Input_Amplitude58_g19270 * v.ase_normal ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use302011_g19244 * Global_Amplitude_270_g19244 );
				half Motion_Scale321_g19274 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g19274 = _MotionSpeed_32;
				float temp_output_4_0_g19275 = Input_Speed62_g19274;
				float temp_output_5_0_g19275 = ( temp_output_4_0_g19275 * _TimeParameters.x );
				float Motion_Variation330_g19274 = ( _MotionVariation_32 * v.ase_color.r );
				half Input_Amplitude58_g19274 = ( _MotionAmplitude_32 * Bounds_Radius121_g19244 * 0.2 );
				float3 appendResult345_g19274 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_A139_g19244 = break142_g19284.a;
				half Motion_Use322013_g19244 = _Motion_32;
				half Global_Amplitude_3488_g19244 = TVE_Amplitude3;
				half3 Motion_Flutter263_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19274 ) + temp_output_5_0_g19275 + Motion_Variation330_g19274 ) ) * Input_Amplitude58_g19274 * appendResult345_g19274 ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_A139_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use322013_g19244 * Global_Amplitude_3488_g19244 );
				float3 Vertex_Motion_Object833_g19244 = ( ( ( ( VertexPosRotationAxis50_g19276 + ( VertexPosOtherAxis82_g19276 * cos( Angle44_g19276 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g19276 ) * sin( Angle44_g19276 ) ) ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 ObjectData20_g19267 = Vertex_Motion_Object833_g19244;
				float3 appendResult2047_g19244 = (float3(Motion_Rolling138_g19244 , 0.0 , -Motion_Rolling138_g19244));
				float3 appendResult2043_g19244 = (float3(Motion_X216_g19244 , 0.0 , Motion_Z190_g19244));
				float3 Vertex_Motion_World1118_g19244 = ( ( ( ( ( v.vertex.xyz + appendResult2047_g19244 ) + appendResult2043_g19244 ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 WorldData19_g19267 = Vertex_Motion_World1118_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19267 = WorldData19_g19267;
				#else
				float3 staticSwitch14_g19267 = ObjectData20_g19267;
				#endif
				float4x4 break19_g19269 = GetObjectToWorldMatrix();
				float3 appendResult20_g19269 = (float3(break19_g19269[ 0 ][ 3 ] , break19_g19269[ 1 ][ 3 ] , break19_g19269[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g19244 = TVE_SizeFadeEnd;
				float temp_output_7_0_g19264 = Global_SizeFadeEnd287_g19244;
				half Global_SizeFadeStart276_g19244 = TVE_SizeFadeStart;
				float lerpResult348_g19244 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g19269 ) - temp_output_7_0_g19264 ) / ( Global_SizeFadeStart276_g19244 - temp_output_7_0_g19264 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g19273 = lerpResult348_g19244;
				float WorldData19_g19273 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19273 = WorldData19_g19273;
				#else
				float staticSwitch14_g19273 = ObjectData20_g19273;
				#endif
				float Vertex_SizeFade1740_g19244 = staticSwitch14_g19273;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g19244 = tex2DNode7_g19292.g;
				float lerpResult346_g19244 = lerp( 1.0 , Global_ExtrasTex_G305_g19244 , _GlobalSize);
				float ObjectData20_g19265 = lerpResult346_g19244;
				float WorldData19_g19265 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19265 = WorldData19_g19265;
				#else
				float staticSwitch14_g19265 = ObjectData20_g19265;
				#endif
				half Vertex_Size1741_g19244 = staticSwitch14_g19265;
				float3 Final_Vertex890_g19244 = ( ( staticSwitch14_g19267 * Vertex_SizeFade1740_g19244 * Vertex_Size1741_g19244 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = Final_Vertex890_g19244;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 Main_UVs15_g19244 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g19244 = tex2D( _MainAlbedoTex, Main_UVs15_g19244 );
				float4 temp_output_51_0_g19244 = ( _MainColor * tex2DNode29_g19244 );
				half Main_Alpha316_g19244 = (temp_output_51_0_g19244).a;
				
				float localCustomAlphaClip9_g19272 = ( 0.0 );
				half Main_AlphaRaw1203_g19244 = tex2DNode29_g19244.a;
				float Mesh_Variation16_g19244 = IN.ase_color.r;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ) );
				half Global_ExtrasTex_R174_g19244 = tex2DNode7_g19292.r;
				float lerpResult293_g19244 = lerp( 1.0 , ceil( ( ( Mesh_Variation16_g19244 * Mesh_Variation16_g19244 ) - ( 1.0 - Global_ExtrasTex_R174_g19244 ) ) ) , _GlobalLeaves);
				half Mask_Leaves315_g19244 = lerpResult293_g19244;
				half Alpha5_g19272 = ( Main_AlphaRaw1203_g19244 * Mask_Leaves315_g19244 );
				float Alpha9_g19272 = Alpha5_g19272;
				float AlphaClipThreshold9_g19272 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g19272 - AlphaClipThreshold9_g19272);
				#endif
				half Final_Clip914_g19244 = localCustomAlphaClip9_g19272;
				
				float Alpha = Main_Alpha316_g19244;
				float AlphaClipThreshold = Final_Clip914_g19244;

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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half3 _render_normals_options;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _Motion_30;
			half _MotionAmplitude_30;
			float _MotionSpeed_30;
			half _Motion_32;
			float _MotionScale_30;
			half _MotionVertical_20;
			half _MotionCat;
			half _Motion_10;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionVariation_30;
			half _GlobalSizeFade;
			half _VertexOcclusion;
			half _IsUniversalPipeline;
			half _ObjectOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half __premul;
			half _OverlayContrast;
			half _OverlayUVTilling;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _GlobalSize;
			half _SubsurfaceAngleValue;
			half _GlobalOverlay;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _GlobalColors;
			half _MotionAmplitude_10;
			half _OverlayVariation;
			float _MotionScale_20;
			float _MotionSpeed_20;
			half _MainOcclusionValue;
			half _RenderMode_TransparentInteractive;
			half _Cutoff;
			half _render_zw;
			half _render_blend;
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
			half _render_normals;
			half _MotionVariation_20;
			half __cull;
			half __src;
			half _Motion_20;
			half _MotionAmplitude_20;
			half _IsStandardShader;
			half _IsLeafShader;
			half _Banner;
			half _material_batching;
			half _BatchingMessage;
			half _IsAnyPathShader;
			half _IsLitShader;
			half _IsVersion;
			half __surface;
			half _MainColorMode;
			half __dst;
			half _render_cull;
			half _AlphaClipInteractive;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __normals;
			half _GlobalLeaves;
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
			half TVE_Amplitude2;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			half TVE_Amplitude1;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_Amplitude3;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;
			sampler2D TVE_ColorsTex;
			half4 TVE_ColorsCoord;
			sampler2D _MainMaskTex;
			half TVE_OverlayIntensity;
			sampler2D _MainNormalTex;
			half4 TVE_OverlayColor;
			sampler2D TVE_OverlayAlbedoTex;
			half TVE_OverlayUVTilling;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				half3 VertexPos40_g19266 = v.vertex.xyz;
				float3 appendResult74_g19266 = (float3(0.0 , VertexPos40_g19266.y , 0.0));
				float3 VertexPosRotationAxis50_g19266 = appendResult74_g19266;
				float3 break84_g19266 = VertexPos40_g19266;
				float3 appendResult81_g19266 = (float3(break84_g19266.x , 0.0 , break84_g19266.z));
				float3 VertexPosOtherAxis82_g19266 = appendResult81_g19266;
				float ObjectData20_g19303 = 3.14;
				float Bounds_Radius121_g19244 = _MaxBoundsInfo.x;
				float WorldData19_g19303 = Bounds_Radius121_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19303 = WorldData19_g19303;
				#else
				float staticSwitch14_g19303 = ObjectData20_g19303;
				#endif
				float Motion_Max_Rolling1137_g19244 = staticSwitch14_g19303;
				half Global_Amplitude_270_g19244 = TVE_Amplitude2;
				half Mesh_Motion_260_g19244 = v.ase_texcoord3.y;
				float temp_output_4_0_g19286 = 1.0;
				float temp_output_5_0_g19286 = ( temp_output_4_0_g19286 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g19285 = GetObjectToWorldMatrix();
				float3 appendResult20_g19285 = (float3(break19_g19285[ 0 ][ 3 ] , break19_g19285[ 1 ][ 3 ] , break19_g19285[ 2 ][ 3 ]));
				half3 ObjectData20_g19287 = appendResult20_g19285;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g19287 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19287 = WorldData19_g19287;
				#else
				float3 staticSwitch14_g19287 = ObjectData20_g19287;
				#endif
				float2 panner73_g19284 = ( temp_output_5_0_g19286 * temp_cast_0 + ( (staticSwitch14_g19287).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g19284 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g19284, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g19244 = break142_g19284.r;
				half Global_NoiseTex_G38_g19244 = break142_g19284.g;
				half Motion_Use20162_g19244 = _Motion_20;
				half MotionSpeed265_g19244 = _MotionSpeed_20;
				half Input_Speed62_g19257 = MotionSpeed265_g19244;
				float temp_output_4_0_g19260 = Input_Speed62_g19257;
				float temp_output_5_0_g19260 = ( temp_output_4_0_g19260 * _TimeParameters.x );
				half MotionVariation264_g19244 = _MotionVariation_20;
				float temp_output_342_0_g19257 = ( MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19258 = GetObjectToWorldMatrix();
				float3 appendResult20_g19258 = (float3(break19_g19258[ 0 ][ 3 ] , break19_g19258[ 1 ][ 3 ] , break19_g19258[ 2 ][ 3 ]));
				float3 break9_g19258 = appendResult20_g19258;
				float ObjectData20_g19259 = ( temp_output_342_0_g19257 + ( break9_g19258.x + break9_g19258.z ) );
				float WorldData19_g19259 = temp_output_342_0_g19257;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19259 = WorldData19_g19259;
				#else
				float staticSwitch14_g19259 = ObjectData20_g19259;
				#endif
				float Motion_Variation284_g19257 = staticSwitch14_g19259;
				half MotionScale262_g19244 = _MotionScale_20;
				float Motion_Scale287_g19257 = ( MotionScale262_g19244 * ase_worldPos.x );
				half Motion_Rolling138_g19244 = ( ( _MotionAmplitude_20 * Motion_Max_Rolling1137_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Motion_Use20162_g19244 * sin( ( temp_output_5_0_g19260 + Motion_Variation284_g19257 + Motion_Scale287_g19257 ) ) );
				half Angle44_g19266 = Motion_Rolling138_g19244;
				half3 VertexPos40_g19268 = ( VertexPosRotationAxis50_g19266 + ( VertexPosOtherAxis82_g19266 * cos( Angle44_g19266 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g19266 ) * sin( Angle44_g19266 ) ) );
				float3 appendResult74_g19268 = (float3(VertexPos40_g19268.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g19268 = appendResult74_g19268;
				float3 break84_g19268 = VertexPos40_g19268;
				float3 appendResult81_g19268 = (float3(0.0 , break84_g19268.y , break84_g19268.z));
				half3 VertexPosOtherAxis82_g19268 = appendResult81_g19268;
				float ObjectData20_g19304 = 3.14;
				float Bounds_Height374_g19244 = _MaxBoundsInfo.y;
				float WorldData19_g19304 = ( Bounds_Height374_g19244 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19304 = WorldData19_g19304;
				#else
				float staticSwitch14_g19304 = ObjectData20_g19304;
				#endif
				float Motion_Max_Bending1133_g19244 = staticSwitch14_g19304;
				half Global_Amplitude_136_g19244 = TVE_Amplitude1;
				float4x4 break19_g19263 = GetObjectToWorldMatrix();
				float3 appendResult20_g19263 = (float3(break19_g19263[ 0 ][ 3 ] , break19_g19263[ 1 ][ 3 ] , break19_g19263[ 2 ][ 3 ]));
				half3 ObjectData20_g19262 = appendResult20_g19263;
				half3 WorldData19_g19262 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19262 = WorldData19_g19262;
				#else
				float3 staticSwitch14_g19262 = ObjectData20_g19262;
				#endif
				float3 break322_g19289 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g19262).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g19289 = (float3(break322_g19289.x , 0.0 , break322_g19289.y));
				float3 temp_output_324_0_g19289 = (appendResult323_g19289*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g19290 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g19289 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g19290 = temp_output_324_0_g19289;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19290 = WorldData19_g19290;
				#else
				float3 staticSwitch14_g19290 = ObjectData20_g19290;
				#endif
				float2 temp_output_1976_320_g19244 = (staticSwitch14_g19290).xz;
				half2 Motion_DirectionOS39_g19244 = temp_output_1976_320_g19244;
				half Input_Speed62_g19245 = _MotionSpeed_10;
				float temp_output_4_0_g19246 = Input_Speed62_g19245;
				float temp_output_5_0_g19246 = ( temp_output_4_0_g19246 * _TimeParameters.x );
				float temp_output_349_0_g19245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g19249 = GetObjectToWorldMatrix();
				float3 appendResult20_g19249 = (float3(break19_g19249[ 0 ][ 3 ] , break19_g19249[ 1 ][ 3 ] , break19_g19249[ 2 ][ 3 ]));
				float3 break9_g19249 = appendResult20_g19249;
				float ObjectData20_g19248 = ( temp_output_349_0_g19245 + ( break9_g19249.x + break9_g19249.z ) );
				float WorldData19_g19248 = temp_output_349_0_g19245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19248 = WorldData19_g19248;
				#else
				float staticSwitch14_g19248 = ObjectData20_g19248;
				#endif
				half Motion_Variation284_g19245 = staticSwitch14_g19248;
				float2 appendResult344_g19245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g19245 = ( _MotionScale_10 * appendResult344_g19245 );
				half2 Sine_MinusOneToOne281_g19245 = sin( ( temp_output_5_0_g19246 + Motion_Variation284_g19245 + Motion_Scale287_g19245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g19245 = Global_NoiseTex_R34_g19244;
				float2 lerpResult321_g19245 = lerp( Sine_MinusOneToOne281_g19245 , temp_cast_4 , Input_Turbulence327_g19245);
				float2 temp_output_84_0_g19244 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g19244 ) * Global_Amplitude_136_g19244 * Global_NoiseTex_R34_g19244 * Motion_DirectionOS39_g19244 * lerpResult321_g19245 );
				float temp_output_1976_333_g19244 = break322_g19289.z;
				half2 Motion_Interaction53_g19244 = ( _InteractionAmplitude * Motion_Max_Bending1133_g19244 * temp_output_1976_320_g19244 * temp_output_1976_333_g19244 * temp_output_1976_333_g19244 );
				half Motion_InteractionMask66_g19244 = temp_output_1976_333_g19244;
				float2 lerpResult109_g19244 = lerp( temp_output_84_0_g19244 , Motion_Interaction53_g19244 , Motion_InteractionMask66_g19244);
				half Mesh_Motion_182_g19244 = v.ase_texcoord3.x;
				half Motion_Use1056_g19244 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g19244 = ( lerpResult109_g19244 * Mesh_Motion_182_g19244 * Motion_Use1056_g19244 );
				half Motion_Z190_g19244 = break143_g19244.y;
				half Angle44_g19268 = Motion_Z190_g19244;
				half3 VertexPos40_g19276 = ( VertexPosRotationAxis50_g19268 + ( VertexPosOtherAxis82_g19268 * cos( Angle44_g19268 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g19268 ) * sin( Angle44_g19268 ) ) );
				float3 appendResult74_g19276 = (float3(0.0 , 0.0 , VertexPos40_g19276.z));
				half3 VertexPosRotationAxis50_g19276 = appendResult74_g19276;
				float3 break84_g19276 = VertexPos40_g19276;
				float3 appendResult81_g19276 = (float3(break84_g19276.x , break84_g19276.y , 0.0));
				half3 VertexPosOtherAxis82_g19276 = appendResult81_g19276;
				half Motion_X216_g19244 = break143_g19244.x;
				half Angle44_g19276 = -Motion_X216_g19244;
				half Global_NoiseTex_B132_g19244 = break142_g19284.b;
				half Input_Speed62_g19297 = -MotionSpeed265_g19244;
				float temp_output_4_0_g19300 = Input_Speed62_g19297;
				float temp_output_5_0_g19300 = ( temp_output_4_0_g19300 * _TimeParameters.x );
				float temp_output_342_0_g19297 = ( -MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19298 = GetObjectToWorldMatrix();
				float3 appendResult20_g19298 = (float3(break19_g19298[ 0 ][ 3 ] , break19_g19298[ 1 ][ 3 ] , break19_g19298[ 2 ][ 3 ]));
				float3 break9_g19298 = appendResult20_g19298;
				float ObjectData20_g19299 = ( temp_output_342_0_g19297 + ( break9_g19298.x + break9_g19298.z ) );
				float WorldData19_g19299 = temp_output_342_0_g19297;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19299 = WorldData19_g19299;
				#else
				float staticSwitch14_g19299 = ObjectData20_g19299;
				#endif
				float Motion_Variation284_g19297 = staticSwitch14_g19299;
				float Motion_Scale287_g19297 = ( MotionScale262_g19244 * ase_worldPos.x );
				float3 appendResult2014_g19244 = (float3(0.0 , ( ( _MotionVertical_20 * Bounds_Radius121_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * Motion_Use20162_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_B132_g19244 ) * sin( ( temp_output_5_0_g19300 + Motion_Variation284_g19297 + Motion_Scale287_g19297 ) ) ) , 0.0));
				half3 Motion_Vertical223_g19244 = appendResult2014_g19244;
				half Motion_Scale321_g19270 = ( _MotionScale_30 * 10.0 );
				half Input_Speed62_g19270 = _MotionSpeed_30;
				float temp_output_4_0_g19271 = Input_Speed62_g19270;
				float temp_output_5_0_g19271 = ( temp_output_4_0_g19271 * _TimeParameters.x );
				float Motion_Variation330_g19270 = ( _MotionVariation_30 * v.ase_color.r );
				half Input_Amplitude58_g19270 = ( _MotionAmplitude_30 * Bounds_Radius121_g19244 * 0.2 );
				half Mesh_Motion_3144_g19244 = v.ase_texcoord3.z;
				half Motion_Use302011_g19244 = _Motion_30;
				half3 Motion_Leaves1988_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19270 ) + temp_output_5_0_g19271 + Motion_Variation330_g19270 ) ) * Input_Amplitude58_g19270 * v.ase_normal ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use302011_g19244 * Global_Amplitude_270_g19244 );
				half Motion_Scale321_g19274 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g19274 = _MotionSpeed_32;
				float temp_output_4_0_g19275 = Input_Speed62_g19274;
				float temp_output_5_0_g19275 = ( temp_output_4_0_g19275 * _TimeParameters.x );
				float Motion_Variation330_g19274 = ( _MotionVariation_32 * v.ase_color.r );
				half Input_Amplitude58_g19274 = ( _MotionAmplitude_32 * Bounds_Radius121_g19244 * 0.2 );
				float3 appendResult345_g19274 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_A139_g19244 = break142_g19284.a;
				half Motion_Use322013_g19244 = _Motion_32;
				half Global_Amplitude_3488_g19244 = TVE_Amplitude3;
				half3 Motion_Flutter263_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19274 ) + temp_output_5_0_g19275 + Motion_Variation330_g19274 ) ) * Input_Amplitude58_g19274 * appendResult345_g19274 ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_A139_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use322013_g19244 * Global_Amplitude_3488_g19244 );
				float3 Vertex_Motion_Object833_g19244 = ( ( ( ( VertexPosRotationAxis50_g19276 + ( VertexPosOtherAxis82_g19276 * cos( Angle44_g19276 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g19276 ) * sin( Angle44_g19276 ) ) ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 ObjectData20_g19267 = Vertex_Motion_Object833_g19244;
				float3 appendResult2047_g19244 = (float3(Motion_Rolling138_g19244 , 0.0 , -Motion_Rolling138_g19244));
				float3 appendResult2043_g19244 = (float3(Motion_X216_g19244 , 0.0 , Motion_Z190_g19244));
				float3 Vertex_Motion_World1118_g19244 = ( ( ( ( ( v.vertex.xyz + appendResult2047_g19244 ) + appendResult2043_g19244 ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 WorldData19_g19267 = Vertex_Motion_World1118_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19267 = WorldData19_g19267;
				#else
				float3 staticSwitch14_g19267 = ObjectData20_g19267;
				#endif
				float4x4 break19_g19269 = GetObjectToWorldMatrix();
				float3 appendResult20_g19269 = (float3(break19_g19269[ 0 ][ 3 ] , break19_g19269[ 1 ][ 3 ] , break19_g19269[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g19244 = TVE_SizeFadeEnd;
				float temp_output_7_0_g19264 = Global_SizeFadeEnd287_g19244;
				half Global_SizeFadeStart276_g19244 = TVE_SizeFadeStart;
				float lerpResult348_g19244 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g19269 ) - temp_output_7_0_g19264 ) / ( Global_SizeFadeStart276_g19244 - temp_output_7_0_g19264 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g19273 = lerpResult348_g19244;
				float WorldData19_g19273 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19273 = WorldData19_g19273;
				#else
				float staticSwitch14_g19273 = ObjectData20_g19273;
				#endif
				float Vertex_SizeFade1740_g19244 = staticSwitch14_g19273;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g19244 = tex2DNode7_g19292.g;
				float lerpResult346_g19244 = lerp( 1.0 , Global_ExtrasTex_G305_g19244 , _GlobalSize);
				float ObjectData20_g19265 = lerpResult346_g19244;
				float WorldData19_g19265 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19265 = WorldData19_g19265;
				#else
				float staticSwitch14_g19265 = ObjectData20_g19265;
				#endif
				half Vertex_Size1741_g19244 = staticSwitch14_g19265;
				float3 Final_Vertex890_g19244 = ( ( staticSwitch14_g19267 * Vertex_SizeFade1740_g19244 * Vertex_Size1741_g19244 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
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
				float3 vertexValue = Final_Vertex890_g19244;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			half4 frag(VertexOutput IN , half ase_vface : VFACE ) : SV_TARGET
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

				float2 Main_UVs15_g19244 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g19244 = tex2D( _MainAlbedoTex, Main_UVs15_g19244 );
				float4 temp_output_51_0_g19244 = ( _MainColor * tex2DNode29_g19244 );
				half3 Main_AlbedoRaw99_g19244 = (temp_output_51_0_g19244).rgb;
				float3 temp_cast_0 = (1.0).xxx;
				float4x4 break19_g19282 = GetObjectToWorldMatrix();
				float3 appendResult20_g19282 = (float3(break19_g19282[ 0 ][ 3 ] , break19_g19282[ 1 ][ 3 ] , break19_g19282[ 2 ][ 3 ]));
				half3 ObjectData20_g19281 = appendResult20_g19282;
				half3 WorldData19_g19281 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19281 = WorldData19_g19281;
				#else
				float3 staticSwitch14_g19281 = ObjectData20_g19281;
				#endif
				float4 tex2DNode7_g19280 = tex2D( TVE_ColorsTex, ( (TVE_ColorsCoord).xy + ( TVE_ColorsCoord.z * (staticSwitch14_g19281).xz ) ) );
				half3 Global_ColorsTex_RGB1700_g19244 = (tex2DNode7_g19280).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g19250 = 2.0;
				#else
				float staticSwitch1_g19250 = 4.594794;
				#endif
				float3 lerpResult108_g19244 = lerp( temp_cast_0 , ( Global_ColorsTex_RGB1700_g19244 * staticSwitch1_g19250 ) , _GlobalColors);
				half3 Global_Colors1954_g19244 = lerpResult108_g19244;
				float3 temp_output_123_0_g19244 = ( Main_AlbedoRaw99_g19244 * Global_Colors1954_g19244 );
				half3 Main_AlbedoColored863_g19244 = temp_output_123_0_g19244;
				half3 Blend_Albedo265_g19244 = Main_AlbedoColored863_g19244;
				float3 temp_cast_1 = (0.5).xxx;
				float3 temp_output_799_0_g19244 = (_SubsurfaceColor).rgb;
				half Global_ColorsTex_A1701_g19244 = tex2DNode7_g19280.a;
				half Global_HealthinessValue1780_g19244 = _GlobalHealthiness;
				float lerpResult1720_g19244 = lerp( 1.0 , Global_ColorsTex_A1701_g19244 , Global_HealthinessValue1780_g19244);
				float3 lerpResult1698_g19244 = lerp( temp_cast_1 , temp_output_799_0_g19244 , lerpResult1720_g19244);
				half3 Subsurface_Color1722_g19244 = lerpResult1698_g19244;
				float lerpResult1779_g19244 = lerp( 1.0 , Global_ColorsTex_A1701_g19244 , Global_HealthinessValue1780_g19244);
				half AutoRegister_MaterialShadingSpace1208_g19244 = _MaterialShadingSpaceDrawer;
				half Subsurface_Intensity1752_g19244 = ( ( _SubsurfaceValue * lerpResult1779_g19244 ) + AutoRegister_MaterialShadingSpace1208_g19244 );
				float4 tex2DNode35_g19244 = tex2D( _MainMaskTex, Main_UVs15_g19244 );
				half Main_Mask57_g19244 = tex2DNode35_g19244.b;
				float temp_output_7_0_g19278 = _SubsurfaceMinValue;
				half Subsurface_Mask1557_g19244 = saturate( ( ( Main_Mask57_g19244 - temp_output_7_0_g19278 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g19278 ) ) );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				half Global_OverlayIntensity154_g19244 = TVE_OverlayIntensity;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ) );
				half Global_ExtrasTex_B156_g19244 = tex2DNode7_g19292.b;
				float temp_output_1025_0_g19244 = ( Global_OverlayIntensity154_g19244 * _GlobalOverlay * Global_ExtrasTex_B156_g19244 );
				float Mesh_Variation16_g19244 = IN.ase_color.r;
				float lerpResult1065_g19244 = lerp( 1.0 , Mesh_Variation16_g19244 , _OverlayVariation);
				half Overlay_Commons1365_g19244 = ( temp_output_1025_0_g19244 * lerpResult1065_g19244 );
				half Overlay_Mask_Subsurface1492_g19244 = saturate( ( saturate( ase_worldNormal.y ) - ( 1.0 - Overlay_Commons1365_g19244 ) ) );
				half3 Subsurface_Transmission884_g19244 = ( Subsurface_Color1722_g19244 * Subsurface_Intensity1752_g19244 * Subsurface_Mask1557_g19244 * ( 1.0 - Overlay_Mask_Subsurface1492_g19244 ) );
				float3 normalizeResult1983_g19244 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g19244 = dot( -SafeNormalize(_MainLightPosition.xyz) , normalizeResult1983_g19244 );
				float saferPower1624_g19244 = max( (dotResult785_g19244*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g19244 = 0.0;
				#else
				float staticSwitch1602_g19244 = ( pow( saferPower1624_g19244 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g19244 = staticSwitch1602_g19244;
				float4 tex2DNode117_g19244 = tex2D( _MainNormalTex, Main_UVs15_g19244 );
				float2 appendResult88_g19296 = (float2(tex2DNode117_g19244.a , tex2DNode117_g19244.g));
				float2 temp_output_90_0_g19296 = ( (appendResult88_g19296*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g19296 = (float3(temp_output_90_0_g19296 , 1.0));
				float3 Main_Normal137_g19244 = appendResult91_g19296;
				float3 temp_output_13_0_g19288 = Main_Normal137_g19244;
				float3 switchResult12_g19288 = (((ase_vface>0)?(temp_output_13_0_g19288):(( temp_output_13_0_g19288 * _render_normals_options ))));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal2069_g19244 = switchResult12_g19288;
				float3 worldNormal2069_g19244 = normalize( float3(dot(tanToWorld0,tanNormal2069_g19244), dot(tanToWorld1,tanNormal2069_g19244), dot(tanToWorld2,tanNormal2069_g19244)) );
				float dotResult777_g19244 = dot( worldNormal2069_g19244 , SafeNormalize(_MainLightPosition.xyz) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1604_g19244 = 0.0;
				#else
				float staticSwitch1604_g19244 = max( -dotResult777_g19244 , 0.0 );
				#endif
				half Mask_Subsurface_Normal870_g19244 = staticSwitch1604_g19244;
				half3 Subsurface_Deferred1693_g19244 = ( Subsurface_Transmission884_g19244 * ( Mask_Subsurface_View782_g19244 + Mask_Subsurface_Normal870_g19244 ) );
				half3 Blend_AlbedoAndSubsurface149_g19244 = ( Blend_Albedo265_g19244 + Subsurface_Deferred1693_g19244 );
				float3 temp_output_44_0_g19253 = (TVE_OverlayColor).rgb;
				half3 Global_OverlayColor1758_g19244 = temp_output_44_0_g19253;
				float2 temp_output_38_0_g19253 = ( _OverlayUVTilling * IN.ase_texcoord2.xy * TVE_OverlayUVTilling );
				float3 temp_output_34_0_g19253 = (tex2D( TVE_OverlayAlbedoTex, temp_output_38_0_g19253 )).rgb;
				half3 Global_OverlayAlbedo277_g19244 = temp_output_34_0_g19253;
				float3 Blend_NormalRaw1051_g19244 = Main_Normal137_g19244;
				float3 switchResult1063_g19244 = (((ase_vface>0)?(Blend_NormalRaw1051_g19244):(( Blend_NormalRaw1051_g19244 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g19244 = _OverlayContrast;
				float3 appendResult1439_g19244 = (float3(Overlay_Contrast1405_g19244 , Overlay_Contrast1405_g19244 , 1.0));
				float3 tanNormal178_g19244 = ( switchResult1063_g19244 * appendResult1439_g19244 );
				float3 worldNormal178_g19244 = float3(dot(tanToWorld0,tanNormal178_g19244), dot(tanToWorld1,tanNormal178_g19244), dot(tanToWorld2,tanNormal178_g19244));
				half Overlay_Mask269_g19244 = saturate( ( saturate( worldNormal178_g19244.y ) - ( 1.0 - Overlay_Commons1365_g19244 ) ) );
				float3 lerpResult336_g19244 = lerp( Blend_AlbedoAndSubsurface149_g19244 , ( Global_OverlayColor1758_g19244 * Global_OverlayAlbedo277_g19244 ) , Overlay_Mask269_g19244);
				half3 Final_Albedo359_g19244 = lerpResult336_g19244;
				half Main_Alpha316_g19244 = (temp_output_51_0_g19244).a;
				float lerpResult354_g19244 = lerp( 1.0 , Main_Alpha316_g19244 , __premul);
				half Final_Premultiply355_g19244 = lerpResult354_g19244;
				
				float localCustomAlphaClip9_g19272 = ( 0.0 );
				half Main_AlphaRaw1203_g19244 = tex2DNode29_g19244.a;
				half Global_ExtrasTex_R174_g19244 = tex2DNode7_g19292.r;
				float lerpResult293_g19244 = lerp( 1.0 , ceil( ( ( Mesh_Variation16_g19244 * Mesh_Variation16_g19244 ) - ( 1.0 - Global_ExtrasTex_R174_g19244 ) ) ) , _GlobalLeaves);
				half Mask_Leaves315_g19244 = lerpResult293_g19244;
				half Alpha5_g19272 = ( Main_AlphaRaw1203_g19244 * Mask_Leaves315_g19244 );
				float Alpha9_g19272 = Alpha5_g19272;
				float AlphaClipThreshold9_g19272 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g19272 - AlphaClipThreshold9_g19272);
				#endif
				half Final_Clip914_g19244 = localCustomAlphaClip9_g19272;
				
				
				float3 Albedo = ( Final_Albedo359_g19244 * Final_Premultiply355_g19244 );
				float3 Emission = 0;
				float Alpha = Main_Alpha316_g19244;
				float AlphaClipThreshold = Final_Clip914_g19244;

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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _ALPHATEST_ON
			  
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			    
			#pragma shader_feature_local MATERIAL_USE_OBJECT_DATA MATERIAL_USE_WORLD_DATA


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO

			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _MainUVs;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_asset;
			float4 _Color;
			half3 _render_normals_options;
			half _MotionAmplitude_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _Motion_30;
			half _MotionAmplitude_30;
			float _MotionSpeed_30;
			half _Motion_32;
			float _MotionScale_30;
			half _MotionVertical_20;
			half _MotionCat;
			half _Motion_10;
			half _InteractionAmplitude;
			float _MotionScale_10;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionVariation_30;
			half _GlobalSizeFade;
			half _VertexOcclusion;
			half _IsUniversalPipeline;
			half _ObjectOcclusionValue;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half __premul;
			half _OverlayContrast;
			half _OverlayUVTilling;
			half _MainNormalValue;
			half _SubsurfaceViewValue;
			half _GlobalSize;
			half _SubsurfaceAngleValue;
			half _GlobalOverlay;
			half _SubsurfaceMaxValue;
			half _SubsurfaceMinValue;
			half _MaterialShadingSpaceDrawer;
			half _SubsurfaceValue;
			half _GlobalHealthiness;
			half _GlobalColors;
			half _MotionAmplitude_10;
			half _OverlayVariation;
			float _MotionScale_20;
			float _MotionSpeed_20;
			half _MainOcclusionValue;
			half _RenderMode_TransparentInteractive;
			half _Cutoff;
			half _render_zw;
			half _render_blend;
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
			half _render_normals;
			half _MotionVariation_20;
			half __cull;
			half __src;
			half _Motion_20;
			half _MotionAmplitude_20;
			half _IsStandardShader;
			half _IsLeafShader;
			half _Banner;
			half _material_batching;
			half _BatchingMessage;
			half _IsAnyPathShader;
			half _IsLitShader;
			half _IsVersion;
			half __surface;
			half _MainColorMode;
			half __dst;
			half _render_cull;
			half _AlphaClipInteractive;
			half _render_src;
			float _SubsurfaceMode;
			half __priority;
			half _MainShadingCat;
			half __normals;
			half _GlobalLeaves;
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
			half TVE_Amplitude2;
			sampler2D TVE_NoiseTex;
			half TVE_NoiseSpeed;
			half TVE_NoiseSize;
			half TVE_NoiseContrast;
			half TVE_Amplitude1;
			sampler2D TVE_MotionTex;
			half4 TVE_MotionCoord;
			half TVE_Amplitude3;
			half TVE_SizeFadeEnd;
			half TVE_SizeFadeStart;
			sampler2D TVE_ExtrasTex;
			half4 TVE_ExtrasCoord;
			sampler2D _MainAlbedoTex;
			sampler2D TVE_ColorsTex;
			half4 TVE_ColorsCoord;
			sampler2D _MainMaskTex;
			half TVE_OverlayIntensity;
			sampler2D _MainNormalTex;
			half4 TVE_OverlayColor;
			sampler2D TVE_OverlayAlbedoTex;
			half TVE_OverlayUVTilling;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				half3 VertexPos40_g19266 = v.vertex.xyz;
				float3 appendResult74_g19266 = (float3(0.0 , VertexPos40_g19266.y , 0.0));
				float3 VertexPosRotationAxis50_g19266 = appendResult74_g19266;
				float3 break84_g19266 = VertexPos40_g19266;
				float3 appendResult81_g19266 = (float3(break84_g19266.x , 0.0 , break84_g19266.z));
				float3 VertexPosOtherAxis82_g19266 = appendResult81_g19266;
				float ObjectData20_g19303 = 3.14;
				float Bounds_Radius121_g19244 = _MaxBoundsInfo.x;
				float WorldData19_g19303 = Bounds_Radius121_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19303 = WorldData19_g19303;
				#else
				float staticSwitch14_g19303 = ObjectData20_g19303;
				#endif
				float Motion_Max_Rolling1137_g19244 = staticSwitch14_g19303;
				half Global_Amplitude_270_g19244 = TVE_Amplitude2;
				half Mesh_Motion_260_g19244 = v.ase_texcoord3.y;
				float temp_output_4_0_g19286 = 1.0;
				float temp_output_5_0_g19286 = ( temp_output_4_0_g19286 * _TimeParameters.x );
				float2 temp_cast_0 = (TVE_NoiseSpeed).xx;
				float4x4 break19_g19285 = GetObjectToWorldMatrix();
				float3 appendResult20_g19285 = (float3(break19_g19285[ 0 ][ 3 ] , break19_g19285[ 1 ][ 3 ] , break19_g19285[ 2 ][ 3 ]));
				half3 ObjectData20_g19287 = appendResult20_g19285;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				half3 WorldData19_g19287 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19287 = WorldData19_g19287;
				#else
				float3 staticSwitch14_g19287 = ObjectData20_g19287;
				#endif
				float2 panner73_g19284 = ( temp_output_5_0_g19286 * temp_cast_0 + ( (staticSwitch14_g19287).xz * TVE_NoiseSize ));
				float4 temp_cast_1 = (TVE_NoiseContrast).xxxx;
				float4 break142_g19284 = pow( abs( tex2Dlod( TVE_NoiseTex, float4( panner73_g19284, 0, 0.0) ) ) , temp_cast_1 );
				half Global_NoiseTex_R34_g19244 = break142_g19284.r;
				half Global_NoiseTex_G38_g19244 = break142_g19284.g;
				half Motion_Use20162_g19244 = _Motion_20;
				half MotionSpeed265_g19244 = _MotionSpeed_20;
				half Input_Speed62_g19257 = MotionSpeed265_g19244;
				float temp_output_4_0_g19260 = Input_Speed62_g19257;
				float temp_output_5_0_g19260 = ( temp_output_4_0_g19260 * _TimeParameters.x );
				half MotionVariation264_g19244 = _MotionVariation_20;
				float temp_output_342_0_g19257 = ( MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19258 = GetObjectToWorldMatrix();
				float3 appendResult20_g19258 = (float3(break19_g19258[ 0 ][ 3 ] , break19_g19258[ 1 ][ 3 ] , break19_g19258[ 2 ][ 3 ]));
				float3 break9_g19258 = appendResult20_g19258;
				float ObjectData20_g19259 = ( temp_output_342_0_g19257 + ( break9_g19258.x + break9_g19258.z ) );
				float WorldData19_g19259 = temp_output_342_0_g19257;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19259 = WorldData19_g19259;
				#else
				float staticSwitch14_g19259 = ObjectData20_g19259;
				#endif
				float Motion_Variation284_g19257 = staticSwitch14_g19259;
				half MotionScale262_g19244 = _MotionScale_20;
				float Motion_Scale287_g19257 = ( MotionScale262_g19244 * ase_worldPos.x );
				half Motion_Rolling138_g19244 = ( ( _MotionAmplitude_20 * Motion_Max_Rolling1137_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Motion_Use20162_g19244 * sin( ( temp_output_5_0_g19260 + Motion_Variation284_g19257 + Motion_Scale287_g19257 ) ) );
				half Angle44_g19266 = Motion_Rolling138_g19244;
				half3 VertexPos40_g19268 = ( VertexPosRotationAxis50_g19266 + ( VertexPosOtherAxis82_g19266 * cos( Angle44_g19266 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g19266 ) * sin( Angle44_g19266 ) ) );
				float3 appendResult74_g19268 = (float3(VertexPos40_g19268.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g19268 = appendResult74_g19268;
				float3 break84_g19268 = VertexPos40_g19268;
				float3 appendResult81_g19268 = (float3(0.0 , break84_g19268.y , break84_g19268.z));
				half3 VertexPosOtherAxis82_g19268 = appendResult81_g19268;
				float ObjectData20_g19304 = 3.14;
				float Bounds_Height374_g19244 = _MaxBoundsInfo.y;
				float WorldData19_g19304 = ( Bounds_Height374_g19244 * 3.14 );
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19304 = WorldData19_g19304;
				#else
				float staticSwitch14_g19304 = ObjectData20_g19304;
				#endif
				float Motion_Max_Bending1133_g19244 = staticSwitch14_g19304;
				half Global_Amplitude_136_g19244 = TVE_Amplitude1;
				float4x4 break19_g19263 = GetObjectToWorldMatrix();
				float3 appendResult20_g19263 = (float3(break19_g19263[ 0 ][ 3 ] , break19_g19263[ 1 ][ 3 ] , break19_g19263[ 2 ][ 3 ]));
				half3 ObjectData20_g19262 = appendResult20_g19263;
				half3 WorldData19_g19262 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19262 = WorldData19_g19262;
				#else
				float3 staticSwitch14_g19262 = ObjectData20_g19262;
				#endif
				float3 break322_g19289 = (tex2Dlod( TVE_MotionTex, float4( ( (TVE_MotionCoord).xy + ( TVE_MotionCoord.z * (staticSwitch14_g19262).xz ) ), 0, 0.0) )).rgb;
				float3 appendResult323_g19289 = (float3(break322_g19289.x , 0.0 , break322_g19289.y));
				float3 temp_output_324_0_g19289 = (appendResult323_g19289*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half3 ObjectData20_g19290 = ( mul( GetWorldToObjectMatrix(), float4( temp_output_324_0_g19289 , 0.0 ) ).xyz * ase_parentObjectScale );
				half3 WorldData19_g19290 = temp_output_324_0_g19289;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19290 = WorldData19_g19290;
				#else
				float3 staticSwitch14_g19290 = ObjectData20_g19290;
				#endif
				float2 temp_output_1976_320_g19244 = (staticSwitch14_g19290).xz;
				half2 Motion_DirectionOS39_g19244 = temp_output_1976_320_g19244;
				half Input_Speed62_g19245 = _MotionSpeed_10;
				float temp_output_4_0_g19246 = Input_Speed62_g19245;
				float temp_output_5_0_g19246 = ( temp_output_4_0_g19246 * _TimeParameters.x );
				float temp_output_349_0_g19245 = ( _MotionVariation_10 * v.ase_color.r );
				float4x4 break19_g19249 = GetObjectToWorldMatrix();
				float3 appendResult20_g19249 = (float3(break19_g19249[ 0 ][ 3 ] , break19_g19249[ 1 ][ 3 ] , break19_g19249[ 2 ][ 3 ]));
				float3 break9_g19249 = appendResult20_g19249;
				float ObjectData20_g19248 = ( temp_output_349_0_g19245 + ( break9_g19249.x + break9_g19249.z ) );
				float WorldData19_g19248 = temp_output_349_0_g19245;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19248 = WorldData19_g19248;
				#else
				float staticSwitch14_g19248 = ObjectData20_g19248;
				#endif
				half Motion_Variation284_g19245 = staticSwitch14_g19248;
				float2 appendResult344_g19245 = (float2(ase_worldPos.x , ase_worldPos.z));
				float2 Motion_Scale287_g19245 = ( _MotionScale_10 * appendResult344_g19245 );
				half2 Sine_MinusOneToOne281_g19245 = sin( ( temp_output_5_0_g19246 + Motion_Variation284_g19245 + Motion_Scale287_g19245 ) );
				float2 temp_cast_4 = (1.0).xx;
				half Input_Turbulence327_g19245 = Global_NoiseTex_R34_g19244;
				float2 lerpResult321_g19245 = lerp( Sine_MinusOneToOne281_g19245 , temp_cast_4 , Input_Turbulence327_g19245);
				float2 temp_output_84_0_g19244 = ( ( _MotionAmplitude_10 * Motion_Max_Bending1133_g19244 ) * Global_Amplitude_136_g19244 * Global_NoiseTex_R34_g19244 * Motion_DirectionOS39_g19244 * lerpResult321_g19245 );
				float temp_output_1976_333_g19244 = break322_g19289.z;
				half2 Motion_Interaction53_g19244 = ( _InteractionAmplitude * Motion_Max_Bending1133_g19244 * temp_output_1976_320_g19244 * temp_output_1976_333_g19244 * temp_output_1976_333_g19244 );
				half Motion_InteractionMask66_g19244 = temp_output_1976_333_g19244;
				float2 lerpResult109_g19244 = lerp( temp_output_84_0_g19244 , Motion_Interaction53_g19244 , Motion_InteractionMask66_g19244);
				half Mesh_Motion_182_g19244 = v.ase_texcoord3.x;
				half Motion_Use1056_g19244 = ( _Motion_10 + ( _MotionCat * 0.0 ) );
				float2 break143_g19244 = ( lerpResult109_g19244 * Mesh_Motion_182_g19244 * Motion_Use1056_g19244 );
				half Motion_Z190_g19244 = break143_g19244.y;
				half Angle44_g19268 = Motion_Z190_g19244;
				half3 VertexPos40_g19276 = ( VertexPosRotationAxis50_g19268 + ( VertexPosOtherAxis82_g19268 * cos( Angle44_g19268 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g19268 ) * sin( Angle44_g19268 ) ) );
				float3 appendResult74_g19276 = (float3(0.0 , 0.0 , VertexPos40_g19276.z));
				half3 VertexPosRotationAxis50_g19276 = appendResult74_g19276;
				float3 break84_g19276 = VertexPos40_g19276;
				float3 appendResult81_g19276 = (float3(break84_g19276.x , break84_g19276.y , 0.0));
				half3 VertexPosOtherAxis82_g19276 = appendResult81_g19276;
				half Motion_X216_g19244 = break143_g19244.x;
				half Angle44_g19276 = -Motion_X216_g19244;
				half Global_NoiseTex_B132_g19244 = break142_g19284.b;
				half Input_Speed62_g19297 = -MotionSpeed265_g19244;
				float temp_output_4_0_g19300 = Input_Speed62_g19297;
				float temp_output_5_0_g19300 = ( temp_output_4_0_g19300 * _TimeParameters.x );
				float temp_output_342_0_g19297 = ( -MotionVariation264_g19244 * v.ase_color.r );
				float4x4 break19_g19298 = GetObjectToWorldMatrix();
				float3 appendResult20_g19298 = (float3(break19_g19298[ 0 ][ 3 ] , break19_g19298[ 1 ][ 3 ] , break19_g19298[ 2 ][ 3 ]));
				float3 break9_g19298 = appendResult20_g19298;
				float ObjectData20_g19299 = ( temp_output_342_0_g19297 + ( break9_g19298.x + break9_g19298.z ) );
				float WorldData19_g19299 = temp_output_342_0_g19297;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19299 = WorldData19_g19299;
				#else
				float staticSwitch14_g19299 = ObjectData20_g19299;
				#endif
				float Motion_Variation284_g19297 = staticSwitch14_g19299;
				float Motion_Scale287_g19297 = ( MotionScale262_g19244 * ase_worldPos.x );
				float3 appendResult2014_g19244 = (float3(0.0 , ( ( _MotionVertical_20 * Bounds_Radius121_g19244 ) * Global_Amplitude_270_g19244 * Mesh_Motion_260_g19244 * Motion_Use20162_g19244 * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_B132_g19244 ) * sin( ( temp_output_5_0_g19300 + Motion_Variation284_g19297 + Motion_Scale287_g19297 ) ) ) , 0.0));
				half3 Motion_Vertical223_g19244 = appendResult2014_g19244;
				half Motion_Scale321_g19270 = ( _MotionScale_30 * 10.0 );
				half Input_Speed62_g19270 = _MotionSpeed_30;
				float temp_output_4_0_g19271 = Input_Speed62_g19270;
				float temp_output_5_0_g19271 = ( temp_output_4_0_g19271 * _TimeParameters.x );
				float Motion_Variation330_g19270 = ( _MotionVariation_30 * v.ase_color.r );
				half Input_Amplitude58_g19270 = ( _MotionAmplitude_30 * Bounds_Radius121_g19244 * 0.2 );
				half Mesh_Motion_3144_g19244 = v.ase_texcoord3.z;
				half Motion_Use302011_g19244 = _Motion_30;
				half3 Motion_Leaves1988_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19270 ) + temp_output_5_0_g19271 + Motion_Variation330_g19270 ) ) * Input_Amplitude58_g19270 * v.ase_normal ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_G38_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use302011_g19244 * Global_Amplitude_270_g19244 );
				half Motion_Scale321_g19274 = ( _MotionScale_32 * 10.0 );
				half Input_Speed62_g19274 = _MotionSpeed_32;
				float temp_output_4_0_g19275 = Input_Speed62_g19274;
				float temp_output_5_0_g19275 = ( temp_output_4_0_g19275 * _TimeParameters.x );
				float Motion_Variation330_g19274 = ( _MotionVariation_32 * v.ase_color.r );
				half Input_Amplitude58_g19274 = ( _MotionAmplitude_32 * Bounds_Radius121_g19244 * 0.2 );
				float3 appendResult345_g19274 = (float3(v.ase_color.r , ( 1.0 - v.ase_color.r ) , v.ase_color.r));
				half Global_NoiseTex_A139_g19244 = break142_g19284.a;
				half Motion_Use322013_g19244 = _Motion_32;
				half Global_Amplitude_3488_g19244 = TVE_Amplitude3;
				half3 Motion_Flutter263_g19244 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g19274 ) + temp_output_5_0_g19275 + Motion_Variation330_g19274 ) ) * Input_Amplitude58_g19274 * appendResult345_g19274 ) * ( Global_NoiseTex_R34_g19244 + Global_NoiseTex_A139_g19244 ) * Mesh_Motion_3144_g19244 * Motion_Use322013_g19244 * Global_Amplitude_3488_g19244 );
				float3 Vertex_Motion_Object833_g19244 = ( ( ( ( VertexPosRotationAxis50_g19276 + ( VertexPosOtherAxis82_g19276 * cos( Angle44_g19276 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g19276 ) * sin( Angle44_g19276 ) ) ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 ObjectData20_g19267 = Vertex_Motion_Object833_g19244;
				float3 appendResult2047_g19244 = (float3(Motion_Rolling138_g19244 , 0.0 , -Motion_Rolling138_g19244));
				float3 appendResult2043_g19244 = (float3(Motion_X216_g19244 , 0.0 , Motion_Z190_g19244));
				float3 Vertex_Motion_World1118_g19244 = ( ( ( ( ( v.vertex.xyz + appendResult2047_g19244 ) + appendResult2043_g19244 ) + Motion_Vertical223_g19244 ) + Motion_Leaves1988_g19244 ) + Motion_Flutter263_g19244 );
				half3 WorldData19_g19267 = Vertex_Motion_World1118_g19244;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19267 = WorldData19_g19267;
				#else
				float3 staticSwitch14_g19267 = ObjectData20_g19267;
				#endif
				float4x4 break19_g19269 = GetObjectToWorldMatrix();
				float3 appendResult20_g19269 = (float3(break19_g19269[ 0 ][ 3 ] , break19_g19269[ 1 ][ 3 ] , break19_g19269[ 2 ][ 3 ]));
				half Global_SizeFadeEnd287_g19244 = TVE_SizeFadeEnd;
				float temp_output_7_0_g19264 = Global_SizeFadeEnd287_g19244;
				half Global_SizeFadeStart276_g19244 = TVE_SizeFadeStart;
				float lerpResult348_g19244 = lerp( 1.0 , saturate( ( ( distance( _WorldSpaceCameraPos , appendResult20_g19269 ) - temp_output_7_0_g19264 ) / ( Global_SizeFadeStart276_g19244 - temp_output_7_0_g19264 ) ) ) , _GlobalSizeFade);
				float ObjectData20_g19273 = lerpResult348_g19244;
				float WorldData19_g19273 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19273 = WorldData19_g19273;
				#else
				float staticSwitch14_g19273 = ObjectData20_g19273;
				#endif
				float Vertex_SizeFade1740_g19244 = staticSwitch14_g19273;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = ase_worldPos;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2Dlod( TVE_ExtrasTex, float4( ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ), 0, 0.0) );
				half Global_ExtrasTex_G305_g19244 = tex2DNode7_g19292.g;
				float lerpResult346_g19244 = lerp( 1.0 , Global_ExtrasTex_G305_g19244 , _GlobalSize);
				float ObjectData20_g19265 = lerpResult346_g19244;
				float WorldData19_g19265 = 1.0;
				#ifdef MATERIAL_USE_WORLD_DATA
				float staticSwitch14_g19265 = WorldData19_g19265;
				#else
				float staticSwitch14_g19265 = ObjectData20_g19265;
				#endif
				half Vertex_Size1741_g19244 = staticSwitch14_g19265;
				float3 Final_Vertex890_g19244 = ( ( staticSwitch14_g19267 * Vertex_SizeFade1740_g19244 * Vertex_Size1741_g19244 ) + ( _IsUniversalPipeline * 0.0 ) );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
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
				float3 vertexValue = Final_Vertex890_g19244;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			half4 frag(VertexOutput IN , half ase_vface : VFACE ) : SV_TARGET
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

				float2 Main_UVs15_g19244 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g19244 = tex2D( _MainAlbedoTex, Main_UVs15_g19244 );
				float4 temp_output_51_0_g19244 = ( _MainColor * tex2DNode29_g19244 );
				half3 Main_AlbedoRaw99_g19244 = (temp_output_51_0_g19244).rgb;
				float3 temp_cast_0 = (1.0).xxx;
				float4x4 break19_g19282 = GetObjectToWorldMatrix();
				float3 appendResult20_g19282 = (float3(break19_g19282[ 0 ][ 3 ] , break19_g19282[ 1 ][ 3 ] , break19_g19282[ 2 ][ 3 ]));
				half3 ObjectData20_g19281 = appendResult20_g19282;
				half3 WorldData19_g19281 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19281 = WorldData19_g19281;
				#else
				float3 staticSwitch14_g19281 = ObjectData20_g19281;
				#endif
				float4 tex2DNode7_g19280 = tex2D( TVE_ColorsTex, ( (TVE_ColorsCoord).xy + ( TVE_ColorsCoord.z * (staticSwitch14_g19281).xz ) ) );
				half3 Global_ColorsTex_RGB1700_g19244 = (tex2DNode7_g19280).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g19250 = 2.0;
				#else
				float staticSwitch1_g19250 = 4.594794;
				#endif
				float3 lerpResult108_g19244 = lerp( temp_cast_0 , ( Global_ColorsTex_RGB1700_g19244 * staticSwitch1_g19250 ) , _GlobalColors);
				half3 Global_Colors1954_g19244 = lerpResult108_g19244;
				float3 temp_output_123_0_g19244 = ( Main_AlbedoRaw99_g19244 * Global_Colors1954_g19244 );
				half3 Main_AlbedoColored863_g19244 = temp_output_123_0_g19244;
				half3 Blend_Albedo265_g19244 = Main_AlbedoColored863_g19244;
				float3 temp_cast_1 = (0.5).xxx;
				float3 temp_output_799_0_g19244 = (_SubsurfaceColor).rgb;
				half Global_ColorsTex_A1701_g19244 = tex2DNode7_g19280.a;
				half Global_HealthinessValue1780_g19244 = _GlobalHealthiness;
				float lerpResult1720_g19244 = lerp( 1.0 , Global_ColorsTex_A1701_g19244 , Global_HealthinessValue1780_g19244);
				float3 lerpResult1698_g19244 = lerp( temp_cast_1 , temp_output_799_0_g19244 , lerpResult1720_g19244);
				half3 Subsurface_Color1722_g19244 = lerpResult1698_g19244;
				float lerpResult1779_g19244 = lerp( 1.0 , Global_ColorsTex_A1701_g19244 , Global_HealthinessValue1780_g19244);
				half AutoRegister_MaterialShadingSpace1208_g19244 = _MaterialShadingSpaceDrawer;
				half Subsurface_Intensity1752_g19244 = ( ( _SubsurfaceValue * lerpResult1779_g19244 ) + AutoRegister_MaterialShadingSpace1208_g19244 );
				float4 tex2DNode35_g19244 = tex2D( _MainMaskTex, Main_UVs15_g19244 );
				half Main_Mask57_g19244 = tex2DNode35_g19244.b;
				float temp_output_7_0_g19278 = _SubsurfaceMinValue;
				half Subsurface_Mask1557_g19244 = saturate( ( ( Main_Mask57_g19244 - temp_output_7_0_g19278 ) / ( _SubsurfaceMaxValue - temp_output_7_0_g19278 ) ) );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				half Global_OverlayIntensity154_g19244 = TVE_OverlayIntensity;
				float4x4 break19_g19293 = GetObjectToWorldMatrix();
				float3 appendResult20_g19293 = (float3(break19_g19293[ 0 ][ 3 ] , break19_g19293[ 1 ][ 3 ] , break19_g19293[ 2 ][ 3 ]));
				half3 ObjectData20_g19294 = appendResult20_g19293;
				half3 WorldData19_g19294 = WorldPosition;
				#ifdef MATERIAL_USE_WORLD_DATA
				float3 staticSwitch14_g19294 = WorldData19_g19294;
				#else
				float3 staticSwitch14_g19294 = ObjectData20_g19294;
				#endif
				float4 tex2DNode7_g19292 = tex2D( TVE_ExtrasTex, ( (TVE_ExtrasCoord).xy + ( TVE_ExtrasCoord.z * (staticSwitch14_g19294).xz ) ) );
				half Global_ExtrasTex_B156_g19244 = tex2DNode7_g19292.b;
				float temp_output_1025_0_g19244 = ( Global_OverlayIntensity154_g19244 * _GlobalOverlay * Global_ExtrasTex_B156_g19244 );
				float Mesh_Variation16_g19244 = IN.ase_color.r;
				float lerpResult1065_g19244 = lerp( 1.0 , Mesh_Variation16_g19244 , _OverlayVariation);
				half Overlay_Commons1365_g19244 = ( temp_output_1025_0_g19244 * lerpResult1065_g19244 );
				half Overlay_Mask_Subsurface1492_g19244 = saturate( ( saturate( ase_worldNormal.y ) - ( 1.0 - Overlay_Commons1365_g19244 ) ) );
				half3 Subsurface_Transmission884_g19244 = ( Subsurface_Color1722_g19244 * Subsurface_Intensity1752_g19244 * Subsurface_Mask1557_g19244 * ( 1.0 - Overlay_Mask_Subsurface1492_g19244 ) );
				float3 normalizeResult1983_g19244 = normalize( ( _WorldSpaceCameraPos - WorldPosition ) );
				float dotResult785_g19244 = dot( -SafeNormalize(_MainLightPosition.xyz) , normalizeResult1983_g19244 );
				float saferPower1624_g19244 = max( (dotResult785_g19244*0.5 + 0.5) , 0.0001 );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g19244 = 0.0;
				#else
				float staticSwitch1602_g19244 = ( pow( saferPower1624_g19244 , _SubsurfaceAngleValue ) * _SubsurfaceViewValue );
				#endif
				half Mask_Subsurface_View782_g19244 = staticSwitch1602_g19244;
				float4 tex2DNode117_g19244 = tex2D( _MainNormalTex, Main_UVs15_g19244 );
				float2 appendResult88_g19296 = (float2(tex2DNode117_g19244.a , tex2DNode117_g19244.g));
				float2 temp_output_90_0_g19296 = ( (appendResult88_g19296*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g19296 = (float3(temp_output_90_0_g19296 , 1.0));
				float3 Main_Normal137_g19244 = appendResult91_g19296;
				float3 temp_output_13_0_g19288 = Main_Normal137_g19244;
				float3 switchResult12_g19288 = (((ase_vface>0)?(temp_output_13_0_g19288):(( temp_output_13_0_g19288 * _render_normals_options ))));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal2069_g19244 = switchResult12_g19288;
				float3 worldNormal2069_g19244 = normalize( float3(dot(tanToWorld0,tanNormal2069_g19244), dot(tanToWorld1,tanNormal2069_g19244), dot(tanToWorld2,tanNormal2069_g19244)) );
				float dotResult777_g19244 = dot( worldNormal2069_g19244 , SafeNormalize(_MainLightPosition.xyz) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1604_g19244 = 0.0;
				#else
				float staticSwitch1604_g19244 = max( -dotResult777_g19244 , 0.0 );
				#endif
				half Mask_Subsurface_Normal870_g19244 = staticSwitch1604_g19244;
				half3 Subsurface_Deferred1693_g19244 = ( Subsurface_Transmission884_g19244 * ( Mask_Subsurface_View782_g19244 + Mask_Subsurface_Normal870_g19244 ) );
				half3 Blend_AlbedoAndSubsurface149_g19244 = ( Blend_Albedo265_g19244 + Subsurface_Deferred1693_g19244 );
				float3 temp_output_44_0_g19253 = (TVE_OverlayColor).rgb;
				half3 Global_OverlayColor1758_g19244 = temp_output_44_0_g19253;
				float2 temp_output_38_0_g19253 = ( _OverlayUVTilling * IN.ase_texcoord2.xy * TVE_OverlayUVTilling );
				float3 temp_output_34_0_g19253 = (tex2D( TVE_OverlayAlbedoTex, temp_output_38_0_g19253 )).rgb;
				half3 Global_OverlayAlbedo277_g19244 = temp_output_34_0_g19253;
				float3 Blend_NormalRaw1051_g19244 = Main_Normal137_g19244;
				float3 switchResult1063_g19244 = (((ase_vface>0)?(Blend_NormalRaw1051_g19244):(( Blend_NormalRaw1051_g19244 * float3(-1,-1,-1) ))));
				half Overlay_Contrast1405_g19244 = _OverlayContrast;
				float3 appendResult1439_g19244 = (float3(Overlay_Contrast1405_g19244 , Overlay_Contrast1405_g19244 , 1.0));
				float3 tanNormal178_g19244 = ( switchResult1063_g19244 * appendResult1439_g19244 );
				float3 worldNormal178_g19244 = float3(dot(tanToWorld0,tanNormal178_g19244), dot(tanToWorld1,tanNormal178_g19244), dot(tanToWorld2,tanNormal178_g19244));
				half Overlay_Mask269_g19244 = saturate( ( saturate( worldNormal178_g19244.y ) - ( 1.0 - Overlay_Commons1365_g19244 ) ) );
				float3 lerpResult336_g19244 = lerp( Blend_AlbedoAndSubsurface149_g19244 , ( Global_OverlayColor1758_g19244 * Global_OverlayAlbedo277_g19244 ) , Overlay_Mask269_g19244);
				half3 Final_Albedo359_g19244 = lerpResult336_g19244;
				half Main_Alpha316_g19244 = (temp_output_51_0_g19244).a;
				float lerpResult354_g19244 = lerp( 1.0 , Main_Alpha316_g19244 , __premul);
				half Final_Premultiply355_g19244 = lerpResult354_g19244;
				
				float localCustomAlphaClip9_g19272 = ( 0.0 );
				half Main_AlphaRaw1203_g19244 = tex2DNode29_g19244.a;
				half Global_ExtrasTex_R174_g19244 = tex2DNode7_g19292.r;
				float lerpResult293_g19244 = lerp( 1.0 , ceil( ( ( Mesh_Variation16_g19244 * Mesh_Variation16_g19244 ) - ( 1.0 - Global_ExtrasTex_R174_g19244 ) ) ) , _GlobalLeaves);
				half Mask_Leaves315_g19244 = lerpResult293_g19244;
				half Alpha5_g19272 = ( Main_AlphaRaw1203_g19244 * Mask_Leaves315_g19244 );
				float Alpha9_g19272 = Alpha5_g19272;
				float AlphaClipThreshold9_g19272 = _Cutoff;
				#if _ALPHATEST_ON
				clip(Alpha9_g19272 - AlphaClipThreshold9_g19272);
				#endif
				half Final_Clip914_g19244 = localCustomAlphaClip9_g19272;
				
				
				float3 Albedo = ( Final_Albedo359_g19244 * Final_Premultiply355_g19244 );
				float Alpha = Main_Alpha316_g19244;
				float AlphaClipThreshold = Final_Clip914_g19244;

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
1927;7;1906;1015;2898.277;482.3361;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;7;-1536,-768;Half;False;Property;_render_dst;_render_dst;154;1;[HideInInspector];Fetch;True;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-1792,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;148;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1344,-768;Half;False;Property;_render_zw;_render_zw;155;1;[HideInInspector];Fetch;True;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2176,-768;Half;False;Property;_Cutoff;_Cutoff;151;1;[HideInInspector];Fetch;False;4;Alpha;0;Premultiply;1;Additive;2;Multiply;3;0;True;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1728,-768;Half;False;Property;_render_src;_render_src;153;1;[HideInInspector];Fetch;True;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2176,-896;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Leaf Standard Lit);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-1984,-896;Half;False;Property;_IsLeafShader;_IsLeafShader;147;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1920,-768;Half;False;Property;_render_cull;_render_cull;152;2;[HideInInspector];[Enum];Fetch;True;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;609;-1376,-896;Half;False;Property;_IsAnyPathShader;_IsAnyPathShader;149;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;271;-1552,-896;Half;False;Property;_IsLitShader;_IsLitShader;150;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;608;-2176,-128;Inherit;False;Base Shader;1;;19244;856f7164d1c579d43a5cf4968a75ca43;51,1271,2,1300,1,1298,1,1962,1,1708,1,1712,0,1964,1,1969,1,1723,1,1719,1,893,1,1745,1,1742,1,1714,1,1718,1,1715,1,1717,1,1728,1,1732,1,916,1,1949,1,1762,1,1763,1,1776,1,1966,0,1736,0,1735,0,1734,0,1737,0,1968,0,1733,0,878,0,1550,0,1646,1,1690,1,1757,1,1669,1,1981,1,1759,1,860,1,2055,1,2031,1,2054,1,2032,1,2057,1,2033,1,2036,1,2060,1,2039,1,2062,1,1785,1;0;14;FLOAT3;0;FLOAT3;528;FLOAT;529;FLOAT;530;FLOAT;531;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;653;FLOAT;629;FLOAT3;534
Node;AmplifyShaderEditor.FunctionNode;606;-2176,256;Inherit;False;Base Batching;144;;19306;d914b3a554b05ab4da8c1d2a8ce94c0a;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;614;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;610;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;611;-1376,-128;Float;False;True;-1;2;TVEShaderCoreGUI;0;2;BOXOPHOBIC/The Vegetation Engine/Vegetation/Leaf Standard Lit;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;16;False;False;False;True;2;True;10;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;17;True;0;False;-1;True;True;0;False;-1;-1;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;33;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Transmission;0;  Transmission Shadow;0.5,True,408;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;0;0;6;False;True;True;True;True;True;False;;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;612;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;613;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;615;-1376,-128;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;True;20;0;True;7;1;1;False;-1;0;False;-1;False;False;False;True;True;True;True;True;0;False;-1;False;True;1;True;17;True;0;False;-1;True;True;0;False;-1;-1;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,-640;Inherit;False;1026.438;100;Features;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1023.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-256;Inherit;False;1024.392;100;Final;0;;0.3439424,0.5960785,0,1;0;0
WireConnection;611;0;608;0
WireConnection;611;1;608;528
WireConnection;611;4;608;530
WireConnection;611;5;608;531
WireConnection;611;6;608;532
WireConnection;611;7;608;653
WireConnection;611;8;608;534
ASEEND*/
//CHKSM=6759AFA98F26C9F2974C64B1C2A96BA1A73243E9