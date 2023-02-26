{.passC: "-Ivendor/soloud/src/ -Ivendor/soloud/include/ -DWITH_NULL".}

{.compile: "vendor/stb/stb_vorbis.c".}
{.compile: "vendor/soloud/src/audiosource/ay/chipplayer.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/sndbuffer.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/sndchip.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/sndrender.cpp".}
{.compile: "vendor/soloud/src/audiosource/ay/soloud_ay.cpp".}
{.compile: "vendor/soloud/src/audiosource/monotone/soloud_monotone.cpp".}
{.compile: "vendor/soloud/src/audiosource/noise/soloud_noise.cpp".}
# {.compile: "vendor/soloud/src/audiosource/openmpt/soloud_openmpt.cpp".}
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

##
## SoLoud audio engine
## Copyright (c) 2013-2020 Jari Komppa
##
## This software is provided 'as-is', without any express or implied
## warranty. In no event will the authors be held liable for any damages
## arising from the use of this software.
##
## Permission is granted to anyone to use this software for any purpose,
## including commercial applications, and to alter it and redistribute it
## freely, subject to the following restrictions:
##
##    1. The origin of this software must not be misrepresented; you must not
##    claim that you wrote the original software. If you use this software
##    in a product, an acknowledgment in the product documentation would be
##    appreciated but is not required.
##
##    2. Altered source versions must be plainly marked as such, and must not be
##    misrepresented as being the original software.
##
##    3. This notice may not be removed or altered from any source
##    distribution.
##
##  SoLoud C-Api Code Generator (c)2013-2020 Jari Komppa http://iki.fi/sol/

##  Collected enumerations

type
  SOLOUD_ENUMS* = enum
    SOLOUD_AUTO = 0, SOLOUD_SDL1 = 1, SOLOUD_SDL2 = 2, SOLOUD_PORTAUDIO = 3,
    SOLOUD_WINMM = 4, SOLOUD_XAUDIO2 = 5, SOLOUD_WASAPI = 6, SOLOUD_ALSA = 7,
    SOLOUD_JACK = 8, SOLOUD_OSS = 9, SOLOUD_OPENAL = 10, SOLOUD_COREAUDIO = 11,
    SOLOUD_OPENSLES = 12, SOLOUD_VITA_HOMEBREW = 13, SOLOUD_MINIAUDIO = 14,
    SOLOUD_NOSOUND = 15, SOLOUD_NULLDRIVER = 16, SOLOUD_BACKEND_MAX = 17

const
  SOLOUD_WAVE_SQUARE = SOLOUD_AUTO
  SOLOUD_RESAMPLER_POINT = SOLOUD_AUTO
  BASSBOOSTFILTER_WET = SOLOUD_AUTO
  BIQUADRESONANTFILTER_LOWPASS = SOLOUD_AUTO
  BIQUADRESONANTFILTER_WET = SOLOUD_AUTO
  ECHOFILTER_WET = SOLOUD_AUTO
  FLANGERFILTER_WET = SOLOUD_AUTO
  FREEVERBFILTER_WET = SOLOUD_AUTO
  LOFIFILTER_WET = SOLOUD_AUTO
  NOISE_WHITE = SOLOUD_AUTO
  ROBOTIZEFILTER_WET = SOLOUD_AUTO
  SFXR_COIN = SOLOUD_AUTO
  SPEECH_KW_SAW = SOLOUD_AUTO
  VIC_PAL = SOLOUD_AUTO
  VIC_BASS = SOLOUD_AUTO
  WAVESHAPERFILTER_WET = SOLOUD_AUTO
  SOLOUD_CLIP_ROUNDOFF = SOLOUD_SDL1
  SOLOUD_WAVE_SAW = SOLOUD_SDL1
  SOLOUD_RESAMPLER_LINEAR = SOLOUD_SDL1
  BASSBOOSTFILTER_BOOST = SOLOUD_SDL1
  BIQUADRESONANTFILTER_HIGHPASS = SOLOUD_SDL1
  BIQUADRESONANTFILTER_TYPE = SOLOUD_SDL1
  ECHOFILTER_DELAY = SOLOUD_SDL1
  FLANGERFILTER_DELAY = SOLOUD_SDL1
  FREEVERBFILTER_FREEZE = SOLOUD_SDL1
  LOFIFILTER_SAMPLERATE = SOLOUD_SDL1
  NOISE_PINK = SOLOUD_SDL1
  ROBOTIZEFILTER_FREQ = SOLOUD_SDL1
  SFXR_LASER = SOLOUD_SDL1
  SPEECH_KW_TRIANGLE = SOLOUD_SDL1
  VIC_NTSC = SOLOUD_SDL1
  VIC_ALTO = SOLOUD_SDL1
  WAVESHAPERFILTER_AMOUNT = SOLOUD_SDL1
  SOLOUD_ENABLE_VISUALIZATION = SOLOUD_SDL2
  SOLOUD_WAVE_SIN = SOLOUD_SDL2
  SOLOUD_RESAMPLER_CATMULLROM = SOLOUD_SDL2
  BIQUADRESONANTFILTER_BANDPASS = SOLOUD_SDL2
  BIQUADRESONANTFILTER_FREQUENCY = SOLOUD_SDL2
  ECHOFILTER_DECAY = SOLOUD_SDL2
  FLANGERFILTER_FREQ = SOLOUD_SDL2
  FREEVERBFILTER_ROOMSIZE = SOLOUD_SDL2
  LOFIFILTER_BITDEPTH = SOLOUD_SDL2
  NOISE_BROWNISH = SOLOUD_SDL2
  ROBOTIZEFILTER_WAVE = SOLOUD_SDL2
  SFXR_EXPLOSION = SOLOUD_SDL2
  SPEECH_KW_SIN = SOLOUD_SDL2
  VIC_SOPRANO = SOLOUD_SDL2
  SOLOUD_WAVE_TRIANGLE = SOLOUD_PORTAUDIO
  BIQUADRESONANTFILTER_RESONANCE = SOLOUD_PORTAUDIO
  ECHOFILTER_FILTER = SOLOUD_PORTAUDIO
  FREEVERBFILTER_DAMP = SOLOUD_PORTAUDIO
  NOISE_BLUEISH = SOLOUD_PORTAUDIO
  SFXR_POWERUP = SOLOUD_PORTAUDIO
  SPEECH_KW_SQUARE = SOLOUD_PORTAUDIO
  VIC_NOISE = SOLOUD_PORTAUDIO
  SOLOUD_LEFT_HANDED_3D = SOLOUD_WINMM
  SOLOUD_WAVE_BOUNCE = SOLOUD_WINMM
  FREEVERBFILTER_WIDTH = SOLOUD_WINMM
  SFXR_HURT = SOLOUD_WINMM
  SPEECH_KW_PULSE = SOLOUD_WINMM
  VIC_MAX_REGS = SOLOUD_WINMM
  SOLOUD_WAVE_JAWS = SOLOUD_XAUDIO2
  SFXR_JUMP = SOLOUD_XAUDIO2
  SPEECH_KW_NOISE = SOLOUD_XAUDIO2
  SOLOUD_WAVE_HUMPS = SOLOUD_WASAPI
  SFXR_BLIP = SOLOUD_WASAPI
  SPEECH_KW_WARBLE = SOLOUD_WASAPI
  SOLOUD_WAVE_FSQUARE = SOLOUD_ALSA
  SOLOUD_NO_FPU_REGISTER_CHANGE = SOLOUD_JACK
  SOLOUD_WAVE_FSAW = SOLOUD_JACK

##  Object handle typedefs

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

##
##  Soloud
##

{.push callconv: cdecl, importc.}

proc Soloud_destroy*(aSoloud: ptr Soloud)
proc Soloud_create*(): ptr Soloud
proc Soloud_init*(aSoloud: ptr Soloud): cint
proc Soloud_initEx*(aSoloud: ptr Soloud; aFlags: cuint; ##  = Soloud::CLIP_ROUNDOFF
                   aBackend: cuint; ##  = Soloud::AUTO
                   aSamplerate: cuint; ##  = Soloud::AUTO
                   aBufferSize: cuint; ##  = Soloud::AUTO
                   aChannels: cuint): cint
