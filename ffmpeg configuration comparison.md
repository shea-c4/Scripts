# ffmpeg configuration comparison
Comparison of the ffmpeg installed via winget install Gyan.FFmpeg (C:\Users\maritime6626\AppData\Local\Microsoft\WinGet\Links\ffmpeg.exe, ) and the ffmpeg created via vcpkg (c:\src\github\Microsoft\vcpkg\installed\x64-windows\tools\ffmpeg\ffmpeg.exe)

## Gyan.FFmpeg
ffmpeg version 7.0-full_build-www.gyan.dev Copyright (c) 2000-2024 the FFmpeg developers
  built with gcc 13.2.0 (Rev5, Built by MSYS2 project)

## vcpkg ffmpeg
ffmpeg version 6.1.1 Copyright (c) 2000-2023 the FFmpeg developers
built with Microsoft (R) C/C++ Optimizing Compiler Version 19.39.33522 for x64

## common config
```
--disable-autodetect
--enable-amf
--enable-avisynth
--enable-bzlib
--enable-cuvid
--enable-d3d11va 
--enable-dxva2
--enable-ffnvcodec
--enable-gpl
--enable-iconv
--enable-libaom
--enable-libass
--enable-libdav1d
--enable-libfreetype
--enable-libfribidi
--enable-libilbc
--enable-libmodplug
--enable-libmp3lame
--enable-libopenjpeg
--enable-libopenmpt
--enable-libopus
--enable-libsnappy
--enable-libsoxr
--enable-libspeex
--enable-libsrt
--enable-libssh
--enable-libtheora
--enable-libvorbis
--enable-libvpx
--enable-libwebp
--enable-libx264
--enable-libx265
--enable-libxml2
--enable-lzma
--enable-mediafoundation
--enable-nvdec
--enable-nvenc
--enable-opencl
--enable-sdl2
--enable-version3
--enable-zlib
```
## Only in Gyan.FFmpeg
```
--disable-w32threads
--enable-chromaprint
--enable-cuda-llvm
--enable-d3d12va
--enable-fontconfig
--enable-frei0r
--enable-gmp
--enable-gnutls
--enable-ladspa
--enable-libaribb24
--enable-libaribcaption
--enable-libbluray
--enable-libbs2b
--enable-libcaca
--enable-libcdio
--enable-libcodec2
--enable-libdavs2
--enable-libflite
--enable-libgme
--enable-libgsm
--enable-libharfbuzz
--enable-libjxl
--enable-liblensfun
--enable-libmysofa
--enable-libopencore-amrnb
--enable-libopencore-amrwb
--enable-libplacebo
--enable-librav1e
--enable-librist
--enable-librubberband
--enable-libshaderc
--enable-libshine
--enable-libsvtav1
--enable-libtwolame
--enable-libuavs3d
--enable-libvidstab
--enable-libvmaf
--enable-libvo-amrwbenc
--enable-libvpl
--enable-libxavs2
--enable-libxevd
--enable-libxeve
--enable-libxvid
--enable-libzimg
--enable-static
--enable-vaapi
--enable-vulkan
```
## Only in vcpkg ffmpeg
```
--disable-alsa
--disable-doc
--disable-inline-asm
--disable-libtensorflow
--disable-static
--enable-asm
--enable-avcodec
--enable-avdevice
--enable-avfilter
--enable-avformat
--enable-cross-compile
--enable-cuda
--enable-debug
--enable-decoder=h264_qsv
--enable-encoder=h264_qsv
--enable-ffmpeg
--enable-ffplay
--enable-ffprobe
--enable-libfdk-aac
--enable-libfontconfig
--enable-libmfx
--enable-libopenh264
--enable-libtesseract
--enable-nonfree
--enable-opengl
--enable-openssl
--enable-optimizations
--enable-pic
--enable-postproc
--enable-runtime-cpudetect
--enable-shared
--enable-swresample
--enable-swscale
--enable-w32threads
--enable-x86asm
```
