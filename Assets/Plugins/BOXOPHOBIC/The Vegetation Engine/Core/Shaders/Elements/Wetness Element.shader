// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Wetness Element"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledBanner(Wetness Element)]_Banner1("Banner", Float) = 0
		[HideInInspector]_IsExtrasShader("_IsExtrasShader", Float) = 1
		[StyledMessage(Info, Use the Wetness elements to dampen the global wetness effect on vegetation and props., 0,0)]_Message1("Message", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 130
		[HideInInspector]_IsUniversalPipeline("_IsUniversalPipeline", Float) = 1
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsTVEElement("_IsTVEElement", Float) = 1
		[StyledCategory(Element)]_ElementCat("[ Element Cat ]", Float) = 0
		_ElementIntensity("Element Intensity", Range( 0 , 1)) = 1
		[NoScaleOffset][Space(10)]_MainTex("Element Texture", 2D) = "white" {}
		_MainUVs("Element UVs", Vector) = (1,1,0,0)
		[Enum(Main,0,Seasons,1)]_ElementMode("Element Mode", Float) = 0
		[StyledInteractive(_ElementMode, 0)]_SeasonMode_Simple("# SeasonMode_Simple", Float) = 0
		[Space(10)]_MainValue("Main", Range( 0 , 1)) = 1
		[StyledInteractive(_ElementMode, 1)]_SeasonMode_Seasons("# SeasonMode_Seasons", Float) = 0
		[Space(10)]_WinterValue("Winter", Range( 0 , 1)) = 1
		_SpringValue("Spring", Range( 0 , 1)) = 1
		_SummerValue("Summer", Range( 0 , 1)) = 1
		_AutumnValue("Autumn", Range( 0 , 1)) = 1
		[StyledCategory(Advanced)]_AdvancedCat("[ Advanced Cat]", Float) = 1
		[IntRange]_render_priority("Priority", Range( -50 , 50)) = 0
		[HideInInspector]_Intensity("Intensity", Range( 0 , 1)) = 1
		[HideInInspector][Enum(Simple,0,Seasons,1)]_SeasonMode("Size Mode", Float) = 0
		[HideInInspector][Space(10)]_Simple("Simple Amount", Float) = 1
		[HideInInspector][Space(10)]_Winter("Winter Amount", Float) = 1
		[HideInInspector]_Summer("Summer Amount", Float) = 1
		[HideInInspector]_Spring("Spring Amount", Float) = 1
		[HideInInspector]_Autumn("Autumn Amount", Float) = 1

		[HideInInspector]_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		[HideInInspector]_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		[HideInInspector]_TessMin( "Tess Min Distance", Float ) = 10
		[HideInInspector]_TessMax( "Tess Max Distance", Float ) = 25
		[HideInInspector]_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		[HideInInspector]_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		
		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }
		
		Cull Back
		HLSLINCLUDE
		#pragma target 2.0

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
			
			Blend DstColor Zero , DstColor Zero
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask A
			

			HLSLPROGRAM
			#define _RECEIVE_SHADOWS_OFF 1
			#pragma multi_compile_instancing
			#define ASE_SRP_VERSION 70201

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
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
				#ifdef ASE_FOG
				float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _MainUVs;
			half _Banner1;
			half _AutumnValue;
			half _SummerValue;
			half _SpringValue;
			half _WinterValue;
			half _MainValue;
			half _IsUniversalPipeline;
			float _Summer;
			float _Simple;
			half _IsTVEElement;
			half _SeasonMode_Simple;
			float _ElementMode;
			half _AdvancedCat;
			half _IsVersion;
			half _IsTVEShader;
			half _ElementCat;
			half _render_priority;
			float _Intensity;
			float _SeasonMode;
			float _Spring;
			float _Winter;
			half _Message1;
			float _Autumn;
			half _IsExtrasShader;
			half _SeasonMode_Seasons;
			float _ElementIntensity;
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			CBUFFER_END
			sampler2D _MainTex;
			half4 TVE_SeasonOptions;
			half TVE_SeasonLerp;


			half GammaToLinearFloatFast( half sRGB )
			{
				return sRGB * (sRGB * (sRGB * 0.305306011h + 0.682171111h) + 0.012522878h);
			}
			
			
			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (( _IsUniversalPipeline * 0.0 )).xxx;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_cast_0;
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
				#ifdef ASE_FOG
				o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			half4 frag ( VertexOutput IN  ) : SV_Target
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
				half Value_Main157_g79 = _MainValue;
				float4 tex2DNode17_g79 = tex2D( _MainTex, ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw ) );
				half MainTex_R73_g79 = tex2DNode17_g79.r;
				half TVE_SeasonOptions_X50_g79 = TVE_SeasonOptions.x;
				half Value_Winter158_g79 = _WinterValue;
				float temp_output_427_0_g79 = ( 1.0 - Value_Winter158_g79 );
				half Value_Spring159_g79 = _SpringValue;
				float temp_output_428_0_g79 = ( 1.0 - Value_Spring159_g79 );
				half TVE_SeasonLerp54_g79 = TVE_SeasonLerp;
				float lerpResult419_g79 = lerp( temp_output_427_0_g79 , temp_output_428_0_g79 , TVE_SeasonLerp54_g79);
				half TVE_SeasonOptions_Y51_g79 = TVE_SeasonOptions.y;
				half Value_Summer160_g79 = _SummerValue;
				float temp_output_429_0_g79 = ( 1.0 - Value_Summer160_g79 );
				float lerpResult422_g79 = lerp( temp_output_428_0_g79 , temp_output_429_0_g79 , TVE_SeasonLerp54_g79);
				half TVE_SeasonOptions_Z52_g79 = TVE_SeasonOptions.z;
				half Value_Autumn161_g79 = _AutumnValue;
				float temp_output_430_0_g79 = ( 1.0 - Value_Autumn161_g79 );
				float lerpResult407_g79 = lerp( temp_output_429_0_g79 , temp_output_430_0_g79 , TVE_SeasonLerp54_g79);
				half TVE_SeasonOptions_W53_g79 = TVE_SeasonOptions.w;
				float lerpResult415_g79 = lerp( temp_output_430_0_g79 , temp_output_427_0_g79 , TVE_SeasonLerp54_g79);
				half Element_Mode55_g79 = _ElementMode;
				float lerpResult413_g79 = lerp( ( ( 1.0 - Value_Main157_g79 ) * MainTex_R73_g79 ) , ( MainTex_R73_g79 * ( ( TVE_SeasonOptions_X50_g79 * lerpResult419_g79 ) + ( TVE_SeasonOptions_Y51_g79 * lerpResult422_g79 ) + ( TVE_SeasonOptions_Z52_g79 * lerpResult407_g79 ) + ( TVE_SeasonOptions_W53_g79 * lerpResult415_g79 ) ) ) , Element_Mode55_g79);
				half Base_Extras_A423_g79 = ( 1.0 - lerpResult413_g79 );
				half Element_Intensity56_g79 = ( _ElementIntensity * IN.ase_color.a );
				float lerpResult378_g79 = lerp( 1.0 , Base_Extras_A423_g79 , Element_Intensity56_g79);
				float temp_output_9_0_g91 = lerpResult378_g79;
				half sRGB8_g91 = temp_output_9_0_g91;
				half localGammaToLinearFloatFast8_g91 = GammaToLinearFloatFast( sRGB8_g91 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g91 = temp_output_9_0_g91;
				#else
				float staticSwitch1_g91 = localGammaToLinearFloatFast8_g91;
				#endif
				half Final_Wetness_A250_g79 = staticSwitch1_g91;
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = float3( 0.5, 0.5, 0.5 );
				float Alpha = Final_Wetness_A250_g79;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				return half4( Color, Alpha );
			}

			ENDHLSL
		}

	
	}
	CustomEditor "TVEShaderElementGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18102