proc Soloud_deinit*(aSoloud: ptr Soloud)
proc Soloud_getVersion*(aSoloud: ptr Soloud): cuint
proc Soloud_getErrorString*(aSoloud: ptr Soloud; aErrorCode: cint): cstring
proc Soloud_getBackendId*(aSoloud: ptr Soloud): cuint
proc Soloud_getBackendString*(aSoloud: ptr Soloud): cstring
proc Soloud_getBackendChannels*(aSoloud: ptr Soloud): cuint
proc Soloud_getBackendSamplerate*(aSoloud: ptr Soloud): cuint
proc Soloud_getBackendBufferSize*(aSoloud: ptr Soloud): cuint
proc Soloud_setSpeakerPosition*(aSoloud: ptr Soloud; aChannel: cuint; aX: cfloat;
                               aY: cfloat; aZ: cfloat): cint
proc Soloud_getSpeakerPosition*(aSoloud: ptr Soloud; aChannel: cuint; aX: ptr cfloat;
                               aY: ptr cfloat; aZ: ptr cfloat): cint
proc Soloud_play*(aSoloud: ptr Soloud; aSound: ptr AudioSource): cuint
proc Soloud_playEx*(aSoloud: ptr Soloud; aSound: ptr AudioSource; aVolume: cfloat; ##  = -1.0f
                   aPan: cfloat; ##  = 0.0f
                   aPaused: cint; ##  = 0
                   aBus: cuint): cuint
proc Soloud_playClocked*(aSoloud: ptr Soloud; aSoundTime: cdouble;
                        aSound: ptr AudioSource): cuint
proc Soloud_playClockedEx*(aSoloud: ptr Soloud; aSoundTime: cdouble;
                          aSound: ptr AudioSource; aVolume: cfloat; ##  = -1.0f
                          aPan: cfloat; ##  = 0.0f
                          aBus: cuint): cuint
proc Soloud_play3d*(aSoloud: ptr Soloud; aSound: ptr AudioSource; aPosX: cfloat;
                   aPosY: cfloat; aPosZ: cfloat): cuint
proc Soloud_play3dEx*(aSoloud: ptr Soloud; aSound: ptr AudioSource; aPosX: cfloat;
                     aPosY: cfloat; aPosZ: cfloat; aVelX: cfloat; ##  = 0.0f
                     aVelY: cfloat; ##  = 0.0f
                     aVelZ: cfloat; ##  = 0.0f
                     aVolume: cfloat; ##  = 1.0f
                     aPaused: cint; ##  = 0
                     aBus: cuint): cuint
proc Soloud_play3dClocked*(aSoloud: ptr Soloud; aSoundTime: cdouble;
                          aSound: ptr AudioSource; aPosX: cfloat; aPosY: cfloat;
                          aPosZ: cfloat): cuint
proc Soloud_play3dClockedEx*(aSoloud: ptr Soloud; aSoundTime: cdouble;
                            aSound: ptr AudioSource; aPosX: cfloat; aPosY: cfloat;
                            aPosZ: cfloat; aVelX: cfloat; ##  = 0.0f
                            aVelY: cfloat; ##  = 0.0f
                            aVelZ: cfloat; ##  = 0.0f
                            aVolume: cfloat; ##  = 1.0f
                            aBus: cuint): cuint
proc Soloud_playBackground*(aSoloud: ptr Soloud; aSound: ptr AudioSource): cuint
proc Soloud_playBackgroundEx*(aSoloud: ptr Soloud; aSound: ptr AudioSource; aVolume: cfloat; ##  = -1.0f
                             aPaused: cint; ##  = 0
                             aBus: cuint): cuint
proc Soloud_seek*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aSeconds: cdouble): cint
proc Soloud_stop*(aSoloud: ptr Soloud; aVoiceHandle: cuint)
proc Soloud_stopAll*(aSoloud: ptr Soloud)
proc Soloud_stopAudioSource*(aSoloud: ptr Soloud; aSound: ptr AudioSource)
proc Soloud_countAudioSource*(aSoloud: ptr Soloud; aSound: ptr AudioSource): cint
proc Soloud_setFilterParameter*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                               aFilterId: cuint; aAttributeId: cuint; aValue: cfloat)
proc Soloud_getFilterParameter*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                               aFilterId: cuint; aAttributeId: cuint): cfloat
proc Soloud_fadeFilterParameter*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                aFilterId: cuint; aAttributeId: cuint; aTo: cfloat;
                                aTime: cdouble)
proc Soloud_oscillateFilterParameter*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                     aFilterId: cuint; aAttributeId: cuint;
                                     aFrom: cfloat; aTo: cfloat; aTime: cdouble)
proc Soloud_getStreamTime*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cdouble
proc Soloud_getStreamPosition*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cdouble
proc Soloud_getPause*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cint
proc Soloud_getVolume*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getOverallVolume*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getPan*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getSamplerate*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getProtectVoice*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cint
proc Soloud_getActiveVoiceCount*(aSoloud: ptr Soloud): cuint
proc Soloud_getVoiceCount*(aSoloud: ptr Soloud): cuint
proc Soloud_isValidVoiceHandle*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cint
proc Soloud_getRelativePlaySpeed*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cfloat
proc Soloud_getPostClipScaler*(aSoloud: ptr Soloud): cfloat
proc Soloud_getMainResampler*(aSoloud: ptr Soloud): cuint
proc Soloud_getGlobalVolume*(aSoloud: ptr Soloud): cfloat
proc Soloud_getMaxActiveVoiceCount*(aSoloud: ptr Soloud): cuint
proc Soloud_getLooping*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cint
proc Soloud_getAutoStop*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cint
proc Soloud_getLoopPoint*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cdouble
proc Soloud_setLoopPoint*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                         aLoopPoint: cdouble)
proc Soloud_setLooping*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aLooping: cint)
proc Soloud_setAutoStop*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aAutoStop: cint)
proc Soloud_setMaxActiveVoiceCount*(aSoloud: ptr Soloud; aVoiceCount: cuint): cint
proc Soloud_setInaudibleBehavior*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                 aMustTick: cint; aKill: cint)
proc Soloud_setGlobalVolume*(aSoloud: ptr Soloud; aVolume: cfloat)
proc Soloud_setPostClipScaler*(aSoloud: ptr Soloud; aScaler: cfloat)
proc Soloud_setMainResampler*(aSoloud: ptr Soloud; aResampler: cuint)
proc Soloud_setPause*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aPause: cint)
proc Soloud_setPauseAll*(aSoloud: ptr Soloud; aPause: cint)
proc Soloud_setRelativePlaySpeed*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                 aSpeed: cfloat): cint
proc Soloud_setProtectVoice*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aProtect: cint)
proc Soloud_setSamplerate*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                          aSamplerate: cfloat)
proc Soloud_setPan*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aPan: cfloat)
proc Soloud_setPanAbsolute*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                           aLVolume: cfloat; aRVolume: cfloat)
proc Soloud_setChannelVolume*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                             aChannel: cuint; aVolume: cfloat)
proc Soloud_setVolume*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aVolume: cfloat)
proc Soloud_setDelaySamples*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aSamples: cuint)
proc Soloud_fadeVolume*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aTo: cfloat;
                       aTime: cdouble)
proc Soloud_fadePan*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aTo: cfloat;
                    aTime: cdouble)
proc Soloud_fadeRelativePlaySpeed*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                  aTo: cfloat; aTime: cdouble)
proc Soloud_fadeGlobalVolume*(aSoloud: ptr Soloud; aTo: cfloat; aTime: cdouble)
proc Soloud_schedulePause*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aTime: cdouble)
proc Soloud_scheduleStop*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aTime: cdouble)
proc Soloud_oscillateVolume*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aFrom: cfloat;
                            aTo: cfloat; aTime: cdouble)
proc Soloud_oscillatePan*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aFrom: cfloat;
                         aTo: cfloat; aTime: cdouble)
proc Soloud_oscillateRelativePlaySpeed*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                       aFrom: cfloat; aTo: cfloat; aTime: cdouble)
proc Soloud_oscillateGlobalVolume*(aSoloud: ptr Soloud; aFrom: cfloat; aTo: cfloat;
                                  aTime: cdouble)
