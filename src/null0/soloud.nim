{.passC: "-Ivendor/soloud/src/ -Ivendor/soloud/include/ -DWITH_NULL -DWITH_MINIAUDIO".}

{.compile: "vendor/soloud/src/audiosource/openmpt/soloud_openmpt.cpp".}
{.compile: "vendor/soloud/src/audiosource/openmpt/soloud_openmpt_dll.c".}

{.compile: "vendor/stb/stb_vorbis.c".}
{.compile: "vendor/soloud/src/audiosource/ay/chipplayer.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/sndbuffer.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/sndchip.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/sndrender.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/soloud_ay.cpp".}
{.compile: "vendor/soloud/src/audiosource/monotone/soloud_monotone.cpp".}
{.compile: "vendor/soloud/src/audiosource/noise/soloud_noise.cpp".}
{.compile: "vendor/soloud/src/audiosource/sfxr/soloud_sfxr.cpp".}
{.compile: "vendor/soloud/src/audiosource/speech/darray.cpp".}
{.compile: "vendor/soloud/src/audiosource/speech/klatt.cpp".}
{.compile: "vendor/soloud/src/audiosource/speech/resonator.cpp".}
{.compile: "vendor/soloud/src/audiosource/speech/soloud_speech.cpp".}
{.compile: "vendor/soloud/src/audiosource/speech/tts.cpp".}
{.compile: "vendor/soloud/src/audiosource/tedsid/sid.cpp".}
{.compile: "vendor/soloud/src/audiosource/tedsid/soloud_tedsid.cpp".}
{.compile: "vendor/soloud/src/audiosource/tedsid/ted.cpp".}
{.compile: "vendor/soloud/src/audiosource/vic/soloud_vic.cpp".}
{.compile: "vendor/soloud/src/audiosource/vizsn/soloud_vizsn.cpp".}
{.compile: "vendor/soloud/src/audiosource/wav/dr_impl.cpp".}
{.compile: "vendor/soloud/src/audiosource/wav/soloud_wav.cpp".}
{.compile: "vendor/soloud/src/audiosource/wav/soloud_wavstream.cpp".}
{.compile: "vendor/soloud/src/backend/alsa/soloud_alsa.cpp".}
{.compile: "vendor/soloud/src/backend/coreaudio/soloud_coreaudio.cpp".}
{.compile: "vendor/soloud/src/backend/jack/soloud_jack.cpp".}
{.compile: "vendor/soloud/src/backend/miniaudio/soloud_miniaudio.cpp".}
{.compile: "vendor/soloud/src/backend/nosound/soloud_nosound.cpp".}
{.compile: "vendor/soloud/src/backend/null/soloud_null.cpp".}
{.compile: "vendor/soloud/src/backend/openal/soloud_openal.cpp".}
{.compile: "vendor/soloud/src/backend/opensles/soloud_opensles.cpp".}
{.compile: "vendor/soloud/src/backend/oss/soloud_oss.cpp".}
{.compile: "vendor/soloud/src/backend/portaudio/soloud_portaudio.cpp".}
{.compile: "vendor/soloud/src/backend/sdl/soloud_sdl1.cpp".}
{.compile: "vendor/soloud/src/backend/sdl/soloud_sdl2.cpp".}
{.compile: "vendor/soloud/src/backend/sdl2_static/soloud_sdl2_static.cpp".}
{.compile: "vendor/soloud/src/backend/sdl_static/soloud_sdl_static.cpp".}
# {.compile: "vendor/soloud/src/backend/vita_homebrew/soloud_vita_homebrew.cpp".} 
{.compile: "vendor/soloud/src/backend/wasapi/soloud_wasapi.cpp".}
{.compile: "vendor/soloud/src/backend/winmm/soloud_winmm.cpp".}
{.compile: "vendor/soloud/src/backend/xaudio2/soloud_xaudio2.cpp".}
{.compile: "vendor/soloud/src/core/soloud_audiosource.cpp".}
{.compile: "vendor/soloud/src/core/soloud_bus.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_3d.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_basicops.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_faderops.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_filterops.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_getters.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_setters.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_voicegroup.cpp".}
{.compile: "vendor/soloud/src/core/soloud_core_voiceops.cpp".}
{.compile: "vendor/soloud/src/core/soloud_fader.cpp".}
{.compile: "vendor/soloud/src/core/soloud_fft.cpp".}
{.compile: "vendor/soloud/src/core/soloud_fft_lut.cpp".}
{.compile: "vendor/soloud/src/core/soloud_file.cpp".}
{.compile: "vendor/soloud/src/core/soloud_filter.cpp".}
{.compile: "vendor/soloud/src/core/soloud_misc.cpp".}
{.compile: "vendor/soloud/src/core/soloud_queue.cpp".}
{.compile: "vendor/soloud/src/core/soloud_thread.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_bassboostfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_biquadresonantfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_dcremovalfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_duckfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_echofilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_eqfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_fftfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_flangerfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_freeverbfilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_lofifilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_robotizefilter.cpp".}
{.compile: "vendor/soloud/src/filter/soloud_waveshaperfilter.cpp".}
{.compile: "vendor/soloud/src/core/soloud.cpp".}
{.compile: "vendor/soloud/src/c_api/soloud_c.cpp".}

type
  AlignedFloatBuffer* = pointer
  TinyAlignedFloatBuffer* = pointer
  Soloud* = pointer
  Ay* = pointer
  AudioCollider* = pointer
  AudioAttenuator* = pointer
  AudioSource* = pointer
  BassboostFilter* = pointer
  BiquadResonantFilter* = pointer
  Bus* = pointer
  DCRemovalFilter* = pointer
  EchoFilter* = pointer
  Fader* = pointer
  FFTFilter* = pointer
  Filter* = pointer
  FlangerFilter* = pointer
  FreeverbFilter* = pointer
  LofiFilter* = pointer
  Monotone* = pointer
  Noise* = pointer
  Openmpt* = pointer
  Queue* = pointer
  RobotizeFilter* = pointer
  Sfxr* = pointer
  Speech* = pointer
  TedSid* = pointer
  Vic* = pointer
  Vizsn* = pointer
  Wav* = pointer
  WaveShaperFilter* = pointer
  WavStream* = pointer
  File* = pointer

type
  Backend* = enum
    AUTO,
    SDL1,
    SDL2,
    PORTAUDIO,
    WINMM,
    XAUDIO2,
    WASAPI,
    ALSA,
    JACK,
    OSS,
    OPENAL,
    COREAUDIO,
    OPENSLES,
    VITA_HOMEBREW,
    MINIAUDIO,
    NOSOUND,
    NULLDRIVER,
    BACKEND_MAX
  
  Waveform* = enum
    SQUARE,
    SAW,
    SIN,
    TRIANGLE,
    BOUNCE,
    JAWS,
    HUMPS,
    FSQUARE,
    FSAW

  Resampler* = enum
    POINT,
    LINEAR,
    CATMULLROM

const
  CLIP_ROUNDOFF* = 1
  ENABLE_VISUALIZATION* = 2
  LEFT_HANDED_3D* = 4
  NO_FPU_REGISTER_CHANGE* = 8

{.push callconv: cdecl, importc.}