1927;7;1906;1015;935.3414;2025.001;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;115;-256,-1408;Half;False;Property;_Banner1;Banner;0;0;Create;True;0;0;True;1;StyledBanner(Wetness Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;109;192,-1792;Inherit;False;Property;_Spring;Spring Amount;38;1;[HideInInspector];Create;False;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;117;-64,-1408;Half;False;Property;_IsExtrasShader;_IsExtrasShader;1;1;[HideInInspector];Create;True;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;120;192,-1408;Half;False;Property;_Message1;Message;2;0;Create;True;0;0;True;1;StyledMessage(Info, Use the Wetness elements to dampen the global wetness effect on vegetation and props., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;0,-1792;Inherit;False;Property;_Winter;Winter Amount;36;1;[HideInInspector];Create;False;0;0;True;1;Space(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;592,-1792;Inherit;False;Property;_Autumn;Autumn Amount;39;1;[HideInInspector];Create;False;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-256,-1664;Inherit;False;Property;_SeasonMode;Size Mode;34;2;[HideInInspector];[Enum];Create;False;2;Simple;0;Seasons;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-96,-1664;Inherit;False;Property;_Intensity;Intensity;33;1;[HideInInspector];Create;False;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-256,-1792;Inherit;False;Property;_Simple;Simple Amount;35;1;[HideInInspector];Create;False;0;0;True;1;Space(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;108;384,-1792;Inherit;False;Property;_Summer;Summer Amount;37;1;[HideInInspector];Create;False;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;122;-256,-1280;Inherit;False;Base Element;3;;79;0e972c73cae2ee54ea51acc9738801d0;2,145,5,148,5;0;4;FLOAT3;0;FLOAT;86;FLOAT;435;FLOAT;339
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;126;128,-1280;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;123;128,-1280;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;124;128,-1280;Float;False;True;-1;2;TVEShaderElementGUI;0;3;BOXOPHOBIC/The Vegetation Engine/Elements/Wetness Element;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;7;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;0;0;True;6;2;False;-1;0;False;-1;6;2;False;-1;0;False;-1;False;False;False;True;False;False;False;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;21;Surface;1;  Blend;0;Two Sided;1;Cast Shadows;0;Receive Shadows;0;GPU Instancing;1;LOD CrossFade;0;Built-in Fog;0;Meta Pass;0;DOTS Instancing;1;Extra Pre Pass;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;5;False;True;False;False;False;False;;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;125;128,-1280;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;127;128,-1280;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.CommentaryNode;114;-256,-1920;Inherit;False;1025.136;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;124;3;122;86
WireConnection;124;5;122;339
ASEEND*/
//CHKSM=D41713D1AACDAEE6D2F402A6792F7C27DE9008D5