proc Soloud_setGlobalFilter*(aSoloud: ptr Soloud; aFilterId: cuint;
                            aFilter: ptr Filter)
proc Soloud_setVisualizationEnable*(aSoloud: ptr Soloud; aEnable: cint)
proc Soloud_calcFFT*(aSoloud: ptr Soloud): ptr cfloat
proc Soloud_getWave*(aSoloud: ptr Soloud): ptr cfloat
proc Soloud_getApproximateVolume*(aSoloud: ptr Soloud; aChannel: cuint): cfloat
proc Soloud_getLoopCount*(aSoloud: ptr Soloud; aVoiceHandle: cuint): cuint
proc Soloud_getInfo*(aSoloud: ptr Soloud; aVoiceHandle: cuint; aInfoKey: cuint): cfloat
proc Soloud_createVoiceGroup*(aSoloud: ptr Soloud): cuint
proc Soloud_destroyVoiceGroup*(aSoloud: ptr Soloud; aVoiceGroupHandle: cuint): cint
proc Soloud_addVoiceToGroup*(aSoloud: ptr Soloud; aVoiceGroupHandle: cuint;
                            aVoiceHandle: cuint): cint
proc Soloud_isVoiceGroup*(aSoloud: ptr Soloud; aVoiceGroupHandle: cuint): cint
proc Soloud_isVoiceGroupEmpty*(aSoloud: ptr Soloud; aVoiceGroupHandle: cuint): cint
proc Soloud_update3dAudio*(aSoloud: ptr Soloud)
proc Soloud_set3dSoundSpeed*(aSoloud: ptr Soloud; aSpeed: cfloat): cint
proc Soloud_get3dSoundSpeed*(aSoloud: ptr Soloud): cfloat
proc Soloud_set3dListenerParameters*(aSoloud: ptr Soloud; aPosX: cfloat;
                                    aPosY: cfloat; aPosZ: cfloat; aAtX: cfloat;
                                    aAtY: cfloat; aAtZ: cfloat; aUpX: cfloat;
                                    aUpY: cfloat; aUpZ: cfloat)
proc Soloud_set3dListenerParametersEx*(aSoloud: ptr Soloud; aPosX: cfloat;
                                      aPosY: cfloat; aPosZ: cfloat; aAtX: cfloat;
                                      aAtY: cfloat; aAtZ: cfloat; aUpX: cfloat;
                                      aUpY: cfloat; aUpZ: cfloat; aVelocityX: cfloat; ##  = 0.0f
                                      aVelocityY: cfloat; ##  = 0.0f
                                      aVelocityZ: cfloat)
proc Soloud_set3dListenerPosition*(aSoloud: ptr Soloud; aPosX: cfloat; aPosY: cfloat;
                                  aPosZ: cfloat)
proc Soloud_set3dListenerAt*(aSoloud: ptr Soloud; aAtX: cfloat; aAtY: cfloat;
                            aAtZ: cfloat)
proc Soloud_set3dListenerUp*(aSoloud: ptr Soloud; aUpX: cfloat; aUpY: cfloat;
                            aUpZ: cfloat)
proc Soloud_set3dListenerVelocity*(aSoloud: ptr Soloud; aVelocityX: cfloat;
                                  aVelocityY: cfloat; aVelocityZ: cfloat)
proc Soloud_set3dSourceParameters*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                  aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat)
proc Soloud_set3dSourceParametersEx*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                    aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aVelocityX: cfloat; ##  = 0.0f
                                    aVelocityY: cfloat; ##  = 0.0f
                                    aVelocityZ: cfloat)
proc Soloud_set3dSourcePosition*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat)
proc Soloud_set3dSourceVelocity*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                aVelocityX: cfloat; aVelocityY: cfloat;
                                aVelocityZ: cfloat)
proc Soloud_set3dSourceMinMaxDistance*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                      aMinDistance: cfloat; aMaxDistance: cfloat)
proc Soloud_set3dSourceAttenuation*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                   aAttenuationModel: cuint;
                                   aAttenuationRolloffFactor: cfloat)
proc Soloud_set3dSourceDopplerFactor*(aSoloud: ptr Soloud; aVoiceHandle: cuint;
                                     aDopplerFactor: cfloat)
proc Soloud_mix*(aSoloud: ptr Soloud; aBuffer: ptr cfloat; aSamples: cuint)
proc Soloud_mixSigned16*(aSoloud: ptr Soloud; aBuffer: ptr cshort; aSamples: cuint)

##
##  Ay
##

proc Ay_destroy*(aAy: ptr Ay)
proc Ay_create*(): ptr Ay
proc Ay_setVolume*(aAy: ptr Ay; aVolume: cfloat)
proc Ay_setLooping*(aAy: ptr Ay; aLoop: cint)
proc Ay_setAutoStop*(aAy: ptr Ay; aAutoStop: cint)
proc Ay_set3dMinMaxDistance*(aAy: ptr Ay; aMinDistance: cfloat; aMaxDistance: cfloat)
proc Ay_set3dAttenuation*(aAy: ptr Ay; aAttenuationModel: cuint;
                         aAttenuationRolloffFactor: cfloat)
proc Ay_set3dDopplerFactor*(aAy: ptr Ay; aDopplerFactor: cfloat)
proc Ay_set3dListenerRelative*(aAy: ptr Ay; aListenerRelative: cint)
proc Ay_set3dDistanceDelay*(aAy: ptr Ay; aDistanceDelay: cint)
proc Ay_set3dCollider*(aAy: ptr Ay; aCollider: ptr AudioCollider)
proc Ay_set3dColliderEx*(aAy: ptr Ay; aCollider: ptr AudioCollider; aUserData: cint)
proc Ay_set3dAttenuator*(aAy: ptr Ay; aAttenuator: ptr AudioAttenuator)
proc Ay_setInaudibleBehavior*(aAy: ptr Ay; aMustTick: cint; aKill: cint)
proc Ay_setLoopPoint*(aAy: ptr Ay; aLoopPoint: cdouble)
proc Ay_getLoopPoint*(aAy: ptr Ay): cdouble
proc Ay_setFilter*(aAy: ptr Ay; aFilterId: cuint; aFilter: ptr Filter)
proc Ay_stop*(aAy: ptr Ay)

##
##  BassboostFilter
##

proc BassboostFilter_destroy*(aBassboostFilter: ptr BassboostFilter)
proc BassboostFilter_getParamCount*(aBassboostFilter: ptr BassboostFilter): cint
proc BassboostFilter_getParamName*(aBassboostFilter: ptr BassboostFilter;
                                  aParamIndex: cuint): cstring
proc BassboostFilter_getParamType*(aBassboostFilter: ptr BassboostFilter;
                                  aParamIndex: cuint): cuint
proc BassboostFilter_getParamMax*(aBassboostFilter: ptr BassboostFilter;
                                 aParamIndex: cuint): cfloat
proc BassboostFilter_getParamMin*(aBassboostFilter: ptr BassboostFilter;
                                 aParamIndex: cuint): cfloat
proc BassboostFilter_setParams*(aBassboostFilter: ptr BassboostFilter;
                               aBoost: cfloat): cint
proc BassboostFilter_create*(): ptr BassboostFilter

##
##  BiquadResonantFilter
##

proc BiquadResonantFilter_destroy*(aBiquadResonantFilter: ptr BiquadResonantFilter)
proc BiquadResonantFilter_getParamCount*(aBiquadResonantFilter: ptr BiquadResonantFilter): cint
proc BiquadResonantFilter_getParamName*(aBiquadResonantFilter: ptr BiquadResonantFilter;
                                       aParamIndex: cuint): cstring
proc BiquadResonantFilter_getParamType*(aBiquadResonantFilter: ptr BiquadResonantFilter;
                                       aParamIndex: cuint): cuint
proc BiquadResonantFilter_getParamMax*(aBiquadResonantFilter: ptr BiquadResonantFilter;
                                      aParamIndex: cuint): cfloat
proc BiquadResonantFilter_getParamMin*(aBiquadResonantFilter: ptr BiquadResonantFilter;
                                      aParamIndex: cuint): cfloat