proc Soloud_destroy*(aSoloud: Soloud)
proc Soloud_create*(): Soloud
proc Soloud_init*(aSoloud: Soloud): cint
proc Soloud_initEx*(aSoloud: Soloud; aFlags: cuint; aBackend: Backend; aSamplerate: cuint; aBufferSize: cuint; aChannels: cuint): cint
proc Soloud_deinit*(aSoloud: Soloud)
proc Soloud_getVersion*(aSoloud: Soloud): cuint
proc Soloud_getErrorString*(aSoloud: Soloud; aErrorCode: cint): cstring
proc Soloud_getBackendId*(aSoloud: Soloud): cuint
proc Soloud_getBackendString*(aSoloud: Soloud): cstring
proc Soloud_getBackendChannels*(aSoloud: Soloud): cuint
proc Soloud_getBackendSamplerate*(aSoloud: Soloud): cuint
proc Soloud_getBackendBufferSize*(aSoloud: Soloud): cuint
proc Soloud_setSpeakerPosition*(aSoloud: Soloud; aChannel: cuint; aX: cfloat; aY: cfloat; aZ: cfloat): cint
proc Soloud_getSpeakerPosition*(aSoloud: Soloud; aChannel: cuint; aX: cfloat; aY: cfloat; aZ: cfloat): cint
proc Soloud_play*(aSoloud: Soloud; aSound: AudioSource): cuint
proc Soloud_playEx*(aSoloud: Soloud; aSound: AudioSource; aVolume: cfloat;  aPan: cfloat;  aPaused: cint;  aBus: cuint): cuint
proc Soloud_playClocked*(aSoloud: Soloud; aSoundTime: cdouble; aSound: AudioSource): cuint
proc Soloud_playClockedEx*(aSoloud: Soloud; aSoundTime: cdouble; aSound: AudioSource; aVolume: cfloat;  aPan: cfloat;  aBus: cuint): cuint
proc Soloud_play3d*(aSoloud: Soloud; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat): cuint
proc Soloud_play3dEx*(aSoloud: Soloud; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aVelX: cfloat;  aVelY: cfloat;  aVelZ: cfloat;  aVolume: cfloat;  aPaused: cint;  aBus: cuint): cuint
proc Soloud_play3dClocked*(aSoloud: Soloud; aSoundTime: cdouble; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat): cuint
proc Soloud_play3dClockedEx*(aSoloud: Soloud; aSoundTime: cdouble; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aVelX: cfloat;  aVelY: cfloat;  aVelZ: cfloat;  aVolume: cfloat;  aBus: cuint): cuint
proc Soloud_playBackground*(aSoloud: Soloud; aSound: AudioSource): cuint
proc Soloud_playBackgroundEx*(aSoloud: Soloud; aSound: AudioSource; aVolume: cfloat;  aPaused: cint;  aBus: cuint): cuint
proc Soloud_seek*(aSoloud: Soloud; aVoiceHandle: cuint; aSeconds: cdouble): cint
proc Soloud_stop*(aSoloud: Soloud; aVoiceHandle: cuint)
proc Soloud_stopAll*(aSoloud: Soloud)
proc Soloud_stopAudioSource*(aSoloud: Soloud; aSound: AudioSource)
proc Soloud_countAudioSource*(aSoloud: Soloud; aSound: AudioSource): cint
proc Soloud_setFilterParameter*(aSoloud: Soloud; aVoiceHandle: cuint; aFilterId: cuint; aAttributeId: cuint; aValue: cfloat)
proc Soloud_getFilterParameter*(aSoloud: Soloud; aVoiceHandle: cuint; aFilterId: cuint; aAttributeId: cuint): cfloat
proc Soloud_fadeFilterParameter*(aSoloud: Soloud; aVoiceHandle: cuint; aFilterId: cuint; aAttributeId: cuint; aTo: cfloat; aTime: cdouble)
proc Soloud_oscillateFilterParameter*(aSoloud: Soloud; aVoiceHandle: cuint; aFilterId: cuint; aAttributeId: cuint; aFrom: cfloat; aTo: cfloat; aTime: cdouble)
proc Soloud_getStreamTime*(aSoloud: Soloud; aVoiceHandle: cuint): cdouble
proc Soloud_getStreamPosition*(aSoloud: Soloud; aVoiceHandle: cuint): cdouble
proc Soloud_getPause*(aSoloud: Soloud; aVoiceHandle: cuint): cint
proc Soloud_getVolume*(aSoloud: Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getOverallVolume*(aSoloud: Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getPan*(aSoloud: Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getSamplerate*(aSoloud: Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getProtectVoice*(aSoloud: Soloud; aVoiceHandle: cuint): cint
proc Soloud_getActiveVoiceCount*(aSoloud: Soloud): cuint
proc Soloud_getVoiceCount*(aSoloud: Soloud): cuint
proc Soloud_isValidVoiceHandle*(aSoloud: Soloud; aVoiceHandle: cuint): cint
proc Soloud_getRelativePlaySpeed*(aSoloud: Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getPostClipScaler*(aSoloud: Soloud): cfloat
proc Soloud_getMainResampler*(aSoloud: Soloud): cuint
proc Soloud_getGlobalVolume*(aSoloud: Soloud): cfloat
proc Soloud_getMaxActiveVoiceCount*(aSoloud: Soloud): cuint
proc Soloud_getLooping*(aSoloud: Soloud; aVoiceHandle: cuint): cint
proc Soloud_getAutoStop*(aSoloud: Soloud; aVoiceHandle: cuint): cint
proc Soloud_getLoopPoint*(aSoloud: Soloud; aVoiceHandle: cuint): cdouble
proc Soloud_setLoopPoint*(aSoloud: Soloud; aVoiceHandle: cuint; aLoopPoint: cdouble)
proc Soloud_setLooping*(aSoloud: Soloud; aVoiceHandle: cuint; aLooping: cint)
proc Soloud_setAutoStop*(aSoloud: Soloud; aVoiceHandle: cuint; aAutoStop: cint)
proc Soloud_setMaxActiveVoiceCount*(aSoloud: Soloud; aVoiceCount: cuint): cint
proc Soloud_setInaudibleBehavior*(aSoloud: Soloud; aVoiceHandle: cuint; aMustTick: cint; aKill: cint)
proc Soloud_setGlobalVolume*(aSoloud: Soloud; aVolume: cfloat)
proc Soloud_setPostClipScaler*(aSoloud: Soloud; aScaler: cfloat)
proc Soloud_setMainResampler*(aSoloud: Soloud; aResampler: cuint)
proc Soloud_setPause*(aSoloud: Soloud; aVoiceHandle: cuint; aPause: cint)
proc Soloud_setPauseAll*(aSoloud: Soloud; aPause: cint)
proc Soloud_setRelativePlaySpeed*(aSoloud: Soloud; aVoiceHandle: cuint; aSpeed: cfloat): cint
proc Soloud_setProtectVoice*(aSoloud: Soloud; aVoiceHandle: cuint; aProtect: cint)
proc Soloud_setSamplerate*(aSoloud: Soloud; aVoiceHandle: cuint; aSamplerate: cfloat)
proc Soloud_setPan*(aSoloud: Soloud; aVoiceHandle: cuint; aPan: cfloat)
proc Soloud_setPanAbsolute*(aSoloud: Soloud; aVoiceHandle: cuint; aLVolume: cfloat; aRVolume: cfloat)
proc Soloud_setChannelVolume*(aSoloud: Soloud; aVoiceHandle: cuint; aChannel: cuint; aVolume: cfloat)
proc Soloud_setVolume*(aSoloud: Soloud; aVoiceHandle: cuint; aVolume: cfloat)
proc Soloud_setDelaySamples*(aSoloud: Soloud; aVoiceHandle: cuint; aSamples: cuint)
proc Soloud_fadeVolume*(aSoloud: Soloud; aVoiceHandle: cuint; aTo: cfloat; aTime: cdouble)
proc Soloud_fadePan*(aSoloud: Soloud; aVoiceHandle: cuint; aTo: cfloat; aTime: cdouble)
proc Soloud_fadeRelativePlaySpeed*(aSoloud: Soloud; aVoiceHandle: cuint; aTo: cfloat; aTime: cdouble)
proc Soloud_fadeGlobalVolume*(aSoloud: Soloud; aTo: cfloat; aTime: cdouble)
proc Soloud_schedulePause*(aSoloud: Soloud; aVoiceHandle: cuint; aTime: cdouble)
proc Soloud_scheduleStop*(aSoloud: Soloud; aVoiceHandle: cuint; aTime: cdouble)
proc Soloud_oscillateVolume*(aSoloud: Soloud; aVoiceHandle: cuint; aFrom: cfloat; aTo: cfloat; aTime: cdouble)
proc Soloud_oscillatePan*(aSoloud: Soloud; aVoiceHandle: cuint; aFrom: cfloat; aTo: cfloat; aTime: cdouble)
proc Soloud_oscillateRelativePlaySpeed*(aSoloud: Soloud; aVoiceHandle: cuint; aFrom: cfloat; aTo: cfloat; aTime: cdouble)
proc Soloud_oscillateGlobalVolume*(aSoloud: Soloud; aFrom: cfloat; aTo: cfloat; aTime: cdouble)
proc Soloud_setGlobalFilter*(aSoloud: Soloud; aFilterId: cuint; aFilter: Filter)
proc Soloud_setVisualizationEnable*(aSoloud: Soloud; aEnable: cint)
proc Soloud_calcFFT*(aSoloud: Soloud): cfloat
proc Soloud_getWave*(aSoloud: Soloud): cfloat
proc Soloud_getApproximateVolume*(aSoloud: Soloud; aChannel: cuint): cfloat
proc Soloud_getLoopCount*(aSoloud: Soloud; aVoiceHandle: cuint): cuint
proc Soloud_getInfo*(aSoloud: Soloud; aVoiceHandle: cuint; aInfoKey: cuint): cfloat
proc Soloud_createVoiceGroup*(aSoloud: Soloud): cuint
proc Soloud_destroyVoiceGroup*(aSoloud: Soloud; aVoiceGroupHandle: cuint): cint
proc Soloud_addVoiceToGroup*(aSoloud: Soloud; aVoiceGroupHandle: cuint; aVoiceHandle: cuint): cint
proc Soloud_isVoiceGroup*(aSoloud: Soloud; aVoiceGroupHandle: cuint): cint
proc Soloud_isVoiceGroupEmpty*(aSoloud: Soloud; aVoiceGroupHandle: cuint): cint
proc Soloud_update3dAudio*(aSoloud: Soloud)
proc Soloud_set3dSoundSpeed*(aSoloud: Soloud; aSpeed: cfloat): cint
proc Soloud_get3dSoundSpeed*(aSoloud: Soloud): cfloat
proc Soloud_set3dListenerParameters*(aSoloud: Soloud; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aAtX: cfloat; aAtY: cfloat; aAtZ: cfloat; aUpX: cfloat; aUpY: cfloat; aUpZ: cfloat)
proc Soloud_set3dListenerParametersEx*(aSoloud: Soloud; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aAtX: cfloat; aAtY: cfloat; aAtZ: cfloat; aUpX: cfloat; aUpY: cfloat; aUpZ: cfloat; aVelocityX: cfloat;  aVelocityY: cfloat;  aVelocityZ: cfloat)
proc Soloud_set3dListenerPosition*(aSoloud: Soloud; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat)
proc Soloud_set3dListenerAt*(aSoloud: Soloud; aAtX: cfloat; aAtY: cfloat; aAtZ: cfloat)
proc Soloud_set3dListenerUp*(aSoloud: Soloud; aUpX: cfloat; aUpY: cfloat; aUpZ: cfloat)
proc Soloud_set3dListenerVelocity*(aSoloud: Soloud; aVelocityX: cfloat; aVelocityY: cfloat; aVelocityZ: cfloat)
proc Soloud_set3dSourceParameters*(aSoloud: Soloud; aVoiceHandle: cuint; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat)
proc Soloud_set3dSourceParametersEx*(aSoloud: Soloud; aVoiceHandle: cuint; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aVelocityX: cfloat;  aVelocityY: cfloat;  aVelocityZ: cfloat)
proc Soloud_set3dSourcePosition*(aSoloud: Soloud; aVoiceHandle: cuint; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat)
proc Soloud_set3dSourceVelocity*(aSoloud: Soloud; aVoiceHandle: cuint; aVelocityX: cfloat; aVelocityY: cfloat; aVelocityZ: cfloat)
proc Soloud_set3dSourceMinMaxDistance*(aSoloud: Soloud; aVoiceHandle: cuint; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Soloud_set3dSourceAttenuation*(aSoloud: Soloud; aVoiceHandle: cuint; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Soloud_set3dSourceDopplerFactor*(aSoloud: Soloud; aVoiceHandle: cuint; aDopplerFactor: cfloat)
proc Soloud_mix*(aSoloud: Soloud; aBuffer: cfloat; aSamples: cuint)
proc Soloud_mixSigned16*(aSoloud: Soloud; aBuffer: pointer; aSamples: cuint): pointer

##
##  Ay
##

proc Ay_destroy*(aAy: Ay)
proc Ay_create*(): Ay
proc Ay_setVolume*(aAy: Ay; aVolume: cfloat)
proc Ay_setLooping*(aAy: Ay; aLoop: cint)
proc Ay_setAutoStop*(aAy: Ay; aAutoStop: cint)
proc Ay_set3dMinMaxDistance*(aAy: Ay; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Ay_set3dAttenuation*(aAy: Ay; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Ay_set3dDopplerFactor*(aAy: Ay; aDopplerFactor: cfloat)
proc Ay_set3dListenerRelative*(aAy: Ay; aListenerRelative: cint)
proc Ay_set3dDistanceDelay*(aAy: Ay; aDistanceDelay: cint)
proc Ay_set3dCollider*(aAy: Ay; aCollider: AudioCollider)
proc Ay_set3dColliderEx*(aAy: Ay; aCollider: AudioCollider; aUserData: cint)
proc Ay_set3dAttenuator*(aAy: Ay; aAttenuator: AudioAttenuator)
proc Ay_setInaudibleBehavior*(aAy: Ay; aMustTick: cint; aKill: cint)
proc Ay_setLoopPoint*(aAy: Ay; aLoopPoint: cdouble)
proc Ay_getLoopPoint*(aAy: Ay): cdouble
proc Ay_setFilter*(aAy: Ay; aFilterId: cuint; aFilter: Filter)
proc Ay_stop*(aAy: Ay)

##
##  BassboostFilter
##

proc BassboostFilter_destroy*(aBassboostFilter: BassboostFilter)
proc BassboostFilter_getParamCount*(aBassboostFilter: BassboostFilter): cint
proc BassboostFilter_getParamName*(aBassboostFilter: BassboostFilter; aParamIndex: cuint): cstring
proc BassboostFilter_getParamType*(aBassboostFilter: BassboostFilter; aParamIndex: cuint): cuint
proc BassboostFilter_getParamMax*(aBassboostFilter: BassboostFilter; aParamIndex: cuint): cfloat
proc BassboostFilter_getParamMin*(aBassboostFilter: BassboostFilter; aParamIndex: cuint): cfloat
proc BassboostFilter_setParams*(aBassboostFilter: BassboostFilter; aBoost: cfloat): cint
proc BassboostFilter_create*(): BassboostFilter

##
##  BiquadResonantFilter
##

proc BiquadResonantFilter_destroy*(aBiquadResonantFilter: BiquadResonantFilter)
proc BiquadResonantFilter_getParamCount*(aBiquadResonantFilter: BiquadResonantFilter): cint
proc BiquadResonantFilter_getParamName*(aBiquadResonantFilter: BiquadResonantFilter; aParamIndex: cuint): cstring
proc BiquadResonantFilter_getParamType*(aBiquadResonantFilter: BiquadResonantFilter; aParamIndex: cuint): cuint
proc BiquadResonantFilter_getParamMax*(aBiquadResonantFilter: BiquadResonantFilter; aParamIndex: cuint): cfloat
proc BiquadResonantFilter_getParamMin*(aBiquadResonantFilter: BiquadResonantFilter; aParamIndex: cuint): cfloat
proc BiquadResonantFilter_create*(): BiquadResonantFilter
proc BiquadResonantFilter_setParams*(aBiquadResonantFilter: BiquadResonantFilter; aType: cint; aFrequency: cfloat; aResonance: cfloat): cint

##
##  Bus
##

proc Bus_destroy*(aBus: Bus)
proc Bus_create*(): Bus
proc Bus_setFilter*(aBus: Bus; aFilterId: cuint; aFilter: Filter)
proc Bus_play*(aBus: Bus; aSound: AudioSource): cuint
proc Bus_playEx*(aBus: Bus; aSound: AudioSource; aVolume: cfloat;  aPan: cfloat;                aPaused: cint): cuint
proc Bus_playClocked*(aBus: Bus; aSoundTime: cdouble; aSound: AudioSource): cuint
proc Bus_playClockedEx*(aBus: Bus; aSoundTime: cdouble; aSound: AudioSource; aVolume: cfloat;  aPan: cfloat): cuint
proc Bus_play3d*(aBus: Bus; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat): cuint
proc Bus_play3dEx*(aBus: Bus; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aVelX: cfloat;  aVelY: cfloat;  aVelZ: cfloat;  aVolume: cfloat;  aPaused: cint): cuint
proc Bus_play3dClocked*(aBus: Bus; aSoundTime: cdouble; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat): cuint
proc Bus_play3dClockedEx*(aBus: Bus; aSoundTime: cdouble; aSound: AudioSource; aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aVelX: cfloat;  aVelY: cfloat;  aVelZ: cfloat;  aVolume: cfloat): cuint
proc Bus_setChannels*(aBus: Bus; aChannels: cuint): cint
proc Bus_setVisualizationEnable*(aBus: Bus; aEnable: cint)
proc Bus_annexSound*(aBus: Bus; aVoiceHandle: cuint)
proc Bus_calcFFT*(aBus: Bus): cfloat
proc Bus_getWave*(aBus: Bus): cfloat
proc Bus_getApproximateVolume*(aBus: Bus; aChannel: cuint): cfloat
proc Bus_getActiveVoiceCount*(aBus: Bus): cuint
proc Bus_getResampler*(aBus: Bus): cuint
proc Bus_setResampler*(aBus: Bus; aResampler: cuint)
proc Bus_setVolume*(aBus: Bus; aVolume: cfloat)
proc Bus_setLooping*(aBus: Bus; aLoop: cint)
proc Bus_setAutoStop*(aBus: Bus; aAutoStop: cint)
proc Bus_set3dMinMaxDistance*(aBus: Bus; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Bus_set3dAttenuation*(aBus: Bus; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Bus_set3dDopplerFactor*(aBus: Bus; aDopplerFactor: cfloat)
proc Bus_set3dListenerRelative*(aBus: Bus; aListenerRelative: cint)
proc Bus_set3dDistanceDelay*(aBus: Bus; aDistanceDelay: cint)
proc Bus_set3dCollider*(aBus: Bus; aCollider: AudioCollider)
proc Bus_set3dColliderEx*(aBus: Bus; aCollider: AudioCollider; aUserData: cint)
proc Bus_set3dAttenuator*(aBus: Bus; aAttenuator: AudioAttenuator)
proc Bus_setInaudibleBehavior*(aBus: Bus; aMustTick: cint; aKill: cint)
proc Bus_setLoopPoint*(aBus: Bus; aLoopPoint: cdouble)
proc Bus_getLoopPoint*(aBus: Bus): cdouble
proc Bus_stop*(aBus: Bus)

##
##  DCRemovalFilter
##

proc DCRemovalFilter_destroy*(aDCRemovalFilter: DCRemovalFilter)
proc DCRemovalFilter_create*(): DCRemovalFilter
proc DCRemovalFilter_setParams*(aDCRemovalFilter: DCRemovalFilter): cint
proc DCRemovalFilter_setParamsEx*(aDCRemovalFilter: DCRemovalFilter; aLength: cfloat): cint
proc DCRemovalFilter_getParamCount*(aDCRemovalFilter: DCRemovalFilter): cint
proc DCRemovalFilter_getParamName*(aDCRemovalFilter: DCRemovalFilter; aParamIndex: cuint): cstring
proc DCRemovalFilter_getParamType*(aDCRemovalFilter: DCRemovalFilter; aParamIndex: cuint): cuint
proc DCRemovalFilter_getParamMax*(aDCRemovalFilter: DCRemovalFilter; aParamIndex: cuint): cfloat
proc DCRemovalFilter_getParamMin*(aDCRemovalFilter: DCRemovalFilter; aParamIndex: cuint): cfloat

##
##  EchoFilter
##

proc EchoFilter_destroy*(aEchoFilter: EchoFilter)
proc EchoFilter_getParamCount*(aEchoFilter: EchoFilter): cint
proc EchoFilter_getParamName*(aEchoFilter: EchoFilter; aParamIndex: cuint): cstring
proc EchoFilter_getParamType*(aEchoFilter: EchoFilter; aParamIndex: cuint): cuint
proc EchoFilter_getParamMax*(aEchoFilter: EchoFilter; aParamIndex: cuint): cfloat
proc EchoFilter_getParamMin*(aEchoFilter: EchoFilter; aParamIndex: cuint): cfloat
proc EchoFilter_create*(): EchoFilter
proc EchoFilter_setParams*(aEchoFilter: EchoFilter; aDelay: cfloat): cint
proc EchoFilter_setParamsEx*(aEchoFilter: EchoFilter; aDelay: cfloat; aDecay: cfloat;  aFilter: cfloat): cint

##
##  FFTFilter
##

proc FFTFilter_destroy*(aFFTFilter: FFTFilter)
proc FFTFilter_create*(): FFTFilter
proc FFTFilter_getParamCount*(aFFTFilter: FFTFilter): cint
proc FFTFilter_getParamName*(aFFTFilter: FFTFilter; aParamIndex: cuint): cstring
proc FFTFilter_getParamType*(aFFTFilter: FFTFilter; aParamIndex: cuint): cuint
proc FFTFilter_getParamMax*(aFFTFilter: FFTFilter; aParamIndex: cuint): cfloat
proc FFTFilter_getParamMin*(aFFTFilter: FFTFilter; aParamIndex: cuint): cfloat

##
##  FlangerFilter
##

proc FlangerFilter_destroy*(aFlangerFilter: FlangerFilter)
proc FlangerFilter_getParamCount*(aFlangerFilter: FlangerFilter): cint
proc FlangerFilter_getParamName*(aFlangerFilter: FlangerFilter; aParamIndex: cuint): cstring
proc FlangerFilter_getParamType*(aFlangerFilter: FlangerFilter; aParamIndex: cuint): cuint
proc FlangerFilter_getParamMax*(aFlangerFilter: FlangerFilter; aParamIndex: cuint): cfloat
proc FlangerFilter_getParamMin*(aFlangerFilter: FlangerFilter; aParamIndex: cuint): cfloat
proc FlangerFilter_create*(): FlangerFilter
proc FlangerFilter_setParams*(aFlangerFilter: FlangerFilter; aDelay: cfloat; aFreq: cfloat): cint

##
##  FreeverbFilter
##

proc FreeverbFilter_destroy*(aFreeverbFilter: FreeverbFilter)
proc FreeverbFilter_getParamCount*(aFreeverbFilter: FreeverbFilter): cint
proc FreeverbFilter_getParamName*(aFreeverbFilter: FreeverbFilter; aParamIndex: cuint): cstring
proc FreeverbFilter_getParamType*(aFreeverbFilter: FreeverbFilter; aParamIndex: cuint): cuint
proc FreeverbFilter_getParamMax*(aFreeverbFilter: FreeverbFilter; aParamIndex: cuint): cfloat
proc FreeverbFilter_getParamMin*(aFreeverbFilter: FreeverbFilter; aParamIndex: cuint): cfloat
proc FreeverbFilter_create*(): FreeverbFilter
proc FreeverbFilter_setParams*(aFreeverbFilter: FreeverbFilter; aMode: cfloat; aRoomSize: cfloat; aDamp: cfloat; aWidth: cfloat): cint

##
##  LofiFilter
##

proc LofiFilter_destroy*(aLofiFilter: LofiFilter)
proc LofiFilter_getParamCount*(aLofiFilter: LofiFilter): cint
proc LofiFilter_getParamName*(aLofiFilter: LofiFilter; aParamIndex: cuint): cstring
proc LofiFilter_getParamType*(aLofiFilter: LofiFilter; aParamIndex: cuint): cuint
proc LofiFilter_getParamMax*(aLofiFilter: LofiFilter; aParamIndex: cuint): cfloat
proc LofiFilter_getParamMin*(aLofiFilter: LofiFilter; aParamIndex: cuint): cfloat
proc LofiFilter_create*(): LofiFilter
proc LofiFilter_setParams*(aLofiFilter: LofiFilter; aSampleRate: cfloat; aBitdepth: cfloat): cint

##
##  Monotone
##

proc Monotone_destroy*(aMonotone: Monotone)
proc Monotone_create*(): Monotone
proc Monotone_setParams*(aMonotone: Monotone; aHardwareChannels: cint): cint
proc Monotone_setParamsEx*(aMonotone: Monotone; aHardwareChannels: cint; aWaveform: cint): cint
proc Monotone_load*(aMonotone: Monotone; aFilename: cstring): cint
proc Monotone_loadMem*(aMonotone: Monotone; aMem: uint8; aLength: cuint): cint
proc Monotone_loadMemEx*(aMonotone: Monotone; aMem: uint8; aLength: cuint; aCopy: cint;  aTakeOwnership: cint): cint
proc Monotone_loadFile*(aMonotone: Monotone; aFile: File): cint
proc Monotone_setVolume*(aMonotone: Monotone; aVolume: cfloat)
proc Monotone_setLooping*(aMonotone: Monotone; aLoop: cint)
proc Monotone_setAutoStop*(aMonotone: Monotone; aAutoStop: cint)
proc Monotone_set3dMinMaxDistance*(aMonotone: Monotone; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Monotone_set3dAttenuation*(aMonotone: Monotone; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Monotone_set3dDopplerFactor*(aMonotone: Monotone; aDopplerFactor: cfloat)
proc Monotone_set3dListenerRelative*(aMonotone: Monotone; aListenerRelative: cint)
proc Monotone_set3dDistanceDelay*(aMonotone: Monotone; aDistanceDelay: cint)
proc Monotone_set3dCollider*(aMonotone: Monotone; aCollider: AudioCollider)
proc Monotone_set3dColliderEx*(aMonotone: Monotone; aCollider: AudioCollider; aUserData: cint)
proc Monotone_set3dAttenuator*(aMonotone: Monotone; aAttenuator: AudioAttenuator)
proc Monotone_setInaudibleBehavior*(aMonotone: Monotone; aMustTick: cint; aKill: cint)
proc Monotone_setLoopPoint*(aMonotone: Monotone; aLoopPoint: cdouble)
proc Monotone_getLoopPoint*(aMonotone: Monotone): cdouble
proc Monotone_setFilter*(aMonotone: Monotone; aFilterId: cuint; aFilter: Filter)
proc Monotone_stop*(aMonotone: Monotone)

##
##  Noise
##

proc Noise_destroy*(aNoise: Noise)
proc Noise_create*(): Noise
proc Noise_setOctaveScale*(aNoise: Noise; aOct0: cfloat; aOct1: cfloat; aOct2: cfloat; aOct3: cfloat; aOct4: cfloat; aOct5: cfloat; aOct6: cfloat; aOct7: cfloat; aOct8: cfloat; aOct9: cfloat)
proc Noise_setType*(aNoise: Noise; aType: cint)
proc Noise_setVolume*(aNoise: Noise; aVolume: cfloat)
proc Noise_setLooping*(aNoise: Noise; aLoop: cint)
proc Noise_setAutoStop*(aNoise: Noise; aAutoStop: cint)
proc Noise_set3dMinMaxDistance*(aNoise: Noise; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Noise_set3dAttenuation*(aNoise: Noise; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Noise_set3dDopplerFactor*(aNoise: Noise; aDopplerFactor: cfloat)
proc Noise_set3dListenerRelative*(aNoise: Noise; aListenerRelative: cint)
proc Noise_set3dDistanceDelay*(aNoise: Noise; aDistanceDelay: cint)
proc Noise_set3dCollider*(aNoise: Noise; aCollider: AudioCollider)
proc Noise_set3dColliderEx*(aNoise: Noise; aCollider: AudioCollider; aUserData: cint)
proc Noise_set3dAttenuator*(aNoise: Noise; aAttenuator: AudioAttenuator)
proc Noise_setInaudibleBehavior*(aNoise: Noise; aMustTick: cint; aKill: cint)
proc Noise_setLoopPoint*(aNoise: Noise; aLoopPoint: cdouble)
proc Noise_getLoopPoint*(aNoise: Noise): cdouble
proc Noise_setFilter*(aNoise: Noise; aFilterId: cuint; aFilter: Filter)
proc Noise_stop*(aNoise: Noise)

##
##  Openmpt
##

proc Openmpt_destroy*(aOpenmpt: Openmpt)
proc Openmpt_create*(): Openmpt
proc Openmpt_load*(aOpenmpt: Openmpt; aFilename: cstring): cint
proc Openmpt_loadMem*(aOpenmpt: Openmpt; aMem: uint8; aLength: cuint): cint
proc Openmpt_loadMemEx*(aOpenmpt: Openmpt; aMem: uint8; aLength: cuint; aCopy: cint;  aTakeOwnership: cint): cint
proc Openmpt_loadFile*(aOpenmpt: Openmpt; aFile: File): cint
proc Openmpt_setVolume*(aOpenmpt: Openmpt; aVolume: cfloat)
proc Openmpt_setLooping*(aOpenmpt: Openmpt; aLoop: cint)
proc Openmpt_setAutoStop*(aOpenmpt: Openmpt; aAutoStop: cint)
proc Openmpt_set3dMinMaxDistance*(aOpenmpt: Openmpt; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Openmpt_set3dAttenuation*(aOpenmpt: Openmpt; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Openmpt_set3dDopplerFactor*(aOpenmpt: Openmpt; aDopplerFactor: cfloat)
proc Openmpt_set3dListenerRelative*(aOpenmpt: Openmpt; aListenerRelative: cint)
proc Openmpt_set3dDistanceDelay*(aOpenmpt: Openmpt; aDistanceDelay: cint)
proc Openmpt_set3dCollider*(aOpenmpt: Openmpt; aCollider: AudioCollider)
proc Openmpt_set3dColliderEx*(aOpenmpt: Openmpt; aCollider: AudioCollider; aUserData: cint)
proc Openmpt_set3dAttenuator*(aOpenmpt: Openmpt; aAttenuator: AudioAttenuator)
proc Openmpt_setInaudibleBehavior*(aOpenmpt: Openmpt; aMustTick: cint; aKill: cint)
proc Openmpt_setLoopPoint*(aOpenmpt: Openmpt; aLoopPoint: cdouble)
proc Openmpt_getLoopPoint*(aOpenmpt: Openmpt): cdouble
proc Openmpt_setFilter*(aOpenmpt: Openmpt; aFilterId: cuint; aFilter: Filter)
proc Openmpt_stop*(aOpenmpt: Openmpt)

##
##  Queue
##

proc Queue_destroy*(aQueue: Queue)
proc Queue_create*(): Queue
proc Queue_play*(aQueue: Queue; aSound: AudioSource): cint
proc Queue_getQueueCount*(aQueue: Queue): cuint
proc Queue_isCurrentlyPlaying*(aQueue: Queue; aSound: AudioSource): cint
proc Queue_setParamsFromAudioSource*(aQueue: Queue; aSound: AudioSource): cint
proc Queue_setParams*(aQueue: Queue; aSamplerate: cfloat): cint
proc Queue_setParamsEx*(aQueue: Queue; aSamplerate: cfloat; aChannels: cuint): cint
proc Queue_setVolume*(aQueue: Queue; aVolume: cfloat)
proc Queue_setLooping*(aQueue: Queue; aLoop: cint)
proc Queue_setAutoStop*(aQueue: Queue; aAutoStop: cint)
proc Queue_set3dMinMaxDistance*(aQueue: Queue; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Queue_set3dAttenuation*(aQueue: Queue; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Queue_set3dDopplerFactor*(aQueue: Queue; aDopplerFactor: cfloat)
proc Queue_set3dListenerRelative*(aQueue: Queue; aListenerRelative: cint)
proc Queue_set3dDistanceDelay*(aQueue: Queue; aDistanceDelay: cint)
proc Queue_set3dCollider*(aQueue: Queue; aCollider: AudioCollider)
proc Queue_set3dColliderEx*(aQueue: Queue; aCollider: AudioCollider; aUserData: cint)
proc Queue_set3dAttenuator*(aQueue: Queue; aAttenuator: AudioAttenuator)
proc Queue_setInaudibleBehavior*(aQueue: Queue; aMustTick: cint; aKill: cint)
proc Queue_setLoopPoint*(aQueue: Queue; aLoopPoint: cdouble)
proc Queue_getLoopPoint*(aQueue: Queue): cdouble
proc Queue_setFilter*(aQueue: Queue; aFilterId: cuint; aFilter: Filter)
proc Queue_stop*(aQueue: Queue)

##
##  RobotizeFilter
##

proc RobotizeFilter_destroy*(aRobotizeFilter: RobotizeFilter)
proc RobotizeFilter_getParamCount*(aRobotizeFilter: RobotizeFilter): cint
proc RobotizeFilter_getParamName*(aRobotizeFilter: RobotizeFilter; aParamIndex: cuint): cstring
proc RobotizeFilter_getParamType*(aRobotizeFilter: RobotizeFilter; aParamIndex: cuint): cuint
proc RobotizeFilter_getParamMax*(aRobotizeFilter: RobotizeFilter; aParamIndex: cuint): cfloat
proc RobotizeFilter_getParamMin*(aRobotizeFilter: RobotizeFilter; aParamIndex: cuint): cfloat
proc RobotizeFilter_setParams*(aRobotizeFilter: RobotizeFilter; aFreq: cfloat; aWaveform: cint)
proc RobotizeFilter_create*(): RobotizeFilter

##
##  Sfxr
##

proc Sfxr_destroy*(aSfxr: Sfxr)
proc Sfxr_create*(): Sfxr
proc Sfxr_resetParams*(aSfxr: Sfxr)
proc Sfxr_loadParams*(aSfxr: Sfxr; aFilename: cstring): cint
proc Sfxr_loadParamsMem*(aSfxr: Sfxr; aMem: uint8; aLength: cuint): cint
proc Sfxr_loadParamsMemEx*(aSfxr: Sfxr; aMem: uint8; aLength: cuint; aCopy: cint;  aTakeOwnership: cint): cint
proc Sfxr_loadParamsFile*(aSfxr: Sfxr; aFile: File): cint
proc Sfxr_loadPreset*(aSfxr: Sfxr; aPresetNo: cint; aRandSeed: cint): cint
proc Sfxr_setVolume*(aSfxr: Sfxr; aVolume: cfloat)
proc Sfxr_setLooping*(aSfxr: Sfxr; aLoop: cint)
proc Sfxr_setAutoStop*(aSfxr: Sfxr; aAutoStop: cint)
proc Sfxr_set3dMinMaxDistance*(aSfxr: Sfxr; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Sfxr_set3dAttenuation*(aSfxr: Sfxr; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Sfxr_set3dDopplerFactor*(aSfxr: Sfxr; aDopplerFactor: cfloat)
proc Sfxr_set3dListenerRelative*(aSfxr: Sfxr; aListenerRelative: cint)
proc Sfxr_set3dDistanceDelay*(aSfxr: Sfxr; aDistanceDelay: cint)
proc Sfxr_set3dCollider*(aSfxr: Sfxr; aCollider: AudioCollider)
proc Sfxr_set3dColliderEx*(aSfxr: Sfxr; aCollider: AudioCollider; aUserData: cint)
proc Sfxr_set3dAttenuator*(aSfxr: Sfxr; aAttenuator: AudioAttenuator)
proc Sfxr_setInaudibleBehavior*(aSfxr: Sfxr; aMustTick: cint; aKill: cint)
proc Sfxr_setLoopPoint*(aSfxr: Sfxr; aLoopPoint: cdouble)
proc Sfxr_getLoopPoint*(aSfxr: Sfxr): cdouble
proc Sfxr_setFilter*(aSfxr: Sfxr; aFilterId: cuint; aFilter: Filter)
proc Sfxr_stop*(aSfxr: Sfxr)

##
##  Speech
##

proc Speech_destroy*(aSpeech: Speech)
proc Speech_create*(): Speech
proc Speech_setText*(aSpeech: Speech; aText: cstring): cint
proc Speech_setParams*(aSpeech: Speech): cint
proc Speech_setParamsEx*(aSpeech: Speech; aBaseFrequency: cuint;  aBaseSpeed: cfloat;  aBaseDeclination: cfloat;  aBaseWaveform: cint): cint
proc Speech_setVolume*(aSpeech: Speech; aVolume: cfloat)
proc Speech_setLooping*(aSpeech: Speech; aLoop: cint)
proc Speech_setAutoStop*(aSpeech: Speech; aAutoStop: cint)
proc Speech_set3dMinMaxDistance*(aSpeech: Speech; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Speech_set3dAttenuation*(aSpeech: Speech; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Speech_set3dDopplerFactor*(aSpeech: Speech; aDopplerFactor: cfloat)
proc Speech_set3dListenerRelative*(aSpeech: Speech; aListenerRelative: cint)
proc Speech_set3dDistanceDelay*(aSpeech: Speech; aDistanceDelay: cint)
proc Speech_set3dCollider*(aSpeech: Speech; aCollider: AudioCollider)
proc Speech_set3dColliderEx*(aSpeech: Speech; aCollider: AudioCollider; aUserData: cint)
proc Speech_set3dAttenuator*(aSpeech: Speech; aAttenuator: AudioAttenuator)
proc Speech_setInaudibleBehavior*(aSpeech: Speech; aMustTick: cint; aKill: cint)
proc Speech_setLoopPoint*(aSpeech: Speech; aLoopPoint: cdouble)
proc Speech_getLoopPoint*(aSpeech: Speech): cdouble
proc Speech_setFilter*(aSpeech: Speech; aFilterId: cuint; aFilter: Filter)
proc Speech_stop*(aSpeech: Speech)

##
##  TedSid
##

proc TedSid_destroy*(aTedSid: TedSid)
proc TedSid_create*(): TedSid
proc TedSid_load*(aTedSid: TedSid; aFilename: cstring): cint
proc TedSid_loadMem*(aTedSid: TedSid; aMem: uint8; aLength: cuint): cint
proc TedSid_loadMemEx*(aTedSid: TedSid; aMem: uint8; aLength: cuint; aCopy: cint;  aTakeOwnership: cint): cint
proc TedSid_loadFile*(aTedSid: TedSid; aFile: File): cint
proc TedSid_setVolume*(aTedSid: TedSid; aVolume: cfloat)
proc TedSid_setLooping*(aTedSid: TedSid; aLoop: cint)
proc TedSid_setAutoStop*(aTedSid: TedSid; aAutoStop: cint)
proc TedSid_set3dMinMaxDistance*(aTedSid: TedSid; aMinDistance: cfloat; aMaxDistance: cfloat)
proc TedSid_set3dAttenuation*(aTedSid: TedSid; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc TedSid_set3dDopplerFactor*(aTedSid: TedSid; aDopplerFactor: cfloat)
proc TedSid_set3dListenerRelative*(aTedSid: TedSid; aListenerRelative: cint)
proc TedSid_set3dDistanceDelay*(aTedSid: TedSid; aDistanceDelay: cint)
proc TedSid_set3dCollider*(aTedSid: TedSid; aCollider: AudioCollider)
proc TedSid_set3dColliderEx*(aTedSid: TedSid; aCollider: AudioCollider; aUserData: cint)
proc TedSid_set3dAttenuator*(aTedSid: TedSid; aAttenuator: AudioAttenuator)
proc TedSid_setInaudibleBehavior*(aTedSid: TedSid; aMustTick: cint; aKill: cint)
proc TedSid_setLoopPoint*(aTedSid: TedSid; aLoopPoint: cdouble)
proc TedSid_getLoopPoint*(aTedSid: TedSid): cdouble
proc TedSid_setFilter*(aTedSid: TedSid; aFilterId: cuint; aFilter: Filter)
proc TedSid_stop*(aTedSid: TedSid)

##
##  Vic
##

proc Vic_destroy*(aVic: Vic)
proc Vic_create*(): Vic
proc Vic_setModel*(aVic: Vic; model: cint)
proc Vic_getModel*(aVic: Vic): cint
proc Vic_setRegister*(aVic: Vic; reg: cint; value: uint8)
proc Vic_getRegister*(aVic: Vic; reg: cint): uint8
proc Vic_setVolume*(aVic: Vic; aVolume: cfloat)
proc Vic_setLooping*(aVic: Vic; aLoop: cint)
proc Vic_setAutoStop*(aVic: Vic; aAutoStop: cint)
proc Vic_set3dMinMaxDistance*(aVic: Vic; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Vic_set3dAttenuation*(aVic: Vic; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Vic_set3dDopplerFactor*(aVic: Vic; aDopplerFactor: cfloat)
proc Vic_set3dListenerRelative*(aVic: Vic; aListenerRelative: cint)
proc Vic_set3dDistanceDelay*(aVic: Vic; aDistanceDelay: cint)
proc Vic_set3dCollider*(aVic: Vic; aCollider: AudioCollider)
proc Vic_set3dColliderEx*(aVic: Vic; aCollider: AudioCollider; aUserData: cint)
proc Vic_set3dAttenuator*(aVic: Vic; aAttenuator: AudioAttenuator)
proc Vic_setInaudibleBehavior*(aVic: Vic; aMustTick: cint; aKill: cint)
proc Vic_setLoopPoint*(aVic: Vic; aLoopPoint: cdouble)
proc Vic_getLoopPoint*(aVic: Vic): cdouble
proc Vic_setFilter*(aVic: Vic; aFilterId: cuint; aFilter: Filter)
proc Vic_stop*(aVic: Vic)

##
##  Vizsn
##

proc Vizsn_destroy*(aVizsn: Vizsn)
proc Vizsn_create*(): Vizsn
proc Vizsn_setText*(aVizsn: Vizsn; aText: cstring)
proc Vizsn_setVolume*(aVizsn: Vizsn; aVolume: cfloat)
proc Vizsn_setLooping*(aVizsn: Vizsn; aLoop: cint)
proc Vizsn_setAutoStop*(aVizsn: Vizsn; aAutoStop: cint)
proc Vizsn_set3dMinMaxDistance*(aVizsn: Vizsn; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Vizsn_set3dAttenuation*(aVizsn: Vizsn; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Vizsn_set3dDopplerFactor*(aVizsn: Vizsn; aDopplerFactor: cfloat)
proc Vizsn_set3dListenerRelative*(aVizsn: Vizsn; aListenerRelative: cint)
proc Vizsn_set3dDistanceDelay*(aVizsn: Vizsn; aDistanceDelay: cint)
proc Vizsn_set3dCollider*(aVizsn: Vizsn; aCollider: AudioCollider)
proc Vizsn_set3dColliderEx*(aVizsn: Vizsn; aCollider: AudioCollider; aUserData: cint)
proc Vizsn_set3dAttenuator*(aVizsn: Vizsn; aAttenuator: AudioAttenuator)
proc Vizsn_setInaudibleBehavior*(aVizsn: Vizsn; aMustTick: cint; aKill: cint)
proc Vizsn_setLoopPoint*(aVizsn: Vizsn; aLoopPoint: cdouble)
proc Vizsn_getLoopPoint*(aVizsn: Vizsn): cdouble
proc Vizsn_setFilter*(aVizsn: Vizsn; aFilterId: cuint; aFilter: Filter)
proc Vizsn_stop*(aVizsn: Vizsn)

##
##  Wav
##

proc Wav_destroy*(aWav: Wav)
proc Wav_create*(): Wav
proc Wav_load*(aWav: Wav; aFilename: cstring): cint
proc Wav_loadMem*(aWav: Wav; aMem: pointer; aLength: cuint): cint
proc Wav_loadMemEx*(aWav: Wav; aMem: pointer; aLength: cuint; aCopy: cint;  aTakeOwnership: cint): cint
proc Wav_loadFile*(aWav: Wav; aFile: File): cint
proc Wav_loadRawWave8*(aWav: Wav; aMem: uint8; aLength: cuint): cint
proc Wav_loadRawWave8Ex*(aWav: Wav; aMem: uint8; aLength: cuint; aSamplerate: cfloat;  aChannels: cuint): cint
proc Wav_loadRawWave16*(aWav: Wav; aMem: cshort; aLength: cuint): cint
proc Wav_loadRawWave16Ex*(aWav: Wav; aMem: cshort; aLength: cuint; aSamplerate: cfloat;  aChannels: cuint): cint
proc Wav_loadRawWave*(aWav: Wav; aMem: cfloat; aLength: cuint): cint
proc Wav_loadRawWaveEx*(aWav: Wav; aMem: cfloat; aLength: cuint; aSamplerate: cfloat;  aChannels: cuint;  aCopy: cint;  aTakeOwnership: cint): cint
proc Wav_getLength*(aWav: Wav): cdouble
proc Wav_setVolume*(aWav: Wav; aVolume: cfloat)
proc Wav_setLooping*(aWav: Wav; aLoop: cint)
proc Wav_setAutoStop*(aWav: Wav; aAutoStop: cint)
proc Wav_set3dMinMaxDistance*(aWav: Wav; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Wav_set3dAttenuation*(aWav: Wav; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc Wav_set3dDopplerFactor*(aWav: Wav; aDopplerFactor: cfloat)
proc Wav_set3dListenerRelative*(aWav: Wav; aListenerRelative: cint)
proc Wav_set3dDistanceDelay*(aWav: Wav; aDistanceDelay: cint)
proc Wav_set3dCollider*(aWav: Wav; aCollider: AudioCollider)
proc Wav_set3dColliderEx*(aWav: Wav; aCollider: AudioCollider; aUserData: cint)
proc Wav_set3dAttenuator*(aWav: Wav; aAttenuator: AudioAttenuator)
proc Wav_setInaudibleBehavior*(aWav: Wav; aMustTick: cint; aKill: cint)
proc Wav_setLoopPoint*(aWav: Wav; aLoopPoint: cdouble)
proc Wav_getLoopPoint*(aWav: Wav): cdouble
proc Wav_setFilter*(aWav: Wav; aFilterId: cuint; aFilter: Filter)
proc Wav_stop*(aWav: Wav)

##
##  WaveShaperFilter
##

proc WaveShaperFilter_destroy*(aWaveShaperFilter: WaveShaperFilter)
proc WaveShaperFilter_setParams*(aWaveShaperFilter: WaveShaperFilter; aAmount: cfloat): cint
proc WaveShaperFilter_create*(): WaveShaperFilter
proc WaveShaperFilter_getParamCount*(aWaveShaperFilter: WaveShaperFilter): cint
proc WaveShaperFilter_getParamName*(aWaveShaperFilter: WaveShaperFilter; aParamIndex: cuint): cstring
proc WaveShaperFilter_getParamType*(aWaveShaperFilter: WaveShaperFilter; aParamIndex: cuint): cuint
proc WaveShaperFilter_getParamMax*(aWaveShaperFilter: WaveShaperFilter; aParamIndex: cuint): cfloat
proc WaveShaperFilter_getParamMin*(aWaveShaperFilter: WaveShaperFilter; aParamIndex: cuint): cfloat

##
##  WavStream
##

proc WavStream_destroy*(aWavStream: WavStream)
proc WavStream_create*(): WavStream
proc WavStream_load*(aWavStream: WavStream; aFilename: cstring): cint
proc WavStream_loadMem*(aWavStream: WavStream; aData: uint8; aDataLen: cuint): cint
proc WavStream_loadMemEx*(aWavStream: WavStream; aData: uint8; aDataLen: cuint; aCopy: cint; aTakeOwnership: cint): cint
proc WavStream_loadToMem*(aWavStream: WavStream; aFilename: cstring): cint
proc WavStream_loadFile*(aWavStream: WavStream; aFile: File): cint
proc WavStream_loadFileToMem*(aWavStream: WavStream; aFile: File): cint
proc WavStream_getLength*(aWavStream: WavStream): cdouble
proc WavStream_setVolume*(aWavStream: WavStream; aVolume: cfloat)
proc WavStream_setLooping*(aWavStream: WavStream; aLoop: cint)
proc WavStream_setAutoStop*(aWavStream: WavStream; aAutoStop: cint)
proc WavStream_set3dMinMaxDistance*(aWavStream: WavStream; aMinDistance: cfloat; aMaxDistance: cfloat)
proc WavStream_set3dAttenuation*(aWavStream: WavStream; aAttenuationModel: cuint; aAttenuationRolloffFactor: cfloat)
proc WavStream_set3dDopplerFactor*(aWavStream: WavStream; aDopplerFactor: cfloat)
proc WavStream_set3dListenerRelative*(aWavStream: WavStream; aListenerRelative: cint)
proc WavStream_set3dDistanceDelay*(aWavStream: WavStream; aDistanceDelay: cint)
proc WavStream_set3dCollider*(aWavStream: WavStream; aCollider: AudioCollider)
proc WavStream_set3dColliderEx*(aWavStream: WavStream; aCollider: AudioCollider; aUserData: cint)
proc WavStream_set3dAttenuator*(aWavStream: WavStream; aAttenuator: AudioAttenuator)
proc WavStream_setInaudibleBehavior*(aWavStream: WavStream; aMustTick: cint; aKill: cint)
proc WavStream_setLoopPoint*(aWavStream: WavStream; aLoopPoint: cdouble)
proc WavStream_getLoopPoint*(aWavStream: WavStream): cdouble
proc WavStream_setFilter*(aWavStream: WavStream; aFilterId: cuint; aFilter: Filter)
proc WavStream_stop*(aWavStream: WavStream)

{.pop.}

# full cleanup for sloud engine
proc Soloud_cleanup*(sl: Soloud) =
  Soloud_stopAll(sl)
  Soloud_deinit(sl)
  Soloud_destroy(sl)