proc BiquadResonantFilter_create*(): ptr BiquadResonantFilter
proc BiquadResonantFilter_setParams*(aBiquadResonantFilter: ptr BiquadResonantFilter;
                                    aType: cint; aFrequency: cfloat;
                                    aResonance: cfloat): cint

##
##  Bus
##

proc Bus_destroy*(aBus: ptr Bus)
proc Bus_create*(): ptr Bus
proc Bus_setFilter*(aBus: ptr Bus; aFilterId: cuint; aFilter: ptr Filter)
proc Bus_play*(aBus: ptr Bus; aSound: ptr AudioSource): cuint
proc Bus_playEx*(aBus: ptr Bus; aSound: ptr AudioSource; aVolume: cfloat; ##  = 1.0f
                aPan: cfloat;                aPaused: cint): cuint
proc Bus_playClocked*(aBus: ptr Bus; aSoundTime: cdouble; aSound: ptr AudioSource): cuint
proc Bus_playClockedEx*(aBus: ptr Bus; aSoundTime: cdouble; aSound: ptr AudioSource; aVolume: cfloat; ##  = 1.0f
                       aPan: cfloat): cuint
proc Bus_play3d*(aBus: ptr Bus; aSound: ptr AudioSource; aPosX: cfloat; aPosY: cfloat;
                aPosZ: cfloat): cuint
proc Bus_play3dEx*(aBus: ptr Bus; aSound: ptr AudioSource; aPosX: cfloat; aPosY: cfloat;
                  aPosZ: cfloat; aVelX: cfloat; ##  = 0.0f
                  aVelY: cfloat; ##  = 0.0f
                  aVelZ: cfloat; ##  = 0.0f
                  aVolume: cfloat; ##  = 1.0f
                  aPaused: cint): cuint
proc Bus_play3dClocked*(aBus: ptr Bus; aSoundTime: cdouble; aSound: ptr AudioSource;
                       aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat): cuint
proc Bus_play3dClockedEx*(aBus: ptr Bus; aSoundTime: cdouble; aSound: ptr AudioSource;
                         aPosX: cfloat; aPosY: cfloat; aPosZ: cfloat; aVelX: cfloat; ##  = 0.0f
                         aVelY: cfloat; ##  = 0.0f
                         aVelZ: cfloat; ##  = 0.0f
                         aVolume: cfloat): cuint
proc Bus_setChannels*(aBus: ptr Bus; aChannels: cuint): cint
proc Bus_setVisualizationEnable*(aBus: ptr Bus; aEnable: cint)
proc Bus_annexSound*(aBus: ptr Bus; aVoiceHandle: cuint)
proc Bus_calcFFT*(aBus: ptr Bus): ptr cfloat
proc Bus_getWave*(aBus: ptr Bus): ptr cfloat
proc Bus_getApproximateVolume*(aBus: ptr Bus; aChannel: cuint): cfloat
proc Bus_getActiveVoiceCount*(aBus: ptr Bus): cuint
proc Bus_getResampler*(aBus: ptr Bus): cuint
proc Bus_setResampler*(aBus: ptr Bus; aResampler: cuint)
proc Bus_setVolume*(aBus: ptr Bus; aVolume: cfloat)
proc Bus_setLooping*(aBus: ptr Bus; aLoop: cint)
proc Bus_setAutoStop*(aBus: ptr Bus; aAutoStop: cint)
proc Bus_set3dMinMaxDistance*(aBus: ptr Bus; aMinDistance: cfloat;
                             aMaxDistance: cfloat)
proc Bus_set3dAttenuation*(aBus: ptr Bus; aAttenuationModel: cuint;
                          aAttenuationRolloffFactor: cfloat)
proc Bus_set3dDopplerFactor*(aBus: ptr Bus; aDopplerFactor: cfloat)
proc Bus_set3dListenerRelative*(aBus: ptr Bus; aListenerRelative: cint)
proc Bus_set3dDistanceDelay*(aBus: ptr Bus; aDistanceDelay: cint)
proc Bus_set3dCollider*(aBus: ptr Bus; aCollider: ptr AudioCollider)
proc Bus_set3dColliderEx*(aBus: ptr Bus; aCollider: ptr AudioCollider; aUserData: cint)
proc Bus_set3dAttenuator*(aBus: ptr Bus; aAttenuator: ptr AudioAttenuator)
proc Bus_setInaudibleBehavior*(aBus: ptr Bus; aMustTick: cint; aKill: cint)
proc Bus_setLoopPoint*(aBus: ptr Bus; aLoopPoint: cdouble)
proc Bus_getLoopPoint*(aBus: ptr Bus): cdouble
proc Bus_stop*(aBus: ptr Bus)

##
##  DCRemovalFilter
##

proc DCRemovalFilter_destroy*(aDCRemovalFilter: ptr DCRemovalFilter)
proc DCRemovalFilter_create*(): ptr DCRemovalFilter
proc DCRemovalFilter_setParams*(aDCRemovalFilter: ptr DCRemovalFilter): cint
proc DCRemovalFilter_setParamsEx*(aDCRemovalFilter: ptr DCRemovalFilter; aLength: cfloat): cint
proc DCRemovalFilter_getParamCount*(aDCRemovalFilter: ptr DCRemovalFilter): cint
proc DCRemovalFilter_getParamName*(aDCRemovalFilter: ptr DCRemovalFilter;
                                  aParamIndex: cuint): cstring
proc DCRemovalFilter_getParamType*(aDCRemovalFilter: ptr DCRemovalFilter;
                                  aParamIndex: cuint): cuint
proc DCRemovalFilter_getParamMax*(aDCRemovalFilter: ptr DCRemovalFilter;
                                 aParamIndex: cuint): cfloat
proc DCRemovalFilter_getParamMin*(aDCRemovalFilter: ptr DCRemovalFilter;
                                 aParamIndex: cuint): cfloat

##
##  EchoFilter
##

proc EchoFilter_destroy*(aEchoFilter: ptr EchoFilter)
proc EchoFilter_getParamCount*(aEchoFilter: ptr EchoFilter): cint
proc EchoFilter_getParamName*(aEchoFilter: ptr EchoFilter; aParamIndex: cuint): cstring
proc EchoFilter_getParamType*(aEchoFilter: ptr EchoFilter; aParamIndex: cuint): cuint
proc EchoFilter_getParamMax*(aEchoFilter: ptr EchoFilter; aParamIndex: cuint): cfloat
proc EchoFilter_getParamMin*(aEchoFilter: ptr EchoFilter; aParamIndex: cuint): cfloat
proc EchoFilter_create*(): ptr EchoFilter
proc EchoFilter_setParams*(aEchoFilter: ptr EchoFilter; aDelay: cfloat): cint
proc EchoFilter_setParamsEx*(aEchoFilter: ptr EchoFilter; aDelay: cfloat; aDecay: cfloat; ##  = 0.7f
                            aFilter: cfloat): cint

##
##  FFTFilter
##

proc FFTFilter_destroy*(aFFTFilter: ptr FFTFilter)
proc FFTFilter_create*(): ptr FFTFilter
proc FFTFilter_getParamCount*(aFFTFilter: ptr FFTFilter): cint
proc FFTFilter_getParamName*(aFFTFilter: ptr FFTFilter; aParamIndex: cuint): cstring
proc FFTFilter_getParamType*(aFFTFilter: ptr FFTFilter; aParamIndex: cuint): cuint
proc FFTFilter_getParamMax*(aFFTFilter: ptr FFTFilter; aParamIndex: cuint): cfloat
proc FFTFilter_getParamMin*(aFFTFilter: ptr FFTFilter; aParamIndex: cuint): cfloat

##
##  FlangerFilter
##

proc FlangerFilter_destroy*(aFlangerFilter: ptr FlangerFilter)
proc FlangerFilter_getParamCount*(aFlangerFilter: ptr FlangerFilter): cint
proc FlangerFilter_getParamName*(aFlangerFilter: ptr FlangerFilter;
                                aParamIndex: cuint): cstring
proc FlangerFilter_getParamType*(aFlangerFilter: ptr FlangerFilter;
                                aParamIndex: cuint): cuint
proc FlangerFilter_getParamMax*(aFlangerFilter: ptr FlangerFilter;
                               aParamIndex: cuint): cfloat
proc FlangerFilter_getParamMin*(aFlangerFilter: ptr FlangerFilter;
                               aParamIndex: cuint): cfloat
proc FlangerFilter_create*(): ptr FlangerFilter
proc FlangerFilter_setParams*(aFlangerFilter: ptr FlangerFilter; aDelay: cfloat;
                             aFreq: cfloat): cint

##
##  FreeverbFilter
##

proc FreeverbFilter_destroy*(aFreeverbFilter: ptr FreeverbFilter)
proc FreeverbFilter_getParamCount*(aFreeverbFilter: ptr FreeverbFilter): cint
proc FreeverbFilter_getParamName*(aFreeverbFilter: ptr FreeverbFilter;
                                 aParamIndex: cuint): cstring
proc FreeverbFilter_getParamType*(aFreeverbFilter: ptr FreeverbFilter;
                                 aParamIndex: cuint): cuint
proc FreeverbFilter_getParamMax*(aFreeverbFilter: ptr FreeverbFilter;
                                aParamIndex: cuint): cfloat
proc FreeverbFilter_getParamMin*(aFreeverbFilter: ptr FreeverbFilter;
                                aParamIndex: cuint): cfloat
proc FreeverbFilter_create*(): ptr FreeverbFilter
proc FreeverbFilter_setParams*(aFreeverbFilter: ptr FreeverbFilter; aMode: cfloat;
                              aRoomSize: cfloat; aDamp: cfloat; aWidth: cfloat): cint

##
##  LofiFilter
##

proc LofiFilter_destroy*(aLofiFilter: ptr LofiFilter)
proc LofiFilter_getParamCount*(aLofiFilter: ptr LofiFilter): cint
proc LofiFilter_getParamName*(aLofiFilter: ptr LofiFilter; aParamIndex: cuint): cstring
proc LofiFilter_getParamType*(aLofiFilter: ptr LofiFilter; aParamIndex: cuint): cuint
proc LofiFilter_getParamMax*(aLofiFilter: ptr LofiFilter; aParamIndex: cuint): cfloat
proc LofiFilter_getParamMin*(aLofiFilter: ptr LofiFilter; aParamIndex: cuint): cfloat
proc LofiFilter_create*(): ptr LofiFilter
proc LofiFilter_setParams*(aLofiFilter: ptr LofiFilter; aSampleRate: cfloat;
                          aBitdepth: cfloat): cint

##
##  Monotone
##

proc Monotone_destroy*(aMonotone: ptr Monotone)
proc Monotone_create*(): ptr Monotone
proc Monotone_setParams*(aMonotone: ptr Monotone; aHardwareChannels: cint): cint
proc Monotone_setParamsEx*(aMonotone: ptr Monotone; aHardwareChannels: cint; aWaveform: cint): cint
proc Monotone_load*(aMonotone: ptr Monotone; aFilename: cstring): cint
proc Monotone_loadMem*(aMonotone: ptr Monotone; aMem: ptr uint8; aLength: cuint): cint
proc Monotone_loadMemEx*(aMonotone: ptr Monotone; aMem: ptr uint8; aLength: cuint; aCopy: cint; ##  = false
                        aTakeOwnership: cint): cint
proc Monotone_loadFile*(aMonotone: ptr Monotone; aFile: ptr File): cint
proc Monotone_setVolume*(aMonotone: ptr Monotone; aVolume: cfloat)
proc Monotone_setLooping*(aMonotone: ptr Monotone; aLoop: cint)
proc Monotone_setAutoStop*(aMonotone: ptr Monotone; aAutoStop: cint)
proc Monotone_set3dMinMaxDistance*(aMonotone: ptr Monotone; aMinDistance: cfloat;
                                  aMaxDistance: cfloat)
proc Monotone_set3dAttenuation*(aMonotone: ptr Monotone; aAttenuationModel: cuint;
                               aAttenuationRolloffFactor: cfloat)
proc Monotone_set3dDopplerFactor*(aMonotone: ptr Monotone; aDopplerFactor: cfloat)
proc Monotone_set3dListenerRelative*(aMonotone: ptr Monotone;
                                    aListenerRelative: cint)
proc Monotone_set3dDistanceDelay*(aMonotone: ptr Monotone; aDistanceDelay: cint)
proc Monotone_set3dCollider*(aMonotone: ptr Monotone; aCollider: ptr AudioCollider)
proc Monotone_set3dColliderEx*(aMonotone: ptr Monotone;
                              aCollider: ptr AudioCollider; aUserData: cint)
proc Monotone_set3dAttenuator*(aMonotone: ptr Monotone;
                              aAttenuator: ptr AudioAttenuator)
proc Monotone_setInaudibleBehavior*(aMonotone: ptr Monotone; aMustTick: cint;
                                   aKill: cint)
proc Monotone_setLoopPoint*(aMonotone: ptr Monotone; aLoopPoint: cdouble)
proc Monotone_getLoopPoint*(aMonotone: ptr Monotone): cdouble
proc Monotone_setFilter*(aMonotone: ptr Monotone; aFilterId: cuint;
                        aFilter: ptr Filter)
proc Monotone_stop*(aMonotone: ptr Monotone)

##
##  Noise
##

proc Noise_destroy*(aNoise: ptr Noise)
proc Noise_create*(): ptr Noise
proc Noise_setOctaveScale*(aNoise: ptr Noise; aOct0: cfloat; aOct1: cfloat;
                          aOct2: cfloat; aOct3: cfloat; aOct4: cfloat; aOct5: cfloat;
                          aOct6: cfloat; aOct7: cfloat; aOct8: cfloat; aOct9: cfloat)
proc Noise_setType*(aNoise: ptr Noise; aType: cint)
proc Noise_setVolume*(aNoise: ptr Noise; aVolume: cfloat)
proc Noise_setLooping*(aNoise: ptr Noise; aLoop: cint)
proc Noise_setAutoStop*(aNoise: ptr Noise; aAutoStop: cint)
proc Noise_set3dMinMaxDistance*(aNoise: ptr Noise; aMinDistance: cfloat;
                               aMaxDistance: cfloat)
proc Noise_set3dAttenuation*(aNoise: ptr Noise; aAttenuationModel: cuint;
                            aAttenuationRolloffFactor: cfloat)
proc Noise_set3dDopplerFactor*(aNoise: ptr Noise; aDopplerFactor: cfloat)
proc Noise_set3dListenerRelative*(aNoise: ptr Noise; aListenerRelative: cint)
proc Noise_set3dDistanceDelay*(aNoise: ptr Noise; aDistanceDelay: cint)
proc Noise_set3dCollider*(aNoise: ptr Noise; aCollider: ptr AudioCollider)
proc Noise_set3dColliderEx*(aNoise: ptr Noise; aCollider: ptr AudioCollider; aUserData: cint)
proc Noise_set3dAttenuator*(aNoise: ptr Noise; aAttenuator: ptr AudioAttenuator)
proc Noise_setInaudibleBehavior*(aNoise: ptr Noise; aMustTick: cint; aKill: cint)
proc Noise_setLoopPoint*(aNoise: ptr Noise; aLoopPoint: cdouble)
proc Noise_getLoopPoint*(aNoise: ptr Noise): cdouble
proc Noise_setFilter*(aNoise: ptr Noise; aFilterId: cuint; aFilter: ptr Filter)
proc Noise_stop*(aNoise: ptr Noise)

##
##  Openmpt
##

proc Openmpt_destroy*(aOpenmpt: ptr Openmpt)
proc Openmpt_create*(): ptr Openmpt
proc Openmpt_load*(aOpenmpt: ptr Openmpt; aFilename: cstring): cint
proc Openmpt_loadMem*(aOpenmpt: ptr Openmpt; aMem: ptr uint8; aLength: cuint): cint
proc Openmpt_loadMemEx*(aOpenmpt: ptr Openmpt; aMem: ptr uint8; aLength: cuint; aCopy: cint; ##  = false
                       aTakeOwnership: cint): cint
proc Openmpt_loadFile*(aOpenmpt: ptr Openmpt; aFile: ptr File): cint
proc Openmpt_setVolume*(aOpenmpt: ptr Openmpt; aVolume: cfloat)
proc Openmpt_setLooping*(aOpenmpt: ptr Openmpt; aLoop: cint)
proc Openmpt_setAutoStop*(aOpenmpt: ptr Openmpt; aAutoStop: cint)
proc Openmpt_set3dMinMaxDistance*(aOpenmpt: ptr Openmpt; aMinDistance: cfloat;
                                 aMaxDistance: cfloat)
proc Openmpt_set3dAttenuation*(aOpenmpt: ptr Openmpt; aAttenuationModel: cuint;
                              aAttenuationRolloffFactor: cfloat)
proc Openmpt_set3dDopplerFactor*(aOpenmpt: ptr Openmpt; aDopplerFactor: cfloat)
proc Openmpt_set3dListenerRelative*(aOpenmpt: ptr Openmpt; aListenerRelative: cint)
proc Openmpt_set3dDistanceDelay*(aOpenmpt: ptr Openmpt; aDistanceDelay: cint)
proc Openmpt_set3dCollider*(aOpenmpt: ptr Openmpt; aCollider: ptr AudioCollider)
proc Openmpt_set3dColliderEx*(aOpenmpt: ptr Openmpt; aCollider: ptr AudioCollider; aUserData: cint)
proc Openmpt_set3dAttenuator*(aOpenmpt: ptr Openmpt;
                             aAttenuator: ptr AudioAttenuator)
proc Openmpt_setInaudibleBehavior*(aOpenmpt: ptr Openmpt; aMustTick: cint; aKill: cint)
proc Openmpt_setLoopPoint*(aOpenmpt: ptr Openmpt; aLoopPoint: cdouble)
proc Openmpt_getLoopPoint*(aOpenmpt: ptr Openmpt): cdouble
proc Openmpt_setFilter*(aOpenmpt: ptr Openmpt; aFilterId: cuint; aFilter: ptr Filter)
proc Openmpt_stop*(aOpenmpt: ptr Openmpt)

##
##  Queue
##

proc Queue_destroy*(aQueue: ptr Queue)
proc Queue_create*(): ptr Queue
proc Queue_play*(aQueue: ptr Queue; aSound: ptr AudioSource): cint
proc Queue_getQueueCount*(aQueue: ptr Queue): cuint
proc Queue_isCurrentlyPlaying*(aQueue: ptr Queue; aSound: ptr AudioSource): cint
proc Queue_setParamsFromAudioSource*(aQueue: ptr Queue; aSound: ptr AudioSource): cint
proc Queue_setParams*(aQueue: ptr Queue; aSamplerate: cfloat): cint
proc Queue_setParamsEx*(aQueue: ptr Queue; aSamplerate: cfloat; aChannels: cuint): cint
proc Queue_setVolume*(aQueue: ptr Queue; aVolume: cfloat)
proc Queue_setLooping*(aQueue: ptr Queue; aLoop: cint)
proc Queue_setAutoStop*(aQueue: ptr Queue; aAutoStop: cint)
proc Queue_set3dMinMaxDistance*(aQueue: ptr Queue; aMinDistance: cfloat;
                               aMaxDistance: cfloat)
proc Queue_set3dAttenuation*(aQueue: ptr Queue; aAttenuationModel: cuint;
                            aAttenuationRolloffFactor: cfloat)
proc Queue_set3dDopplerFactor*(aQueue: ptr Queue; aDopplerFactor: cfloat)
proc Queue_set3dListenerRelative*(aQueue: ptr Queue; aListenerRelative: cint)
proc Queue_set3dDistanceDelay*(aQueue: ptr Queue; aDistanceDelay: cint)
proc Queue_set3dCollider*(aQueue: ptr Queue; aCollider: ptr AudioCollider)
proc Queue_set3dColliderEx*(aQueue: ptr Queue; aCollider: ptr AudioCollider; aUserData: cint)
proc Queue_set3dAttenuator*(aQueue: ptr Queue; aAttenuator: ptr AudioAttenuator)
proc Queue_setInaudibleBehavior*(aQueue: ptr Queue; aMustTick: cint; aKill: cint)
proc Queue_setLoopPoint*(aQueue: ptr Queue; aLoopPoint: cdouble)
proc Queue_getLoopPoint*(aQueue: ptr Queue): cdouble
proc Queue_setFilter*(aQueue: ptr Queue; aFilterId: cuint; aFilter: ptr Filter)
proc Queue_stop*(aQueue: ptr Queue)

##
##  RobotizeFilter
##

proc RobotizeFilter_destroy*(aRobotizeFilter: ptr RobotizeFilter)
proc RobotizeFilter_getParamCount*(aRobotizeFilter: ptr RobotizeFilter): cint
proc RobotizeFilter_getParamName*(aRobotizeFilter: ptr RobotizeFilter;
                                 aParamIndex: cuint): cstring
proc RobotizeFilter_getParamType*(aRobotizeFilter: ptr RobotizeFilter;
                                 aParamIndex: cuint): cuint
proc RobotizeFilter_getParamMax*(aRobotizeFilter: ptr RobotizeFilter;
                                aParamIndex: cuint): cfloat
proc RobotizeFilter_getParamMin*(aRobotizeFilter: ptr RobotizeFilter;
                                aParamIndex: cuint): cfloat
proc RobotizeFilter_setParams*(aRobotizeFilter: ptr RobotizeFilter; aFreq: cfloat;
                              aWaveform: cint)
proc RobotizeFilter_create*(): ptr RobotizeFilter

##
##  Sfxr
##

proc Sfxr_destroy*(aSfxr: ptr Sfxr)
proc Sfxr_create*(): ptr Sfxr
proc Sfxr_resetParams*(aSfxr: ptr Sfxr)
proc Sfxr_loadParams*(aSfxr: ptr Sfxr; aFilename: cstring): cint
proc Sfxr_loadParamsMem*(aSfxr: ptr Sfxr; aMem: ptr uint8; aLength: cuint): cint
proc Sfxr_loadParamsMemEx*(aSfxr: ptr Sfxr; aMem: ptr uint8; aLength: cuint; aCopy: cint; ##  = false
                          aTakeOwnership: cint): cint
proc Sfxr_loadParamsFile*(aSfxr: ptr Sfxr; aFile: ptr File): cint
proc Sfxr_loadPreset*(aSfxr: ptr Sfxr; aPresetNo: cint; aRandSeed: cint): cint
proc Sfxr_setVolume*(aSfxr: ptr Sfxr; aVolume: cfloat)
proc Sfxr_setLooping*(aSfxr: ptr Sfxr; aLoop: cint)
proc Sfxr_setAutoStop*(aSfxr: ptr Sfxr; aAutoStop: cint)
proc Sfxr_set3dMinMaxDistance*(aSfxr: ptr Sfxr; aMinDistance: cfloat;
                              aMaxDistance: cfloat)
proc Sfxr_set3dAttenuation*(aSfxr: ptr Sfxr; aAttenuationModel: cuint;
                           aAttenuationRolloffFactor: cfloat)
proc Sfxr_set3dDopplerFactor*(aSfxr: ptr Sfxr; aDopplerFactor: cfloat)
proc Sfxr_set3dListenerRelative*(aSfxr: ptr Sfxr; aListenerRelative: cint)
proc Sfxr_set3dDistanceDelay*(aSfxr: ptr Sfxr; aDistanceDelay: cint)
proc Sfxr_set3dCollider*(aSfxr: ptr Sfxr; aCollider: ptr AudioCollider)
proc Sfxr_set3dColliderEx*(aSfxr: ptr Sfxr; aCollider: ptr AudioCollider; aUserData: cint)
proc Sfxr_set3dAttenuator*(aSfxr: ptr Sfxr; aAttenuator: ptr AudioAttenuator)
proc Sfxr_setInaudibleBehavior*(aSfxr: ptr Sfxr; aMustTick: cint; aKill: cint)
proc Sfxr_setLoopPoint*(aSfxr: ptr Sfxr; aLoopPoint: cdouble)
proc Sfxr_getLoopPoint*(aSfxr: ptr Sfxr): cdouble
proc Sfxr_setFilter*(aSfxr: ptr Sfxr; aFilterId: cuint; aFilter: ptr Filter)
proc Sfxr_stop*(aSfxr: ptr Sfxr)

##
##  Speech
##

proc Speech_destroy*(aSpeech: ptr Speech)
proc Speech_create*(): ptr Speech
proc Speech_setText*(aSpeech: ptr Speech; aText: cstring): cint
proc Speech_setParams*(aSpeech: ptr Speech): cint
proc Speech_setParamsEx*(aSpeech: ptr Speech; aBaseFrequency: cuint; ##  = 1330
                        aBaseSpeed: cfloat; ##  = 10.0f
                        aBaseDeclination: cfloat; ##  = 0.5f
                        aBaseWaveform: cint): cint
proc Speech_setVolume*(aSpeech: ptr Speech; aVolume: cfloat)
proc Speech_setLooping*(aSpeech: ptr Speech; aLoop: cint)
proc Speech_setAutoStop*(aSpeech: ptr Speech; aAutoStop: cint)
proc Speech_set3dMinMaxDistance*(aSpeech: ptr Speech; aMinDistance: cfloat;
                                aMaxDistance: cfloat)
proc Speech_set3dAttenuation*(aSpeech: ptr Speech; aAttenuationModel: cuint;
                             aAttenuationRolloffFactor: cfloat)
proc Speech_set3dDopplerFactor*(aSpeech: ptr Speech; aDopplerFactor: cfloat)
proc Speech_set3dListenerRelative*(aSpeech: ptr Speech; aListenerRelative: cint)
proc Speech_set3dDistanceDelay*(aSpeech: ptr Speech; aDistanceDelay: cint)
proc Speech_set3dCollider*(aSpeech: ptr Speech; aCollider: ptr AudioCollider)
proc Speech_set3dColliderEx*(aSpeech: ptr Speech; aCollider: ptr AudioCollider; aUserData: cint)
proc Speech_set3dAttenuator*(aSpeech: ptr Speech; aAttenuator: ptr AudioAttenuator)
proc Speech_setInaudibleBehavior*(aSpeech: ptr Speech; aMustTick: cint; aKill: cint)
proc Speech_setLoopPoint*(aSpeech: ptr Speech; aLoopPoint: cdouble)
proc Speech_getLoopPoint*(aSpeech: ptr Speech): cdouble
proc Speech_setFilter*(aSpeech: ptr Speech; aFilterId: cuint; aFilter: ptr Filter)
proc Speech_stop*(aSpeech: ptr Speech)

##
##  TedSid
##

proc TedSid_destroy*(aTedSid: ptr TedSid)
proc TedSid_create*(): ptr TedSid
proc TedSid_load*(aTedSid: ptr TedSid; aFilename: cstring): cint
proc TedSid_loadMem*(aTedSid: ptr TedSid; aMem: ptr uint8; aLength: cuint): cint
proc TedSid_loadMemEx*(aTedSid: ptr TedSid; aMem: ptr uint8; aLength: cuint; aCopy: cint; ##  = false
                      aTakeOwnership: cint): cint
proc TedSid_loadFile*(aTedSid: ptr TedSid; aFile: ptr File): cint
proc TedSid_setVolume*(aTedSid: ptr TedSid; aVolume: cfloat)
proc TedSid_setLooping*(aTedSid: ptr TedSid; aLoop: cint)
proc TedSid_setAutoStop*(aTedSid: ptr TedSid; aAutoStop: cint)
proc TedSid_set3dMinMaxDistance*(aTedSid: ptr TedSid; aMinDistance: cfloat;
                                aMaxDistance: cfloat)
proc TedSid_set3dAttenuation*(aTedSid: ptr TedSid; aAttenuationModel: cuint;
                             aAttenuationRolloffFactor: cfloat)
proc TedSid_set3dDopplerFactor*(aTedSid: ptr TedSid; aDopplerFactor: cfloat)
proc TedSid_set3dListenerRelative*(aTedSid: ptr TedSid; aListenerRelative: cint)
proc TedSid_set3dDistanceDelay*(aTedSid: ptr TedSid; aDistanceDelay: cint)
proc TedSid_set3dCollider*(aTedSid: ptr TedSid; aCollider: ptr AudioCollider)
proc TedSid_set3dColliderEx*(aTedSid: ptr TedSid; aCollider: ptr AudioCollider; aUserData: cint)
proc TedSid_set3dAttenuator*(aTedSid: ptr TedSid; aAttenuator: ptr AudioAttenuator)
proc TedSid_setInaudibleBehavior*(aTedSid: ptr TedSid; aMustTick: cint; aKill: cint)
proc TedSid_setLoopPoint*(aTedSid: ptr TedSid; aLoopPoint: cdouble)
proc TedSid_getLoopPoint*(aTedSid: ptr TedSid): cdouble
proc TedSid_setFilter*(aTedSid: ptr TedSid; aFilterId: cuint; aFilter: ptr Filter)
proc TedSid_stop*(aTedSid: ptr TedSid)

##
##  Vic
##

proc Vic_destroy*(aVic: ptr Vic)
proc Vic_create*(): ptr Vic
proc Vic_setModel*(aVic: ptr Vic; model: cint)
proc Vic_getModel*(aVic: ptr Vic): cint
proc Vic_setRegister*(aVic: ptr Vic; reg: cint; value: uint8)
proc Vic_getRegister*(aVic: ptr Vic; reg: cint): uint8
proc Vic_setVolume*(aVic: ptr Vic; aVolume: cfloat)
proc Vic_setLooping*(aVic: ptr Vic; aLoop: cint)
proc Vic_setAutoStop*(aVic: ptr Vic; aAutoStop: cint)
proc Vic_set3dMinMaxDistance*(aVic: ptr Vic; aMinDistance: cfloat;
                             aMaxDistance: cfloat)
proc Vic_set3dAttenuation*(aVic: ptr Vic; aAttenuationModel: cuint;
                          aAttenuationRolloffFactor: cfloat)
proc Vic_set3dDopplerFactor*(aVic: ptr Vic; aDopplerFactor: cfloat)
proc Vic_set3dListenerRelative*(aVic: ptr Vic; aListenerRelative: cint)
proc Vic_set3dDistanceDelay*(aVic: ptr Vic; aDistanceDelay: cint)
proc Vic_set3dCollider*(aVic: ptr Vic; aCollider: ptr AudioCollider)
proc Vic_set3dColliderEx*(aVic: ptr Vic; aCollider: ptr AudioCollider; aUserData: cint)
proc Vic_set3dAttenuator*(aVic: ptr Vic; aAttenuator: ptr AudioAttenuator)
proc Vic_setInaudibleBehavior*(aVic: ptr Vic; aMustTick: cint; aKill: cint)
proc Vic_setLoopPoint*(aVic: ptr Vic; aLoopPoint: cdouble)
proc Vic_getLoopPoint*(aVic: ptr Vic): cdouble
proc Vic_setFilter*(aVic: ptr Vic; aFilterId: cuint; aFilter: ptr Filter)
proc Vic_stop*(aVic: ptr Vic)

##
##  Vizsn
##

proc Vizsn_destroy*(aVizsn: ptr Vizsn)
proc Vizsn_create*(): ptr Vizsn
proc Vizsn_setText*(aVizsn: ptr Vizsn; aText: cstring)
proc Vizsn_setVolume*(aVizsn: ptr Vizsn; aVolume: cfloat)
proc Vizsn_setLooping*(aVizsn: ptr Vizsn; aLoop: cint)
proc Vizsn_setAutoStop*(aVizsn: ptr Vizsn; aAutoStop: cint)
proc Vizsn_set3dMinMaxDistance*(aVizsn: ptr Vizsn; aMinDistance: cfloat;
                               aMaxDistance: cfloat)
proc Vizsn_set3dAttenuation*(aVizsn: ptr Vizsn; aAttenuationModel: cuint;
                            aAttenuationRolloffFactor: cfloat)
proc Vizsn_set3dDopplerFactor*(aVizsn: ptr Vizsn; aDopplerFactor: cfloat)
proc Vizsn_set3dListenerRelative*(aVizsn: ptr Vizsn; aListenerRelative: cint)
proc Vizsn_set3dDistanceDelay*(aVizsn: ptr Vizsn; aDistanceDelay: cint)
proc Vizsn_set3dCollider*(aVizsn: ptr Vizsn; aCollider: ptr AudioCollider)
proc Vizsn_set3dColliderEx*(aVizsn: ptr Vizsn; aCollider: ptr AudioCollider; aUserData: cint)
proc Vizsn_set3dAttenuator*(aVizsn: ptr Vizsn; aAttenuator: ptr AudioAttenuator)
proc Vizsn_setInaudibleBehavior*(aVizsn: ptr Vizsn; aMustTick: cint; aKill: cint)
proc Vizsn_setLoopPoint*(aVizsn: ptr Vizsn; aLoopPoint: cdouble)
proc Vizsn_getLoopPoint*(aVizsn: ptr Vizsn): cdouble
proc Vizsn_setFilter*(aVizsn: ptr Vizsn; aFilterId: cuint; aFilter: ptr Filter)
proc Vizsn_stop*(aVizsn: ptr Vizsn)

##
##  Wav
##

proc Wav_destroy*(aWav: ptr Wav)
proc Wav_create*(): ptr Wav
proc Wav_load*(aWav: ptr Wav; aFilename: cstring): cint
proc Wav_loadMem*(aWav: ptr Wav; aMem: ptr uint8; aLength: cuint): cint
proc Wav_loadMemEx*(aWav: ptr Wav; aMem: ptr uint8; aLength: cuint; aCopy: cint; ##  = false
                   aTakeOwnership: cint): cint
proc Wav_loadFile*(aWav: ptr Wav; aFile: ptr File): cint
proc Wav_loadRawWave8*(aWav: ptr Wav; aMem: ptr uint8; aLength: cuint): cint
proc Wav_loadRawWave8Ex*(aWav: ptr Wav; aMem: ptr uint8; aLength: cuint; aSamplerate: cfloat; ##  = 44100.0f
                        aChannels: cuint): cint
proc Wav_loadRawWave16*(aWav: ptr Wav; aMem: ptr cshort; aLength: cuint): cint
proc Wav_loadRawWave16Ex*(aWav: ptr Wav; aMem: ptr cshort; aLength: cuint; aSamplerate: cfloat; ##  = 44100.0f
                         aChannels: cuint): cint
proc Wav_loadRawWave*(aWav: ptr Wav; aMem: ptr cfloat; aLength: cuint): cint
proc Wav_loadRawWaveEx*(aWav: ptr Wav; aMem: ptr cfloat; aLength: cuint; aSamplerate: cfloat; ##  = 44100.0f
                       aChannels: cuint; ##  = 1
                       aCopy: cint; ##  = false
                       aTakeOwnership: cint): cint
proc Wav_getLength*(aWav: ptr Wav): cdouble
proc Wav_setVolume*(aWav: ptr Wav; aVolume: cfloat)
proc Wav_setLooping*(aWav: ptr Wav; aLoop: cint)
proc Wav_setAutoStop*(aWav: ptr Wav; aAutoStop: cint)
proc Wav_set3dMinMaxDistance*(aWav: ptr Wav; aMinDistance: cfloat;
                             aMaxDistance: cfloat)
proc Wav_set3dAttenuation*(aWav: ptr Wav; aAttenuationModel: cuint;
                          aAttenuationRolloffFactor: cfloat)
proc Wav_set3dDopplerFactor*(aWav: ptr Wav; aDopplerFactor: cfloat)
proc Wav_set3dListenerRelative*(aWav: ptr Wav; aListenerRelative: cint)
proc Wav_set3dDistanceDelay*(aWav: ptr Wav; aDistanceDelay: cint)
proc Wav_set3dCollider*(aWav: ptr Wav; aCollider: ptr AudioCollider)
proc Wav_set3dColliderEx*(aWav: ptr Wav; aCollider: ptr AudioCollider; aUserData: cint)
proc Wav_set3dAttenuator*(aWav: ptr Wav; aAttenuator: ptr AudioAttenuator)
proc Wav_setInaudibleBehavior*(aWav: ptr Wav; aMustTick: cint; aKill: cint)
proc Wav_setLoopPoint*(aWav: ptr Wav; aLoopPoint: cdouble)
proc Wav_getLoopPoint*(aWav: ptr Wav): cdouble
proc Wav_setFilter*(aWav: ptr Wav; aFilterId: cuint; aFilter: ptr Filter)
proc Wav_stop*(aWav: ptr Wav)

##
##  WaveShaperFilter
##

proc WaveShaperFilter_destroy*(aWaveShaperFilter: ptr WaveShaperFilter)
proc WaveShaperFilter_setParams*(aWaveShaperFilter: ptr WaveShaperFilter;
                                aAmount: cfloat): cint
proc WaveShaperFilter_create*(): ptr WaveShaperFilter
proc WaveShaperFilter_getParamCount*(aWaveShaperFilter: ptr WaveShaperFilter): cint
proc WaveShaperFilter_getParamName*(aWaveShaperFilter: ptr WaveShaperFilter;
                                   aParamIndex: cuint): cstring
proc WaveShaperFilter_getParamType*(aWaveShaperFilter: ptr WaveShaperFilter;
                                   aParamIndex: cuint): cuint
proc WaveShaperFilter_getParamMax*(aWaveShaperFilter: ptr WaveShaperFilter;
                                  aParamIndex: cuint): cfloat
proc WaveShaperFilter_getParamMin*(aWaveShaperFilter: ptr WaveShaperFilter;
                                  aParamIndex: cuint): cfloat

##
##  WavStream
##

proc WavStream_destroy*(aWavStream: ptr WavStream)
proc WavStream_create*(): ptr WavStream
proc WavStream_load*(aWavStream: ptr WavStream; aFilename: cstring): cint
proc WavStream_loadMem*(aWavStream: ptr WavStream; aData: ptr uint8; aDataLen: cuint): cint
proc WavStream_loadMemEx*(aWavStream: ptr WavStream; aData: ptr uint8;
                         aDataLen: cuint; aCopy: cint; ##  = false
                         aTakeOwnership: cint): cint
proc WavStream_loadToMem*(aWavStream: ptr WavStream; aFilename: cstring): cint
proc WavStream_loadFile*(aWavStream: ptr WavStream; aFile: ptr File): cint
proc WavStream_loadFileToMem*(aWavStream: ptr WavStream; aFile: ptr File): cint
proc WavStream_getLength*(aWavStream: ptr WavStream): cdouble
proc WavStream_setVolume*(aWavStream: ptr WavStream; aVolume: cfloat)
proc WavStream_setLooping*(aWavStream: ptr WavStream; aLoop: cint)
proc WavStream_setAutoStop*(aWavStream: ptr WavStream; aAutoStop: cint)
proc WavStream_set3dMinMaxDistance*(aWavStream: ptr WavStream; aMinDistance: cfloat;
                                   aMaxDistance: cfloat)
proc WavStream_set3dAttenuation*(aWavStream: ptr WavStream;
                                aAttenuationModel: cuint;
                                aAttenuationRolloffFactor: cfloat)
proc WavStream_set3dDopplerFactor*(aWavStream: ptr WavStream; aDopplerFactor: cfloat)
proc WavStream_set3dListenerRelative*(aWavStream: ptr WavStream;
                                     aListenerRelative: cint)
proc WavStream_set3dDistanceDelay*(aWavStream: ptr WavStream; aDistanceDelay: cint)
proc WavStream_set3dCollider*(aWavStream: ptr WavStream;
                             aCollider: ptr AudioCollider)
proc WavStream_set3dColliderEx*(aWavStream: ptr WavStream;
                               aCollider: ptr AudioCollider; aUserData: cint)
proc WavStream_set3dAttenuator*(aWavStream: ptr WavStream;
                               aAttenuator: ptr AudioAttenuator)
proc WavStream_setInaudibleBehavior*(aWavStream: ptr WavStream; aMustTick: cint;
                                    aKill: cint)
proc WavStream_setLoopPoint*(aWavStream: ptr WavStream; aLoopPoint: cdouble)
proc WavStream_getLoopPoint*(aWavStream: ptr WavStream): cdouble
proc WavStream_setFilter*(aWavStream: ptr WavStream; aFilterId: cuint;
                         aFilter: ptr Filter)
proc WavStream_stop*(aWavStream: ptr WavStream)
{.pop.}

