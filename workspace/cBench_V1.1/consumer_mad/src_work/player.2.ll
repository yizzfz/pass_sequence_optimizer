; ModuleID = 'tmp1.ll'
source_filename = "player.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mad_timer_t = type { i64, i64 }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }
%struct.equalizer = type { [2 x [32 x i32]] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.anon.15 = type { i8*, i8* }
%struct.player = type { i32, i32, i32, i32, %struct.playlist, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.input, %struct.output, %struct.stats }
%struct.playlist = type { i8**, i32, i32 }
%struct.input = type { i8*, i32, i8*, i8*, i64, i32, %struct.xing }
%struct.xing = type { i64, i64, i64, [100 x i8], i64 }
%struct.output = type { i32, i32, %struct.filter*, i32, i32, i32, i32, i32, i32, i32, i8*, i32 (%union.audio_control*)*, [2 x %struct.resample_state], [2 x [3456 x i32]]* }
%struct.filter = type { i32, i32 (i8*, %struct.mad_frame*)*, i8*, %struct.filter* }
%struct.mad_frame = type { %struct.mad_header, i32, [2 x [36 x [32 x i32]]], [2 x [32 x [18 x i32]]]* }
%struct.mad_header = type { i32, i32, i32, i32, i64, i32, i16, i16, i32, i32, %struct.mad_timer_t }
%union.audio_control = type { %struct.audio_play }
%struct.audio_play = type { i32, i32, [2 x i32*], i32, %struct.audio_stats* }
%struct.audio_stats = type { i64, i32, i32 }
%struct.resample_state = type { i32, i32, i32 }
%struct.stats = type { i32, i8*, i64, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, %struct.audio_stats }
%struct.audio_init = type { i32, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.audio_config = type { i32, i32, i32, i32 }
%struct.audio_stop = type { i32, i32 }
%struct.id3_file = type opaque
%struct.id3_tag = type { i32, i32, i32, i32, i32, i32, i32, %struct.id3_frame**, i64 }
%struct.id3_frame = type { [5 x i8], i8*, i32, i32, i32, i32, i8*, i64, i64, i32, %union.id3_field* }
%union.id3_field = type { %struct.anon.14 }
%struct.anon.14 = type { i32, i8*, i64 }
%struct.lconv = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.mad_decoder = type { i32, i32, %struct.anon.16, %struct.anon.17*, i8*, i32 (i8*, %struct.mad_stream*)*, i32 (i8*, %struct.mad_header*)*, i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)*, i32 (i8*, %struct.mad_header*, %struct.mad_pcm*)*, i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)*, i32 (i8*, i8*, i32*)* }
%struct.anon.16 = type { i64, i32, i32 }
%struct.anon.17 = type { %struct.mad_stream, %struct.mad_frame, %struct.mad_synth }
%struct.mad_stream = type { i8*, i8*, i64, i32, i64, i8*, i8*, %struct.mad_bitptr, %struct.mad_bitptr, i32, [2567 x i8]*, i32, i32, i32 }
%struct.mad_bitptr = type { i8*, i16, i16 }
%struct.mad_synth = type { [2 x [2 x [2 x [16 x [8 x i32]]]]], i32, %struct.mad_pcm }
%struct.mad_pcm = type { i32, i16, i16, [2 x [1152 x i32]] }

$__llvm_profile_raw_version = comdat any

@mad_timer_zero = external constant %struct.mad_timer_t, align 8
@.str = private unnamed_addr constant [7 x i8] c"filter\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"not enough memory to allocate filters\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"audio\00", align 1
@audio_error = external global i8*, align 8
@.str.3 = private unnamed_addr constant [8 x i8] c"lead-in\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"/dev/tty\00", align 1
@tty_fd = internal global i32 -1, align 4
@.str.5 = private unnamed_addr constant [4 x i8] c"tty\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c":\00", align 1
@save_tty = internal global %struct.termios zeroinitializer, align 4
@.str.7 = private unnamed_addr constant [11 x i8] c":tcgetattr\00", align 1
@save_sigtstp = internal global %struct.sigaction zeroinitializer, align 8
@.str.8 = private unnamed_addr constant [20 x i8] c":sigaction(SIGTSTP)\00", align 1
@save_sigint = internal global %struct.sigaction zeroinitializer, align 8
@.str.9 = private unnamed_addr constant [19 x i8] c":sigaction(SIGINT)\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c":tcsetattr\00", align 1
@signal_handler.save_sigcont = internal global %struct.sigaction zeroinitializer, align 8
@setup_filters.attenuation = internal global %struct.equalizer zeroinitializer, align 4
@.str.11 = private unnamed_addr constant [8 x i8] c" --%s--\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c"Stopped\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"Paused\00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.16 = private unnamed_addr constant [15 x i8] c"[Overall Time]\00", align 1
@.str.17 = private unnamed_addr constant [25 x i8] c"[Current Time Remaining]\00", align 1
@.str.18 = private unnamed_addr constant [15 x i8] c"[Current Time]\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c":read\00", align 1
@on_same_line = internal global i32 0, align 4
@stderr = external global %struct._IO_FILE*, align 8
@show_status.layer_str = internal constant [3 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0)], align 16
@.str.20 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str.21 = private unnamed_addr constant [3 x i8] c"II\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"III\00", align 1
@show_status.mode_str = internal constant [4 x i8*] [i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.26, i32 0, i32 0)], align 16
@.str.23 = private unnamed_addr constant [15 x i8] c"single channel\00", align 1
@.str.24 = private unnamed_addr constant [13 x i8] c"dual channel\00", align 1
@.str.25 = private unnamed_addr constant [13 x i8] c"joint stereo\00", align 1
@.str.26 = private unnamed_addr constant [7 x i8] c"stereo\00", align 1
@.str.27 = private unnamed_addr constant [17 x i8] c" %02lu:%02u:%02u\00", align 1
@.str.28 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c" (LR)\00", align 1
@.str.30 = private unnamed_addr constant [6 x i8] c" (MS)\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c" (I)\00", align 1
@.str.32 = private unnamed_addr constant [8 x i8] c" (MS+I)\00", align 1
@.str.33 = private unnamed_addr constant [42 x i8] c"%s Layer %s, %s%u kbps%s, %u Hz, %s%s, %s\00", align 1
@.str.34 = private unnamed_addr constant [10 x i8] c"VBR (avg \00", align 1
@.str.35 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.36 = private unnamed_addr constant [4 x i8] c"CRC\00", align 1
@.str.37 = private unnamed_addr constant [7 x i8] c"no CRC\00", align 1
@.str.38 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.39 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.40 = private unnamed_addr constant [8 x i8] c"silence\00", align 1
@.str.41 = private unnamed_addr constant [44 x i8] c"not enough memory to allocate sample buffer\00", align 1
@.str.42 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.44 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.45 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.46 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.47 = private unnamed_addr constant [7 x i8] c"%s: %s\00", align 1
@.str.48 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.49 = private unnamed_addr constant [9 x i8] c"is a tty\00", align 1
@.str.50 = private unnamed_addr constant [7 x i8] c">> %s\0A\00", align 1
@.str.51 = private unnamed_addr constant [18 x i8] c"%lu:%02u:%02u.%1u\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"-inf\00", align 1
@.str.53 = private unnamed_addr constant [6 x i8] c"%+.1f\00", align 1
@.str.54 = private unnamed_addr constant [68 x i8] c"%lu frames decoded (%s), %s dB peak amplitude, %lu clipped samples\0A\00", align 1
@show_id3.spaces = internal constant [11 x i8] c"          \00", align 1
@show_id3.info = internal constant [16 x %struct.anon.15] [%struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.56, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i32 0, i32 0), i8* null }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.58, i32 0, i32 0), i8* null }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0), i8* null }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.60, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.61, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.63, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.65, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.66, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.67, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.68, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.69, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.71, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.73, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.74, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.75, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.77, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.78, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.79, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.80, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.81, i32 0, i32 0) }, %struct.anon.15 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.83, i32 0, i32 0) }], align 16
@.str.55 = private unnamed_addr constant [5 x i8] c"TIT2\00", align 1
@.str.56 = private unnamed_addr constant [6 x i8] c"Title\00", align 1
@.str.57 = private unnamed_addr constant [5 x i8] c"TIT3\00", align 1
@.str.58 = private unnamed_addr constant [5 x i8] c"TCOP\00", align 1
@.str.59 = private unnamed_addr constant [5 x i8] c"TPRO\00", align 1
@.str.60 = private unnamed_addr constant [5 x i8] c"TCOM\00", align 1
@.str.61 = private unnamed_addr constant [9 x i8] c"Composer\00", align 1
@.str.62 = private unnamed_addr constant [5 x i8] c"TPE1\00", align 1
@.str.63 = private unnamed_addr constant [7 x i8] c"Artist\00", align 1
@.str.64 = private unnamed_addr constant [5 x i8] c"TPE2\00", align 1
@.str.65 = private unnamed_addr constant [10 x i8] c"Orchestra\00", align 1
@.str.66 = private unnamed_addr constant [5 x i8] c"TPE3\00", align 1
@.str.67 = private unnamed_addr constant [10 x i8] c"Conductor\00", align 1
@.str.68 = private unnamed_addr constant [5 x i8] c"TEXT\00", align 1
@.str.69 = private unnamed_addr constant [9 x i8] c"Lyricist\00", align 1
@.str.70 = private unnamed_addr constant [5 x i8] c"TALB\00", align 1
@.str.71 = private unnamed_addr constant [6 x i8] c"Album\00", align 1
@.str.72 = private unnamed_addr constant [5 x i8] c"TDRC\00", align 1
@.str.73 = private unnamed_addr constant [5 x i8] c"Year\00", align 1
@.str.74 = private unnamed_addr constant [5 x i8] c"TRCK\00", align 1
@.str.75 = private unnamed_addr constant [6 x i8] c"Track\00", align 1
@.str.76 = private unnamed_addr constant [5 x i8] c"TPUB\00", align 1
@.str.77 = private unnamed_addr constant [10 x i8] c"Publisher\00", align 1
@.str.78 = private unnamed_addr constant [5 x i8] c"TCON\00", align 1
@.str.79 = private unnamed_addr constant [6 x i8] c"Genre\00", align 1
@.str.80 = private unnamed_addr constant [5 x i8] c"TRSN\00", align 1
@.str.81 = private unnamed_addr constant [8 x i8] c"Station\00", align 1
@.str.82 = private unnamed_addr constant [5 x i8] c"TENC\00", align 1
@.str.83 = private unnamed_addr constant [8 x i8] c"Encoder\00", align 1
@.str.84 = private unnamed_addr constant [25 x i8] c"namelen < sizeof(spaces)\00", align 1
@.str.85 = private unnamed_addr constant [9 x i8] c"player.c\00", align 1
@__PRETTY_FUNCTION__.show_id3 = private unnamed_addr constant [38 x i8] c"void show_id3(const struct id3_tag *)\00", align 1
@.str.86 = private unnamed_addr constant [5 x i8] c"ucs4\00", align 1
@.str.87 = private unnamed_addr constant [10 x i8] c"%s%s: %s\0A\00", align 1
@.str.88 = private unnamed_addr constant [11 x i8] c"%s  %s %s\0A\00", align 1
@.str.89 = private unnamed_addr constant [14 x i8] c"Copyright (C)\00", align 1
@.str.90 = private unnamed_addr constant [13 x i8] c"Produced (P)\00", align 1
@.str.91 = private unnamed_addr constant [8 x i8] c"%s  %s\0A\00", align 1
@.str.92 = private unnamed_addr constant [5 x i8] c"COMM\00", align 1
@.str.93 = private unnamed_addr constant [8 x i8] c"Comment\00", align 1
@.str.94 = private unnamed_addr constant [4 x i8] c"id3\00", align 1
@.str.95 = private unnamed_addr constant [33 x i8] c"not enough memory to display tag\00", align 1
@.str.96 = private unnamed_addr constant [7 x i8] c"decode\00", align 1
@.str.97 = private unnamed_addr constant [7 x i8] c":fstat\00", align 1
@.str.98 = private unnamed_addr constant [6 x i8] c":mmap\00", align 1
@.str.99 = private unnamed_addr constant [43 x i8] c"not enough memory to allocate input buffer\00", align 1
@.str.100 = private unnamed_addr constant [8 x i8] c":munmap\00", align 1
@.str.101 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str.102 = private unnamed_addr constant [47 x i8] c"MPEG_BUFSZ - input->length >= MAD_BUFFER_GUARD\00", align 1
@__PRETTY_FUNCTION__.decode_input_read = private unnamed_addr constant [61 x i8] c"enum mad_flow decode_input_read(void *, struct mad_stream *)\00", align 1
@.str.103 = private unnamed_addr constant [7 x i8] c"output\00", align 1
@.str.104 = private unnamed_addr constant [50 x i8] c"no channel selected for dual channel; using first\00", align 1
@.str.105 = private unnamed_addr constant [36 x i8] c"using output sample frequency %u Hz\00", align 1
@.str.106 = private unnamed_addr constant [42 x i8] c"mono output not available; forcing stereo\00", align 1
@.str.107 = private unnamed_addr constant [65 x i8] c"stereo output not available; using first channel (use -m to mix)\00", align 1
@.str.108 = private unnamed_addr constant [52 x i8] c"sample frequency %u Hz not available; closest %u Hz\00", align 1
@.str.109 = private unnamed_addr constant [37 x i8] c"bit depth %u not available; using %u\00", align 1
@.str.110 = private unnamed_addr constant [48 x i8] c"not enough memory to allocate resampling buffer\00", align 1
@.str.111 = private unnamed_addr constant [31 x i8] c"cannot resample %u Hz to %u Hz\00", align 1
@.str.112 = private unnamed_addr constant [26 x i8] c"resampling %u Hz to %u Hz\00", align 1
@.str.113 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@.str.114 = private unnamed_addr constant [14 x i8] c"frame %lu: %s\00", align 1
@.str.115 = private unnamed_addr constant [46 x i8] c"not enough memory to allocate tag data buffer\00", align 1
@.str.116 = private unnamed_addr constant [27 x i8] c"EOF while reading tag data\00", align 1
@.str.117 = private unnamed_addr constant [7 x i8] c":close\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_player_init = private constant [11 x i8] c"player_init"
@__profn_player_finish = private constant [13 x i8] c"player_finish"
@__profn_player_run = private constant [10 x i8] c"player_run"
@__profn_tmp1.ll_setup_tty = private constant [17 x i8] c"tmp1.ll:setup_tty"
@__profn_tmp1.ll_setup_filters = private constant [21 x i8] c"tmp1.ll:setup_filters"
@__profn_tmp1.ll_error = private constant [13 x i8] c"tmp1.ll:error"
@__profn_tmp1.ll_silence = private constant [15 x i8] c"tmp1.ll:silence"
@__profn_tmp1.ll_play_all = private constant [16 x i8] c"tmp1.ll:play_all"
@__profn_tmp1.ll_restore_tty = private constant [19 x i8] c"tmp1.ll:restore_tty"
@__profn_tmp1.ll_signal_handler = private constant [22 x i8] c"tmp1.ll:signal_handler"
@__profn_tmp1.ll_addfilter = private constant [17 x i8] c"tmp1.ll:addfilter"
@__profn_tmp1.ll_tty_filter = private constant [18 x i8] c"tmp1.ll:tty_filter"
@__profn_tmp1.ll_readkey = private constant [15 x i8] c"tmp1.ll:readkey"
@__profn_tmp1.ll_stop_audio = private constant [18 x i8] c"tmp1.ll:stop_audio"
@__profn_tmp1.ll_message = private constant [15 x i8] c"tmp1.ll:message"
@__profn_tmp1.ll_show_status = private constant [19 x i8] c"tmp1.ll:show_status"
@__profn_tmp1.ll_play_one = private constant [16 x i8] c"tmp1.ll:play_one"
@__profn_tmp1.ll_show_id3 = private constant [16 x i8] c"tmp1.ll:show_id3"
@__profn_tmp1.ll_decode = private constant [14 x i8] c"tmp1.ll:decode"
@__profn_tmp1.ll_map_file = private constant [16 x i8] c"tmp1.ll:map_file"
@__profn_tmp1.ll_decode_input_mmap = private constant [25 x i8] c"tmp1.ll:decode_input_mmap"
@__profn_tmp1.ll_decode_input_read = private constant [25 x i8] c"tmp1.ll:decode_input_read"
@__profn_tmp1.ll_decode_header = private constant [21 x i8] c"tmp1.ll:decode_header"
@__profn_tmp1.ll_decode_filter = private constant [21 x i8] c"tmp1.ll:decode_filter"
@__profn_tmp1.ll_decode_output = private constant [21 x i8] c"tmp1.ll:decode_output"
@__profn_tmp1.ll_decode_error = private constant [20 x i8] c"tmp1.ll:decode_error"
@__profn_tmp1.ll_unmap_file = private constant [18 x i8] c"tmp1.ll:unmap_file"
@__profn_tmp1.ll_get_id3 = private constant [15 x i8] c"tmp1.ll:get_id3"
@__profc_player_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_player_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1090384918872290860, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_player_init, i32 0, i32 0), i8* bitcast (void (%struct.player*)* @player_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_player_finish = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_player_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2763693393071847029, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_player_finish, i32 0, i32 0), i8* bitcast (void (%struct.player*)* @player_finish to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_player_run = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_player_run = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_player_run = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 551018600043472619, i64 563110683621439, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i32 0, i32 0), i8* bitcast (i32 (%struct.player*, i32, i8**)* @player_run to i8*), i8* bitcast ([2 x i64]* @__profvp_player_run to i8*), i32 13, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setup_tty = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setup_tty = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8915381451543665709, i64 110205824684, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setup_filters = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setup_filters = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3608433955068017660, i64 124826178229, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_error = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1139532565226376507, i64 87696807297, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_silence = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_silence = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_silence = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -911008816129616224, i64 563104064979020, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_silence to i8*), i32 10, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_play_all = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_play_all = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1584802743236431643, i64 308989375286, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_restore_tty = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_restore_tty = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8030327901750978039, i64 72057734482862976, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i32 0, i32 0), i8* null, i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_signal_handler = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_signal_handler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6081435125732319461, i64 34225934981, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signal_handler, i32 0, i32 0), i8* bitcast (void (i32)* @signal_handler to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_addfilter = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_addfilter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8565838925147715509, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_addfilter, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_tty_filter = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_tty_filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7014458085396925122, i64 144115433390269059, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_frame*)* @tty_filter to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_readkey = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_readkey = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7129924273238174497, i64 176803836845, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i32 0, i32 0), i8* null, i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_stop_audio = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_stop_audio = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_stop_audio = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5873074694715044392, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop_audio, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_stop_audio to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_message = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_message = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6019428945129701195, i64 133135395762, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_show_status = private global [30 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_show_status = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9139606462571915539, i64 288230700917423683, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i32 0, i32 0), i8* null, i8* null, i32 30, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_play_one = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_play_one = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7978517285595115290, i64 197269350332, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_show_id3 = private global [31 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_show_id3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8656444194640286512, i64 144115647410323439, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i32 0, i32 0), i8* null, i8* null, i32 31, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -373636256944910668, i64 144115378570522760, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_map_file = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_map_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2205265417183746332, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_map_file, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_input_mmap = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_input_mmap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2882841857103438794, i64 106045480472, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_stream*)* @decode_input_mmap to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_input_read = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_input_read = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2013897053645387104, i64 140446743112, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_stream*)* @decode_input_read to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_header = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1131220519621357293, i64 70232975234, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_header*)* @decode_header to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_filter = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6509489640298447662, i64 86609381438, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)* @decode_filter to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_output = private global [37 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_decode_output = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_decode_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1491491261031030450, i64 563424301874100, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_header*, %struct.mad_pcm*)* @decode_output to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_decode_output to i8*), i32 37, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_error = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_error = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2087388350336572466, i64 179268384132, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)* @decode_error to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_unmap_file = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_unmap_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8337789128093149365, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unmap_file, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_id3 = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_get_id3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1064848888401795587, i64 132616229222, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [14 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [195 x i8] c"\82\04\BF\01x\DAm\91\DD\0E\C2 \0C\85\E3\0B\99\18\EF|\19\D2\8Cn\10\CBO\DA\12\B3\B7\97\B9\C96\F4\8E~\A7\1CNK&\98\91\8D\8F^/y=\8F\B5\10\F7\AD\B8\C4\8B\86|\BB\12=\04\B5d\A3:wd\F4\A4\C8\D2(2'\DE{<a\1C\B0\D5\8B\B1\01\A2\06\18E\13\E3\D9\D8O\11\C88\88\96p\F7\02k\D7\C7\1A\A9\97L\87\18\C1>\F1\E0\A5)\1B(\D6\A7\86\02\8A\C0\B4g\12\97^F\14\B4\C89g\8A]\93\B7\F7\06,\0E\C9\EEz\80\CF*\B0\D3\EBrsQ\13\AA\FC_Y\F2\F6\8A\AB\EC0\D2F\BBA7\9A\8AV\9B\9E\9E?\A1\C4\9Ft\13\EA2\CD\1B-I\BC\02", section "__llvm_prf_names"
@llvm.used = appending global [30 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_player_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_player_finish to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_player_run to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setup_tty to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setup_filters to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_silence to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_play_all to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_restore_tty to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_signal_handler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_addfilter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_tty_filter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_readkey to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_stop_audio to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_message to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_show_status to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_play_one to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_show_id3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_map_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_input_mmap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_input_read to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_filter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_error to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_unmap_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_id3 to i8*), i8* bitcast ([14 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([195 x i8], [195 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @player_init(%struct.player*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_player_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_player_init, i64 0, i64 0)
  %3 = alloca %struct.player*, align 8
  store %struct.player* %0, %struct.player** %3, align 8
  %4 = load %struct.player*, %struct.player** %3, align 8
  %5 = getelementptr inbounds %struct.player, %struct.player* %4, i32 0, i32 0
  store i32 0, i32* %5, align 8
  %6 = load %struct.player*, %struct.player** %3, align 8
  %7 = getelementptr inbounds %struct.player, %struct.player* %6, i32 0, i32 1
  store i32 0, i32* %7, align 4
  %8 = load %struct.player*, %struct.player** %3, align 8
  %9 = getelementptr inbounds %struct.player, %struct.player* %8, i32 0, i32 2
  store i32 1, i32* %9, align 8
  %10 = load %struct.player*, %struct.player** %3, align 8
  %11 = getelementptr inbounds %struct.player, %struct.player* %10, i32 0, i32 3
  store i32 0, i32* %11, align 4
  %12 = load %struct.player*, %struct.player** %3, align 8
  %13 = getelementptr inbounds %struct.player, %struct.player* %12, i32 0, i32 4
  %14 = getelementptr inbounds %struct.playlist, %struct.playlist* %13, i32 0, i32 0
  store i8** null, i8*** %14, align 8
  %15 = load %struct.player*, %struct.player** %3, align 8
  %16 = getelementptr inbounds %struct.player, %struct.player* %15, i32 0, i32 4
  %17 = getelementptr inbounds %struct.playlist, %struct.playlist* %16, i32 0, i32 1
  store i32 0, i32* %17, align 8
  %18 = load %struct.player*, %struct.player** %3, align 8
  %19 = getelementptr inbounds %struct.player, %struct.player* %18, i32 0, i32 4
  %20 = getelementptr inbounds %struct.playlist, %struct.playlist* %19, i32 0, i32 2
  store i32 0, i32* %20, align 4
  %21 = load %struct.player*, %struct.player** %3, align 8
  %22 = getelementptr inbounds %struct.player, %struct.player* %21, i32 0, i32 5
  %23 = bitcast %struct.mad_timer_t* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %24 = load %struct.player*, %struct.player** %3, align 8
  %25 = getelementptr inbounds %struct.player, %struct.player* %24, i32 0, i32 6
  %26 = bitcast %struct.mad_timer_t* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %27 = load %struct.player*, %struct.player** %3, align 8
  %28 = getelementptr inbounds %struct.player, %struct.player* %27, i32 0, i32 7
  %29 = bitcast %struct.mad_timer_t* %28 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %30 = load %struct.player*, %struct.player** %3, align 8
  %31 = getelementptr inbounds %struct.player, %struct.player* %30, i32 0, i32 8
  %32 = bitcast %struct.mad_timer_t* %31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %33 = load %struct.player*, %struct.player** %3, align 8
  %34 = getelementptr inbounds %struct.player, %struct.player* %33, i32 0, i32 9
  %35 = bitcast %struct.mad_timer_t* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %36 = load %struct.player*, %struct.player** %3, align 8
  %37 = getelementptr inbounds %struct.player, %struct.player* %36, i32 0, i32 10
  %38 = getelementptr inbounds %struct.input, %struct.input* %37, i32 0, i32 0
  store i8* null, i8** %38, align 8
  %39 = load %struct.player*, %struct.player** %3, align 8
  %40 = getelementptr inbounds %struct.player, %struct.player* %39, i32 0, i32 10
  %41 = getelementptr inbounds %struct.input, %struct.input* %40, i32 0, i32 1
  store i32 -1, i32* %41, align 8
  %42 = load %struct.player*, %struct.player** %3, align 8
  %43 = getelementptr inbounds %struct.player, %struct.player* %42, i32 0, i32 10
  %44 = getelementptr inbounds %struct.input, %struct.input* %43, i32 0, i32 2
  store i8* null, i8** %44, align 8
  %45 = load %struct.player*, %struct.player** %3, align 8
  %46 = getelementptr inbounds %struct.player, %struct.player* %45, i32 0, i32 10
  %47 = getelementptr inbounds %struct.input, %struct.input* %46, i32 0, i32 3
  store i8* null, i8** %47, align 8
  %48 = load %struct.player*, %struct.player** %3, align 8
  %49 = getelementptr inbounds %struct.player, %struct.player* %48, i32 0, i32 10
  %50 = getelementptr inbounds %struct.input, %struct.input* %49, i32 0, i32 4
  store i64 0, i64* %50, align 8
  %51 = load %struct.player*, %struct.player** %3, align 8
  %52 = getelementptr inbounds %struct.player, %struct.player* %51, i32 0, i32 10
  %53 = getelementptr inbounds %struct.input, %struct.input* %52, i32 0, i32 5
  store i32 0, i32* %53, align 8
  %54 = load %struct.player*, %struct.player** %3, align 8
  %55 = getelementptr inbounds %struct.player, %struct.player* %54, i32 0, i32 10
  %56 = getelementptr inbounds %struct.input, %struct.input* %55, i32 0, i32 6
  call void @xing_init(%struct.xing* %56)
  %57 = load %struct.player*, %struct.player** %3, align 8
  %58 = getelementptr inbounds %struct.player, %struct.player* %57, i32 0, i32 11
  %59 = getelementptr inbounds %struct.output, %struct.output* %58, i32 0, i32 0
  store i32 1, i32* %59, align 8
  %60 = load %struct.player*, %struct.player** %3, align 8
  %61 = getelementptr inbounds %struct.player, %struct.player* %60, i32 0, i32 11
  %62 = getelementptr inbounds %struct.output, %struct.output* %61, i32 0, i32 1
  store i32 268435456, i32* %62, align 4
  %63 = load %struct.player*, %struct.player** %3, align 8
  %64 = getelementptr inbounds %struct.player, %struct.player* %63, i32 0, i32 11
  %65 = getelementptr inbounds %struct.output, %struct.output* %64, i32 0, i32 2
  store %struct.filter* null, %struct.filter** %65, align 8
  %66 = load %struct.player*, %struct.player** %3, align 8
  %67 = getelementptr inbounds %struct.player, %struct.player* %66, i32 0, i32 11
  %68 = getelementptr inbounds %struct.output, %struct.output* %67, i32 0, i32 3
  store i32 0, i32* %68, align 8
  %69 = load %struct.player*, %struct.player** %3, align 8
  %70 = getelementptr inbounds %struct.player, %struct.player* %69, i32 0, i32 11
  %71 = getelementptr inbounds %struct.output, %struct.output* %70, i32 0, i32 4
  store i32 0, i32* %71, align 4
  %72 = load %struct.player*, %struct.player** %3, align 8
  %73 = getelementptr inbounds %struct.player, %struct.player* %72, i32 0, i32 11
  %74 = getelementptr inbounds %struct.output, %struct.output* %73, i32 0, i32 5
  store i32 0, i32* %74, align 8
  %75 = load %struct.player*, %struct.player** %3, align 8
  %76 = getelementptr inbounds %struct.player, %struct.player* %75, i32 0, i32 11
  %77 = getelementptr inbounds %struct.output, %struct.output* %76, i32 0, i32 6
  store i32 0, i32* %77, align 4
  %78 = load %struct.player*, %struct.player** %3, align 8
  %79 = getelementptr inbounds %struct.player, %struct.player* %78, i32 0, i32 11
  %80 = getelementptr inbounds %struct.output, %struct.output* %79, i32 0, i32 7
  store i32 0, i32* %80, align 8
  %81 = load %struct.player*, %struct.player** %3, align 8
  %82 = getelementptr inbounds %struct.player, %struct.player* %81, i32 0, i32 11
  %83 = getelementptr inbounds %struct.output, %struct.output* %82, i32 0, i32 8
  store i32 0, i32* %83, align 4
  %84 = load %struct.player*, %struct.player** %3, align 8
  %85 = getelementptr inbounds %struct.player, %struct.player* %84, i32 0, i32 11
  %86 = getelementptr inbounds %struct.output, %struct.output* %85, i32 0, i32 9
  store i32 0, i32* %86, align 8
  %87 = load %struct.player*, %struct.player** %3, align 8
  %88 = getelementptr inbounds %struct.player, %struct.player* %87, i32 0, i32 11
  %89 = getelementptr inbounds %struct.output, %struct.output* %88, i32 0, i32 10
  store i8* null, i8** %89, align 8
  %90 = load %struct.player*, %struct.player** %3, align 8
  %91 = getelementptr inbounds %struct.player, %struct.player* %90, i32 0, i32 11
  %92 = getelementptr inbounds %struct.output, %struct.output* %91, i32 0, i32 11
  store i32 (%union.audio_control*)* null, i32 (%union.audio_control*)** %92, align 8
  %93 = load %struct.player*, %struct.player** %3, align 8
  %94 = getelementptr inbounds %struct.player, %struct.player* %93, i32 0, i32 11
  %95 = getelementptr inbounds %struct.output, %struct.output* %94, i32 0, i32 13
  store [2 x [3456 x i32]]* null, [2 x [3456 x i32]]** %95, align 8
  %96 = load %struct.player*, %struct.player** %3, align 8
  %97 = getelementptr inbounds %struct.player, %struct.player* %96, i32 0, i32 12
  %98 = getelementptr inbounds %struct.stats, %struct.stats* %97, i32 0, i32 0
  store i32 0, i32* %98, align 8
  %99 = load %struct.player*, %struct.player** %3, align 8
  %100 = getelementptr inbounds %struct.player, %struct.player* %99, i32 0, i32 12
  %101 = getelementptr inbounds %struct.stats, %struct.stats* %100, i32 0, i32 1
  store i8* null, i8** %101, align 8
  %102 = load %struct.player*, %struct.player** %3, align 8
  %103 = getelementptr inbounds %struct.player, %struct.player* %102, i32 0, i32 12
  %104 = getelementptr inbounds %struct.stats, %struct.stats* %103, i32 0, i32 2
  store i64 0, i64* %104, align 8
  %105 = load %struct.player*, %struct.player** %3, align 8
  %106 = getelementptr inbounds %struct.player, %struct.player* %105, i32 0, i32 12
  %107 = getelementptr inbounds %struct.stats, %struct.stats* %106, i32 0, i32 3
  %108 = bitcast %struct.mad_timer_t* %107 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %108, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %109 = load %struct.player*, %struct.player** %3, align 8
  %110 = getelementptr inbounds %struct.player, %struct.player* %109, i32 0, i32 12
  %111 = getelementptr inbounds %struct.stats, %struct.stats* %110, i32 0, i32 4
  %112 = bitcast %struct.mad_timer_t* %111 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %112, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %113 = load %struct.player*, %struct.player** %3, align 8
  %114 = getelementptr inbounds %struct.player, %struct.player* %113, i32 0, i32 12
  %115 = getelementptr inbounds %struct.stats, %struct.stats* %114, i32 0, i32 5
  %116 = bitcast %struct.mad_timer_t* %115 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %116, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %117 = load %struct.player*, %struct.player** %3, align 8
  %118 = getelementptr inbounds %struct.player, %struct.player* %117, i32 0, i32 12
  %119 = getelementptr inbounds %struct.stats, %struct.stats* %118, i32 0, i32 6
  %120 = bitcast %struct.mad_timer_t* %119 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %120, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %121 = load %struct.player*, %struct.player** %3, align 8
  %122 = getelementptr inbounds %struct.player, %struct.player* %121, i32 0, i32 12
  %123 = getelementptr inbounds %struct.stats, %struct.stats* %122, i32 0, i32 7
  store i64 0, i64* %123, align 8
  %124 = load %struct.player*, %struct.player** %3, align 8
  %125 = getelementptr inbounds %struct.player, %struct.player* %124, i32 0, i32 12
  %126 = getelementptr inbounds %struct.stats, %struct.stats* %125, i32 0, i32 8
  store i64 0, i64* %126, align 8
  %127 = load %struct.player*, %struct.player** %3, align 8
  %128 = getelementptr inbounds %struct.player, %struct.player* %127, i32 0, i32 12
  %129 = getelementptr inbounds %struct.stats, %struct.stats* %128, i32 0, i32 9
  store i64 0, i64* %129, align 8
  %130 = load %struct.player*, %struct.player** %3, align 8
  %131 = getelementptr inbounds %struct.player, %struct.player* %130, i32 0, i32 12
  %132 = getelementptr inbounds %struct.stats, %struct.stats* %131, i32 0, i32 10
  store i64 -1, i64* %132, align 8
  %133 = load %struct.player*, %struct.player** %3, align 8
  %134 = getelementptr inbounds %struct.player, %struct.player* %133, i32 0, i32 12
  %135 = getelementptr inbounds %struct.stats, %struct.stats* %134, i32 0, i32 11
  store i64 0, i64* %135, align 8
  %136 = load %struct.player*, %struct.player** %3, align 8
  %137 = getelementptr inbounds %struct.player, %struct.player* %136, i32 0, i32 12
  %138 = getelementptr inbounds %struct.stats, %struct.stats* %137, i32 0, i32 12
  store i32 0, i32* %138, align 8
  %139 = load %struct.player*, %struct.player** %3, align 8
  %140 = getelementptr inbounds %struct.player, %struct.player* %139, i32 0, i32 12
  %141 = getelementptr inbounds %struct.stats, %struct.stats* %140, i32 0, i32 13
  store i32 0, i32* %141, align 4
  %142 = load %struct.player*, %struct.player** %3, align 8
  %143 = getelementptr inbounds %struct.player, %struct.player* %142, i32 0, i32 12
  %144 = getelementptr inbounds %struct.stats, %struct.stats* %143, i32 0, i32 14
  store i64 0, i64* %144, align 8
  %145 = load %struct.player*, %struct.player** %3, align 8
  %146 = getelementptr inbounds %struct.player, %struct.player* %145, i32 0, i32 12
  %147 = getelementptr inbounds %struct.stats, %struct.stats* %146, i32 0, i32 15
  store i64 0, i64* %147, align 8
  %148 = load %struct.player*, %struct.player** %3, align 8
  %149 = getelementptr inbounds %struct.player, %struct.player* %148, i32 0, i32 12
  %150 = getelementptr inbounds %struct.stats, %struct.stats* %149, i32 0, i32 16
  store i64 0, i64* %150, align 8
  %151 = load %struct.player*, %struct.player** %3, align 8
  %152 = getelementptr inbounds %struct.player, %struct.player* %151, i32 0, i32 12
  %153 = getelementptr inbounds %struct.stats, %struct.stats* %152, i32 0, i32 17
  %154 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %153, i32 0, i32 0
  store i64 0, i64* %154, align 8
  %155 = load %struct.player*, %struct.player** %3, align 8
  %156 = getelementptr inbounds %struct.player, %struct.player* %155, i32 0, i32 12
  %157 = getelementptr inbounds %struct.stats, %struct.stats* %156, i32 0, i32 17
  %158 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %157, i32 0, i32 1
  store i32 0, i32* %158, align 8
  %159 = load %struct.player*, %struct.player** %3, align 8
  %160 = getelementptr inbounds %struct.player, %struct.player* %159, i32 0, i32 12
  %161 = getelementptr inbounds %struct.stats, %struct.stats* %160, i32 0, i32 17
  %162 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %161, i32 0, i32 2
  store i32 0, i32* %162, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

declare void @xing_init(%struct.xing*) #2

; Function Attrs: nounwind uwtable
define void @player_finish(%struct.player*) #0 {
  %2 = alloca %struct.player*, align 8
  store %struct.player* %0, %struct.player** %2, align 8
  %3 = load %struct.player*, %struct.player** %2, align 8
  %4 = getelementptr inbounds %struct.player, %struct.player* %3, i32 0, i32 11
  %5 = getelementptr inbounds %struct.output, %struct.output* %4, i32 0, i32 2
  %6 = load %struct.filter*, %struct.filter** %5, align 8
  %7 = icmp ne %struct.filter* %6, null
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_player_finish, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_player_finish, i64 0, i64 1)
  %10 = load %struct.player*, %struct.player** %2, align 8
  %11 = getelementptr inbounds %struct.player, %struct.player* %10, i32 0, i32 11
  %12 = getelementptr inbounds %struct.output, %struct.output* %11, i32 0, i32 2
  %13 = load %struct.filter*, %struct.filter** %12, align 8
  call void @filter_free(%struct.filter* %13)
  br label %14

; <label>:14:                                     ; preds = %8, %1
  %15 = load %struct.player*, %struct.player** %2, align 8
  %16 = getelementptr inbounds %struct.player, %struct.player* %15, i32 0, i32 11
  %17 = getelementptr inbounds %struct.output, %struct.output* %16, i32 0, i32 13
  %18 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %17, align 8
  %19 = icmp ne [2 x [3456 x i32]]* %18, null
  br i1 %19, label %20, label %30

; <label>:20:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_player_finish, i64 0, i64 2)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_player_finish, i64 0, i64 2)
  %22 = load %struct.player*, %struct.player** %2, align 8
  %23 = getelementptr inbounds %struct.player, %struct.player* %22, i32 0, i32 11
  %24 = getelementptr inbounds %struct.output, %struct.output* %23, i32 0, i32 13
  %25 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %24, align 8
  %26 = bitcast [2 x [3456 x i32]]* %25 to i8*
  call void @free(i8* %26) #6
  %27 = load %struct.player*, %struct.player** %2, align 8
  %28 = getelementptr inbounds %struct.player, %struct.player* %27, i32 0, i32 11
  %29 = getelementptr inbounds %struct.output, %struct.output* %28, i32 0, i32 13
  store [2 x [3456 x i32]]* null, [2 x [3456 x i32]]** %29, align 8
  br label %30

; <label>:30:                                     ; preds = %20, %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_player_finish, i64 0, i64 0)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_player_finish, i64 0, i64 0)
  ret void
}

declare void @filter_free(%struct.filter*) #2

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @player_run(%struct.player*, i32, i8**) #0 {
  %4 = alloca %struct.player*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8**, align 8
  %7 = alloca i32, align 4
  %8 = alloca %union.audio_control, align 8
  %9 = alloca %struct.mad_timer_t, align 8
  store %struct.player* %0, %struct.player** %4, align 8
  store i32 %1, i32* %5, align 4
  store i8** %2, i8*** %6, align 8
  store i32 0, i32* %7, align 4
  %10 = load i8**, i8*** %6, align 8
  %11 = load %struct.player*, %struct.player** %4, align 8
  %12 = getelementptr inbounds %struct.player, %struct.player* %11, i32 0, i32 4
  %13 = getelementptr inbounds %struct.playlist, %struct.playlist* %12, i32 0, i32 0
  store i8** %10, i8*** %13, align 8
  %14 = load i32, i32* %5, align 4
  %15 = load %struct.player*, %struct.player** %4, align 8
  %16 = getelementptr inbounds %struct.player, %struct.player* %15, i32 0, i32 4
  %17 = getelementptr inbounds %struct.playlist, %struct.playlist* %16, i32 0, i32 1
  store i32 %14, i32* %17, align 8
  %18 = load %struct.player*, %struct.player** %4, align 8
  %19 = getelementptr inbounds %struct.player, %struct.player* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 4
  %21 = and i32 %20, 64
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %33

; <label>:23:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 1)
  %25 = call i32 @setup_tty()
  %26 = icmp eq i32 %25, -1
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 5)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 5)
  %29 = load %struct.player*, %struct.player** %4, align 8
  %30 = getelementptr inbounds %struct.player, %struct.player* %29, i32 0, i32 1
  %31 = load i32, i32* %30, align 4
  %32 = and i32 %31, -65
  store i32 %32, i32* %30, align 4
  br label %33

; <label>:33:                                     ; preds = %27, %23, %3
  %34 = load %struct.player*, %struct.player** %4, align 8
  %35 = call i32 @setup_filters(%struct.player* %34)
  %36 = icmp eq i32 %35, -1
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 3)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 3)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i32 0, i32 0))
  br label %144

; <label>:39:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 0)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 0)
  %41 = load %struct.player*, %struct.player** %4, align 8
  %42 = getelementptr inbounds %struct.player, %struct.player* %41, i32 0, i32 11
  %43 = getelementptr inbounds %struct.output, %struct.output* %42, i32 0, i32 11
  %44 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %43, align 8
  %45 = icmp ne i32 (%union.audio_control*)* %44, null
  br i1 %45, label %46, label %120

; <label>:46:                                     ; preds = %39
  call void @audio_control_init(%union.audio_control* %8, i32 0)
  %47 = load %struct.player*, %struct.player** %4, align 8
  %48 = getelementptr inbounds %struct.player, %struct.player* %47, i32 0, i32 11
  %49 = getelementptr inbounds %struct.output, %struct.output* %48, i32 0, i32 10
  %50 = load i8*, i8** %49, align 8
  %51 = bitcast %union.audio_control* %8 to %struct.audio_init*
  %52 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %51, i32 0, i32 1
  store i8* %50, i8** %52, align 8
  %53 = load %struct.player*, %struct.player** %4, align 8
  %54 = getelementptr inbounds %struct.player, %struct.player* %53, i32 0, i32 11
  %55 = getelementptr inbounds %struct.output, %struct.output* %54, i32 0, i32 11
  %56 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %55, align 8
  %57 = ptrtoint i32 (%union.audio_control*)* %56 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_player_run to i8*), i32 0)
  %58 = call i32 %56(%union.audio_control* %8)
  %59 = icmp eq i32 %58, -1
  br i1 %59, label %60, label %66

; <label>:60:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 8)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 8)
  %62 = load i8*, i8** @audio_error, align 8
  %63 = bitcast %union.audio_control* %8 to %struct.audio_init*
  %64 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %63, i32 0, i32 1
  %65 = load i8*, i8** %64, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* %62, i8* %65)
  br label %144

; <label>:66:                                     ; preds = %46
  %67 = load %struct.player*, %struct.player** %4, align 8
  %68 = getelementptr inbounds %struct.player, %struct.player* %67, i32 0, i32 1
  %69 = load i32, i32* %68, align 4
  %70 = and i32 %69, 16
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %118

; <label>:72:                                     ; preds = %66
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 9)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 9)
  %74 = load %struct.player*, %struct.player** %4, align 8
  %75 = getelementptr inbounds %struct.player, %struct.player* %74, i32 0, i32 5
  %76 = bitcast %struct.mad_timer_t* %75 to { i64, i64 }*
  %77 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 0
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 1
  %80 = load i64, i64* %79, align 8
  %81 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 0), align 8
  %82 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 1), align 8
  %83 = call i32 @mad_timer_compare(i64 %78, i64 %80, i64 %81, i64 %82)
  %84 = icmp slt i32 %83, 0
  br i1 %84, label %85, label %118

; <label>:85:                                     ; preds = %72
  %86 = load %struct.player*, %struct.player** %4, align 8
  %87 = getelementptr inbounds %struct.player, %struct.player* %86, i32 0, i32 12
  %88 = getelementptr inbounds %struct.stats, %struct.stats* %87, i32 0, i32 4
  %89 = load %struct.player*, %struct.player** %4, align 8
  %90 = getelementptr inbounds %struct.player, %struct.player* %89, i32 0, i32 5
  %91 = bitcast %struct.mad_timer_t* %88 to i8*
  %92 = bitcast %struct.mad_timer_t* %90 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %91, i8* %92, i64 16, i32 8, i1 false)
  %93 = load %struct.player*, %struct.player** %4, align 8
  %94 = load %struct.player*, %struct.player** %4, align 8
  %95 = getelementptr inbounds %struct.player, %struct.player* %94, i32 0, i32 5
  %96 = bitcast %struct.mad_timer_t* %95 to { i64, i64 }*
  %97 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %96, i32 0, i32 0
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %96, i32 0, i32 1
  %100 = load i64, i64* %99, align 8
  %101 = call { i64, i64 } @mad_timer_abs(i64 %98, i64 %100)
  %102 = bitcast %struct.mad_timer_t* %9 to { i64, i64 }*
  %103 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %102, i32 0, i32 0
  %104 = extractvalue { i64, i64 } %101, 0
  store i64 %104, i64* %103, align 8
  %105 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %102, i32 0, i32 1
  %106 = extractvalue { i64, i64 } %101, 1
  store i64 %106, i64* %105, align 8
  %107 = bitcast %struct.mad_timer_t* %9 to { i64, i64 }*
  %108 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %107, i32 0, i32 0
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %107, i32 0, i32 1
  %111 = load i64, i64* %110, align 8
  %112 = call i32 @silence(%struct.player* %93, i64 %109, i64 %111, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0))
  %113 = icmp eq i32 %112, -1
  br i1 %113, label %114, label %116

; <label>:114:                                    ; preds = %85
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 12)
  %115 = add i64 %pgocount6, 1
  store i64 %115, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 12)
  br label %144

; <label>:116:                                    ; preds = %85
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 11)
  %117 = add i64 %pgocount7, 1
  store i64 %117, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 11)
  br label %118

; <label>:118:                                    ; preds = %116, %72, %66
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 4)
  %119 = add i64 %pgocount8, 1
  store i64 %119, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 4)
  br label %120

; <label>:120:                                    ; preds = %118, %39
  %121 = load %struct.player*, %struct.player** %4, align 8
  %122 = call i32 @play_all(%struct.player* %121)
  store i32 %122, i32* %7, align 4
  %123 = load %struct.player*, %struct.player** %4, align 8
  %124 = getelementptr inbounds %struct.player, %struct.player* %123, i32 0, i32 11
  %125 = getelementptr inbounds %struct.output, %struct.output* %124, i32 0, i32 11
  %126 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %125, align 8
  %127 = icmp ne i32 (%union.audio_control*)* %126, null
  br i1 %127, label %128, label %141

; <label>:128:                                    ; preds = %120
  call void @audio_control_init(%union.audio_control* %8, i32 4)
  %129 = load %struct.player*, %struct.player** %4, align 8
  %130 = getelementptr inbounds %struct.player, %struct.player* %129, i32 0, i32 11
  %131 = getelementptr inbounds %struct.output, %struct.output* %130, i32 0, i32 11
  %132 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %131, align 8
  %133 = ptrtoint i32 (%union.audio_control*)* %132 to i64
  call void @__llvm_profile_instrument_target(i64 %133, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_player_run to i8*), i32 1)
  %134 = call i32 %132(%union.audio_control* %8)
  %135 = icmp eq i32 %134, -1
  br i1 %135, label %136, label %139

; <label>:136:                                    ; preds = %128
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 10)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 10)
  %138 = load i8*, i8** @audio_error, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* %138)
  br label %144

; <label>:139:                                    ; preds = %128
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 6)
  %140 = add i64 %pgocount10, 1
  store i64 %140, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 6)
  br label %141

; <label>:141:                                    ; preds = %139, %120
  br i1 false, label %142, label %145

; <label>:142:                                    ; preds = %141
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 7)
  %143 = add i64 %pgocount11, 1
  store i64 %143, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 7)
  br label %144

; <label>:144:                                    ; preds = %142, %136, %114, %60, %37
  store i32 -1, i32* %7, align 4
  br label %145

; <label>:145:                                    ; preds = %144, %141
  %146 = load %struct.player*, %struct.player** %4, align 8
  %147 = getelementptr inbounds %struct.player, %struct.player* %146, i32 0, i32 1
  %148 = load i32, i32* %147, align 4
  %149 = and i32 %148, 64
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %154

; <label>:151:                                    ; preds = %145
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 2)
  %152 = add i64 %pgocount12, 1
  store i64 %152, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_player_run, i64 0, i64 2)
  %153 = call i32 @restore_tty(i32 0)
  br label %154

; <label>:154:                                    ; preds = %151, %145
  %155 = load i32, i32* %7, align 4
  ret i32 %155
}

; Function Attrs: nounwind uwtable
define internal i32 @setup_tty() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.termios, align 4
  %3 = alloca %struct.sigaction, align 8
  %4 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i32 0)
  store i32 %4, i32* @tty_fd, align 4
  %5 = load i32, i32* @tty_fd, align 4
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 0)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  store i32 -1, i32* %1, align 4
  br label %66

; <label>:9:                                      ; preds = %0
  %10 = load i32, i32* @tty_fd, align 4
  %11 = call i32 @tcgetattr(i32 %10, %struct.termios* @save_tty) #6
  %12 = icmp eq i32 %11, -1
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 1)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
  store i32 -1, i32* %1, align 4
  br label %66

; <label>:15:                                     ; preds = %9
  %16 = call i32 @sigaction(i32 20, %struct.sigaction* null, %struct.sigaction* @save_sigtstp) #6
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 2)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 2)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0))
  store i32 -1, i32* %1, align 4
  br label %66

; <label>:20:                                     ; preds = %15
  %21 = call i32 @sigaction(i32 2, %struct.sigaction* null, %struct.sigaction* @save_sigint) #6
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 3)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 3)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0))
  store i32 -1, i32* %1, align 4
  br label %66

; <label>:25:                                     ; preds = %20
  %26 = bitcast %struct.sigaction* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* bitcast (%struct.sigaction* @save_sigtstp to i8*), i64 152, i32 8, i1 false)
  %27 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 0
  %28 = bitcast %union.anon* %27 to void (i32)**
  store void (i32)* @signal_handler, void (i32)** %28, align 8
  %29 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 1
  %30 = call i32 @sigemptyset(%struct.__sigset_t* %29) #6
  %31 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 2
  store i32 0, i32* %31, align 8
  %32 = call i32 @sigaction(i32 20, %struct.sigaction* %3, %struct.sigaction* null) #6
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %25
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 4)
  %35 = add i64 %pgocount4, 1
  store i64 %35, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 4)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0))
  br label %63

; <label>:36:                                     ; preds = %25
  %37 = bitcast %struct.sigaction* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* bitcast (%struct.sigaction* @save_sigint to i8*), i64 152, i32 8, i1 false)
  %38 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 0
  %39 = bitcast %union.anon* %38 to void (i32)**
  store void (i32)* @signal_handler, void (i32)** %39, align 8
  %40 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 1
  %41 = call i32 @sigemptyset(%struct.__sigset_t* %40) #6
  %42 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 2
  store i32 0, i32* %42, align 8
  %43 = call i32 @sigaction(i32 2, %struct.sigaction* %3, %struct.sigaction* null) #6
  %44 = icmp eq i32 %43, -1
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 6)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 6)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0))
  br label %63

; <label>:47:                                     ; preds = %36
  %48 = bitcast %struct.termios* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %48, i8* bitcast (%struct.termios* @save_tty to i8*), i64 60, i32 4, i1 false)
  %49 = getelementptr inbounds %struct.termios, %struct.termios* %2, i32 0, i32 3
  %50 = load i32, i32* %49, align 4
  %51 = and i32 %50, -11
  store i32 %51, i32* %49, align 4
  %52 = getelementptr inbounds %struct.termios, %struct.termios* %2, i32 0, i32 5
  %53 = getelementptr inbounds [32 x i8], [32 x i8]* %52, i64 0, i64 6
  store i8 0, i8* %53, align 1
  %54 = getelementptr inbounds %struct.termios, %struct.termios* %2, i32 0, i32 5
  %55 = getelementptr inbounds [32 x i8], [32 x i8]* %54, i64 0, i64 5
  store i8 0, i8* %55, align 1
  %56 = load i32, i32* @tty_fd, align 4
  %57 = call i32 @tcsetattr(i32 %56, i32 2, %struct.termios* %2) #6
  %58 = icmp eq i32 %57, -1
  br i1 %58, label %59, label %61

; <label>:59:                                     ; preds = %47
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 7)
  %60 = add i64 %pgocount6, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 7)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0))
  br label %63

; <label>:61:                                     ; preds = %47
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 5)
  %62 = add i64 %pgocount7, 1
  store i64 %62, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setup_tty, i64 0, i64 5)
  store i32 0, i32* %1, align 4
  br label %66

; <label>:63:                                     ; preds = %59, %45, %34
  %64 = call i32 @sigaction(i32 2, %struct.sigaction* @save_sigint, %struct.sigaction* null) #6
  %65 = call i32 @sigaction(i32 20, %struct.sigaction* @save_sigtstp, %struct.sigaction* null) #6
  store i32 -1, i32* %1, align 4
  br label %66

; <label>:66:                                     ; preds = %63, %61, %23, %18, %13, %7
  %67 = load i32, i32* %1, align 4
  ret i32 %67
}

; Function Attrs: nounwind uwtable
define internal i32 @setup_filters(%struct.player*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.player*, align 8
  %4 = alloca i32, align 4
  store %struct.player* %0, %struct.player** %3, align 8
  %5 = load %struct.player*, %struct.player** %3, align 8
  %6 = getelementptr inbounds %struct.player, %struct.player* %5, i32 0, i32 1
  %7 = load i32, i32* %6, align 4
  %8 = and i32 %7, 256
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %19

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 1)
  %12 = load %struct.player*, %struct.player** %3, align 8
  %13 = load %struct.player*, %struct.player** %3, align 8
  %14 = bitcast %struct.player* %13 to i8*
  %15 = call i32 @addfilter(%struct.player* %12, i32 (i8*, %struct.mad_frame*)* @fadein_filter, i8* %14)
  %16 = icmp eq i32 %15, -1
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 6)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 6)
  store i32 -1, i32* %2, align 4
  br label %84

; <label>:19:                                     ; preds = %10, %1
  %20 = load %struct.player*, %struct.player** %3, align 8
  %21 = getelementptr inbounds %struct.player, %struct.player* %20, i32 0, i32 11
  %22 = getelementptr inbounds %struct.output, %struct.output* %21, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = icmp ne i32 %23, 268435456
  br i1 %24, label %25, label %52

; <label>:25:                                     ; preds = %19
  call void @equalizer_init(%struct.equalizer* @setup_filters.attenuation)
  store i32 0, i32* %4, align 4
  br label %26

; <label>:26:                                     ; preds = %40, %25
  %27 = load i32, i32* %4, align 4
  %28 = icmp slt i32 %27, 32
  br i1 %28, label %29, label %44

; <label>:29:                                     ; preds = %26
  %30 = load %struct.player*, %struct.player** %3, align 8
  %31 = getelementptr inbounds %struct.player, %struct.player* %30, i32 0, i32 11
  %32 = getelementptr inbounds %struct.output, %struct.output* %31, i32 0, i32 1
  %33 = load i32, i32* %32, align 4
  %34 = load i32, i32* %4, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [32 x i32], [32 x i32]* getelementptr inbounds (%struct.equalizer, %struct.equalizer* @setup_filters.attenuation, i32 0, i32 0, i64 1), i64 0, i64 %35
  store i32 %33, i32* %36, align 4
  %37 = load i32, i32* %4, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [32 x i32], [32 x i32]* getelementptr inbounds (%struct.equalizer, %struct.equalizer* @setup_filters.attenuation, i32 0, i32 0, i64 0), i64 0, i64 %38
  store i32 %33, i32* %39, align 4
  br label %40

; <label>:40:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 0)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 0)
  %42 = load i32, i32* %4, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %4, align 4
  br label %26

; <label>:44:                                     ; preds = %26
  %45 = load %struct.player*, %struct.player** %3, align 8
  %46 = call i32 @addfilter(%struct.player* %45, i32 (i8*, %struct.mad_frame*)* @equalizer_filter, i8* bitcast (%struct.equalizer* @setup_filters.attenuation to i8*))
  %47 = icmp eq i32 %46, -1
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 7)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 7)
  store i32 -1, i32* %2, align 4
  br label %84

; <label>:50:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 5)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 5)
  br label %52

; <label>:52:                                     ; preds = %50, %19
  %53 = load %struct.player*, %struct.player** %3, align 8
  %54 = getelementptr inbounds %struct.player, %struct.player* %53, i32 0, i32 11
  %55 = getelementptr inbounds %struct.output, %struct.output* %54, i32 0, i32 5
  %56 = load i32, i32* %55, align 8
  %57 = icmp eq i32 %56, 3
  br i1 %57, label %58, label %67

; <label>:58:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 3)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 3)
  %60 = load %struct.player*, %struct.player** %3, align 8
  %61 = load %struct.player*, %struct.player** %3, align 8
  %62 = bitcast %struct.player* %61 to i8*
  %63 = call i32 @addfilter(%struct.player* %60, i32 (i8*, %struct.mad_frame*)* @mono_filter, i8* %62)
  %64 = icmp eq i32 %63, -1
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %58
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 8)
  %66 = add i64 %pgocount6, 1
  store i64 %66, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 8)
  store i32 -1, i32* %2, align 4
  br label %84

; <label>:67:                                     ; preds = %58, %52
  %68 = load %struct.player*, %struct.player** %3, align 8
  %69 = getelementptr inbounds %struct.player, %struct.player* %68, i32 0, i32 1
  %70 = load i32, i32* %69, align 4
  %71 = and i32 %70, 64
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %82

; <label>:73:                                     ; preds = %67
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 4)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 4)
  %75 = load %struct.player*, %struct.player** %3, align 8
  %76 = load %struct.player*, %struct.player** %3, align 8
  %77 = bitcast %struct.player* %76 to i8*
  %78 = call i32 @addfilter(%struct.player* %75, i32 (i8*, %struct.mad_frame*)* @tty_filter, i8* %77)
  %79 = icmp eq i32 %78, -1
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %73
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 9)
  %81 = add i64 %pgocount8, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 9)
  store i32 -1, i32* %2, align 4
  br label %84

; <label>:82:                                     ; preds = %73, %67
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 2)
  %83 = add i64 %pgocount9, 1
  store i64 %83, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_setup_filters, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %84

; <label>:84:                                     ; preds = %82, %80, %65, %48, %17
  %85 = load i32, i32* %2, align 4
  ret i32 %85
}

; Function Attrs: nounwind uwtable
define internal void @error(i8*, i8*, ...) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = call i32* @__errno_location() #8
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %5, align 4
  %9 = load i32, i32* @on_same_line, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 0)
  %13 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  br label %14

; <label>:14:                                     ; preds = %11, %2
  %15 = load i8*, i8** %3, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 1)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = load i8*, i8** %3, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i32 0, i32 0), i8* %20)
  br label %22

; <label>:22:                                     ; preds = %17, %14
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %24 = bitcast %struct.__va_list_tag* %23 to i8*
  call void @llvm.va_start(i8* %24)
  %25 = load i8*, i8** %4, align 8
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %27, 58
  br i1 %28, label %29, label %66

; <label>:29:                                     ; preds = %22
  %30 = load i8*, i8** %4, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %59

; <label>:35:                                     ; preds = %29
  %36 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %37 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %36, i32 0, i32 0
  %38 = load i32, i32* %37, align 16
  %39 = icmp ule i32 %38, 40
  br i1 %39, label %40, label %47

; <label>:40:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 4)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 4)
  %42 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %36, i32 0, i32 3
  %43 = load i8*, i8** %42, align 16
  %44 = getelementptr i8, i8* %43, i32 %38
  %45 = bitcast i8* %44 to i8**
  %46 = add i32 %38, 8
  store i32 %46, i32* %37, align 16
  br label %53

; <label>:47:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 5)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 5)
  %49 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %36, i32 0, i32 2
  %50 = load i8*, i8** %49, align 8
  %51 = bitcast i8* %50 to i8**
  %52 = getelementptr i8, i8* %50, i32 8
  store i8* %52, i8** %49, align 8
  br label %53

; <label>:53:                                     ; preds = %47, %40
  %54 = phi i8** [ %45, %40 ], [ %51, %47 ]
  %55 = load i8*, i8** %54, align 8
  store i8* %55, i8** %4, align 8
  %56 = load i32, i32* %5, align 4
  %57 = call i32* @__errno_location() #8
  store i32 %56, i32* %57, align 4
  %58 = load i8*, i8** %4, align 8
  call void @perror(i8* %58)
  br label %65

; <label>:59:                                     ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 3)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 3)
  %61 = load i32, i32* %5, align 4
  %62 = call i32* @__errno_location() #8
  store i32 %61, i32* %62, align 4
  %63 = load i8*, i8** %4, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 1
  call void @perror(i8* %64)
  br label %65

; <label>:65:                                     ; preds = %59, %53
  br label %74

; <label>:66:                                     ; preds = %22
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 2)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_error, i64 0, i64 2)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = load i8*, i8** %4, align 8
  %70 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %71 = call i32 @vfprintf(%struct._IO_FILE* %68, i8* %69, %struct.__va_list_tag* %70)
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %73 = call i32 @fputc(i32 10, %struct._IO_FILE* %72)
  br label %74

; <label>:74:                                     ; preds = %66, %65
  %75 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %76 = bitcast %struct.__va_list_tag* %75 to i8*
  call void @llvm.va_end(i8* %76)
  ret void
}

declare void @audio_control_init(%union.audio_control*, i32) #2

declare i32 @mad_timer_compare(i64, i64, i64, i64) #2

; Function Attrs: nounwind uwtable
define internal i32 @silence(%struct.player*, i64, i64, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.mad_timer_t, align 8
  %7 = alloca %struct.player*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %union.audio_control, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  %14 = alloca %struct.mad_timer_t, align 8
  %15 = alloca i32, align 4
  %16 = alloca %struct.mad_timer_t, align 8
  %17 = alloca %struct.mad_timer_t, align 8
  %18 = bitcast %struct.mad_timer_t* %6 to { i64, i64 }*
  %19 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %18, i32 0, i32 0
  store i64 %1, i64* %19, align 8
  %20 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %18, i32 0, i32 1
  store i64 %2, i64* %20, align 8
  store %struct.player* %0, %struct.player** %7, align 8
  store i8* %3, i8** %8, align 8
  store i32 0, i32* %15, align 4
  call void @audio_control_init(%union.audio_control* %9, i32 1)
  %21 = bitcast %union.audio_control* %9 to %struct.audio_config*
  %22 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %21, i32 0, i32 1
  store i32 2, i32* %22, align 4
  %23 = bitcast %union.audio_control* %9 to %struct.audio_config*
  %24 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %23, i32 0, i32 2
  store i32 44100, i32* %24, align 8
  %25 = load %struct.player*, %struct.player** %7, align 8
  %26 = getelementptr inbounds %struct.player, %struct.player* %25, i32 0, i32 11
  %27 = getelementptr inbounds %struct.output, %struct.output* %26, i32 0, i32 11
  %28 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %27, align 8
  %29 = ptrtoint i32 (%union.audio_control*)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_silence to i8*), i32 0)
  %30 = call i32 %28(%union.audio_control* %9)
  %31 = icmp eq i32 %30, -1
  br i1 %31, label %32, label %35

; <label>:32:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 3)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 3)
  %34 = load i8*, i8** @audio_error, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* %34)
  store i32 -1, i32* %5, align 4
  br label %214

; <label>:35:                                     ; preds = %4
  %36 = bitcast %union.audio_control* %9 to %struct.audio_config*
  %37 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  store i32 %38, i32* %10, align 4
  %39 = bitcast %union.audio_control* %9 to %struct.audio_config*
  %40 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %39, i32 0, i32 2
  %41 = load i32, i32* %40, align 8
  store i32 %41, i32* %11, align 4
  %42 = load i32, i32* %11, align 4
  %43 = icmp ugt i32 %42, 3456
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %35
  br label %48

; <label>:45:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 4)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 4)
  %47 = load i32, i32* %11, align 4
  br label %48

; <label>:48:                                     ; preds = %45, %44
  %49 = phi i32 [ 3456, %44 ], [ %47, %45 ]
  store i32 %49, i32* %12, align 4
  %50 = load i32, i32* %10, align 4
  %51 = load %struct.player*, %struct.player** %7, align 8
  %52 = getelementptr inbounds %struct.player, %struct.player* %51, i32 0, i32 11
  %53 = getelementptr inbounds %struct.output, %struct.output* %52, i32 0, i32 3
  store i32 %50, i32* %53, align 8
  %54 = load i32, i32* %10, align 4
  %55 = load %struct.player*, %struct.player** %7, align 8
  %56 = getelementptr inbounds %struct.player, %struct.player* %55, i32 0, i32 11
  %57 = getelementptr inbounds %struct.output, %struct.output* %56, i32 0, i32 4
  store i32 %54, i32* %57, align 4
  %58 = load i32, i32* %11, align 4
  %59 = load %struct.player*, %struct.player** %7, align 8
  %60 = getelementptr inbounds %struct.player, %struct.player* %59, i32 0, i32 11
  %61 = getelementptr inbounds %struct.output, %struct.output* %60, i32 0, i32 6
  store i32 %58, i32* %61, align 4
  %62 = load i32, i32* %11, align 4
  %63 = load %struct.player*, %struct.player** %7, align 8
  %64 = getelementptr inbounds %struct.player, %struct.player* %63, i32 0, i32 11
  %65 = getelementptr inbounds %struct.output, %struct.output* %64, i32 0, i32 7
  store i32 %62, i32* %65, align 8
  %66 = load i32, i32* %12, align 4
  %67 = zext i32 %66 to i64
  %68 = call noalias i8* @calloc(i64 %67, i64 4) #6
  %69 = bitcast i8* %68 to i32*
  store i32* %69, i32** %13, align 8
  %70 = load i32*, i32** %13, align 8
  %71 = icmp eq i32* %70, null
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 5)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 5)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.41, i32 0, i32 0))
  store i32 -1, i32* %5, align 4
  br label %214

; <label>:74:                                     ; preds = %48
  call void @audio_control_init(%union.audio_control* %9, i32 2)
  %75 = load i32, i32* %12, align 4
  %76 = bitcast %union.audio_control* %9 to %struct.audio_play*
  %77 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %76, i32 0, i32 1
  store i32 %75, i32* %77, align 4
  %78 = load i32*, i32** %13, align 8
  %79 = bitcast %union.audio_control* %9 to %struct.audio_play*
  %80 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %79, i32 0, i32 2
  %81 = getelementptr inbounds [2 x i32*], [2 x i32*]* %80, i64 0, i64 0
  store i32* %78, i32** %81, align 8
  %82 = load i32, i32* %10, align 4
  %83 = icmp eq i32 %82, 2
  br i1 %83, label %84, label %87

; <label>:84:                                     ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 6)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 6)
  %86 = load i32*, i32** %13, align 8
  br label %89

; <label>:87:                                     ; preds = %74
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 7)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 7)
  br label %89

; <label>:89:                                     ; preds = %87, %84
  %90 = phi i32* [ %86, %84 ], [ null, %87 ]
  %91 = bitcast %union.audio_control* %9 to %struct.audio_play*
  %92 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %91, i32 0, i32 2
  %93 = getelementptr inbounds [2 x i32*], [2 x i32*]* %92, i64 0, i64 1
  store i32* %90, i32** %93, align 8
  %94 = load %struct.player*, %struct.player** %7, align 8
  %95 = getelementptr inbounds %struct.player, %struct.player* %94, i32 0, i32 11
  %96 = getelementptr inbounds %struct.output, %struct.output* %95, i32 0, i32 0
  %97 = load i32, i32* %96, align 8
  %98 = bitcast %union.audio_control* %9 to %struct.audio_play*
  %99 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %98, i32 0, i32 3
  store i32 %97, i32* %99, align 8
  %100 = load %struct.player*, %struct.player** %7, align 8
  %101 = getelementptr inbounds %struct.player, %struct.player* %100, i32 0, i32 12
  %102 = getelementptr inbounds %struct.stats, %struct.stats* %101, i32 0, i32 17
  %103 = bitcast %union.audio_control* %9 to %struct.audio_play*
  %104 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %103, i32 0, i32 4
  store %struct.audio_stats* %102, %struct.audio_stats** %104, align 8
  %105 = load i32, i32* %12, align 4
  %106 = zext i32 %105 to i64
  %107 = load i32, i32* %11, align 4
  %108 = zext i32 %107 to i64
  call void @mad_timer_set(%struct.mad_timer_t* %14, i64 0, i64 %106, i64 %108)
  call void @mad_timer_negate(%struct.mad_timer_t* %6)
  br label %109

; <label>:109:                                    ; preds = %199, %89
  %110 = bitcast %struct.mad_timer_t* %6 to { i64, i64 }*
  %111 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %110, i32 0, i32 0
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %110, i32 0, i32 1
  %114 = load i64, i64* %113, align 8
  %115 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 0), align 8
  %116 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 1), align 8
  %117 = call i32 @mad_timer_compare(i64 %112, i64 %114, i64 %115, i64 %116)
  %118 = icmp slt i32 %117, 0
  br i1 %118, label %119, label %206

; <label>:119:                                    ; preds = %109
  %120 = bitcast %struct.mad_timer_t* %6 to { i64, i64 }*
  %121 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %120, i32 0, i32 0
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %120, i32 0, i32 1
  %124 = load i64, i64* %123, align 8
  %125 = call { i64, i64 } @mad_timer_abs(i64 %122, i64 %124)
  %126 = bitcast %struct.mad_timer_t* %16 to { i64, i64 }*
  %127 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %126, i32 0, i32 0
  %128 = extractvalue { i64, i64 } %125, 0
  store i64 %128, i64* %127, align 8
  %129 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %126, i32 0, i32 1
  %130 = extractvalue { i64, i64 } %125, 1
  store i64 %130, i64* %129, align 8
  %131 = bitcast %struct.mad_timer_t* %14 to { i64, i64 }*
  %132 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %131, i32 0, i32 0
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %131, i32 0, i32 1
  %135 = load i64, i64* %134, align 8
  %136 = bitcast %struct.mad_timer_t* %16 to { i64, i64 }*
  %137 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %136, i32 0, i32 0
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %136, i32 0, i32 1
  %140 = load i64, i64* %139, align 8
  %141 = call i32 @mad_timer_compare(i64 %133, i64 %135, i64 %138, i64 %140)
  %142 = icmp sgt i32 %141, 0
  br i1 %142, label %143, label %169

; <label>:143:                                    ; preds = %119
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 1)
  %144 = add i64 %pgocount5, 1
  store i64 %144, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 1)
  %145 = bitcast %struct.mad_timer_t* %6 to { i64, i64 }*
  %146 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %145, i32 0, i32 0
  %147 = load i64, i64* %146, align 8
  %148 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %145, i32 0, i32 1
  %149 = load i64, i64* %148, align 8
  %150 = call { i64, i64 } @mad_timer_abs(i64 %147, i64 %149)
  %151 = bitcast %struct.mad_timer_t* %17 to { i64, i64 }*
  %152 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %151, i32 0, i32 0
  %153 = extractvalue { i64, i64 } %150, 0
  store i64 %153, i64* %152, align 8
  %154 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %151, i32 0, i32 1
  %155 = extractvalue { i64, i64 } %150, 1
  store i64 %155, i64* %154, align 8
  %156 = bitcast %struct.mad_timer_t* %14 to i8*
  %157 = bitcast %struct.mad_timer_t* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %156, i8* %157, i64 16, i32 8, i1 false)
  %158 = load i32, i32* %11, align 4
  %159 = zext i32 %158 to i64
  %160 = bitcast %struct.mad_timer_t* %14 to { i64, i64 }*
  %161 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %160, i32 0, i32 0
  %162 = load i64, i64* %161, align 8
  %163 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %160, i32 0, i32 1
  %164 = load i64, i64* %163, align 8
  %165 = call i64 @mad_timer_fraction(i64 %162, i64 %164, i64 %159)
  %166 = trunc i64 %165 to i32
  %167 = bitcast %union.audio_control* %9 to %struct.audio_play*
  %168 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %167, i32 0, i32 1
  store i32 %166, i32* %168, align 4
  br label %169

; <label>:169:                                    ; preds = %143, %119
  %170 = load %struct.player*, %struct.player** %7, align 8
  %171 = getelementptr inbounds %struct.player, %struct.player* %170, i32 0, i32 11
  %172 = getelementptr inbounds %struct.output, %struct.output* %171, i32 0, i32 11
  %173 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %172, align 8
  %174 = ptrtoint i32 (%union.audio_control*)* %173 to i64
  call void @__llvm_profile_instrument_target(i64 %174, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_silence to i8*), i32 1)
  %175 = call i32 %173(%union.audio_control* %9)
  %176 = icmp eq i32 %175, -1
  br i1 %176, label %177, label %180

; <label>:177:                                    ; preds = %169
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 8)
  %178 = add i64 %pgocount6, 1
  store i64 %178, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 8)
  %179 = load i8*, i8** @audio_error, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* %179)
  br label %209

; <label>:180:                                    ; preds = %169
  %181 = load %struct.player*, %struct.player** %7, align 8
  %182 = getelementptr inbounds %struct.player, %struct.player* %181, i32 0, i32 12
  %183 = getelementptr inbounds %struct.stats, %struct.stats* %182, i32 0, i32 4
  %184 = bitcast %struct.mad_timer_t* %14 to { i64, i64 }*
  %185 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %184, i32 0, i32 0
  %186 = load i64, i64* %185, align 8
  %187 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %184, i32 0, i32 1
  %188 = load i64, i64* %187, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %183, i64 %186, i64 %188)
  %189 = load %struct.player*, %struct.player** %7, align 8
  %190 = getelementptr inbounds %struct.player, %struct.player* %189, i32 0, i32 0
  %191 = load i32, i32* %190, align 8
  %192 = icmp sgt i32 %191, 0
  br i1 %192, label %193, label %198

; <label>:193:                                    ; preds = %180
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 2)
  %194 = add i64 %pgocount7, 1
  store i64 %194, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 2)
  %195 = load %struct.player*, %struct.player** %7, align 8
  %196 = getelementptr inbounds %struct.player, %struct.player* %195, i32 0, i32 12
  %197 = load i8*, i8** %8, align 8
  call void @show_status(%struct.stats* %196, %struct.mad_header* null, i8* %197, i32 0)
  br label %198

; <label>:198:                                    ; preds = %193, %180
  br label %199

; <label>:199:                                    ; preds = %198
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 0)
  %200 = add i64 %pgocount8, 1
  store i64 %200, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 0)
  %201 = bitcast %struct.mad_timer_t* %14 to { i64, i64 }*
  %202 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %201, i32 0, i32 0
  %203 = load i64, i64* %202, align 8
  %204 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %201, i32 0, i32 1
  %205 = load i64, i64* %204, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %6, i64 %203, i64 %205)
  br label %109

; <label>:206:                                    ; preds = %109
  br i1 false, label %207, label %210

; <label>:207:                                    ; preds = %206
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 9)
  %208 = add i64 %pgocount9, 1
  store i64 %208, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_silence, i64 0, i64 9)
  br label %209

; <label>:209:                                    ; preds = %207, %177
  store i32 -1, i32* %15, align 4
  br label %210

; <label>:210:                                    ; preds = %209, %206
  %211 = load i32*, i32** %13, align 8
  %212 = bitcast i32* %211 to i8*
  call void @free(i8* %212) #6
  %213 = load i32, i32* %15, align 4
  store i32 %213, i32* %5, align 4
  br label %214

; <label>:214:                                    ; preds = %210, %72, %32
  %215 = load i32, i32* %5, align 4
  ret i32 %215
}

declare { i64, i64 } @mad_timer_abs(i64, i64) #2

; Function Attrs: nounwind uwtable
define internal i32 @play_all(%struct.player*) #0 {
  %2 = alloca %struct.player*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.playlist*, align 8
  %11 = alloca i8*, align 8
  store %struct.player* %0, %struct.player** %2, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %3, align 8
  store i32 0, i32* %9, align 4
  %12 = load %struct.player*, %struct.player** %2, align 8
  %13 = getelementptr inbounds %struct.player, %struct.player* %12, i32 0, i32 4
  store %struct.playlist* %13, %struct.playlist** %10, align 8
  %14 = load %struct.playlist*, %struct.playlist** %10, align 8
  %15 = getelementptr inbounds %struct.playlist, %struct.playlist* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  store i32 %16, i32* %6, align 4
  %17 = load %struct.player*, %struct.player** %2, align 8
  %18 = getelementptr inbounds %struct.player, %struct.player* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = and i32 %19, 1
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %66

; <label>:22:                                     ; preds = %1
  %23 = call i64 @time(i64* null) #6
  %24 = trunc i64 %23 to i32
  call void @srand(i32 %24) #6
  store i32 0, i32* %7, align 4
  br label %25

; <label>:25:                                     ; preds = %60, %22
  %26 = load i32, i32* %7, align 4
  %27 = load i32, i32* %6, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %64

; <label>:29:                                     ; preds = %25
  %30 = call i32 @rand() #6
  %31 = load i32, i32* %6, align 4
  %32 = srem i32 %30, %31
  store i32 %32, i32* %8, align 4
  %33 = load %struct.playlist*, %struct.playlist** %10, align 8
  %34 = getelementptr inbounds %struct.playlist, %struct.playlist* %33, i32 0, i32 0
  %35 = load i8**, i8*** %34, align 8
  %36 = load i32, i32* %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8*, i8** %35, i64 %37
  %39 = load i8*, i8** %38, align 8
  store i8* %39, i8** %11, align 8
  %40 = load %struct.playlist*, %struct.playlist** %10, align 8
  %41 = getelementptr inbounds %struct.playlist, %struct.playlist* %40, i32 0, i32 0
  %42 = load i8**, i8*** %41, align 8
  %43 = load i32, i32* %8, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8*, i8** %42, i64 %44
  %46 = load i8*, i8** %45, align 8
  %47 = load %struct.playlist*, %struct.playlist** %10, align 8
  %48 = getelementptr inbounds %struct.playlist, %struct.playlist* %47, i32 0, i32 0
  %49 = load i8**, i8*** %48, align 8
  %50 = load i32, i32* %7, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8*, i8** %49, i64 %51
  store i8* %46, i8** %52, align 8
  %53 = load i8*, i8** %11, align 8
  %54 = load %struct.playlist*, %struct.playlist** %10, align 8
  %55 = getelementptr inbounds %struct.playlist, %struct.playlist* %54, i32 0, i32 0
  %56 = load i8**, i8*** %55, align 8
  %57 = load i32, i32* %8, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %56, i64 %58
  store i8* %53, i8** %59, align 8
  br label %60

; <label>:60:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 17)
  %61 = add i64 %pgocount, 1
  store i64 %61, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 17)
  %62 = load i32, i32* %7, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %7, align 4
  br label %25

; <label>:64:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 22)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 22)
  br label %66

; <label>:66:                                     ; preds = %64, %1
  br label %67

; <label>:67:                                     ; preds = %303, %66
  %68 = load i32, i32* %6, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %85

; <label>:70:                                     ; preds = %67
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 16)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 16)
  %72 = load %struct.player*, %struct.player** %2, align 8
  %73 = getelementptr inbounds %struct.player, %struct.player* %72, i32 0, i32 2
  %74 = load i32, i32* %73, align 8
  %75 = icmp eq i32 %74, -1
  br i1 %75, label %83, label %76

; <label>:76:                                     ; preds = %70
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 18)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 18)
  %78 = load %struct.player*, %struct.player** %2, align 8
  %79 = getelementptr inbounds %struct.player, %struct.player* %78, i32 0, i32 2
  %80 = load i32, i32* %79, align 8
  %81 = add nsw i32 %80, -1
  store i32 %81, i32* %79, align 8
  %82 = icmp ne i32 %80, 0
  br label %83

; <label>:83:                                     ; preds = %76, %70
  %84 = phi i1 [ true, %70 ], [ %82, %76 ]
  br label %85

; <label>:85:                                     ; preds = %83, %67
  %86 = phi i1 [ false, %67 ], [ %84, %83 ]
  br i1 %86, label %87, label %307

; <label>:87:                                     ; preds = %85
  br label %88

; <label>:88:                                     ; preds = %301, %108, %87
  %89 = load %struct.playlist*, %struct.playlist** %10, align 8
  %90 = getelementptr inbounds %struct.playlist, %struct.playlist* %89, i32 0, i32 2
  %91 = load i32, i32* %90, align 4
  %92 = load %struct.playlist*, %struct.playlist** %10, align 8
  %93 = getelementptr inbounds %struct.playlist, %struct.playlist* %92, i32 0, i32 1
  %94 = load i32, i32* %93, align 8
  %95 = icmp slt i32 %91, %94
  br i1 %95, label %96, label %303

; <label>:96:                                     ; preds = %88
  %97 = load %struct.playlist*, %struct.playlist** %10, align 8
  %98 = getelementptr inbounds %struct.playlist, %struct.playlist* %97, i32 0, i32 2
  %99 = load i32, i32* %98, align 4
  store i32 %99, i32* %7, align 4
  %100 = load %struct.playlist*, %struct.playlist** %10, align 8
  %101 = getelementptr inbounds %struct.playlist, %struct.playlist* %100, i32 0, i32 0
  %102 = load i8**, i8*** %101, align 8
  %103 = load i32, i32* %7, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8*, i8** %102, i64 %104
  %106 = load i8*, i8** %105, align 8
  %107 = icmp eq i8* %106, null
  br i1 %107, label %108, label %114

; <label>:108:                                    ; preds = %96
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 6)
  %109 = add i64 %pgocount4, 1
  store i64 %109, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 6)
  %110 = load %struct.playlist*, %struct.playlist** %10, align 8
  %111 = getelementptr inbounds %struct.playlist, %struct.playlist* %110, i32 0, i32 2
  %112 = load i32, i32* %111, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %111, align 4
  br label %88

; <label>:114:                                    ; preds = %96
  %115 = load %struct.player*, %struct.player** %2, align 8
  %116 = getelementptr inbounds %struct.player, %struct.player* %115, i32 0, i32 3
  store i32 0, i32* %116, align 4
  %117 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0))
  store %struct._IO_FILE* %117, %struct._IO_FILE** %3, align 8
  %118 = icmp eq %struct._IO_FILE* %117, null
  br i1 %118, label %119, label %123

; <label>:119:                                    ; preds = %114
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 23)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 23)
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %122 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %121, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.44, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:123:                                    ; preds = %114
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %125 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %124, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.45, i32 0, i32 0), i64* %5)
  %126 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %127 = call i32 @fclose(%struct._IO_FILE* %126)
  store i64 0, i64* %4, align 8
  br label %128

; <label>:128:                                    ; preds = %148, %123
  %129 = load i64, i64* %4, align 8
  %130 = load i64, i64* %5, align 8
  %131 = icmp slt i64 %129, %130
  br i1 %131, label %132, label %151

; <label>:132:                                    ; preds = %128
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 0)
  %133 = add i64 %pgocount6, 1
  store i64 %133, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 0)
  %134 = load %struct.player*, %struct.player** %2, align 8
  %135 = call i32 @play_one(%struct.player* %134)
  %136 = icmp eq i32 %135, -1
  br i1 %136, label %137, label %147

; <label>:137:                                    ; preds = %132
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 1)
  %138 = add i64 %pgocount7, 1
  store i64 %138, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 1)
  %139 = load %struct.playlist*, %struct.playlist** %10, align 8
  %140 = getelementptr inbounds %struct.playlist, %struct.playlist* %139, i32 0, i32 0
  %141 = load i8**, i8*** %140, align 8
  %142 = load i32, i32* %7, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8*, i8** %141, i64 %143
  store i8* null, i8** %144, align 8
  %145 = load i32, i32* %6, align 4
  %146 = add nsw i32 %145, -1
  store i32 %146, i32* %6, align 4
  store i32 -1, i32* %9, align 4
  br label %147

; <label>:147:                                    ; preds = %137, %132
  br label %148

; <label>:148:                                    ; preds = %147
  %149 = load i64, i64* %4, align 8
  %150 = add nsw i64 %149, 1
  store i64 %150, i64* %4, align 8
  br label %128

; <label>:151:                                    ; preds = %128
  %152 = load %struct.player*, %struct.player** %2, align 8
  %153 = getelementptr inbounds %struct.player, %struct.player* %152, i32 0, i32 1
  %154 = load i32, i32* %153, align 4
  %155 = and i32 %154, 32
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %157, label %178

; <label>:157:                                    ; preds = %151
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 7)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 7)
  %159 = load %struct.player*, %struct.player** %2, align 8
  %160 = getelementptr inbounds %struct.player, %struct.player* %159, i32 0, i32 12
  %161 = getelementptr inbounds %struct.stats, %struct.stats* %160, i32 0, i32 4
  %162 = load %struct.player*, %struct.player** %2, align 8
  %163 = getelementptr inbounds %struct.player, %struct.player* %162, i32 0, i32 6
  %164 = bitcast %struct.mad_timer_t* %161 to { i64, i64 }*
  %165 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %164, i32 0, i32 0
  %166 = load i64, i64* %165, align 8
  %167 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %164, i32 0, i32 1
  %168 = load i64, i64* %167, align 8
  %169 = bitcast %struct.mad_timer_t* %163 to { i64, i64 }*
  %170 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %169, i32 0, i32 0
  %171 = load i64, i64* %170, align 8
  %172 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %169, i32 0, i32 1
  %173 = load i64, i64* %172, align 8
  %174 = call i32 @mad_timer_compare(i64 %166, i64 %168, i64 %171, i64 %173)
  %175 = icmp sgt i32 %174, 0
  br i1 %175, label %176, label %178

; <label>:176:                                    ; preds = %157
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 20)
  %177 = add i64 %pgocount9, 1
  store i64 %177, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 20)
  store i32 0, i32* %6, align 4
  br label %303

; <label>:178:                                    ; preds = %157, %151
  %179 = load %struct.player*, %struct.player** %2, align 8
  %180 = getelementptr inbounds %struct.player, %struct.player* %179, i32 0, i32 3
  %181 = load i32, i32* %180, align 4
  switch i32 %181, label %301 [
    i32 0, label %182
    i32 1, label %246
    i32 2, label %252
    i32 3, label %292
    i32 4, label %294
  ]

; <label>:182:                                    ; preds = %178
  %183 = load %struct.player*, %struct.player** %2, align 8
  %184 = getelementptr inbounds %struct.player, %struct.player* %183, i32 0, i32 1
  %185 = load i32, i32* %184, align 4
  %186 = and i32 %185, 1
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %188, label %244

; <label>:188:                                    ; preds = %182
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 13)
  %189 = add i64 %pgocount10, 1
  store i64 %189, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 13)
  %190 = load %struct.player*, %struct.player** %2, align 8
  %191 = getelementptr inbounds %struct.player, %struct.player* %190, i32 0, i32 2
  %192 = load i32, i32* %191, align 8
  %193 = icmp ne i32 %192, 0
  br i1 %193, label %194, label %244

; <label>:194:                                    ; preds = %188
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 15)
  %195 = add i64 %pgocount11, 1
  store i64 %195, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 15)
  %196 = load i32, i32* %7, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, i32* %7, align 4
  %198 = load %struct.playlist*, %struct.playlist** %10, align 8
  %199 = getelementptr inbounds %struct.playlist, %struct.playlist* %198, i32 0, i32 1
  %200 = load i32, i32* %199, align 8
  %201 = icmp slt i32 %197, %200
  br i1 %201, label %202, label %244

; <label>:202:                                    ; preds = %194
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 19)
  %203 = add i64 %pgocount12, 1
  store i64 %203, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 19)
  %204 = load i32, i32* %7, align 4
  %205 = call i32 @rand() #6
  %206 = load %struct.playlist*, %struct.playlist** %10, align 8
  %207 = getelementptr inbounds %struct.playlist, %struct.playlist* %206, i32 0, i32 1
  %208 = load i32, i32* %207, align 8
  %209 = add nsw i32 %208, 1
  %210 = sdiv i32 %209, 2
  %211 = srem i32 %205, %210
  %212 = add nsw i32 %204, %211
  %213 = load %struct.playlist*, %struct.playlist** %10, align 8
  %214 = getelementptr inbounds %struct.playlist, %struct.playlist* %213, i32 0, i32 1
  %215 = load i32, i32* %214, align 8
  %216 = srem i32 %212, %215
  store i32 %216, i32* %8, align 4
  %217 = load %struct.playlist*, %struct.playlist** %10, align 8
  %218 = getelementptr inbounds %struct.playlist, %struct.playlist* %217, i32 0, i32 0
  %219 = load i8**, i8*** %218, align 8
  %220 = load i32, i32* %7, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i8*, i8** %219, i64 %221
  %223 = load i8*, i8** %222, align 8
  store i8* %223, i8** %11, align 8
  %224 = load %struct.playlist*, %struct.playlist** %10, align 8
  %225 = getelementptr inbounds %struct.playlist, %struct.playlist* %224, i32 0, i32 0
  %226 = load i8**, i8*** %225, align 8
  %227 = load i32, i32* %8, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i8*, i8** %226, i64 %228
  %230 = load i8*, i8** %229, align 8
  %231 = load %struct.playlist*, %struct.playlist** %10, align 8
  %232 = getelementptr inbounds %struct.playlist, %struct.playlist* %231, i32 0, i32 0
  %233 = load i8**, i8*** %232, align 8
  %234 = load i32, i32* %7, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i8*, i8** %233, i64 %235
  store i8* %230, i8** %236, align 8
  %237 = load i8*, i8** %11, align 8
  %238 = load %struct.playlist*, %struct.playlist** %10, align 8
  %239 = getelementptr inbounds %struct.playlist, %struct.playlist* %238, i32 0, i32 0
  %240 = load i8**, i8*** %239, align 8
  %241 = load i32, i32* %8, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds i8*, i8** %240, i64 %242
  store i8* %237, i8** %243, align 8
  br label %244

; <label>:244:                                    ; preds = %202, %194, %188, %182
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 9)
  %245 = add i64 %pgocount13, 1
  store i64 %245, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 9)
  br label %246

; <label>:246:                                    ; preds = %244, %178
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 8)
  %247 = add i64 %pgocount14, 1
  store i64 %247, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 8)
  %248 = load %struct.playlist*, %struct.playlist** %10, align 8
  %249 = getelementptr inbounds %struct.playlist, %struct.playlist* %248, i32 0, i32 2
  %250 = load i32, i32* %249, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %249, align 4
  br label %301

; <label>:252:                                    ; preds = %178
  br label %253

; <label>:253:                                    ; preds = %288, %252
  %254 = load %struct.playlist*, %struct.playlist** %10, align 8
  %255 = getelementptr inbounds %struct.playlist, %struct.playlist* %254, i32 0, i32 2
  %256 = load i32, i32* %255, align 4
  %257 = add nsw i32 %256, -1
  store i32 %257, i32* %255, align 4
  %258 = icmp eq i32 %256, 0
  br i1 %258, label %259, label %266

; <label>:259:                                    ; preds = %253
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 4)
  %260 = add i64 %pgocount15, 1
  store i64 %260, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 4)
  %261 = load %struct.playlist*, %struct.playlist** %10, align 8
  %262 = getelementptr inbounds %struct.playlist, %struct.playlist* %261, i32 0, i32 1
  %263 = load i32, i32* %262, align 8
  %264 = load %struct.playlist*, %struct.playlist** %10, align 8
  %265 = getelementptr inbounds %struct.playlist, %struct.playlist* %264, i32 0, i32 2
  store i32 %263, i32* %265, align 4
  br label %266

; <label>:266:                                    ; preds = %259, %253
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 2)
  %267 = add i64 %pgocount16, 1
  store i64 %267, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 2)
  br label %268

; <label>:268:                                    ; preds = %266
  %269 = load %struct.playlist*, %struct.playlist** %10, align 8
  %270 = getelementptr inbounds %struct.playlist, %struct.playlist* %269, i32 0, i32 2
  %271 = load i32, i32* %270, align 4
  %272 = load %struct.playlist*, %struct.playlist** %10, align 8
  %273 = getelementptr inbounds %struct.playlist, %struct.playlist* %272, i32 0, i32 1
  %274 = load i32, i32* %273, align 8
  %275 = icmp slt i32 %271, %274
  br i1 %275, label %276, label %288

; <label>:276:                                    ; preds = %268
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 3)
  %277 = add i64 %pgocount17, 1
  store i64 %277, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 3)
  %278 = load %struct.playlist*, %struct.playlist** %10, align 8
  %279 = getelementptr inbounds %struct.playlist, %struct.playlist* %278, i32 0, i32 0
  %280 = load i8**, i8*** %279, align 8
  %281 = load %struct.playlist*, %struct.playlist** %10, align 8
  %282 = getelementptr inbounds %struct.playlist, %struct.playlist* %281, i32 0, i32 2
  %283 = load i32, i32* %282, align 4
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds i8*, i8** %280, i64 %284
  %286 = load i8*, i8** %285, align 8
  %287 = icmp eq i8* %286, null
  br label %288

; <label>:288:                                    ; preds = %276, %268
  %289 = phi i1 [ false, %268 ], [ %287, %276 ]
  br i1 %289, label %253, label %290

; <label>:290:                                    ; preds = %288
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 10)
  %291 = add i64 %pgocount18, 1
  store i64 %291, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 10)
  br label %301

; <label>:292:                                    ; preds = %178
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 11)
  %293 = add i64 %pgocount19, 1
  store i64 %293, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 11)
  br label %301

; <label>:294:                                    ; preds = %178
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 12)
  %295 = add i64 %pgocount20, 1
  store i64 %295, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 12)
  %296 = load %struct.playlist*, %struct.playlist** %10, align 8
  %297 = getelementptr inbounds %struct.playlist, %struct.playlist* %296, i32 0, i32 1
  %298 = load i32, i32* %297, align 8
  %299 = load %struct.playlist*, %struct.playlist** %10, align 8
  %300 = getelementptr inbounds %struct.playlist, %struct.playlist* %299, i32 0, i32 2
  store i32 %298, i32* %300, align 4
  store i32 0, i32* %6, align 4
  br label %301

; <label>:301:                                    ; preds = %294, %292, %290, %246, %178
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 5)
  %302 = add i64 %pgocount21, 1
  store i64 %302, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 5)
  br label %88

; <label>:303:                                    ; preds = %176, %88
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 14)
  %304 = add i64 %pgocount22, 1
  store i64 %304, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 14)
  %305 = load %struct.playlist*, %struct.playlist** %10, align 8
  %306 = getelementptr inbounds %struct.playlist, %struct.playlist* %305, i32 0, i32 2
  store i32 0, i32* %306, align 4
  br label %67

; <label>:307:                                    ; preds = %85
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 21)
  %308 = add i64 %pgocount23, 1
  store i64 %308, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_play_all, i64 0, i64 21)
  %309 = load i32, i32* %9, align 4
  ret i32 %309
}

; Function Attrs: nounwind uwtable
define internal i32 @restore_tty(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.termios, align 4
  %4 = alloca %struct.sigaction, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  store i32 0, i32* %5, align 4
  %6 = load i32, i32* @tty_fd, align 4
  %7 = call i32 @tcgetattr(i32 %6, %struct.termios* %3) #6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %26

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 1)
  %11 = load i32, i32* @tty_fd, align 4
  %12 = load i32, i32* %2, align 4
  %13 = icmp ne i32 %12, 0
  %14 = zext i1 %13 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 12)
  %15 = add i64 %pgocount1, %14
  store i64 %15, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 12)
  %16 = select i1 %13, i32 2, i32 1
  %17 = call i32 @tcsetattr(i32 %11, i32 %16, %struct.termios* @save_tty) #6
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %26

; <label>:19:                                     ; preds = %9
  %20 = load i32, i32* %2, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 9)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 9)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0))
  br label %24

; <label>:24:                                     ; preds = %22, %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 5)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 5)
  store i32 -1, i32* %5, align 4
  br label %26

; <label>:26:                                     ; preds = %24, %9, %1
  %27 = bitcast %struct.termios* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.termios* @save_tty to i8*), i8* %27, i64 60, i32 4, i1 false)
  %28 = call i32 @sigaction(i32 2, %struct.sigaction* null, %struct.sigaction* %4) #6
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %41

; <label>:30:                                     ; preds = %26
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 2)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 2)
  %32 = call i32 @sigaction(i32 2, %struct.sigaction* @save_sigint, %struct.sigaction* null) #6
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %41

; <label>:34:                                     ; preds = %30
  %35 = load i32, i32* %2, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %39, label %37

; <label>:37:                                     ; preds = %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 10)
  %38 = add i64 %pgocount5, 1
  store i64 %38, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 10)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0))
  br label %39

; <label>:39:                                     ; preds = %37, %34
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 6)
  %40 = add i64 %pgocount6, 1
  store i64 %40, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 6)
  store i32 -1, i32* %5, align 4
  br label %41

; <label>:41:                                     ; preds = %39, %30, %26
  %42 = bitcast %struct.sigaction* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.sigaction* @save_sigint to i8*), i8* %42, i64 152, i32 8, i1 false)
  %43 = call i32 @sigaction(i32 20, %struct.sigaction* null, %struct.sigaction* %4) #6
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %56

; <label>:45:                                     ; preds = %41
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 3)
  %46 = add i64 %pgocount7, 1
  store i64 %46, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 3)
  %47 = call i32 @sigaction(i32 20, %struct.sigaction* @save_sigtstp, %struct.sigaction* null) #6
  %48 = icmp eq i32 %47, -1
  br i1 %48, label %49, label %56

; <label>:49:                                     ; preds = %45
  %50 = load i32, i32* %2, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %54, label %52

; <label>:52:                                     ; preds = %49
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 11)
  %53 = add i64 %pgocount8, 1
  store i64 %53, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 11)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0))
  br label %54

; <label>:54:                                     ; preds = %52, %49
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 7)
  %55 = add i64 %pgocount9, 1
  store i64 %55, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 7)
  store i32 -1, i32* %5, align 4
  br label %56

; <label>:56:                                     ; preds = %54, %45, %41
  %57 = bitcast %struct.sigaction* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.sigaction* @save_sigtstp to i8*), i8* %57, i64 152, i32 8, i1 false)
  %58 = load i32, i32* %2, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %68, label %60

; <label>:60:                                     ; preds = %56
  %61 = load i32, i32* @tty_fd, align 4
  %62 = call i32 @close(i32 %61)
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %60
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 8)
  %65 = add i64 %pgocount10, 1
  store i64 %65, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 8)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.117, i32 0, i32 0))
  store i32 -1, i32* %5, align 4
  br label %66

; <label>:66:                                     ; preds = %64, %60
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 4)
  %67 = add i64 %pgocount11, 1
  store i64 %67, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 4)
  store i32 -1, i32* @tty_fd, align 4
  br label %68

; <label>:68:                                     ; preds = %66, %56
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 0)
  %69 = add i64 %pgocount12, 1
  store i64 %69, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_restore_tty, i64 0, i64 0)
  %70 = load i32, i32* %5, align 4
  ret i32 %70
}

declare i32 @open(i8*, i32, ...) #2

; Function Attrs: nounwind
declare i32 @tcgetattr(i32, %struct.termios*) #3

; Function Attrs: nounwind
declare i32 @sigaction(i32, %struct.sigaction*, %struct.sigaction*) #3

; Function Attrs: nounwind uwtable
define internal void @signal_handler(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.sigaction, align 8
  store i32 %0, i32* %2, align 4
  %4 = call i32 @restore_tty(i32 1)
  %5 = load i32, i32* %2, align 4
  switch i32 %5, label %19 [
    i32 20, label %6
    i32 18, label %16
  ]

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signal_handler, i64 0, i64 2)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signal_handler, i64 0, i64 2)
  %8 = call i32 @sigaction(i32 18, %struct.sigaction* null, %struct.sigaction* @signal_handler.save_sigcont) #6
  %9 = bitcast %struct.sigaction* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* bitcast (%struct.sigaction* @signal_handler.save_sigcont to i8*), i64 152, i32 8, i1 false)
  %10 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 0
  %11 = bitcast %union.anon* %10 to void (i32)**
  store void (i32)* @signal_handler, void (i32)** %11, align 8
  %12 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 1
  %13 = call i32 @sigemptyset(%struct.__sigset_t* %12) #6
  %14 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 2
  store i32 0, i32* %14, align 8
  %15 = call i32 @sigaction(i32 18, %struct.sigaction* %3, %struct.sigaction* null) #6
  br label %19

; <label>:16:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signal_handler, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signal_handler, i64 0, i64 1)
  %18 = call i32 @sigaction(i32 18, %struct.sigaction* @signal_handler.save_sigcont, %struct.sigaction* null) #6
  br label %19

; <label>:19:                                     ; preds = %16, %6, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signal_handler, i64 0, i64 0)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_signal_handler, i64 0, i64 0)
  %21 = call i32 @getpid() #6
  %22 = load i32, i32* %2, align 4
  %23 = call i32 @kill(i32 %21, i32 %22) #6
  ret void
}

; Function Attrs: nounwind
declare i32 @sigemptyset(%struct.__sigset_t*) #3

; Function Attrs: nounwind
declare i32 @tcsetattr(i32, i32, %struct.termios*) #3

; Function Attrs: nounwind
declare i32 @kill(i32, i32) #3

; Function Attrs: nounwind
declare i32 @getpid() #3

; Function Attrs: nounwind uwtable
define internal i32 @addfilter(%struct.player*, i32 (i8*, %struct.mad_frame*)*, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.player*, align 8
  %6 = alloca i32 (i8*, %struct.mad_frame*)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.filter*, align 8
  store %struct.player* %0, %struct.player** %5, align 8
  store i32 (i8*, %struct.mad_frame*)* %1, i32 (i8*, %struct.mad_frame*)** %6, align 8
  store i8* %2, i8** %7, align 8
  %9 = load i32 (i8*, %struct.mad_frame*)*, i32 (i8*, %struct.mad_frame*)** %6, align 8
  %10 = load i8*, i8** %7, align 8
  %11 = load %struct.player*, %struct.player** %5, align 8
  %12 = getelementptr inbounds %struct.player, %struct.player* %11, i32 0, i32 11
  %13 = getelementptr inbounds %struct.output, %struct.output* %12, i32 0, i32 2
  %14 = load %struct.filter*, %struct.filter** %13, align 8
  %15 = call %struct.filter* @filter_new(i32 (i8*, %struct.mad_frame*)* %9, i8* %10, %struct.filter* %14)
  store %struct.filter* %15, %struct.filter** %8, align 8
  %16 = load %struct.filter*, %struct.filter** %8, align 8
  %17 = icmp eq %struct.filter* %16, null
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_addfilter, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_addfilter, i64 0, i64 1)
  store i32 -1, i32* %4, align 4
  br label %26

; <label>:20:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_addfilter, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_addfilter, i64 0, i64 0)
  %22 = load %struct.filter*, %struct.filter** %8, align 8
  %23 = load %struct.player*, %struct.player** %5, align 8
  %24 = getelementptr inbounds %struct.player, %struct.player* %23, i32 0, i32 11
  %25 = getelementptr inbounds %struct.output, %struct.output* %24, i32 0, i32 2
  store %struct.filter* %22, %struct.filter** %25, align 8
  store i32 0, i32* %4, align 4
  br label %26

; <label>:26:                                     ; preds = %20, %18
  %27 = load i32, i32* %4, align 4
  ret i32 %27
}

declare i32 @fadein_filter(i8*, %struct.mad_frame*) #2

declare void @equalizer_init(%struct.equalizer*) #2

declare i32 @equalizer_filter(i8*, %struct.mad_frame*) #2

declare i32 @mono_filter(i8*, %struct.mad_frame*) #2

; Function Attrs: nounwind uwtable
define internal i32 @tty_filter(i8*, %struct.mad_frame*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca %struct.mad_frame*, align 8
  %6 = alloca %struct.player*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.mad_timer_t, align 8
  %11 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %5, align 8
  %12 = load i8*, i8** %4, align 8
  %13 = bitcast i8* %12 to %struct.player*
  store %struct.player* %13, %struct.player** %6, align 8
  store i32 0, i32* %7, align 4
  store i32 0, i32* %9, align 4
  %14 = call i32 @readkey(i32 0)
  store i32 %14, i32* %8, align 4
  %15 = load i32, i32* %8, align 4
  %16 = icmp eq i32 %15, -1
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 9)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 9)
  store i32 17, i32* %3, align 4
  br label %162

; <label>:19:                                     ; preds = %2
  br label %20

; <label>:20:                                     ; preds = %60, %19
  %21 = load i32, i32* %8, align 4
  switch i32 %21, label %156 [
    i32 112, label %._crit_edge
    i32 115, label %28
    i32 102, label %._crit_edge3
    i32 14, label %64
    i32 98, label %._crit_edge4
    i32 16, label %68
    i32 113, label %._crit_edge1
    i32 3, label %._crit_edge2
    i32 81, label %96
    i32 105, label %._crit_edge5
    i32 63, label %100
    i32 116, label %116
  ]

._crit_edge5:                                     ; preds = %20
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 5)
  %22 = add i64 %pgocount6, 1
  store i64 %22, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 5)
  br label %100

._crit_edge4:                                     ; preds = %20
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 4)
  %23 = add i64 %pgocount7, 1
  store i64 %23, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 4)
  br label %68

._crit_edge3:                                     ; preds = %20
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 3)
  %24 = add i64 %pgocount8, 1
  store i64 %24, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 3)
  br label %64

._crit_edge2:                                     ; preds = %20
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 2)
  %25 = add i64 %pgocount9, 1
  store i64 %25, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 2)
  br label %96

._crit_edge1:                                     ; preds = %20
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 1)
  %26 = add i64 %pgocount10, 1
  store i64 %26, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 1)
  br label %96

._crit_edge:                                      ; preds = %20
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 0)
  %27 = add i64 %pgocount11, 1
  store i64 %27, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 0)
  br label %28

; <label>:28:                                     ; preds = %._crit_edge, %20
  %29 = load %struct.player*, %struct.player** %6, align 8
  %30 = load i32, i32* %8, align 4
  %31 = icmp eq i32 %30, 115
  %32 = zext i1 %31 to i32
  store i32 %32, i32* %9, align 4
  %33 = call i32 @stop_audio(%struct.player* %29, i32 %32)
  %34 = load i32, i32* %9, align 4
  %35 = icmp ne i32 %34, 0
  %36 = zext i1 %35 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 25)
  %37 = add i64 %pgocount12, %36
  store i64 %37, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 25)
  %38 = select i1 %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0)
  %39 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.11, i32 0, i32 0), i8* %38)
  %40 = load i32, i32* %9, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %46

; <label>:42:                                     ; preds = %28
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 8)
  %43 = add i64 %pgocount13, 1
  store i64 %43, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 8)
  %44 = load %struct.player*, %struct.player** %6, align 8
  %45 = getelementptr inbounds %struct.player, %struct.player* %44, i32 0, i32 3
  store i32 3, i32* %45, align 4
  store i32 16, i32* %7, align 4
  br label %46

; <label>:46:                                     ; preds = %42, %28
  %47 = call i32 @readkey(i32 1)
  store i32 %47, i32* %8, align 4
  %48 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i32 0, i32 0))
  %49 = load i32, i32* %8, align 4
  %50 = icmp eq i32 %49, -1
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %46
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 12)
  %52 = add i64 %pgocount14, 1
  store i64 %52, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 12)
  store i32 17, i32* %3, align 4
  br label %162

; <label>:53:                                     ; preds = %46
  %54 = load i32, i32* %8, align 4
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %62

; <label>:56:                                     ; preds = %53
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 6)
  %57 = add i64 %pgocount15, 1
  store i64 %57, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 6)
  %58 = load i32, i32* %8, align 4
  %59 = icmp ne i32 %58, 112
  br i1 %59, label %60, label %62

; <label>:60:                                     ; preds = %56
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 7)
  %61 = add i64 %pgocount16, 1
  store i64 %61, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 7)
  br label %20

; <label>:62:                                     ; preds = %56, %53
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 11)
  %63 = add i64 %pgocount17, 1
  store i64 %63, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 11)
  br label %156

; <label>:64:                                     ; preds = %._crit_edge3, %20
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 14)
  %65 = add i64 %pgocount18, 1
  store i64 %65, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 14)
  %66 = load %struct.player*, %struct.player** %6, align 8
  %67 = getelementptr inbounds %struct.player, %struct.player* %66, i32 0, i32 3
  store i32 1, i32* %67, align 4
  br label %159

; <label>:68:                                     ; preds = %._crit_edge4, %20
  call void @mad_timer_set(%struct.mad_timer_t* %10, i64 4, i64 0, i64 0)
  %69 = load i32, i32* %9, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %88, label %71

; <label>:71:                                     ; preds = %68
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 19)
  %72 = add i64 %pgocount19, 1
  store i64 %72, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 19)
  %73 = load %struct.player*, %struct.player** %6, align 8
  %74 = getelementptr inbounds %struct.player, %struct.player* %73, i32 0, i32 12
  %75 = getelementptr inbounds %struct.stats, %struct.stats* %74, i32 0, i32 6
  %76 = bitcast %struct.mad_timer_t* %75 to { i64, i64 }*
  %77 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 0
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 1
  %80 = load i64, i64* %79, align 8
  %81 = bitcast %struct.mad_timer_t* %10 to { i64, i64 }*
  %82 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %81, i32 0, i32 0
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %81, i32 0, i32 1
  %85 = load i64, i64* %84, align 8
  %86 = call i32 @mad_timer_compare(i64 %78, i64 %80, i64 %83, i64 %85)
  %87 = icmp slt i32 %86, 0
  br label %88

; <label>:88:                                     ; preds = %71, %68
  %89 = phi i1 [ true, %68 ], [ %87, %71 ]
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 15)
  %90 = add i64 %pgocount20, 1
  store i64 %90, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 15)
  %91 = zext i1 %89 to i64
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 26)
  %92 = add i64 %pgocount21, %91
  store i64 %92, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 26)
  %93 = select i1 %89, i32 2, i32 3
  %94 = load %struct.player*, %struct.player** %6, align 8
  %95 = getelementptr inbounds %struct.player, %struct.player* %94, i32 0, i32 3
  store i32 %93, i32* %95, align 4
  br label %159

; <label>:96:                                     ; preds = %._crit_edge2, %._crit_edge1, %20
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 13)
  %97 = add i64 %pgocount22, 1
  store i64 %97, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 13)
  %98 = load %struct.player*, %struct.player** %6, align 8
  %99 = getelementptr inbounds %struct.player, %struct.player* %98, i32 0, i32 3
  store i32 4, i32* %99, align 4
  br label %159

; <label>:100:                                    ; preds = %._crit_edge5, %20
  %101 = load %struct.player*, %struct.player** %6, align 8
  %102 = getelementptr inbounds %struct.player, %struct.player* %101, i32 0, i32 0
  %103 = load i32, i32* %102, align 8
  %104 = icmp sle i32 %103, 0
  br i1 %104, label %105, label %114

; <label>:105:                                    ; preds = %100
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 17)
  %106 = add i64 %pgocount23, 1
  store i64 %106, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 17)
  %107 = load %struct.player*, %struct.player** %6, align 8
  %108 = getelementptr inbounds %struct.player, %struct.player* %107, i32 0, i32 12
  %109 = load %struct.player*, %struct.player** %6, align 8
  %110 = getelementptr inbounds %struct.player, %struct.player* %109, i32 0, i32 10
  %111 = getelementptr inbounds %struct.input, %struct.input* %110, i32 0, i32 0
  %112 = load i8*, i8** %111, align 8
  call void @show_status(%struct.stats* %108, %struct.mad_header* null, i8* %112, i32 1)
  %113 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  br label %114

; <label>:114:                                    ; preds = %105, %100
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 16)
  %115 = add i64 %pgocount24, 1
  store i64 %115, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 16)
  br label %156

; <label>:116:                                    ; preds = %20
  %117 = load %struct.player*, %struct.player** %6, align 8
  %118 = getelementptr inbounds %struct.player, %struct.player* %117, i32 0, i32 0
  %119 = load i32, i32* %118, align 8
  %120 = icmp sgt i32 %119, 0
  br i1 %120, label %121, label %154

; <label>:121:                                    ; preds = %116
  store i8* null, i8** %11, align 8
  %122 = load %struct.player*, %struct.player** %6, align 8
  %123 = getelementptr inbounds %struct.player, %struct.player* %122, i32 0, i32 12
  %124 = getelementptr inbounds %struct.stats, %struct.stats* %123, i32 0, i32 0
  %125 = load i32, i32* %124, align 8
  switch i32 %125, label %149 [
    i32 1, label %126
    i32 0, label %139
    i32 2, label %144
  ]

; <label>:126:                                    ; preds = %121
  %127 = load %struct.player*, %struct.player** %6, align 8
  %128 = getelementptr inbounds %struct.player, %struct.player* %127, i32 0, i32 4
  %129 = getelementptr inbounds %struct.playlist, %struct.playlist* %128, i32 0, i32 1
  %130 = load i32, i32* %129, align 8
  %131 = icmp sgt i32 %130, 1
  br i1 %131, label %132, label %137

; <label>:132:                                    ; preds = %126
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 23)
  %133 = add i64 %pgocount25, 1
  store i64 %133, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 23)
  %134 = load %struct.player*, %struct.player** %6, align 8
  %135 = getelementptr inbounds %struct.player, %struct.player* %134, i32 0, i32 12
  %136 = getelementptr inbounds %struct.stats, %struct.stats* %135, i32 0, i32 0
  store i32 0, i32* %136, align 8
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.16, i32 0, i32 0), i8** %11, align 8
  br label %149

; <label>:137:                                    ; preds = %126
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 24)
  %138 = add i64 %pgocount26, 1
  store i64 %138, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 24)
  br label %139

; <label>:139:                                    ; preds = %137, %121
  %pgocount27 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 21)
  %140 = add i64 %pgocount27, 1
  store i64 %140, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 21)
  %141 = load %struct.player*, %struct.player** %6, align 8
  %142 = getelementptr inbounds %struct.player, %struct.player* %141, i32 0, i32 12
  %143 = getelementptr inbounds %struct.stats, %struct.stats* %142, i32 0, i32 0
  store i32 2, i32* %143, align 8
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.17, i32 0, i32 0), i8** %11, align 8
  br label %149

; <label>:144:                                    ; preds = %121
  %pgocount28 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 22)
  %145 = add i64 %pgocount28, 1
  store i64 %145, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 22)
  %146 = load %struct.player*, %struct.player** %6, align 8
  %147 = getelementptr inbounds %struct.player, %struct.player* %146, i32 0, i32 12
  %148 = getelementptr inbounds %struct.stats, %struct.stats* %147, i32 0, i32 0
  store i32 1, i32* %148, align 8
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.18, i32 0, i32 0), i8** %11, align 8
  br label %149

; <label>:149:                                    ; preds = %144, %139, %132, %121
  %pgocount29 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 20)
  %150 = add i64 %pgocount29, 1
  store i64 %150, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 20)
  %151 = load %struct.player*, %struct.player** %6, align 8
  %152 = getelementptr inbounds %struct.player, %struct.player* %151, i32 0, i32 12
  %153 = load i8*, i8** %11, align 8
  call void @show_status(%struct.stats* %152, %struct.mad_header* null, i8* %153, i32 1)
  br label %154

; <label>:154:                                    ; preds = %149, %116
  %pgocount30 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 18)
  %155 = add i64 %pgocount30, 1
  store i64 %155, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 18)
  br label %156

; <label>:156:                                    ; preds = %154, %114, %62, %20
  %pgocount31 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 10)
  %157 = add i64 %pgocount31, 1
  store i64 %157, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_tty_filter, i64 0, i64 10)
  %158 = load i32, i32* %7, align 4
  store i32 %158, i32* %3, align 4
  br label %162

; <label>:159:                                    ; preds = %96, %88, %64
  %160 = load %struct.player*, %struct.player** %6, align 8
  %161 = call i32 @stop_audio(%struct.player* %160, i32 1)
  store i32 16, i32* %3, align 4
  br label %162

; <label>:162:                                    ; preds = %159, %156, %51, %17
  %163 = load i32, i32* %3, align 4
  ret i32 %163
}

declare %struct.filter* @filter_new(i32 (i8*, %struct.mad_frame*)*, i8*, %struct.filter*) #2

; Function Attrs: nounwind uwtable
define internal i32 @readkey(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i64, align 8
  %6 = alloca %struct.termios, align 4
  %7 = alloca %struct.termios, align 4
  store i32 %0, i32* %3, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %33, label %10

; <label>:10:                                     ; preds = %1
  %11 = load i32, i32* @tty_fd, align 4
  %12 = call i64 @read(i32 %11, i8* %4, i64 1)
  store i64 %12, i64* %5, align 8
  %13 = load i64, i64* %5, align 8
  %14 = icmp eq i64 %13, -1
  br i1 %14, label %15, label %22

; <label>:15:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 6)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 6)
  %17 = call i32* @__errno_location() #8
  %18 = load i32, i32* %17, align 4
  %19 = icmp ne i32 %18, 4
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 9)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 9)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %91

; <label>:22:                                     ; preds = %15, %10
  %23 = load i64, i64* %5, align 8
  %24 = icmp eq i64 %23, 1
  br i1 %24, label %25, label %29

; <label>:25:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 3)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 3)
  %27 = load i8, i8* %4, align 1
  %28 = zext i8 %27 to i32
  br label %31

; <label>:29:                                     ; preds = %22
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 4)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 4)
  br label %31

; <label>:31:                                     ; preds = %29, %25
  %32 = phi i32 [ %28, %25 ], [ 0, %29 ]
  store i32 %32, i32* %2, align 4
  br label %91

; <label>:33:                                     ; preds = %1
  %34 = load i32, i32* @tty_fd, align 4
  %35 = call i32 @tcgetattr(i32 %34, %struct.termios* %6) #6
  %36 = icmp eq i32 %35, -1
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %33
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 2)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 2)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %91

; <label>:39:                                     ; preds = %33
  %40 = bitcast %struct.termios* %7 to i8*
  %41 = bitcast %struct.termios* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %41, i64 60, i32 4, i1 false)
  %42 = getelementptr inbounds %struct.termios, %struct.termios* %6, i32 0, i32 5
  %43 = getelementptr inbounds [32 x i8], [32 x i8]* %42, i64 0, i64 6
  store i8 1, i8* %43, align 1
  %44 = load i32, i32* @tty_fd, align 4
  %45 = call i32 @tcsetattr(i32 %44, i32 0, %struct.termios* %6) #6
  %46 = icmp eq i32 %45, -1
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 5)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 5)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %91

; <label>:49:                                     ; preds = %39
  br label %50

; <label>:50:                                     ; preds = %62, %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 0)
  %51 = add i64 %pgocount6, 1
  store i64 %51, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 0)
  %52 = load i32, i32* @tty_fd, align 4
  %53 = call i64 @read(i32 %52, i8* %4, i64 1)
  store i64 %53, i64* %5, align 8
  br label %54

; <label>:54:                                     ; preds = %50
  %55 = load i64, i64* %5, align 8
  %56 = icmp eq i64 %55, -1
  br i1 %56, label %57, label %62

; <label>:57:                                     ; preds = %54
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 1)
  %58 = add i64 %pgocount7, 1
  store i64 %58, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 1)
  %59 = call i32* @__errno_location() #8
  %60 = load i32, i32* %59, align 4
  %61 = icmp eq i32 %60, 4
  br label %62

; <label>:62:                                     ; preds = %57, %54
  %63 = phi i1 [ false, %54 ], [ %61, %57 ]
  br i1 %63, label %50, label %64

; <label>:64:                                     ; preds = %62
  %65 = load i64, i64* %5, align 8
  %66 = icmp eq i64 %65, -1
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %64
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 7)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 7)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0))
  br label %69

; <label>:69:                                     ; preds = %67, %64
  %70 = load i32, i32* @tty_fd, align 4
  %71 = call i32 @tcsetattr(i32 %70, i32 0, %struct.termios* %7) #6
  %72 = icmp eq i32 %71, -1
  br i1 %72, label %73, label %75

; <label>:73:                                     ; preds = %69
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 8)
  %74 = add i64 %pgocount9, 1
  store i64 %74, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 8)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %91

; <label>:75:                                     ; preds = %69
  %76 = load i64, i64* %5, align 8
  %77 = icmp eq i64 %76, -1
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %75
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 10)
  %79 = add i64 %pgocount10, 1
  store i64 %79, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 10)
  store i32 -1, i32* %2, align 4
  br label %91

; <label>:80:                                     ; preds = %75
  %81 = load i64, i64* %5, align 8
  %82 = icmp eq i64 %81, 1
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %80
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 11)
  %84 = add i64 %pgocount11, 1
  store i64 %84, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 11)
  %85 = load i8, i8* %4, align 1
  %86 = zext i8 %85 to i32
  br label %89

; <label>:87:                                     ; preds = %80
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 12)
  %88 = add i64 %pgocount12, 1
  store i64 %88, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_readkey, i64 0, i64 12)
  br label %89

; <label>:89:                                     ; preds = %87, %83
  %90 = phi i32 [ %86, %83 ], [ 0, %87 ]
  store i32 %90, i32* %2, align 4
  br label %91

; <label>:91:                                     ; preds = %89, %78, %73, %47, %37, %31, %20
  %92 = load i32, i32* %2, align 4
  ret i32 %92
}

; Function Attrs: nounwind uwtable
define internal i32 @stop_audio(%struct.player*, i32) #0 {
  %3 = alloca %struct.player*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %union.audio_control, align 8
  store %struct.player* %0, %struct.player** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %7 = load %struct.player*, %struct.player** %3, align 8
  %8 = getelementptr inbounds %struct.player, %struct.player* %7, i32 0, i32 11
  %9 = getelementptr inbounds %struct.output, %struct.output* %8, i32 0, i32 11
  %10 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %9, align 8
  %11 = icmp ne i32 (%union.audio_control*)* %10, null
  br i1 %11, label %12, label %23

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop_audio, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop_audio, i64 0, i64 1)
  call void @audio_control_init(%union.audio_control* %6, i32 3)
  %14 = load i32, i32* %4, align 4
  %15 = bitcast %union.audio_control* %6 to %struct.audio_stop*
  %16 = getelementptr inbounds %struct.audio_stop, %struct.audio_stop* %15, i32 0, i32 1
  store i32 %14, i32* %16, align 4
  %17 = load %struct.player*, %struct.player** %3, align 8
  %18 = getelementptr inbounds %struct.player, %struct.player* %17, i32 0, i32 11
  %19 = getelementptr inbounds %struct.output, %struct.output* %18, i32 0, i32 11
  %20 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %19, align 8
  %21 = ptrtoint i32 (%union.audio_control*)* %20 to i64
  call void @__llvm_profile_instrument_target(i64 %21, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_stop_audio to i8*), i32 0)
  %22 = call i32 %20(%union.audio_control* %6)
  store i32 %22, i32* %5, align 4
  br label %23

; <label>:23:                                     ; preds = %12, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop_audio, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop_audio, i64 0, i64 0)
  %25 = load i32, i32* %5, align 4
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define internal i32 @message(i8*, ...) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1 x %struct.__va_list_tag], align 16
  %7 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %8 = load i8*, i8** %2, align 8
  %9 = call i64 @strlen(i8* %8) #10
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %3, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 1)
  %15 = load i8*, i8** %2, align 8
  %16 = load i32, i32* %3, align 4
  %17 = sub nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8* %15, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 10
  br label %23

; <label>:23:                                     ; preds = %13, %1
  %24 = phi i1 [ false, %1 ], [ %22, %13 ]
  %25 = zext i1 %24 to i32
  store i32 %25, i32* %4, align 4
  %26 = load i32, i32* @on_same_line, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %40

; <label>:28:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 2)
  %30 = load i32, i32* %4, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %40

; <label>:32:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 5)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 5)
  %34 = load i32, i32* %3, align 4
  %35 = icmp sgt i32 %34, 1
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 9)
  %37 = add i64 %pgocount3, 1
  store i64 %37, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 9)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = call i32 @fputc(i32 10, %struct._IO_FILE* %38)
  br label %40

; <label>:40:                                     ; preds = %36, %32, %28, %23
  %41 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %42 = bitcast %struct.__va_list_tag* %41 to i8*
  call void @llvm.va_start(i8* %42)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = load i8*, i8** %2, align 8
  %45 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %46 = call i32 @vfprintf(%struct._IO_FILE* %43, i8* %44, %struct.__va_list_tag* %45)
  store i32 %46, i32* %5, align 4
  %47 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %48 = bitcast %struct.__va_list_tag* %47 to i8*
  call void @llvm.va_end(i8* %48)
  %49 = load i32, i32* @on_same_line, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %74

; <label>:51:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 3)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 3)
  %53 = load i32, i32* %4, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %74, label %55

; <label>:55:                                     ; preds = %51
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 8)
  %56 = add i64 %pgocount5, 1
  store i64 %56, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 8)
  %57 = load i32, i32* %5, align 4
  %58 = load i32, i32* @on_same_line, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %74

; <label>:60:                                     ; preds = %55
  %61 = load i32, i32* @on_same_line, align 4
  %62 = load i32, i32* %5, align 4
  %63 = sub nsw i32 %61, %62
  store i32 %63, i32* %7, align 4
  br label %64

; <label>:64:                                     ; preds = %68, %60
  %65 = load i32, i32* %7, align 4
  %66 = add i32 %65, -1
  store i32 %66, i32* %7, align 4
  %67 = icmp ne i32 %65, 0
  br i1 %67, label %68, label %72

; <label>:68:                                     ; preds = %64
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 0)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 0)
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %71 = call i32 @_IO_putc(i32 32, %struct._IO_FILE* %70)
  br label %64

; <label>:72:                                     ; preds = %64
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 10)
  %73 = add i64 %pgocount7, 1
  store i64 %73, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 10)
  br label %74

; <label>:74:                                     ; preds = %72, %55, %51, %40
  %75 = load i32, i32* %4, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %74
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 4)
  %78 = add i64 %pgocount8, 1
  store i64 %78, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 4)
  br label %82

; <label>:79:                                     ; preds = %74
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 6)
  %80 = add i64 %pgocount9, 1
  store i64 %80, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 6)
  %81 = load i32, i32* %5, align 4
  br label %82

; <label>:82:                                     ; preds = %79, %77
  %83 = phi i32 [ 0, %77 ], [ %81, %79 ]
  store i32 %83, i32* @on_same_line, align 4
  %84 = load i32, i32* %4, align 4
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %92, label %86

; <label>:86:                                     ; preds = %82
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 7)
  %87 = add i64 %pgocount10, 1
  store i64 %87, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_message, i64 0, i64 7)
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %89 = call i32 @fputc(i32 13, %struct._IO_FILE* %88)
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %91 = call i32 @fflush(%struct._IO_FILE* %90)
  br label %92

; <label>:92:                                     ; preds = %86, %82
  %93 = load i32, i32* %5, align 4
  ret i32 %93
}

declare void @mad_timer_set(%struct.mad_timer_t*, i64, i64, i64) #2

; Function Attrs: nounwind uwtable
define internal void @show_status(%struct.stats*, %struct.mad_header*, i8*, i32) #0 {
  %5 = alloca %struct.stats*, align 8
  %6 = alloca %struct.mad_header*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.mad_timer_t, align 8
  %12 = alloca [18 x i8], align 16
  %13 = alloca i8*, align 8
  %14 = alloca i64, align 8
  store %struct.stats* %0, %struct.stats** %5, align 8
  store %struct.mad_header* %1, %struct.mad_header** %6, align 8
  store i8* %2, i8** %7, align 8
  store i32 %3, i32* %8, align 4
  %15 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %16 = icmp ne %struct.mad_header* %15, null
  br i1 %16, label %17, label %76

; <label>:17:                                     ; preds = %4
  %18 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %19 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %18, i32 0, i32 4
  %20 = load i64, i64* %19, align 8
  %21 = udiv i64 %20, 1000
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %10, align 4
  %23 = load i32, i32* %10, align 4
  %24 = zext i32 %23 to i64
  %25 = load %struct.stats*, %struct.stats** %5, align 8
  %26 = getelementptr inbounds %struct.stats, %struct.stats* %25, i32 0, i32 15
  %27 = load i64, i64* %26, align 8
  %28 = add i64 %27, %24
  store i64 %28, i64* %26, align 8
  %29 = load %struct.stats*, %struct.stats** %5, align 8
  %30 = getelementptr inbounds %struct.stats, %struct.stats* %29, i32 0, i32 14
  %31 = load i64, i64* %30, align 8
  %32 = add i64 %31, 1
  store i64 %32, i64* %30, align 8
  %33 = load %struct.stats*, %struct.stats** %5, align 8
  %34 = getelementptr inbounds %struct.stats, %struct.stats* %33, i32 0, i32 13
  %35 = load i32, i32* %34, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %44

; <label>:37:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 3)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 3)
  %39 = load %struct.stats*, %struct.stats** %5, align 8
  %40 = getelementptr inbounds %struct.stats, %struct.stats* %39, i32 0, i32 13
  %41 = load i32, i32* %40, align 4
  %42 = load i32, i32* %10, align 4
  %43 = icmp ne i32 %41, %42
  br label %44

; <label>:44:                                     ; preds = %37, %17
  %45 = phi i1 [ false, %17 ], [ %43, %37 ]
  %46 = zext i1 %45 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 26)
  %47 = add i64 %pgocount1, %46
  store i64 %47, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 26)
  %48 = select i1 %45, i32 128, i32 -1
  %49 = load %struct.stats*, %struct.stats** %5, align 8
  %50 = getelementptr inbounds %struct.stats, %struct.stats* %49, i32 0, i32 12
  %51 = load i32, i32* %50, align 8
  %52 = add nsw i32 %51, %48
  store i32 %52, i32* %50, align 8
  %53 = load %struct.stats*, %struct.stats** %5, align 8
  %54 = getelementptr inbounds %struct.stats, %struct.stats* %53, i32 0, i32 12
  %55 = load i32, i32* %54, align 8
  %56 = icmp slt i32 %55, 0
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 10)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 10)
  %59 = load %struct.stats*, %struct.stats** %5, align 8
  %60 = getelementptr inbounds %struct.stats, %struct.stats* %59, i32 0, i32 12
  store i32 0, i32* %60, align 8
  br label %72

; <label>:61:                                     ; preds = %44
  %62 = load %struct.stats*, %struct.stats** %5, align 8
  %63 = getelementptr inbounds %struct.stats, %struct.stats* %62, i32 0, i32 12
  %64 = load i32, i32* %63, align 8
  %65 = icmp sgt i32 %64, 512
  br i1 %65, label %66, label %70

; <label>:66:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 14)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 14)
  %68 = load %struct.stats*, %struct.stats** %5, align 8
  %69 = getelementptr inbounds %struct.stats, %struct.stats* %68, i32 0, i32 12
  store i32 512, i32* %69, align 8
  br label %70

; <label>:70:                                     ; preds = %66, %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 4)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 4)
  br label %72

; <label>:72:                                     ; preds = %70, %57
  %73 = load i32, i32* %10, align 4
  %74 = load %struct.stats*, %struct.stats** %5, align 8
  %75 = getelementptr inbounds %struct.stats, %struct.stats* %74, i32 0, i32 13
  store i32 %73, i32* %75, align 4
  br label %76

; <label>:76:                                     ; preds = %72, %4
  %77 = load %struct.stats*, %struct.stats** %5, align 8
  %78 = getelementptr inbounds %struct.stats, %struct.stats* %77, i32 0, i32 4
  %79 = bitcast %struct.mad_timer_t* %78 to { i64, i64 }*
  %80 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %79, i32 0, i32 0
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %79, i32 0, i32 1
  %83 = load i64, i64* %82, align 8
  %84 = call i64 @mad_timer_count(i64 %81, i64 %83, i32 0)
  store i64 %84, i64* %9, align 8
  %85 = load i64, i64* %9, align 8
  %86 = load %struct.stats*, %struct.stats** %5, align 8
  %87 = getelementptr inbounds %struct.stats, %struct.stats* %86, i32 0, i32 16
  %88 = load i64, i64* %87, align 8
  %89 = icmp ne i64 %85, %88
  br i1 %89, label %98, label %90

; <label>:90:                                     ; preds = %76
  %pgocount5 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 1)
  %91 = add i64 %pgocount5, 1
  store i64 %91, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 1)
  %92 = load i32, i32* @on_same_line, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %98

; <label>:94:                                     ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 7)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 7)
  %96 = load i32, i32* %8, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %322

; <label>:98:                                     ; preds = %94, %90, %76
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i32 0, i32 0), i8** %13, align 8
  %99 = load i64, i64* %9, align 8
  %100 = load %struct.stats*, %struct.stats** %5, align 8
  %101 = getelementptr inbounds %struct.stats, %struct.stats* %100, i32 0, i32 16
  store i64 %99, i64* %101, align 8
  %102 = load %struct.stats*, %struct.stats** %5, align 8
  %103 = getelementptr inbounds %struct.stats, %struct.stats* %102, i32 0, i32 0
  %104 = load i32, i32* %103, align 8
  switch i32 %104, label %174 [
    i32 0, label %105
    i32 1, label %111
    i32 2, label %117
  ]

; <label>:105:                                    ; preds = %98
  %pgocount7 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 11)
  %106 = add i64 %pgocount7, 1
  store i64 %106, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 11)
  %107 = load %struct.stats*, %struct.stats** %5, align 8
  %108 = getelementptr inbounds %struct.stats, %struct.stats* %107, i32 0, i32 4
  %109 = bitcast %struct.mad_timer_t* %11 to i8*
  %110 = bitcast %struct.mad_timer_t* %108 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %109, i8* %110, i64 16, i32 8, i1 false)
  br label %174

; <label>:111:                                    ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 12)
  %112 = add i64 %pgocount8, 1
  store i64 %112, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 12)
  %113 = load %struct.stats*, %struct.stats** %5, align 8
  %114 = getelementptr inbounds %struct.stats, %struct.stats* %113, i32 0, i32 5
  %115 = bitcast %struct.mad_timer_t* %11 to i8*
  %116 = bitcast %struct.mad_timer_t* %114 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %115, i8* %116, i64 16, i32 8, i1 false)
  br label %174

; <label>:117:                                    ; preds = %98
  %118 = load %struct.stats*, %struct.stats** %5, align 8
  %119 = getelementptr inbounds %struct.stats, %struct.stats* %118, i32 0, i32 3
  %120 = bitcast %struct.mad_timer_t* %11 to i8*
  %121 = bitcast %struct.mad_timer_t* %119 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %120, i8* %121, i64 16, i32 8, i1 false)
  %122 = bitcast %struct.mad_timer_t* %11 to { i64, i64 }*
  %123 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %122, i32 0, i32 0
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %122, i32 0, i32 1
  %126 = load i64, i64* %125, align 8
  %127 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 0), align 8
  %128 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 1), align 8
  %129 = call i32 @mad_timer_compare(i64 %124, i64 %126, i64 %127, i64 %128)
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %165

; <label>:131:                                    ; preds = %117
  %pgocount9 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 15)
  %132 = add i64 %pgocount9, 1
  store i64 %132, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 15)
  %133 = load %struct.stats*, %struct.stats** %5, align 8
  %134 = getelementptr inbounds %struct.stats, %struct.stats* %133, i32 0, i32 2
  %135 = load i64, i64* %134, align 8
  %136 = icmp ne i64 %135, 0
  br i1 %136, label %137, label %165

; <label>:137:                                    ; preds = %131
  %138 = load %struct.stats*, %struct.stats** %5, align 8
  %139 = getelementptr inbounds %struct.stats, %struct.stats* %138, i32 0, i32 12
  %140 = load i32, i32* %139, align 8
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %152

; <label>:142:                                    ; preds = %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 19)
  %143 = add i64 %pgocount10, 1
  store i64 %143, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 19)
  %144 = load %struct.stats*, %struct.stats** %5, align 8
  %145 = getelementptr inbounds %struct.stats, %struct.stats* %144, i32 0, i32 15
  %146 = load i64, i64* %145, align 8
  %147 = mul i64 %146, 125
  %148 = load %struct.stats*, %struct.stats** %5, align 8
  %149 = getelementptr inbounds %struct.stats, %struct.stats* %148, i32 0, i32 14
  %150 = load i64, i64* %149, align 8
  %151 = udiv i64 %147, %150
  br label %159

; <label>:152:                                    ; preds = %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 21)
  %153 = add i64 %pgocount11, 1
  store i64 %153, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 21)
  %154 = load %struct.stats*, %struct.stats** %5, align 8
  %155 = getelementptr inbounds %struct.stats, %struct.stats* %154, i32 0, i32 13
  %156 = load i32, i32* %155, align 4
  %157 = zext i32 %156 to i64
  %158 = mul i64 %157, 125
  br label %159

; <label>:159:                                    ; preds = %152, %142
  %160 = phi i64 [ %151, %142 ], [ %158, %152 ]
  store i64 %160, i64* %14, align 8
  %161 = load %struct.stats*, %struct.stats** %5, align 8
  %162 = getelementptr inbounds %struct.stats, %struct.stats* %161, i32 0, i32 2
  %163 = load i64, i64* %162, align 8
  %164 = load i64, i64* %14, align 8
  call void @mad_timer_set(%struct.mad_timer_t* %11, i64 0, i64 %163, i64 %164)
  br label %165

; <label>:165:                                    ; preds = %159, %131, %117
  %pgocount12 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 13)
  %166 = add i64 %pgocount12, 1
  store i64 %166, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 13)
  call void @mad_timer_negate(%struct.mad_timer_t* %11)
  %167 = load %struct.stats*, %struct.stats** %5, align 8
  %168 = getelementptr inbounds %struct.stats, %struct.stats* %167, i32 0, i32 5
  %169 = bitcast %struct.mad_timer_t* %168 to { i64, i64 }*
  %170 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %169, i32 0, i32 0
  %171 = load i64, i64* %170, align 8
  %172 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %169, i32 0, i32 1
  %173 = load i64, i64* %172, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %11, i64 %171, i64 %173)
  br label %174

; <label>:174:                                    ; preds = %165, %111, %105, %98
  %175 = getelementptr inbounds [18 x i8], [18 x i8]* %12, i32 0, i32 0
  %176 = bitcast %struct.mad_timer_t* %11 to { i64, i64 }*
  %177 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %176, i32 0, i32 0
  %178 = load i64, i64* %177, align 8
  %179 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %176, i32 0, i32 1
  %180 = load i64, i64* %179, align 8
  call void @mad_timer_string(i64 %178, i64 %180, i8* %175, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.27, i32 0, i32 0), i32 -2, i32 0, i64 0)
  %181 = bitcast %struct.mad_timer_t* %11 to { i64, i64 }*
  %182 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %181, i32 0, i32 0
  %183 = load i64, i64* %182, align 8
  %184 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %181, i32 0, i32 1
  %185 = load i64, i64* %184, align 8
  %186 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 0), align 8
  %187 = load i64, i64* getelementptr inbounds ({ i64, i64 }, { i64, i64 }* bitcast (%struct.mad_timer_t* @mad_timer_zero to { i64, i64 }*), i32 0, i32 1), align 8
  %188 = call i32 @mad_timer_compare(i64 %183, i64 %185, i64 %186, i64 %187)
  %189 = icmp slt i32 %188, 0
  br i1 %189, label %190, label %193

; <label>:190:                                    ; preds = %174
  %pgocount13 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 5)
  %191 = add i64 %pgocount13, 1
  store i64 %191, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 5)
  %192 = getelementptr inbounds [18 x i8], [18 x i8]* %12, i64 0, i64 0
  store i8 45, i8* %192, align 16
  br label %193

; <label>:193:                                    ; preds = %190, %174
  %194 = load i8*, i8** %7, align 8
  %195 = icmp ne i8* %194, null
  br i1 %195, label %202, label %196

; <label>:196:                                    ; preds = %193
  %pgocount14 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 6)
  %197 = add i64 %pgocount14, 1
  store i64 %197, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 6)
  %198 = load %struct.stats*, %struct.stats** %5, align 8
  %199 = getelementptr inbounds %struct.stats, %struct.stats* %198, i32 0, i32 1
  %200 = load i8*, i8** %199, align 8
  %201 = icmp ne i8* %200, null
  br i1 %201, label %202, label %227

; <label>:202:                                    ; preds = %196, %193
  %203 = getelementptr inbounds [18 x i8], [18 x i8]* %12, i32 0, i32 0
  %204 = load i8*, i8** %7, align 8
  %205 = icmp ne i8* %204, null
  br i1 %205, label %206, label %208

; <label>:206:                                    ; preds = %202
  %207 = load i8*, i8** %7, align 8
  br label %213

; <label>:208:                                    ; preds = %202
  %pgocount15 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 8)
  %209 = add i64 %pgocount15, 1
  store i64 %209, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 8)
  %210 = load %struct.stats*, %struct.stats** %5, align 8
  %211 = getelementptr inbounds %struct.stats, %struct.stats* %210, i32 0, i32 1
  %212 = load i8*, i8** %211, align 8
  br label %213

; <label>:213:                                    ; preds = %208, %206
  %214 = phi i8* [ %207, %206 ], [ %212, %208 ]
  %215 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.28, i32 0, i32 0), i8* %203, i8* %214)
  %216 = load i32, i32* %8, align 4
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %221

; <label>:218:                                    ; preds = %213
  %pgocount16 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 2)
  %219 = add i64 %pgocount16, 1
  store i64 %219, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 2)
  %220 = load i8*, i8** %7, align 8
  br label %223

; <label>:221:                                    ; preds = %213
  %pgocount17 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 9)
  %222 = add i64 %pgocount17, 1
  store i64 %222, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 9)
  br label %223

; <label>:223:                                    ; preds = %221, %218
  %224 = phi i8* [ %220, %218 ], [ null, %221 ]
  %225 = load %struct.stats*, %struct.stats** %5, align 8
  %226 = getelementptr inbounds %struct.stats, %struct.stats* %225, i32 0, i32 1
  store i8* %224, i8** %226, align 8
  br label %321

; <label>:227:                                    ; preds = %196
  %228 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %229 = icmp ne %struct.mad_header* %228, null
  br i1 %229, label %230, label %316

; <label>:230:                                    ; preds = %227
  %231 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %232 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %231, i32 0, i32 1
  %233 = load i32, i32* %232, align 4
  %234 = icmp eq i32 %233, 2
  br i1 %234, label %235, label %250

; <label>:235:                                    ; preds = %230
  %236 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %237 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %236, i32 0, i32 8
  %238 = load i32, i32* %237, align 8
  %239 = and i32 %238, 768
  switch i32 %239, label %248 [
    i32 0, label %240
    i32 512, label %242
    i32 256, label %244
    i32 768, label %246
  ]

; <label>:240:                                    ; preds = %235
  %pgocount18 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 22)
  %241 = add i64 %pgocount18, 1
  store i64 %241, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 22)
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i32 0, i32 0), i8** %13, align 8
  br label %248

; <label>:242:                                    ; preds = %235
  %pgocount19 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 23)
  %243 = add i64 %pgocount19, 1
  store i64 %243, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 23)
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.30, i32 0, i32 0), i8** %13, align 8
  br label %248

; <label>:244:                                    ; preds = %235
  %pgocount20 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 24)
  %245 = add i64 %pgocount20, 1
  store i64 %245, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 24)
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.31, i32 0, i32 0), i8** %13, align 8
  br label %248

; <label>:246:                                    ; preds = %235
  %pgocount21 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 25)
  %247 = add i64 %pgocount21, 1
  store i64 %247, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 25)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0), i8** %13, align 8
  br label %248

; <label>:248:                                    ; preds = %246, %244, %242, %240, %235
  %pgocount22 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 18)
  %249 = add i64 %pgocount22, 1
  store i64 %249, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 18)
  br label %250

; <label>:250:                                    ; preds = %248, %230
  %251 = getelementptr inbounds [18 x i8], [18 x i8]* %12, i32 0, i32 0
  %252 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %253 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %252, i32 0, i32 0
  %254 = load i32, i32* %253, align 8
  %255 = sub i32 %254, 1
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds [3 x i8*], [3 x i8*]* @show_status.layer_str, i64 0, i64 %256
  %258 = load i8*, i8** %257, align 8
  %259 = load %struct.stats*, %struct.stats** %5, align 8
  %260 = getelementptr inbounds %struct.stats, %struct.stats* %259, i32 0, i32 12
  %261 = load i32, i32* %260, align 8
  %262 = icmp ne i32 %261, 0
  %263 = zext i1 %262 to i64
  %pgocount23 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 27)
  %264 = add i64 %pgocount23, %263
  store i64 %264, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 27)
  %265 = select i1 %262, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i32 0, i32 0)
  %266 = load %struct.stats*, %struct.stats** %5, align 8
  %267 = getelementptr inbounds %struct.stats, %struct.stats* %266, i32 0, i32 12
  %268 = load i32, i32* %267, align 8
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %270, label %282

; <label>:270:                                    ; preds = %250
  %pgocount24 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 16)
  %271 = add i64 %pgocount24, 1
  store i64 %271, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 16)
  %272 = load %struct.stats*, %struct.stats** %5, align 8
  %273 = getelementptr inbounds %struct.stats, %struct.stats* %272, i32 0, i32 15
  %274 = load i64, i64* %273, align 8
  %275 = mul i64 %274, 2
  %276 = load %struct.stats*, %struct.stats** %5, align 8
  %277 = getelementptr inbounds %struct.stats, %struct.stats* %276, i32 0, i32 14
  %278 = load i64, i64* %277, align 8
  %279 = udiv i64 %275, %278
  %280 = add i64 %279, 1
  %281 = udiv i64 %280, 2
  br label %288

; <label>:282:                                    ; preds = %250
  %pgocount25 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 20)
  %283 = add i64 %pgocount25, 1
  store i64 %283, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 20)
  %284 = load %struct.stats*, %struct.stats** %5, align 8
  %285 = getelementptr inbounds %struct.stats, %struct.stats* %284, i32 0, i32 13
  %286 = load i32, i32* %285, align 4
  %287 = zext i32 %286 to i64
  br label %288

; <label>:288:                                    ; preds = %282, %270
  %289 = phi i64 [ %281, %270 ], [ %287, %282 ]
  %290 = load %struct.stats*, %struct.stats** %5, align 8
  %291 = getelementptr inbounds %struct.stats, %struct.stats* %290, i32 0, i32 12
  %292 = load i32, i32* %291, align 8
  %293 = icmp ne i32 %292, 0
  %294 = zext i1 %293 to i64
  %pgocount26 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 28)
  %295 = add i64 %pgocount26, %294
  store i64 %295, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 28)
  %296 = select i1 %293, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i32 0, i32 0)
  %297 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %298 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %297, i32 0, i32 5
  %299 = load i32, i32* %298, align 8
  %300 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %301 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %300, i32 0, i32 1
  %302 = load i32, i32* %301, align 4
  %303 = zext i32 %302 to i64
  %304 = getelementptr inbounds [4 x i8*], [4 x i8*]* @show_status.mode_str, i64 0, i64 %303
  %305 = load i8*, i8** %304, align 8
  %306 = load i8*, i8** %13, align 8
  %307 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %308 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %307, i32 0, i32 8
  %309 = load i32, i32* %308, align 8
  %310 = and i32 %309, 16
  %311 = icmp ne i32 %310, 0
  %312 = zext i1 %311 to i64
  %pgocount27 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 29)
  %313 = add i64 %pgocount27, %312
  store i64 %313, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 29)
  %314 = select i1 %311, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.37, i32 0, i32 0)
  %315 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.33, i32 0, i32 0), i8* %251, i8* %258, i8* %265, i64 %289, i8* %296, i32 %299, i8* %305, i8* %306, i8* %314)
  br label %320

; <label>:316:                                    ; preds = %227
  %pgocount28 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 17)
  %317 = add i64 %pgocount28, 1
  store i64 %317, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 17)
  %318 = getelementptr inbounds [18 x i8], [18 x i8]* %12, i32 0, i32 0
  %319 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.38, i32 0, i32 0), i8* %318)
  br label %320

; <label>:320:                                    ; preds = %316, %288
  br label %321

; <label>:321:                                    ; preds = %320, %223
  br label %322

; <label>:322:                                    ; preds = %321, %94
  %pgocount29 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 0)
  %323 = add i64 %pgocount29, 1
  store i64 %323, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_show_status, i64 0, i64 0)
  ret void
}

declare i64 @read(i32, i8*, i64) #2

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #5

declare i32 @fputc(i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #6

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #6

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #2

declare i32 @fflush(%struct._IO_FILE*) #2

declare i64 @mad_timer_count(i64, i64, i32) #2

declare void @mad_timer_negate(%struct.mad_timer_t*) #2

declare void @mad_timer_add(%struct.mad_timer_t*, i64, i64) #2

declare void @mad_timer_string(i64, i64, i8*, i8*, i32, i32, i64) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare void @perror(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

declare i64 @mad_timer_fraction(i64, i64, i64) #2

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind
declare i32 @rand() #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #7

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define internal i32 @play_one(%struct.player*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.player*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.id3_file*, align 8
  %8 = alloca [19 x i8], align 16
  %9 = alloca [7 x i8], align 1
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct.player* %0, %struct.player** %3, align 8
  %13 = load %struct.player*, %struct.player** %3, align 8
  %14 = getelementptr inbounds %struct.player, %struct.player* %13, i32 0, i32 4
  %15 = getelementptr inbounds %struct.playlist, %struct.playlist* %14, i32 0, i32 0
  %16 = load i8**, i8*** %15, align 8
  %17 = load %struct.player*, %struct.player** %3, align 8
  %18 = getelementptr inbounds %struct.player, %struct.player* %17, i32 0, i32 4
  %19 = getelementptr inbounds %struct.playlist, %struct.playlist* %18, i32 0, i32 2
  %20 = load i32, i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8*, i8** %16, i64 %21
  %23 = load i8*, i8** %22, align 8
  store i8* %23, i8** %4, align 8
  %24 = load i8*, i8** %4, align 8
  %25 = call i32 @strcmp(i8* %24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.46, i32 0, i32 0)) #10
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %40

; <label>:27:                                     ; preds = %1
  %28 = call i32 @isatty(i32 0) #6
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 2)
  call void (i8*, i8*, ...) @error(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.47, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.49, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %214

; <label>:32:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 6)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 6)
  %34 = load %struct.player*, %struct.player** %3, align 8
  %35 = getelementptr inbounds %struct.player, %struct.player* %34, i32 0, i32 10
  %36 = getelementptr inbounds %struct.input, %struct.input* %35, i32 0, i32 0
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.48, i32 0, i32 0), i8** %36, align 8
  %37 = load %struct.player*, %struct.player** %3, align 8
  %38 = getelementptr inbounds %struct.player, %struct.player* %37, i32 0, i32 10
  %39 = getelementptr inbounds %struct.input, %struct.input* %38, i32 0, i32 1
  store i32 0, i32* %39, align 8
  br label %66

; <label>:40:                                     ; preds = %1
  %41 = load i8*, i8** %4, align 8
  %42 = load %struct.player*, %struct.player** %3, align 8
  %43 = getelementptr inbounds %struct.player, %struct.player* %42, i32 0, i32 10
  %44 = getelementptr inbounds %struct.input, %struct.input* %43, i32 0, i32 0
  store i8* %41, i8** %44, align 8
  %45 = load %struct.player*, %struct.player** %3, align 8
  %46 = getelementptr inbounds %struct.player, %struct.player* %45, i32 0, i32 10
  %47 = getelementptr inbounds %struct.input, %struct.input* %46, i32 0, i32 0
  %48 = load i8*, i8** %47, align 8
  %49 = call i32 (i8*, i32, ...) @open(i8* %48, i32 0)
  %50 = load %struct.player*, %struct.player** %3, align 8
  %51 = getelementptr inbounds %struct.player, %struct.player* %50, i32 0, i32 10
  %52 = getelementptr inbounds %struct.input, %struct.input* %51, i32 0, i32 1
  store i32 %49, i32* %52, align 8
  %53 = load %struct.player*, %struct.player** %3, align 8
  %54 = getelementptr inbounds %struct.player, %struct.player* %53, i32 0, i32 10
  %55 = getelementptr inbounds %struct.input, %struct.input* %54, i32 0, i32 1
  %56 = load i32, i32* %55, align 8
  %57 = icmp eq i32 %56, -1
  br i1 %57, label %58, label %64

; <label>:58:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 3)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 3)
  %60 = load %struct.player*, %struct.player** %3, align 8
  %61 = getelementptr inbounds %struct.player, %struct.player* %60, i32 0, i32 10
  %62 = getelementptr inbounds %struct.input, %struct.input* %61, i32 0, i32 0
  %63 = load i8*, i8** %62, align 8
  call void (i8*, i8*, ...) @error(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* %63)
  store i32 -1, i32* %2, align 4
  br label %214

; <label>:64:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 0)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 0)
  br label %66

; <label>:66:                                     ; preds = %64, %32
  %67 = load %struct.player*, %struct.player** %3, align 8
  %68 = getelementptr inbounds %struct.player, %struct.player* %67, i32 0, i32 1
  %69 = load i32, i32* %68, align 4
  %70 = and i32 %69, -129
  store i32 %70, i32* %68, align 4
  %71 = load %struct.player*, %struct.player** %3, align 8
  %72 = getelementptr inbounds %struct.player, %struct.player* %71, i32 0, i32 0
  %73 = load i32, i32* %72, align 8
  %74 = icmp sge i32 %73, 0
  br i1 %74, label %75, label %112

; <label>:75:                                     ; preds = %66
  %76 = load %struct.player*, %struct.player** %3, align 8
  %77 = getelementptr inbounds %struct.player, %struct.player* %76, i32 0, i32 4
  %78 = getelementptr inbounds %struct.playlist, %struct.playlist* %77, i32 0, i32 1
  %79 = load i32, i32* %78, align 8
  %80 = icmp sgt i32 %79, 1
  br i1 %80, label %81, label %88

; <label>:81:                                     ; preds = %75
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 7)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 7)
  %83 = load %struct.player*, %struct.player** %3, align 8
  %84 = getelementptr inbounds %struct.player, %struct.player* %83, i32 0, i32 10
  %85 = getelementptr inbounds %struct.input, %struct.input* %84, i32 0, i32 0
  %86 = load i8*, i8** %85, align 8
  %87 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.50, i32 0, i32 0), i8* %86)
  br label %88

; <label>:88:                                     ; preds = %81, %75
  %89 = load %struct.player*, %struct.player** %3, align 8
  %90 = getelementptr inbounds %struct.player, %struct.player* %89, i32 0, i32 10
  %91 = getelementptr inbounds %struct.input, %struct.input* %90, i32 0, i32 1
  %92 = load i32, i32* %91, align 8
  %93 = call i32 @dup(i32 %92) #6
  store i32 %93, i32* %6, align 4
  %94 = load i32, i32* %6, align 4
  %95 = call %struct.id3_file* @id3_file_fdopen(i32 %94, i32 0)
  store %struct.id3_file* %95, %struct.id3_file** %7, align 8
  %96 = load %struct.id3_file*, %struct.id3_file** %7, align 8
  %97 = icmp eq %struct.id3_file* %96, null
  br i1 %97, label %98, label %106

; <label>:98:                                     ; preds = %88
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 9)
  %99 = add i64 %pgocount5, 1
  store i64 %99, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 9)
  %100 = load i32, i32* %6, align 4
  %101 = call i32 @close(i32 %100)
  %102 = load %struct.player*, %struct.player** %3, align 8
  %103 = getelementptr inbounds %struct.player, %struct.player* %102, i32 0, i32 1
  %104 = load i32, i32* %103, align 4
  %105 = or i32 %104, 128
  store i32 %105, i32* %103, align 4
  br label %111

; <label>:106:                                    ; preds = %88
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 5)
  %107 = add i64 %pgocount6, 1
  store i64 %107, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 5)
  %108 = load %struct.id3_file*, %struct.id3_file** %7, align 8
  %109 = call %struct.id3_tag* @id3_file_tag(%struct.id3_file* %108)
  call void @show_id3(%struct.id3_tag* %109)
  %110 = load %struct.id3_file*, %struct.id3_file** %7, align 8
  call void @id3_file_close(%struct.id3_file* %110)
  br label %111

; <label>:111:                                    ; preds = %106, %98
  br label %112

; <label>:112:                                    ; preds = %111, %66
  %113 = load %struct.player*, %struct.player** %3, align 8
  %114 = call i32 @decode(%struct.player* %113)
  store i32 %114, i32* %5, align 4
  %115 = load i32, i32* %5, align 4
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %188

; <label>:117:                                    ; preds = %112
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 4)
  %118 = add i64 %pgocount7, 1
  store i64 %118, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 4)
  %119 = load %struct.player*, %struct.player** %3, align 8
  %120 = getelementptr inbounds %struct.player, %struct.player* %119, i32 0, i32 0
  %121 = load i32, i32* %120, align 8
  %122 = icmp sge i32 %121, 0
  br i1 %122, label %123, label %188

; <label>:123:                                    ; preds = %117
  %124 = load %struct.player*, %struct.player** %3, align 8
  %125 = getelementptr inbounds %struct.player, %struct.player* %124, i32 0, i32 12
  %126 = getelementptr inbounds %struct.stats, %struct.stats* %125, i32 0, i32 6
  %127 = getelementptr inbounds [19 x i8], [19 x i8]* %8, i32 0, i32 0
  %128 = bitcast %struct.mad_timer_t* %126 to { i64, i64 }*
  %129 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %128, i32 0, i32 0
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %128, i32 0, i32 1
  %132 = load i64, i64* %131, align 8
  call void @mad_timer_string(i64 %130, i64 %132, i8* %127, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.51, i32 0, i32 0), i32 -2, i32 10, i64 0)
  %133 = getelementptr inbounds [19 x i8], [19 x i8]* %8, i32 0, i32 0
  %134 = call i8* @strchr(i8* %133, i32 46) #10
  store i8* %134, i8** %12, align 8
  %135 = load i8*, i8** %12, align 8
  %136 = icmp ne i8* %135, null
  br i1 %136, label %137, label %144

; <label>:137:                                    ; preds = %123
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 10)
  %138 = add i64 %pgocount8, 1
  store i64 %138, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 10)
  %139 = call %struct.lconv* @localeconv() #6
  %140 = getelementptr inbounds %struct.lconv, %struct.lconv* %139, i32 0, i32 0
  %141 = load i8*, i8** %140, align 8
  %142 = load i8, i8* %141, align 1
  %143 = load i8*, i8** %12, align 8
  store i8 %142, i8* %143, align 1
  br label %144

; <label>:144:                                    ; preds = %137, %123
  %145 = load %struct.player*, %struct.player** %3, align 8
  %146 = getelementptr inbounds %struct.player, %struct.player* %145, i32 0, i32 12
  %147 = getelementptr inbounds %struct.stats, %struct.stats* %146, i32 0, i32 17
  %148 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %147, i32 0, i32 1
  %149 = load i32, i32* %148, align 8
  %150 = add nsw i32 268435456, %149
  store i32 %150, i32* %11, align 4
  %151 = load i32, i32* %11, align 4
  %152 = icmp eq i32 %151, 268435456
  br i1 %152, label %153, label %160

; <label>:153:                                    ; preds = %144
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 12)
  %154 = add i64 %pgocount9, 1
  store i64 %154, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 12)
  %155 = load %struct.player*, %struct.player** %3, align 8
  %156 = getelementptr inbounds %struct.player, %struct.player* %155, i32 0, i32 12
  %157 = getelementptr inbounds %struct.stats, %struct.stats* %156, i32 0, i32 17
  %158 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %157, i32 0, i32 2
  %159 = load i32, i32* %158, align 4
  store i32 %159, i32* %11, align 4
  br label %160

; <label>:160:                                    ; preds = %153, %144
  %161 = load i32, i32* %11, align 4
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %163, label %165

; <label>:163:                                    ; preds = %160
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 14)
  %164 = add i64 %pgocount10, 1
  store i64 %164, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 14)
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i32 0, i32 0), i8** %10, align 8
  br label %175

; <label>:165:                                    ; preds = %160
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 11)
  %166 = add i64 %pgocount11, 1
  store i64 %166, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 11)
  %167 = getelementptr inbounds [7 x i8], [7 x i8]* %9, i32 0, i32 0
  %168 = load i32, i32* %11, align 4
  %169 = sitofp i32 %168 to double
  %170 = fdiv double %169, 0x41B0000000000000
  %171 = call double @log10(double %170) #6
  %172 = fmul double 2.000000e+01, %171
  %173 = call i32 (i8*, i8*, ...) @sprintf(i8* %167, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.53, i32 0, i32 0), double %172) #6
  %174 = getelementptr inbounds [7 x i8], [7 x i8]* %9, i32 0, i32 0
  store i8* %174, i8** %10, align 8
  br label %175

; <label>:175:                                    ; preds = %165, %163
  %176 = load %struct.player*, %struct.player** %3, align 8
  %177 = getelementptr inbounds %struct.player, %struct.player* %176, i32 0, i32 12
  %178 = getelementptr inbounds %struct.stats, %struct.stats* %177, i32 0, i32 9
  %179 = load i64, i64* %178, align 8
  %180 = getelementptr inbounds [19 x i8], [19 x i8]* %8, i32 0, i32 0
  %181 = load i8*, i8** %10, align 8
  %182 = load %struct.player*, %struct.player** %3, align 8
  %183 = getelementptr inbounds %struct.player, %struct.player* %182, i32 0, i32 12
  %184 = getelementptr inbounds %struct.stats, %struct.stats* %183, i32 0, i32 17
  %185 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %184, i32 0, i32 0
  %186 = load i64, i64* %185, align 8
  %187 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.54, i32 0, i32 0), i64 %179, i8* %180, i8* %181, i64 %186)
  br label %188

; <label>:188:                                    ; preds = %175, %117, %112
  %189 = load %struct.player*, %struct.player** %3, align 8
  %190 = getelementptr inbounds %struct.player, %struct.player* %189, i32 0, i32 10
  %191 = getelementptr inbounds %struct.input, %struct.input* %190, i32 0, i32 1
  %192 = load i32, i32* %191, align 8
  %193 = icmp ne i32 %192, 0
  br i1 %193, label %194, label %212

; <label>:194:                                    ; preds = %188
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 1)
  %195 = add i64 %pgocount12, 1
  store i64 %195, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 1)
  %196 = load %struct.player*, %struct.player** %3, align 8
  %197 = getelementptr inbounds %struct.player, %struct.player* %196, i32 0, i32 10
  %198 = getelementptr inbounds %struct.input, %struct.input* %197, i32 0, i32 1
  %199 = load i32, i32* %198, align 8
  %200 = call i32 @close(i32 %199)
  %201 = icmp eq i32 %200, -1
  br i1 %201, label %202, label %212

; <label>:202:                                    ; preds = %194
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 8)
  %203 = add i64 %pgocount13, 1
  store i64 %203, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 8)
  %204 = load i32, i32* %5, align 4
  %205 = icmp eq i32 %204, 0
  br i1 %205, label %206, label %212

; <label>:206:                                    ; preds = %202
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 13)
  %207 = add i64 %pgocount14, 1
  store i64 %207, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_play_one, i64 0, i64 13)
  %208 = load %struct.player*, %struct.player** %3, align 8
  %209 = getelementptr inbounds %struct.player, %struct.player* %208, i32 0, i32 10
  %210 = getelementptr inbounds %struct.input, %struct.input* %209, i32 0, i32 0
  %211 = load i8*, i8** %210, align 8
  call void (i8*, i8*, ...) @error(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* %211)
  store i32 -1, i32* %5, align 4
  br label %212

; <label>:212:                                    ; preds = %206, %202, %194, %188
  %213 = load i32, i32* %5, align 4
  store i32 %213, i32* %2, align 4
  br label %214

; <label>:214:                                    ; preds = %212, %58, %30
  %215 = load i32, i32* %2, align 4
  ret i32 %215
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #5

; Function Attrs: nounwind
declare i32 @isatty(i32) #3

; Function Attrs: nounwind
declare i32 @dup(i32) #3

declare %struct.id3_file* @id3_file_fdopen(i32, i32) #2

declare i32 @close(i32) #2

; Function Attrs: nounwind uwtable
define internal void @show_id3(%struct.id3_tag*) #0 {
  %2 = alloca %struct.id3_tag*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.id3_frame*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %union.id3_field*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i32, align 4
  store %struct.id3_tag* %0, %struct.id3_tag** %2, align 8
  store i32 0, i32* %3, align 4
  br label %18

; <label>:18:                                     ; preds = %163, %1
  %19 = load i32, i32* %3, align 4
  %20 = zext i32 %19 to i64
  %21 = icmp ult i64 %20, 16
  br i1 %21, label %22, label %166

; <label>:22:                                     ; preds = %18
  %23 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %24 = load i32, i32* %3, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [16 x %struct.anon.15], [16 x %struct.anon.15]* @show_id3.info, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %26, i32 0, i32 0
  %28 = load i8*, i8** %27, align 16
  %29 = call %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag* %23, i8* %28, i32 0)
  store %struct.id3_frame* %29, %struct.id3_frame** %4, align 8
  %30 = load %struct.id3_frame*, %struct.id3_frame** %4, align 8
  %31 = icmp eq %struct.id3_frame* %30, null
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 10)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 10)
  br label %163

; <label>:34:                                     ; preds = %22
  %35 = load %struct.id3_frame*, %struct.id3_frame** %4, align 8
  %36 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %35, i32 0, i32 10
  %37 = load %union.id3_field*, %union.id3_field** %36, align 8
  %38 = getelementptr inbounds %union.id3_field, %union.id3_field* %37, i64 1
  store %union.id3_field* %38, %union.id3_field** %7, align 8
  %39 = load %union.id3_field*, %union.id3_field** %7, align 8
  %40 = call i32 @id3_field_getnstrings(%union.id3_field* %39)
  store i32 %40, i32* %8, align 4
  %41 = load i32, i32* %3, align 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds [16 x %struct.anon.15], [16 x %struct.anon.15]* @show_id3.info, i64 0, i64 %42
  %44 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %43, i32 0, i32 1
  %45 = load i8*, i8** %44, align 8
  store i8* %45, i8** %11, align 8
  %46 = load i8*, i8** %11, align 8
  %47 = icmp ne i8* %46, null
  br i1 %47, label %48, label %51

; <label>:48:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 9)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 9)
  %50 = load i8*, i8** %11, align 8
  store i8* %50, i8** %11, align 8
  br label %51

; <label>:51:                                     ; preds = %48, %34
  %52 = load i8*, i8** %11, align 8
  %53 = icmp ne i8* %52, null
  br i1 %53, label %54, label %57

; <label>:54:                                     ; preds = %51
  %55 = load i8*, i8** %11, align 8
  %56 = call i64 @strlen(i8* %55) #10
  br label %59

; <label>:57:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 13)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 13)
  br label %59

; <label>:59:                                     ; preds = %57, %54
  %60 = phi i64 [ %56, %54 ], [ 0, %57 ]
  %61 = trunc i64 %60 to i32
  store i32 %61, i32* %9, align 4
  %62 = load i32, i32* %9, align 4
  %63 = zext i32 %62 to i64
  %64 = icmp ult i64 %63, 11
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %59
  br label %69

; <label>:66:                                     ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 25)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 25)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.84, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i32 554, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__PRETTY_FUNCTION__.show_id3, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %69

; <label>:69:                                     ; preds = %68, %65
  store i32 0, i32* %10, align 4
  br label %70

; <label>:70:                                     ; preds = %158, %69
  %71 = load i32, i32* %10, align 4
  %72 = load i32, i32* %8, align 4
  %73 = icmp ult i32 %71, %72
  br i1 %73, label %74, label %161

; <label>:74:                                     ; preds = %70
  %75 = load %union.id3_field*, %union.id3_field** %7, align 8
  %76 = load i32, i32* %10, align 4
  %77 = call i64* @id3_field_getstrings(%union.id3_field* %75, i32 %76)
  store i64* %77, i64** %5, align 8
  %78 = load i64*, i64** %5, align 8
  %79 = icmp ne i64* %78, null
  br i1 %79, label %80, label %81

; <label>:80:                                     ; preds = %74
  br label %84

; <label>:81:                                     ; preds = %74
  %pgocount5 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 24)
  %82 = add i64 %pgocount5, 1
  store i64 %82, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 24)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i32 558, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__PRETTY_FUNCTION__.show_id3, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %84

; <label>:84:                                     ; preds = %83, %80
  %85 = load i32, i32* %3, align 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds [16 x %struct.anon.15], [16 x %struct.anon.15]* @show_id3.info, i64 0, i64 %86
  %88 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %87, i32 0, i32 0
  %89 = load i8*, i8** %88, align 16
  %90 = call i32 @strcmp(i8* %89, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.78, i32 0, i32 0)) #10
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %96

; <label>:92:                                     ; preds = %84
  %pgocount6 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 2)
  %93 = add i64 %pgocount6, 1
  store i64 %93, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 2)
  %94 = load i64*, i64** %5, align 8
  %95 = call i64* @id3_genre_name(i64* %94)
  store i64* %95, i64** %5, align 8
  br label %96

; <label>:96:                                     ; preds = %92, %84
  %97 = load i64*, i64** %5, align 8
  %98 = call i8* @id3_ucs4_latin1duplicate(i64* %97)
  store i8* %98, i8** %6, align 8
  %99 = load i8*, i8** %6, align 8
  %100 = icmp eq i8* %99, null
  br i1 %100, label %101, label %103

; <label>:101:                                    ; preds = %96
  %pgocount7 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 12)
  %102 = add i64 %pgocount7, 1
  store i64 %102, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 12)
  br label %309

; <label>:103:                                    ; preds = %96
  %pgocount8 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 7)
  %104 = add i64 %pgocount8, 1
  store i64 %104, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 7)
  %105 = load i32, i32* %10, align 4
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %108, label %._crit_edge1

._crit_edge1:                                     ; preds = %103
  %pgocount9 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 6)
  %107 = add i64 %pgocount9, 1
  store i64 %107, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 6)
  br label %119

; <label>:108:                                    ; preds = %103
  %109 = load i8*, i8** %11, align 8
  %110 = icmp ne i8* %109, null
  br i1 %110, label %111, label %119

; <label>:111:                                    ; preds = %108
  %pgocount10 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 5)
  %112 = add i64 %pgocount10, 1
  store i64 %112, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 5)
  %113 = load i32, i32* %9, align 4
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds [11 x i8], [11 x i8]* @show_id3.spaces, i64 0, i64 %114
  %116 = load i8*, i8** %11, align 8
  %117 = load i8*, i8** %6, align 8
  %118 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.87, i32 0, i32 0), i8* %115, i8* %116, i8* %117)
  br label %156

; <label>:119:                                    ; preds = %._crit_edge1, %108
  %120 = load i32, i32* %3, align 4
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds [16 x %struct.anon.15], [16 x %struct.anon.15]* @show_id3.info, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %122, i32 0, i32 0
  %124 = load i8*, i8** %123, align 16
  %125 = call i32 @strcmp(i8* %124, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.58, i32 0, i32 0)) #10
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %136, label %127

; <label>:127:                                    ; preds = %119
  %128 = load i32, i32* %3, align 4
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds [16 x %struct.anon.15], [16 x %struct.anon.15]* @show_id3.info, i64 0, i64 %129
  %131 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %130, i32 0, i32 0
  %132 = load i8*, i8** %131, align 16
  %133 = call i32 @strcmp(i8* %132, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0)) #10
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %._crit_edge, label %151

._crit_edge:                                      ; preds = %127
  %pgocount11 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 1)
  %135 = add i64 %pgocount11, 1
  store i64 %135, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 1)
  br label %136

; <label>:136:                                    ; preds = %._crit_edge, %119
  %137 = load i32, i32* %3, align 4
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds [16 x %struct.anon.15], [16 x %struct.anon.15]* @show_id3.info, i64 0, i64 %138
  %140 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %139, i32 0, i32 0
  %141 = load i8*, i8** %140, align 16
  %142 = getelementptr inbounds i8, i8* %141, i64 1
  %143 = load i8, i8* %142, align 1
  %144 = sext i8 %143 to i32
  %145 = icmp eq i32 %144, 67
  %146 = zext i1 %145 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 29)
  %147 = add i64 %pgocount12, %146
  store i64 %147, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 29)
  %148 = select i1 %145, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.89, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.90, i32 0, i32 0)
  %149 = load i8*, i8** %6, align 8
  %150 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.88, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @show_id3.spaces, i32 0, i32 0), i8* %148, i8* %149)
  br label %155

; <label>:151:                                    ; preds = %127
  %pgocount13 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 3)
  %152 = add i64 %pgocount13, 1
  store i64 %152, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 3)
  %153 = load i8*, i8** %6, align 8
  %154 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.91, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @show_id3.spaces, i32 0, i32 0), i8* %153)
  br label %155

; <label>:155:                                    ; preds = %151, %136
  br label %156

; <label>:156:                                    ; preds = %155, %111
  %157 = load i8*, i8** %6, align 8
  call void @free(i8* %157) #6
  br label %158

; <label>:158:                                    ; preds = %156
  %159 = load i32, i32* %10, align 4
  %160 = add i32 %159, 1
  store i32 %160, i32* %10, align 4
  br label %70

; <label>:161:                                    ; preds = %70
  %pgocount14 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 11)
  %162 = add i64 %pgocount14, 1
  store i64 %162, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 11)
  br label %163

; <label>:163:                                    ; preds = %161, %32
  %164 = load i32, i32* %3, align 4
  %165 = add i32 %164, 1
  store i32 %165, i32* %3, align 4
  br label %18

; <label>:166:                                    ; preds = %18
  %pgocount15 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 20)
  %167 = add i64 %pgocount15, 1
  store i64 %167, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 20)
  store i32 0, i32* %3, align 4
  br label %168

; <label>:168:                                    ; preds = %190, %166
  %169 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %170 = load i32, i32* %3, align 4
  %171 = add i32 %170, 1
  store i32 %171, i32* %3, align 4
  %172 = call %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag* %169, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.92, i32 0, i32 0), i32 %170)
  store %struct.id3_frame* %172, %struct.id3_frame** %4, align 8
  %173 = icmp ne %struct.id3_frame* %172, null
  br i1 %173, label %174, label %306

; <label>:174:                                    ; preds = %168
  store i32 1, i32* %14, align 4
  %175 = load %struct.id3_frame*, %struct.id3_frame** %4, align 8
  %176 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %175, i32 0, i32 10
  %177 = load %union.id3_field*, %union.id3_field** %176, align 8
  %178 = getelementptr inbounds %union.id3_field, %union.id3_field* %177, i64 2
  %179 = call i64* @id3_field_getstring(%union.id3_field* %178)
  store i64* %179, i64** %5, align 8
  %180 = load i64*, i64** %5, align 8
  %181 = icmp ne i64* %180, null
  br i1 %181, label %182, label %183

; <label>:182:                                    ; preds = %174
  br label %186

; <label>:183:                                    ; preds = %174
  %pgocount16 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 26)
  %184 = add i64 %pgocount16, 1
  store i64 %184, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 26)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i32 591, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__PRETTY_FUNCTION__.show_id3, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %186

; <label>:186:                                    ; preds = %185, %182
  %187 = load i64*, i64** %5, align 8
  %188 = load i64, i64* %187, align 8
  %189 = icmp ne i64 %188, 0
  br i1 %189, label %190, label %192

; <label>:190:                                    ; preds = %186
  %pgocount17 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 8)
  %191 = add i64 %pgocount17, 1
  store i64 %191, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 8)
  br label %168

; <label>:192:                                    ; preds = %186
  %193 = load %struct.id3_frame*, %struct.id3_frame** %4, align 8
  %194 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %193, i32 0, i32 10
  %195 = load %union.id3_field*, %union.id3_field** %194, align 8
  %196 = getelementptr inbounds %union.id3_field, %union.id3_field* %195, i64 3
  %197 = call i64* @id3_field_getfullstring(%union.id3_field* %196)
  store i64* %197, i64** %5, align 8
  %198 = load i64*, i64** %5, align 8
  %199 = icmp ne i64* %198, null
  br i1 %199, label %200, label %201

; <label>:200:                                    ; preds = %192
  br label %204

; <label>:201:                                    ; preds = %192
  %pgocount18 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 28)
  %202 = add i64 %pgocount18, 1
  store i64 %202, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 28)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i32 597, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__PRETTY_FUNCTION__.show_id3, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %204

; <label>:204:                                    ; preds = %203, %200
  %205 = load i64*, i64** %5, align 8
  %206 = call i8* @id3_ucs4_latin1duplicate(i64* %205)
  store i8* %206, i8** %6, align 8
  %207 = load i8*, i8** %6, align 8
  %208 = icmp eq i8* %207, null
  br i1 %208, label %209, label %211

; <label>:209:                                    ; preds = %204
  %pgocount19 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 23)
  %210 = add i64 %pgocount19, 1
  store i64 %210, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 23)
  br label %309

; <label>:211:                                    ; preds = %204
  %212 = load i8*, i8** %6, align 8
  store i8* %212, i8** %12, align 8
  br label %213

; <label>:213:                                    ; preds = %291, %211
  %214 = load i8*, i8** %12, align 8
  %215 = load i8, i8* %214, align 1
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %217, label %303

; <label>:217:                                    ; preds = %213
  %218 = load i8*, i8** %12, align 8
  %219 = call i8* @strchr(i8* %218, i32 10) #10
  store i8* %219, i8** %13, align 8
  %220 = load i8*, i8** %13, align 8
  %221 = icmp ne i8* %220, null
  br i1 %221, label %222, label %225

; <label>:222:                                    ; preds = %217
  %pgocount20 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 14)
  %223 = add i64 %pgocount20, 1
  store i64 %223, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 14)
  %224 = load i8*, i8** %13, align 8
  store i8 0, i8* %224, align 1
  br label %225

; <label>:225:                                    ; preds = %222, %217
  %226 = load i8*, i8** %12, align 8
  %227 = call i64 @strlen(i8* %226) #10
  %228 = icmp ugt i64 %227, 66
  br i1 %228, label %229, label %265

; <label>:229:                                    ; preds = %225
  %230 = load i8*, i8** %12, align 8
  %231 = getelementptr inbounds i8, i8* %230, i64 66
  store i8* %231, i8** %15, align 8
  br label %232

; <label>:232:                                    ; preds = %244, %229
  %233 = load i8*, i8** %15, align 8
  %234 = load i8*, i8** %12, align 8
  %235 = icmp ugt i8* %233, %234
  br i1 %235, label %236, label %242

; <label>:236:                                    ; preds = %232
  %pgocount21 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 4)
  %237 = add i64 %pgocount21, 1
  store i64 %237, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 4)
  %238 = load i8*, i8** %15, align 8
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = icmp ne i32 %240, 32
  br label %242

; <label>:242:                                    ; preds = %236, %232
  %243 = phi i1 [ false, %232 ], [ %241, %236 ]
  br i1 %243, label %244, label %248

; <label>:244:                                    ; preds = %242
  %pgocount22 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 0)
  %245 = add i64 %pgocount22, 1
  store i64 %245, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 0)
  %246 = load i8*, i8** %15, align 8
  %247 = getelementptr inbounds i8, i8* %246, i32 -1
  store i8* %247, i8** %15, align 8
  br label %232

; <label>:248:                                    ; preds = %242
  %249 = load i8*, i8** %15, align 8
  %250 = load i8, i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = icmp eq i32 %251, 32
  br i1 %252, label %253, label %263

; <label>:253:                                    ; preds = %248
  %254 = load i8*, i8** %13, align 8
  %255 = icmp ne i8* %254, null
  br i1 %255, label %256, label %259

; <label>:256:                                    ; preds = %253
  %pgocount23 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 19)
  %257 = add i64 %pgocount23, 1
  store i64 %257, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 19)
  %258 = load i8*, i8** %13, align 8
  store i8 10, i8* %258, align 1
  br label %259

; <label>:259:                                    ; preds = %256, %253
  %pgocount24 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 18)
  %260 = add i64 %pgocount24, 1
  store i64 %260, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 18)
  %261 = load i8*, i8** %15, align 8
  store i8* %261, i8** %13, align 8
  %262 = load i8*, i8** %13, align 8
  store i8 0, i8* %262, align 1
  br label %263

; <label>:263:                                    ; preds = %259, %248
  %pgocount25 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 16)
  %264 = add i64 %pgocount25, 1
  store i64 %264, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 16)
  br label %265

; <label>:265:                                    ; preds = %263, %225
  %266 = load i32, i32* %14, align 4
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %287

; <label>:268:                                    ; preds = %265
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.93, i32 0, i32 0), i8** %16, align 8
  %269 = load i8*, i8** %16, align 8
  %270 = call i64 @strlen(i8* %269) #10
  %271 = trunc i64 %270 to i32
  store i32 %271, i32* %17, align 4
  %272 = load i32, i32* %17, align 4
  %273 = zext i32 %272 to i64
  %274 = icmp ult i64 %273, 11
  br i1 %274, label %275, label %276

; <label>:275:                                    ; preds = %268
  br label %279

; <label>:276:                                    ; preds = %268
  %pgocount26 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 27)
  %277 = add i64 %pgocount26, 1
  store i64 %277, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 27)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.84, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i32 632, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__PRETTY_FUNCTION__.show_id3, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %279

; <label>:279:                                    ; preds = %278, %275
  %pgocount27 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 15)
  %280 = add i64 %pgocount27, 1
  store i64 %280, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 15)
  %281 = load i32, i32* %17, align 4
  %282 = zext i32 %281 to i64
  %283 = getelementptr inbounds [11 x i8], [11 x i8]* @show_id3.spaces, i64 0, i64 %282
  %284 = load i8*, i8** %16, align 8
  %285 = load i8*, i8** %12, align 8
  %286 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.87, i32 0, i32 0), i8* %283, i8* %284, i8* %285)
  store i32 0, i32* %14, align 4
  br label %291

; <label>:287:                                    ; preds = %265
  %pgocount28 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 17)
  %288 = add i64 %pgocount28, 1
  store i64 %288, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 17)
  %289 = load i8*, i8** %12, align 8
  %290 = call i32 (i8*, ...) @message(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.91, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @show_id3.spaces, i32 0, i32 0), i8* %289)
  br label %291

; <label>:291:                                    ; preds = %287, %279
  %292 = load i8*, i8** %12, align 8
  %293 = call i64 @strlen(i8* %292) #10
  %294 = load i8*, i8** %13, align 8
  %295 = icmp ne i8* %294, null
  %296 = zext i1 %295 to i64
  %pgocount29 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 30)
  %297 = add i64 %pgocount29, %296
  store i64 %297, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 30)
  %298 = select i1 %295, i32 1, i32 0
  %299 = sext i32 %298 to i64
  %300 = add i64 %293, %299
  %301 = load i8*, i8** %12, align 8
  %302 = getelementptr inbounds i8, i8* %301, i64 %300
  store i8* %302, i8** %12, align 8
  br label %213

; <label>:303:                                    ; preds = %213
  %pgocount30 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 22)
  %304 = add i64 %pgocount30, 1
  store i64 %304, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 22)
  %305 = load i8*, i8** %6, align 8
  call void @free(i8* %305) #6
  br label %306

; <label>:306:                                    ; preds = %303, %168
  br i1 false, label %307, label %310

; <label>:307:                                    ; preds = %306
  %pgocount31 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 21)
  %308 = add i64 %pgocount31, 1
  store i64 %308, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_show_id3, i64 0, i64 21)
  br label %309

; <label>:309:                                    ; preds = %307, %209, %101
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.95, i32 0, i32 0))
  br label %310

; <label>:310:                                    ; preds = %309, %306
  ret void
}

declare %struct.id3_tag* @id3_file_tag(%struct.id3_file*) #2

declare void @id3_file_close(%struct.id3_file*) #2

; Function Attrs: nounwind uwtable
define internal i32 @decode(%struct.player*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.player*, align 8
  %4 = alloca %struct.stat, align 8
  %5 = alloca %struct.mad_decoder, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.player* %0, %struct.player** %3, align 8
  %8 = load %struct.player*, %struct.player** %3, align 8
  %9 = getelementptr inbounds %struct.player, %struct.player* %8, i32 0, i32 10
  %10 = getelementptr inbounds %struct.input, %struct.input* %9, i32 0, i32 1
  %11 = load i32, i32* %10, align 8
  %12 = call i32 @fstat(i32 %11, %struct.stat* %4) #6
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 0)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.97, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %249

; <label>:16:                                     ; preds = %1
  %17 = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 3
  %18 = load i32, i32* %17, align 8
  %19 = and i32 %18, 61440
  %20 = icmp eq i32 %19, 32768
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 3)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 3)
  %23 = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 8
  %24 = load i64, i64* %23, align 8
  br label %27

; <label>:25:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 4)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 4)
  br label %27

; <label>:27:                                     ; preds = %25, %21
  %28 = phi i64 [ %24, %21 ], [ 0, %25 ]
  %29 = load %struct.player*, %struct.player** %3, align 8
  %30 = getelementptr inbounds %struct.player, %struct.player* %29, i32 0, i32 12
  %31 = getelementptr inbounds %struct.stats, %struct.stats* %30, i32 0, i32 2
  store i64 %28, i64* %31, align 8
  %32 = load %struct.player*, %struct.player** %3, align 8
  %33 = getelementptr inbounds %struct.player, %struct.player* %32, i32 0, i32 12
  %34 = getelementptr inbounds %struct.stats, %struct.stats* %33, i32 0, i32 3
  %35 = bitcast %struct.mad_timer_t* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %36 = load %struct.player*, %struct.player** %3, align 8
  %37 = getelementptr inbounds %struct.player, %struct.player* %36, i32 0, i32 10
  %38 = getelementptr inbounds %struct.input, %struct.input* %37, i32 0, i32 6
  call void @xing_init(%struct.xing* %38)
  %39 = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 3
  %40 = load i32, i32* %39, align 8
  %41 = and i32 %40, 61440
  %42 = icmp eq i32 %41, 32768
  br i1 %42, label %43, label %88

; <label>:43:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 5)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 5)
  %45 = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 8
  %46 = load i64, i64* %45, align 8
  %47 = icmp sgt i64 %46, 0
  br i1 %47, label %48, label %88

; <label>:48:                                     ; preds = %43
  %49 = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 8
  %50 = load i64, i64* %49, align 8
  %51 = load %struct.player*, %struct.player** %3, align 8
  %52 = getelementptr inbounds %struct.player, %struct.player* %51, i32 0, i32 10
  %53 = getelementptr inbounds %struct.input, %struct.input* %52, i32 0, i32 4
  store i64 %50, i64* %53, align 8
  %54 = load %struct.player*, %struct.player** %3, align 8
  %55 = getelementptr inbounds %struct.player, %struct.player* %54, i32 0, i32 10
  %56 = getelementptr inbounds %struct.input, %struct.input* %55, i32 0, i32 1
  %57 = load i32, i32* %56, align 8
  %58 = load %struct.player*, %struct.player** %3, align 8
  %59 = getelementptr inbounds %struct.player, %struct.player* %58, i32 0, i32 10
  %60 = getelementptr inbounds %struct.input, %struct.input* %59, i32 0, i32 4
  %61 = load i64, i64* %60, align 8
  %62 = call i8* @map_file(i32 %57, i64 %61)
  %63 = load %struct.player*, %struct.player** %3, align 8
  %64 = getelementptr inbounds %struct.player, %struct.player* %63, i32 0, i32 10
  %65 = getelementptr inbounds %struct.input, %struct.input* %64, i32 0, i32 2
  store i8* %62, i8** %65, align 8
  %66 = load %struct.player*, %struct.player** %3, align 8
  %67 = getelementptr inbounds %struct.player, %struct.player* %66, i32 0, i32 10
  %68 = getelementptr inbounds %struct.input, %struct.input* %67, i32 0, i32 2
  %69 = load i8*, i8** %68, align 8
  %70 = icmp eq i8* %69, null
  br i1 %70, label %71, label %79

; <label>:71:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 13)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 13)
  %73 = load %struct.player*, %struct.player** %3, align 8
  %74 = getelementptr inbounds %struct.player, %struct.player* %73, i32 0, i32 0
  %75 = load i32, i32* %74, align 8
  %76 = icmp sge i32 %75, 0
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 14)
  %78 = add i64 %pgocount5, 1
  store i64 %78, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 14)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.98, i32 0, i32 0))
  br label %79

; <label>:79:                                     ; preds = %77, %71, %48
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 8)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 8)
  %81 = load %struct.player*, %struct.player** %3, align 8
  %82 = getelementptr inbounds %struct.player, %struct.player* %81, i32 0, i32 10
  %83 = getelementptr inbounds %struct.input, %struct.input* %82, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8
  %85 = load %struct.player*, %struct.player** %3, align 8
  %86 = getelementptr inbounds %struct.player, %struct.player* %85, i32 0, i32 10
  %87 = getelementptr inbounds %struct.input, %struct.input* %86, i32 0, i32 3
  store i8* %84, i8** %87, align 8
  br label %88

; <label>:88:                                     ; preds = %79, %43, %27
  %89 = load %struct.player*, %struct.player** %3, align 8
  %90 = getelementptr inbounds %struct.player, %struct.player* %89, i32 0, i32 10
  %91 = getelementptr inbounds %struct.input, %struct.input* %90, i32 0, i32 3
  %92 = load i8*, i8** %91, align 8
  %93 = icmp eq i8* %92, null
  br i1 %93, label %94, label %111

; <label>:94:                                     ; preds = %88
  %95 = call noalias i8* @malloc(i64 40000) #6
  %96 = load %struct.player*, %struct.player** %3, align 8
  %97 = getelementptr inbounds %struct.player, %struct.player* %96, i32 0, i32 10
  %98 = getelementptr inbounds %struct.input, %struct.input* %97, i32 0, i32 3
  store i8* %95, i8** %98, align 8
  %99 = load %struct.player*, %struct.player** %3, align 8
  %100 = getelementptr inbounds %struct.player, %struct.player* %99, i32 0, i32 10
  %101 = getelementptr inbounds %struct.input, %struct.input* %100, i32 0, i32 3
  %102 = load i8*, i8** %101, align 8
  %103 = icmp eq i8* %102, null
  br i1 %103, label %104, label %106

; <label>:104:                                    ; preds = %94
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 12)
  %105 = add i64 %pgocount7, 1
  store i64 %105, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 12)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.99, i32 0, i32 0))
  store i32 -1, i32* %2, align 4
  br label %249

; <label>:106:                                    ; preds = %94
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 9)
  %107 = add i64 %pgocount8, 1
  store i64 %107, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 9)
  %108 = load %struct.player*, %struct.player** %3, align 8
  %109 = getelementptr inbounds %struct.player, %struct.player* %108, i32 0, i32 10
  %110 = getelementptr inbounds %struct.input, %struct.input* %109, i32 0, i32 4
  store i64 0, i64* %110, align 8
  br label %111

; <label>:111:                                    ; preds = %106, %88
  %112 = load %struct.player*, %struct.player** %3, align 8
  %113 = getelementptr inbounds %struct.player, %struct.player* %112, i32 0, i32 10
  %114 = getelementptr inbounds %struct.input, %struct.input* %113, i32 0, i32 5
  store i32 0, i32* %114, align 8
  %115 = load %struct.player*, %struct.player** %3, align 8
  %116 = getelementptr inbounds %struct.player, %struct.player* %115, i32 0, i32 12
  %117 = getelementptr inbounds %struct.stats, %struct.stats* %116, i32 0, i32 5
  %118 = bitcast %struct.mad_timer_t* %117 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %118, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %119 = load %struct.player*, %struct.player** %3, align 8
  %120 = getelementptr inbounds %struct.player, %struct.player* %119, i32 0, i32 12
  %121 = getelementptr inbounds %struct.stats, %struct.stats* %120, i32 0, i32 6
  %122 = bitcast %struct.mad_timer_t* %121 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* bitcast (%struct.mad_timer_t* @mad_timer_zero to i8*), i64 16, i32 8, i1 false)
  %123 = load %struct.player*, %struct.player** %3, align 8
  %124 = getelementptr inbounds %struct.player, %struct.player* %123, i32 0, i32 12
  %125 = getelementptr inbounds %struct.stats, %struct.stats* %124, i32 0, i32 8
  store i64 0, i64* %125, align 8
  %126 = load %struct.player*, %struct.player** %3, align 8
  %127 = getelementptr inbounds %struct.player, %struct.player* %126, i32 0, i32 12
  %128 = getelementptr inbounds %struct.stats, %struct.stats* %127, i32 0, i32 9
  store i64 0, i64* %128, align 8
  %129 = load %struct.player*, %struct.player** %3, align 8
  %130 = getelementptr inbounds %struct.player, %struct.player* %129, i32 0, i32 12
  %131 = getelementptr inbounds %struct.stats, %struct.stats* %130, i32 0, i32 10
  store i64 -1, i64* %131, align 8
  %132 = load %struct.player*, %struct.player** %3, align 8
  %133 = getelementptr inbounds %struct.player, %struct.player* %132, i32 0, i32 12
  %134 = getelementptr inbounds %struct.stats, %struct.stats* %133, i32 0, i32 12
  store i32 0, i32* %134, align 8
  %135 = load %struct.player*, %struct.player** %3, align 8
  %136 = getelementptr inbounds %struct.player, %struct.player* %135, i32 0, i32 12
  %137 = getelementptr inbounds %struct.stats, %struct.stats* %136, i32 0, i32 13
  store i32 0, i32* %137, align 4
  %138 = load %struct.player*, %struct.player** %3, align 8
  %139 = getelementptr inbounds %struct.player, %struct.player* %138, i32 0, i32 12
  %140 = getelementptr inbounds %struct.stats, %struct.stats* %139, i32 0, i32 14
  store i64 0, i64* %140, align 8
  %141 = load %struct.player*, %struct.player** %3, align 8
  %142 = getelementptr inbounds %struct.player, %struct.player* %141, i32 0, i32 12
  %143 = getelementptr inbounds %struct.stats, %struct.stats* %142, i32 0, i32 15
  store i64 0, i64* %143, align 8
  %144 = load %struct.player*, %struct.player** %3, align 8
  %145 = getelementptr inbounds %struct.player, %struct.player* %144, i32 0, i32 12
  %146 = getelementptr inbounds %struct.stats, %struct.stats* %145, i32 0, i32 17
  %147 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %146, i32 0, i32 0
  store i64 0, i64* %147, align 8
  %148 = load %struct.player*, %struct.player** %3, align 8
  %149 = getelementptr inbounds %struct.player, %struct.player* %148, i32 0, i32 12
  %150 = getelementptr inbounds %struct.stats, %struct.stats* %149, i32 0, i32 17
  %151 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %150, i32 0, i32 1
  store i32 0, i32* %151, align 8
  %152 = load %struct.player*, %struct.player** %3, align 8
  %153 = getelementptr inbounds %struct.player, %struct.player* %152, i32 0, i32 12
  %154 = getelementptr inbounds %struct.stats, %struct.stats* %153, i32 0, i32 17
  %155 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %154, i32 0, i32 2
  store i32 0, i32* %155, align 4
  %156 = load %struct.player*, %struct.player** %3, align 8
  %157 = bitcast %struct.player* %156 to i8*
  %158 = load %struct.player*, %struct.player** %3, align 8
  %159 = getelementptr inbounds %struct.player, %struct.player* %158, i32 0, i32 10
  %160 = getelementptr inbounds %struct.input, %struct.input* %159, i32 0, i32 2
  %161 = load i8*, i8** %160, align 8
  %162 = icmp ne i8* %161, null
  %163 = zext i1 %162 to i64
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 15)
  %164 = add i64 %pgocount9, %163
  store i64 %164, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 15)
  %165 = select i1 %162, i32 (i8*, %struct.mad_stream*)* @decode_input_mmap, i32 (i8*, %struct.mad_stream*)* @decode_input_read
  %166 = load %struct.player*, %struct.player** %3, align 8
  %167 = getelementptr inbounds %struct.player, %struct.player* %166, i32 0, i32 11
  %168 = getelementptr inbounds %struct.output, %struct.output* %167, i32 0, i32 11
  %169 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %168, align 8
  %170 = icmp ne i32 (%union.audio_control*)* %169, null
  %171 = zext i1 %170 to i64
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 16)
  %172 = add i64 %pgocount10, %171
  store i64 %172, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 16)
  %173 = select i1 %170, i32 (i8*, %struct.mad_header*, %struct.mad_pcm*)* @decode_output, i32 (i8*, %struct.mad_header*, %struct.mad_pcm*)* null
  call void @mad_decoder_init(%struct.mad_decoder* %5, i8* %157, i32 (i8*, %struct.mad_stream*)* %165, i32 (i8*, %struct.mad_header*)* @decode_header, i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)* @decode_filter, i32 (i8*, %struct.mad_header*, %struct.mad_pcm*)* %173, i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)* @decode_error, i32 (i8*, i8*, i32*)* null)
  store i32 0, i32* %6, align 4
  %174 = load %struct.player*, %struct.player** %3, align 8
  %175 = getelementptr inbounds %struct.player, %struct.player* %174, i32 0, i32 1
  %176 = load i32, i32* %175, align 4
  %177 = and i32 %176, 2
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %183

; <label>:179:                                    ; preds = %111
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 6)
  %180 = add i64 %pgocount11, 1
  store i64 %180, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 6)
  %181 = load i32, i32* %6, align 4
  %182 = or i32 %181, 2
  store i32 %182, i32* %6, align 4
  br label %183

; <label>:183:                                    ; preds = %179, %111
  %184 = load %struct.player*, %struct.player** %3, align 8
  %185 = getelementptr inbounds %struct.player, %struct.player* %184, i32 0, i32 1
  %186 = load i32, i32* %185, align 4
  %187 = and i32 %186, 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %189, label %193

; <label>:189:                                    ; preds = %183
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 7)
  %190 = add i64 %pgocount12, 1
  store i64 %190, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 7)
  %191 = load i32, i32* %6, align 4
  %192 = or i32 %191, 1
  store i32 %192, i32* %6, align 4
  br label %193

; <label>:193:                                    ; preds = %189, %183
  %194 = load i32, i32* %6, align 4
  %195 = getelementptr inbounds %struct.mad_decoder, %struct.mad_decoder* %5, i32 0, i32 1
  store i32 %194, i32* %195, align 4
  %196 = call i32 @mad_decoder_run(%struct.mad_decoder* %5, i32 0)
  store i32 %196, i32* %7, align 4
  %197 = call i32 @mad_decoder_finish(%struct.mad_decoder* %5)
  %198 = load %struct.player*, %struct.player** %3, align 8
  %199 = getelementptr inbounds %struct.player, %struct.player* %198, i32 0, i32 10
  %200 = getelementptr inbounds %struct.input, %struct.input* %199, i32 0, i32 2
  %201 = load i8*, i8** %200, align 8
  %202 = icmp ne i8* %201, null
  br i1 %202, label %203, label %232

; <label>:203:                                    ; preds = %193
  %204 = load %struct.player*, %struct.player** %3, align 8
  %205 = getelementptr inbounds %struct.player, %struct.player* %204, i32 0, i32 10
  %206 = getelementptr inbounds %struct.input, %struct.input* %205, i32 0, i32 2
  %207 = load i8*, i8** %206, align 8
  %208 = load %struct.player*, %struct.player** %3, align 8
  %209 = getelementptr inbounds %struct.player, %struct.player* %208, i32 0, i32 10
  %210 = getelementptr inbounds %struct.input, %struct.input* %209, i32 0, i32 4
  %211 = load i64, i64* %210, align 8
  %212 = call i32 @unmap_file(i8* %207, i64 %211)
  %213 = icmp eq i32 %212, -1
  br i1 %213, label %214, label %216

; <label>:214:                                    ; preds = %203
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 10)
  %215 = add i64 %pgocount13, 1
  store i64 %215, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 10)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.100, i32 0, i32 0))
  store i32 -1, i32* %7, align 4
  br label %216

; <label>:216:                                    ; preds = %214, %203
  %217 = load %struct.player*, %struct.player** %3, align 8
  %218 = getelementptr inbounds %struct.player, %struct.player* %217, i32 0, i32 10
  %219 = getelementptr inbounds %struct.input, %struct.input* %218, i32 0, i32 2
  store i8* null, i8** %219, align 8
  %220 = load %struct.player*, %struct.player** %3, align 8
  %221 = getelementptr inbounds %struct.player, %struct.player* %220, i32 0, i32 10
  %222 = getelementptr inbounds %struct.input, %struct.input* %221, i32 0, i32 5
  %223 = load i32, i32* %222, align 8
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %230, label %225

; <label>:225:                                    ; preds = %216
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 11)
  %226 = add i64 %pgocount14, 1
  store i64 %226, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 11)
  %227 = load %struct.player*, %struct.player** %3, align 8
  %228 = getelementptr inbounds %struct.player, %struct.player* %227, i32 0, i32 10
  %229 = getelementptr inbounds %struct.input, %struct.input* %228, i32 0, i32 3
  store i8* null, i8** %229, align 8
  br label %230

; <label>:230:                                    ; preds = %225, %216
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 1)
  %231 = add i64 %pgocount15, 1
  store i64 %231, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 1)
  br label %232

; <label>:232:                                    ; preds = %230, %193
  %233 = load %struct.player*, %struct.player** %3, align 8
  %234 = getelementptr inbounds %struct.player, %struct.player* %233, i32 0, i32 10
  %235 = getelementptr inbounds %struct.input, %struct.input* %234, i32 0, i32 3
  %236 = load i8*, i8** %235, align 8
  %237 = icmp ne i8* %236, null
  br i1 %237, label %238, label %247

; <label>:238:                                    ; preds = %232
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 2)
  %239 = add i64 %pgocount16, 1
  store i64 %239, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_decode, i64 0, i64 2)
  %240 = load %struct.player*, %struct.player** %3, align 8
  %241 = getelementptr inbounds %struct.player, %struct.player* %240, i32 0, i32 10
  %242 = getelementptr inbounds %struct.input, %struct.input* %241, i32 0, i32 3
  %243 = load i8*, i8** %242, align 8
  call void @free(i8* %243) #6
  %244 = load %struct.player*, %struct.player** %3, align 8
  %245 = getelementptr inbounds %struct.player, %struct.player* %244, i32 0, i32 10
  %246 = getelementptr inbounds %struct.input, %struct.input* %245, i32 0, i32 3
  store i8* null, i8** %246, align 8
  br label %247

; <label>:247:                                    ; preds = %238, %232
  %248 = load i32, i32* %7, align 4
  store i32 %248, i32* %2, align 4
  br label %249

; <label>:249:                                    ; preds = %247, %104, %14
  %250 = load i32, i32* %2, align 4
  ret i32 %250
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #5

; Function Attrs: nounwind
declare %struct.lconv* @localeconv() #3

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nounwind
declare double @log10(double) #3

declare %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag*, i8*, i32) #2

declare i32 @id3_field_getnstrings(%union.id3_field*) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #7

declare i64* @id3_field_getstrings(%union.id3_field*, i32) #2

declare i64* @id3_genre_name(i64*) #2

declare i8* @id3_ucs4_latin1duplicate(i64*) #2

declare i64* @id3_field_getstring(%union.id3_field*) #2

declare i64* @id3_field_getfullstring(%union.id3_field*) #2

; Function Attrs: nounwind
declare i32 @fstat(i32, %struct.stat*) #3

; Function Attrs: nounwind uwtable
define internal i8* @map_file(i32, i64) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store i32 %0, i32* %4, align 4
  store i64 %1, i64* %5, align 8
  %7 = load i64, i64* %5, align 8
  %8 = load i32, i32* %4, align 4
  %9 = call i8* @mmap(i8* null, i64 %7, i32 1, i32 1, i32 %8, i64 0) #6
  store i8* %9, i8** %6, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = icmp eq i8* %10, inttoptr (i64 -1 to i8*)
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_map_file, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_map_file, i64 0, i64 1)
  store i8* null, i8** %3, align 8
  br label %20

; <label>:14:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_map_file, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_map_file, i64 0, i64 0)
  %16 = load i8*, i8** %6, align 8
  %17 = load i64, i64* %5, align 8
  %18 = call i32 @madvise(i8* %16, i64 %17, i32 2) #6
  %19 = load i8*, i8** %6, align 8
  store i8* %19, i8** %3, align 8
  br label %20

; <label>:20:                                     ; preds = %14, %12
  %21 = load i8*, i8** %3, align 8
  ret i8* %21
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @mad_decoder_init(%struct.mad_decoder*, i8*, i32 (i8*, %struct.mad_stream*)*, i32 (i8*, %struct.mad_header*)*, i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)*, i32 (i8*, %struct.mad_header*, %struct.mad_pcm*)*, i32 (i8*, %struct.mad_stream*, %struct.mad_frame*)*, i32 (i8*, i8*, i32*)*) #2

; Function Attrs: nounwind uwtable
define internal i32 @decode_input_mmap(i8*, %struct.mad_stream*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca %struct.mad_stream*, align 8
  %6 = alloca %struct.player*, align 8
  %7 = alloca %struct.input*, align 8
  %8 = alloca %struct.stat, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store %struct.mad_stream* %1, %struct.mad_stream** %5, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = bitcast i8* %11 to %struct.player*
  store %struct.player* %12, %struct.player** %6, align 8
  %13 = load %struct.player*, %struct.player** %6, align 8
  %14 = getelementptr inbounds %struct.player, %struct.player* %13, i32 0, i32 10
  store %struct.input* %14, %struct.input** %7, align 8
  %15 = load %struct.input*, %struct.input** %7, align 8
  %16 = getelementptr inbounds %struct.input, %struct.input* %15, i32 0, i32 5
  %17 = load i32, i32* %16, align 8
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 0)
  store i32 16, i32* %3, align 4
  br label %161

; <label>:21:                                     ; preds = %2
  %22 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %23 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %22, i32 0, i32 6
  %24 = load i8*, i8** %23, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %152

; <label>:26:                                     ; preds = %21
  %27 = load %struct.input*, %struct.input** %7, align 8
  %28 = getelementptr inbounds %struct.input, %struct.input* %27, i32 0, i32 1
  %29 = load i32, i32* %28, align 8
  %30 = call i32 @fstat(i32 %29, %struct.stat* %8) #6
  %31 = icmp eq i32 %30, -1
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 2)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 2)
  store i32 17, i32* %3, align 4
  br label %161

; <label>:34:                                     ; preds = %26
  %35 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %36 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %35, i32 0, i32 6
  %37 = load i8*, i8** %36, align 8
  %38 = load %struct.input*, %struct.input** %7, align 8
  %39 = getelementptr inbounds %struct.input, %struct.input* %38, i32 0, i32 2
  %40 = load i8*, i8** %39, align 8
  %41 = ptrtoint i8* %37 to i64
  %42 = ptrtoint i8* %40 to i64
  %43 = sub i64 %41, %42
  store i64 %43, i64* %9, align 8
  %44 = getelementptr inbounds %struct.stat, %struct.stat* %8, i32 0, i32 8
  %45 = load i64, i64* %44, align 8
  %46 = load %struct.input*, %struct.input** %7, align 8
  %47 = getelementptr inbounds %struct.input, %struct.input* %46, i32 0, i32 4
  %48 = load i64, i64* %47, align 8
  %49 = icmp ugt i64 %45, %48
  br i1 %49, label %50, label %111

; <label>:50:                                     ; preds = %34
  %51 = load %struct.input*, %struct.input** %7, align 8
  %52 = getelementptr inbounds %struct.input, %struct.input* %51, i32 0, i32 2
  %53 = load i8*, i8** %52, align 8
  %54 = load %struct.input*, %struct.input** %7, align 8
  %55 = getelementptr inbounds %struct.input, %struct.input* %54, i32 0, i32 4
  %56 = load i64, i64* %55, align 8
  %57 = call i32 @unmap_file(i8* %53, i64 %56)
  %58 = icmp eq i32 %57, -1
  br i1 %58, label %59, label %65

; <label>:59:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 5)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 5)
  %61 = load %struct.input*, %struct.input** %7, align 8
  %62 = getelementptr inbounds %struct.input, %struct.input* %61, i32 0, i32 2
  store i8* null, i8** %62, align 8
  %63 = load %struct.input*, %struct.input** %7, align 8
  %64 = getelementptr inbounds %struct.input, %struct.input* %63, i32 0, i32 3
  store i8* null, i8** %64, align 8
  store i32 17, i32* %3, align 4
  br label %161

; <label>:65:                                     ; preds = %50
  %66 = getelementptr inbounds %struct.stat, %struct.stat* %8, i32 0, i32 8
  %67 = load i64, i64* %66, align 8
  %68 = load %struct.input*, %struct.input** %7, align 8
  %69 = getelementptr inbounds %struct.input, %struct.input* %68, i32 0, i32 4
  %70 = load i64, i64* %69, align 8
  %71 = sub i64 %67, %70
  %72 = load %struct.player*, %struct.player** %6, align 8
  %73 = getelementptr inbounds %struct.player, %struct.player* %72, i32 0, i32 12
  %74 = getelementptr inbounds %struct.stats, %struct.stats* %73, i32 0, i32 2
  %75 = load i64, i64* %74, align 8
  %76 = add i64 %75, %71
  store i64 %76, i64* %74, align 8
  %77 = getelementptr inbounds %struct.stat, %struct.stat* %8, i32 0, i32 8
  %78 = load i64, i64* %77, align 8
  %79 = load %struct.input*, %struct.input** %7, align 8
  %80 = getelementptr inbounds %struct.input, %struct.input* %79, i32 0, i32 4
  store i64 %78, i64* %80, align 8
  %81 = load %struct.input*, %struct.input** %7, align 8
  %82 = getelementptr inbounds %struct.input, %struct.input* %81, i32 0, i32 1
  %83 = load i32, i32* %82, align 8
  %84 = load %struct.input*, %struct.input** %7, align 8
  %85 = getelementptr inbounds %struct.input, %struct.input* %84, i32 0, i32 4
  %86 = load i64, i64* %85, align 8
  %87 = call i8* @map_file(i32 %83, i64 %86)
  %88 = load %struct.input*, %struct.input** %7, align 8
  %89 = getelementptr inbounds %struct.input, %struct.input* %88, i32 0, i32 2
  store i8* %87, i8** %89, align 8
  %90 = load %struct.input*, %struct.input** %7, align 8
  %91 = getelementptr inbounds %struct.input, %struct.input* %90, i32 0, i32 2
  %92 = load i8*, i8** %91, align 8
  %93 = icmp eq i8* %92, null
  br i1 %93, label %94, label %98

; <label>:94:                                     ; preds = %65
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 7)
  %95 = add i64 %pgocount3, 1
  store i64 %95, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 7)
  %96 = load %struct.input*, %struct.input** %7, align 8
  %97 = getelementptr inbounds %struct.input, %struct.input* %96, i32 0, i32 3
  store i8* null, i8** %97, align 8
  store i32 17, i32* %3, align 4
  br label %161

; <label>:98:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 4)
  %99 = add i64 %pgocount4, 1
  store i64 %99, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 4)
  %100 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %101 = load %struct.input*, %struct.input** %7, align 8
  %102 = getelementptr inbounds %struct.input, %struct.input* %101, i32 0, i32 2
  %103 = load i8*, i8** %102, align 8
  %104 = load i64, i64* %9, align 8
  %105 = getelementptr inbounds i8, i8* %103, i64 %104
  %106 = load %struct.input*, %struct.input** %7, align 8
  %107 = getelementptr inbounds %struct.input, %struct.input* %106, i32 0, i32 4
  %108 = load i64, i64* %107, align 8
  %109 = load i64, i64* %9, align 8
  %110 = sub i64 %108, %109
  call void @mad_stream_buffer(%struct.mad_stream* %100, i8* %105, i64 %110)
  store i32 0, i32* %3, align 4
  br label %161

; <label>:111:                                    ; preds = %34
  %112 = load %struct.input*, %struct.input** %7, align 8
  %113 = getelementptr inbounds %struct.input, %struct.input* %112, i32 0, i32 4
  %114 = load i64, i64* %113, align 8
  %115 = load i64, i64* %9, align 8
  %116 = sub i64 %114, %115
  store i64 %116, i64* %10, align 8
  %117 = load i64, i64* %10, align 8
  %118 = add i64 %117, 8
  %119 = call noalias i8* @malloc(i64 %118) #6
  %120 = load %struct.input*, %struct.input** %7, align 8
  %121 = getelementptr inbounds %struct.input, %struct.input* %120, i32 0, i32 3
  store i8* %119, i8** %121, align 8
  %122 = load %struct.input*, %struct.input** %7, align 8
  %123 = getelementptr inbounds %struct.input, %struct.input* %122, i32 0, i32 3
  %124 = load i8*, i8** %123, align 8
  %125 = icmp eq i8* %124, null
  br i1 %125, label %126, label %128

; <label>:126:                                    ; preds = %111
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 6)
  %127 = add i64 %pgocount5, 1
  store i64 %127, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 6)
  store i32 17, i32* %3, align 4
  br label %161

; <label>:128:                                    ; preds = %111
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 3)
  %129 = add i64 %pgocount6, 1
  store i64 %129, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 3)
  %130 = load %struct.input*, %struct.input** %7, align 8
  %131 = getelementptr inbounds %struct.input, %struct.input* %130, i32 0, i32 5
  store i32 1, i32* %131, align 8
  %132 = load %struct.input*, %struct.input** %7, align 8
  %133 = getelementptr inbounds %struct.input, %struct.input* %132, i32 0, i32 3
  %134 = load i8*, i8** %133, align 8
  %135 = load %struct.input*, %struct.input** %7, align 8
  %136 = getelementptr inbounds %struct.input, %struct.input* %135, i32 0, i32 2
  %137 = load i8*, i8** %136, align 8
  %138 = load i64, i64* %9, align 8
  %139 = getelementptr inbounds i8, i8* %137, i64 %138
  %140 = load i64, i64* %10, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %134, i8* %139, i64 %140, i32 1, i1 false)
  %141 = load %struct.input*, %struct.input** %7, align 8
  %142 = getelementptr inbounds %struct.input, %struct.input* %141, i32 0, i32 3
  %143 = load i8*, i8** %142, align 8
  %144 = load i64, i64* %10, align 8
  %145 = getelementptr inbounds i8, i8* %143, i64 %144
  call void @llvm.memset.p0i8.i64(i8* %145, i8 0, i64 8, i32 1, i1 false)
  %146 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %147 = load %struct.input*, %struct.input** %7, align 8
  %148 = getelementptr inbounds %struct.input, %struct.input* %147, i32 0, i32 3
  %149 = load i8*, i8** %148, align 8
  %150 = load i64, i64* %10, align 8
  %151 = add i64 %150, 8
  call void @mad_stream_buffer(%struct.mad_stream* %146, i8* %149, i64 %151)
  store i32 0, i32* %3, align 4
  br label %161

; <label>:152:                                    ; preds = %21
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 1)
  %153 = add i64 %pgocount7, 1
  store i64 %153, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_input_mmap, i64 0, i64 1)
  %154 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %155 = load %struct.input*, %struct.input** %7, align 8
  %156 = getelementptr inbounds %struct.input, %struct.input* %155, i32 0, i32 2
  %157 = load i8*, i8** %156, align 8
  %158 = load %struct.input*, %struct.input** %7, align 8
  %159 = getelementptr inbounds %struct.input, %struct.input* %158, i32 0, i32 4
  %160 = load i64, i64* %159, align 8
  call void @mad_stream_buffer(%struct.mad_stream* %154, i8* %157, i64 %160)
  store i32 0, i32* %3, align 4
  br label %161

; <label>:161:                                    ; preds = %152, %128, %126, %98, %94, %59, %32, %19
  %162 = load i32, i32* %3, align 4
  ret i32 %162
}

; Function Attrs: nounwind uwtable
define internal i32 @decode_input_read(i8*, %struct.mad_stream*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca %struct.mad_stream*, align 8
  %6 = alloca %struct.player*, align 8
  %7 = alloca %struct.input*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store %struct.mad_stream* %1, %struct.mad_stream** %5, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = bitcast i8* %9 to %struct.player*
  store %struct.player* %10, %struct.player** %6, align 8
  %11 = load %struct.player*, %struct.player** %6, align 8
  %12 = getelementptr inbounds %struct.player, %struct.player* %11, i32 0, i32 10
  store %struct.input* %12, %struct.input** %7, align 8
  %13 = load %struct.input*, %struct.input** %7, align 8
  %14 = getelementptr inbounds %struct.input, %struct.input* %13, i32 0, i32 5
  %15 = load i32, i32* %14, align 8
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 3)
  store i32 16, i32* %3, align 4
  br label %128

; <label>:19:                                     ; preds = %2
  %20 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %21 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %20, i32 0, i32 6
  %22 = load i8*, i8** %21, align 8
  %23 = icmp ne i8* %22, null
  br i1 %23, label %24, label %47

; <label>:24:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 4)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 4)
  %26 = load %struct.input*, %struct.input** %7, align 8
  %27 = getelementptr inbounds %struct.input, %struct.input* %26, i32 0, i32 3
  %28 = load i8*, i8** %27, align 8
  %29 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %30 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %29, i32 0, i32 6
  %31 = load i8*, i8** %30, align 8
  %32 = load %struct.input*, %struct.input** %7, align 8
  %33 = getelementptr inbounds %struct.input, %struct.input* %32, i32 0, i32 3
  %34 = load i8*, i8** %33, align 8
  %35 = load %struct.input*, %struct.input** %7, align 8
  %36 = getelementptr inbounds %struct.input, %struct.input* %35, i32 0, i32 4
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i8, i8* %34, i64 %37
  %39 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %40 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %39, i32 0, i32 6
  %41 = load i8*, i8** %40, align 8
  %42 = ptrtoint i8* %38 to i64
  %43 = ptrtoint i8* %41 to i64
  %44 = sub i64 %42, %43
  %45 = load %struct.input*, %struct.input** %7, align 8
  %46 = getelementptr inbounds %struct.input, %struct.input* %45, i32 0, i32 4
  store i64 %44, i64* %46, align 8
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %28, i8* %31, i64 %44, i32 1, i1 false)
  br label %47

; <label>:47:                                     ; preds = %24, %19
  br label %48

; <label>:48:                                     ; preds = %74, %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 0)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 0)
  %50 = load %struct.input*, %struct.input** %7, align 8
  %51 = getelementptr inbounds %struct.input, %struct.input* %50, i32 0, i32 1
  %52 = load i32, i32* %51, align 8
  %53 = load %struct.input*, %struct.input** %7, align 8
  %54 = getelementptr inbounds %struct.input, %struct.input* %53, i32 0, i32 3
  %55 = load i8*, i8** %54, align 8
  %56 = load %struct.input*, %struct.input** %7, align 8
  %57 = getelementptr inbounds %struct.input, %struct.input* %56, i32 0, i32 4
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds i8, i8* %55, i64 %58
  %60 = load %struct.input*, %struct.input** %7, align 8
  %61 = getelementptr inbounds %struct.input, %struct.input* %60, i32 0, i32 4
  %62 = load i64, i64* %61, align 8
  %63 = sub i64 40000, %62
  %64 = call i64 @read(i32 %52, i8* %59, i64 %63)
  %65 = trunc i64 %64 to i32
  store i32 %65, i32* %8, align 4
  br label %66

; <label>:66:                                     ; preds = %48
  %67 = load i32, i32* %8, align 4
  %68 = icmp eq i32 %67, -1
  br i1 %68, label %69, label %74

; <label>:69:                                     ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 1)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 1)
  %71 = call i32* @__errno_location() #8
  %72 = load i32, i32* %71, align 4
  %73 = icmp eq i32 %72, 4
  br label %74

; <label>:74:                                     ; preds = %69, %66
  %75 = phi i1 [ false, %66 ], [ %73, %69 ]
  br i1 %75, label %48, label %76

; <label>:76:                                     ; preds = %74
  %77 = load i32, i32* %8, align 4
  %78 = icmp eq i32 %77, -1
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %76
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 6)
  %80 = add i64 %pgocount4, 1
  store i64 %80, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 6)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.101, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0))
  store i32 17, i32* %3, align 4
  br label %128

; <label>:81:                                     ; preds = %76
  %82 = load i32, i32* %8, align 4
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %115

; <label>:84:                                     ; preds = %81
  %85 = load %struct.input*, %struct.input** %7, align 8
  %86 = getelementptr inbounds %struct.input, %struct.input* %85, i32 0, i32 5
  store i32 1, i32* %86, align 8
  %87 = load %struct.input*, %struct.input** %7, align 8
  %88 = getelementptr inbounds %struct.input, %struct.input* %87, i32 0, i32 4
  %89 = load i64, i64* %88, align 8
  %90 = sub i64 40000, %89
  %91 = icmp uge i64 %90, 8
  br i1 %91, label %92, label %94

; <label>:92:                                     ; preds = %84
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 7)
  %93 = add i64 %pgocount5, 1
  store i64 %93, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 7)
  br label %97

; <label>:94:                                     ; preds = %84
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 8)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 8)
  call void @__assert_fail(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.102, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i32 416, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.decode_input_read, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %97

; <label>:97:                                     ; preds = %96, %92
  br label %98

; <label>:98:                                     ; preds = %101, %97
  %99 = load i32, i32* %8, align 4
  %100 = icmp slt i32 %99, 8
  br i1 %100, label %101, label %114

; <label>:101:                                    ; preds = %98
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 2)
  %102 = add i64 %pgocount7, 1
  store i64 %102, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 2)
  %103 = load %struct.input*, %struct.input** %7, align 8
  %104 = getelementptr inbounds %struct.input, %struct.input* %103, i32 0, i32 3
  %105 = load i8*, i8** %104, align 8
  %106 = load %struct.input*, %struct.input** %7, align 8
  %107 = getelementptr inbounds %struct.input, %struct.input* %106, i32 0, i32 4
  %108 = load i64, i64* %107, align 8
  %109 = load i32, i32* %8, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %8, align 4
  %111 = sext i32 %109 to i64
  %112 = add i64 %108, %111
  %113 = getelementptr inbounds i8, i8* %105, i64 %112
  store i8 0, i8* %113, align 1
  br label %98

; <label>:114:                                    ; preds = %98
  br label %115

; <label>:115:                                    ; preds = %114, %81
  br label %116

; <label>:116:                                    ; preds = %115
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 5)
  %117 = add i64 %pgocount8, 1
  store i64 %117, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_decode_input_read, i64 0, i64 5)
  %118 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %119 = load %struct.input*, %struct.input** %7, align 8
  %120 = getelementptr inbounds %struct.input, %struct.input* %119, i32 0, i32 3
  %121 = load i8*, i8** %120, align 8
  %122 = load i32, i32* %8, align 4
  %123 = sext i32 %122 to i64
  %124 = load %struct.input*, %struct.input** %7, align 8
  %125 = getelementptr inbounds %struct.input, %struct.input* %124, i32 0, i32 4
  %126 = load i64, i64* %125, align 8
  %127 = add i64 %126, %123
  store i64 %127, i64* %125, align 8
  call void @mad_stream_buffer(%struct.mad_stream* %118, i8* %121, i64 %127)
  store i32 0, i32* %3, align 4
  br label %128

; <label>:128:                                    ; preds = %116, %79, %17
  %129 = load i32, i32* %3, align 4
  ret i32 %129
}

; Function Attrs: nounwind uwtable
define internal i32 @decode_header(i8*, %struct.mad_header*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca %struct.mad_header*, align 8
  %6 = alloca %struct.player*, align 8
  store i8* %0, i8** %4, align 8
  store %struct.mad_header* %1, %struct.mad_header** %5, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to %struct.player*
  store %struct.player* %8, %struct.player** %6, align 8
  %9 = load %struct.player*, %struct.player** %6, align 8
  %10 = getelementptr inbounds %struct.player, %struct.player* %9, i32 0, i32 1
  %11 = load i32, i32* %10, align 4
  %12 = and i32 %11, 32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %35

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 1)
  %16 = load %struct.player*, %struct.player** %6, align 8
  %17 = getelementptr inbounds %struct.player, %struct.player* %16, i32 0, i32 12
  %18 = getelementptr inbounds %struct.stats, %struct.stats* %17, i32 0, i32 4
  %19 = load %struct.player*, %struct.player** %6, align 8
  %20 = getelementptr inbounds %struct.player, %struct.player* %19, i32 0, i32 6
  %21 = bitcast %struct.mad_timer_t* %18 to { i64, i64 }*
  %22 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %21, i32 0, i32 0
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %21, i32 0, i32 1
  %25 = load i64, i64* %24, align 8
  %26 = bitcast %struct.mad_timer_t* %20 to { i64, i64 }*
  %27 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %26, i32 0, i32 0
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %26, i32 0, i32 1
  %30 = load i64, i64* %29, align 8
  %31 = call i32 @mad_timer_compare(i64 %23, i64 %25, i64 %28, i64 %30)
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 3)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 3)
  store i32 16, i32* %3, align 4
  br label %102

; <label>:35:                                     ; preds = %14, %2
  %36 = load %struct.player*, %struct.player** %6, align 8
  %37 = getelementptr inbounds %struct.player, %struct.player* %36, i32 0, i32 12
  %38 = getelementptr inbounds %struct.stats, %struct.stats* %37, i32 0, i32 8
  %39 = load i64, i64* %38, align 8
  %40 = icmp ne i64 %39, 0
  br i1 %40, label %41, label %100

; <label>:41:                                     ; preds = %35
  %42 = load %struct.player*, %struct.player** %6, align 8
  %43 = getelementptr inbounds %struct.player, %struct.player* %42, i32 0, i32 12
  %44 = getelementptr inbounds %struct.stats, %struct.stats* %43, i32 0, i32 8
  %45 = load i64, i64* %44, align 8
  %46 = add i64 %45, 1
  store i64 %46, i64* %44, align 8
  %47 = load %struct.player*, %struct.player** %6, align 8
  %48 = getelementptr inbounds %struct.player, %struct.player* %47, i32 0, i32 12
  %49 = getelementptr inbounds %struct.stats, %struct.stats* %48, i32 0, i32 5
  %50 = load %struct.mad_header*, %struct.mad_header** %5, align 8
  %51 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %50, i32 0, i32 10
  %52 = bitcast %struct.mad_timer_t* %51 to { i64, i64 }*
  %53 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %52, i32 0, i32 0
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %52, i32 0, i32 1
  %56 = load i64, i64* %55, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %49, i64 %54, i64 %56)
  %57 = load %struct.player*, %struct.player** %6, align 8
  %58 = getelementptr inbounds %struct.player, %struct.player* %57, i32 0, i32 12
  %59 = getelementptr inbounds %struct.stats, %struct.stats* %58, i32 0, i32 7
  %60 = load i64, i64* %59, align 8
  %61 = add i64 %60, 1
  store i64 %61, i64* %59, align 8
  %62 = load %struct.player*, %struct.player** %6, align 8
  %63 = getelementptr inbounds %struct.player, %struct.player* %62, i32 0, i32 12
  %64 = getelementptr inbounds %struct.stats, %struct.stats* %63, i32 0, i32 4
  %65 = load %struct.mad_header*, %struct.mad_header** %5, align 8
  %66 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %65, i32 0, i32 10
  %67 = bitcast %struct.mad_timer_t* %66 to { i64, i64 }*
  %68 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 0
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 1
  %71 = load i64, i64* %70, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %64, i64 %69, i64 %71)
  %72 = load %struct.player*, %struct.player** %6, align 8
  %73 = getelementptr inbounds %struct.player, %struct.player* %72, i32 0, i32 1
  %74 = load i32, i32* %73, align 4
  %75 = and i32 %74, 16
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %98

; <label>:77:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 4)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 4)
  %79 = load %struct.player*, %struct.player** %6, align 8
  %80 = getelementptr inbounds %struct.player, %struct.player* %79, i32 0, i32 12
  %81 = getelementptr inbounds %struct.stats, %struct.stats* %80, i32 0, i32 4
  %82 = load %struct.player*, %struct.player** %6, align 8
  %83 = getelementptr inbounds %struct.player, %struct.player* %82, i32 0, i32 5
  %84 = bitcast %struct.mad_timer_t* %81 to { i64, i64 }*
  %85 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %84, i32 0, i32 0
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %84, i32 0, i32 1
  %88 = load i64, i64* %87, align 8
  %89 = bitcast %struct.mad_timer_t* %83 to { i64, i64 }*
  %90 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %89, i32 0, i32 0
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %89, i32 0, i32 1
  %93 = load i64, i64* %92, align 8
  %94 = call i32 @mad_timer_compare(i64 %86, i64 %88, i64 %91, i64 %93)
  %95 = icmp slt i32 %94, 0
  br i1 %95, label %96, label %98

; <label>:96:                                     ; preds = %77
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 5)
  %97 = add i64 %pgocount3, 1
  store i64 %97, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 5)
  store i32 32, i32* %3, align 4
  br label %102

; <label>:98:                                     ; preds = %77, %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 2)
  %99 = add i64 %pgocount4, 1
  store i64 %99, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 2)
  br label %100

; <label>:100:                                    ; preds = %98, %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 0)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_decode_header, i64 0, i64 0)
  store i32 0, i32* %3, align 4
  br label %102

; <label>:102:                                    ; preds = %100, %96, %33
  %103 = load i32, i32* %3, align 4
  ret i32 %103
}

; Function Attrs: nounwind uwtable
define internal i32 @decode_filter(i8*, %struct.mad_stream*, %struct.mad_frame*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.mad_stream*, align 8
  %7 = alloca %struct.mad_frame*, align 8
  %8 = alloca %struct.player*, align 8
  store i8* %0, i8** %5, align 8
  store %struct.mad_stream* %1, %struct.mad_stream** %6, align 8
  store %struct.mad_frame* %2, %struct.mad_frame** %7, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = bitcast i8* %9 to %struct.player*
  store %struct.player* %10, %struct.player** %8, align 8
  %11 = load %struct.player*, %struct.player** %8, align 8
  %12 = getelementptr inbounds %struct.player, %struct.player* %11, i32 0, i32 12
  %13 = getelementptr inbounds %struct.stats, %struct.stats* %12, i32 0, i32 8
  %14 = load i64, i64* %13, align 8
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %152

; <label>:16:                                     ; preds = %3
  %17 = load %struct.player*, %struct.player** %8, align 8
  %18 = getelementptr inbounds %struct.player, %struct.player* %17, i32 0, i32 10
  %19 = getelementptr inbounds %struct.input, %struct.input* %18, i32 0, i32 6
  %20 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %21 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %20, i32 0, i32 8
  %22 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %23 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %22, i32 0, i32 9
  %24 = load i32, i32* %23, align 8
  %25 = bitcast %struct.mad_bitptr* %21 to { i8*, i64 }*
  %26 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %25, i32 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %25, i32 0, i32 1
  %29 = load i64, i64* %28, align 8
  %30 = call i32 @xing_parse(%struct.xing* %19, i8* %27, i64 %29, i32 %24)
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %91

; <label>:32:                                     ; preds = %16
  %33 = load %struct.player*, %struct.player** %8, align 8
  %34 = getelementptr inbounds %struct.player, %struct.player* %33, i32 0, i32 10
  %35 = getelementptr inbounds %struct.input, %struct.input* %34, i32 0, i32 6
  %36 = getelementptr inbounds %struct.xing, %struct.xing* %35, i32 0, i32 0
  %37 = load i64, i64* %36, align 8
  %38 = and i64 %37, 1
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %40, label %58

; <label>:40:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 4)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 4)
  %42 = load %struct.player*, %struct.player** %8, align 8
  %43 = getelementptr inbounds %struct.player, %struct.player* %42, i32 0, i32 12
  %44 = getelementptr inbounds %struct.stats, %struct.stats* %43, i32 0, i32 3
  %45 = load %struct.mad_frame*, %struct.mad_frame** %7, align 8
  %46 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %46, i32 0, i32 10
  %48 = bitcast %struct.mad_timer_t* %44 to i8*
  %49 = bitcast %struct.mad_timer_t* %47 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %48, i8* %49, i64 16, i32 8, i1 false)
  %50 = load %struct.player*, %struct.player** %8, align 8
  %51 = getelementptr inbounds %struct.player, %struct.player* %50, i32 0, i32 12
  %52 = getelementptr inbounds %struct.stats, %struct.stats* %51, i32 0, i32 3
  %53 = load %struct.player*, %struct.player** %8, align 8
  %54 = getelementptr inbounds %struct.player, %struct.player* %53, i32 0, i32 10
  %55 = getelementptr inbounds %struct.input, %struct.input* %54, i32 0, i32 6
  %56 = getelementptr inbounds %struct.xing, %struct.xing* %55, i32 0, i32 1
  %57 = load i64, i64* %56, align 8
  call void @mad_timer_multiply(%struct.mad_timer_t* %52, i64 %57)
  br label %58

; <label>:58:                                     ; preds = %40, %32
  %59 = load %struct.player*, %struct.player** %8, align 8
  %60 = getelementptr inbounds %struct.player, %struct.player* %59, i32 0, i32 12
  %61 = getelementptr inbounds %struct.stats, %struct.stats* %60, i32 0, i32 2
  %62 = load i64, i64* %61, align 8
  %63 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %64 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %63, i32 0, i32 6
  %65 = load i8*, i8** %64, align 8
  %66 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %67 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %66, i32 0, i32 5
  %68 = load i8*, i8** %67, align 8
  %69 = ptrtoint i8* %65 to i64
  %70 = ptrtoint i8* %68 to i64
  %71 = sub i64 %69, %70
  %72 = icmp uge i64 %62, %71
  br i1 %72, label %73, label %89

; <label>:73:                                     ; preds = %58
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 5)
  %74 = add i64 %pgocount1, 1
  store i64 %74, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 5)
  %75 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %76 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %75, i32 0, i32 6
  %77 = load i8*, i8** %76, align 8
  %78 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %79 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %78, i32 0, i32 5
  %80 = load i8*, i8** %79, align 8
  %81 = ptrtoint i8* %77 to i64
  %82 = ptrtoint i8* %80 to i64
  %83 = sub i64 %81, %82
  %84 = load %struct.player*, %struct.player** %8, align 8
  %85 = getelementptr inbounds %struct.player, %struct.player* %84, i32 0, i32 12
  %86 = getelementptr inbounds %struct.stats, %struct.stats* %85, i32 0, i32 2
  %87 = load i64, i64* %86, align 8
  %88 = sub i64 %87, %83
  store i64 %88, i64* %86, align 8
  br label %89

; <label>:89:                                     ; preds = %73, %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 2)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 2)
  store i32 32, i32* %4, align 4
  br label %160

; <label>:91:                                     ; preds = %16
  %92 = load %struct.player*, %struct.player** %8, align 8
  %93 = getelementptr inbounds %struct.player, %struct.player* %92, i32 0, i32 12
  %94 = getelementptr inbounds %struct.stats, %struct.stats* %93, i32 0, i32 8
  %95 = load i64, i64* %94, align 8
  %96 = add i64 %95, 1
  store i64 %96, i64* %94, align 8
  %97 = load %struct.player*, %struct.player** %8, align 8
  %98 = getelementptr inbounds %struct.player, %struct.player* %97, i32 0, i32 12
  %99 = getelementptr inbounds %struct.stats, %struct.stats* %98, i32 0, i32 5
  %100 = load %struct.mad_frame*, %struct.mad_frame** %7, align 8
  %101 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %100, i32 0, i32 0
  %102 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %101, i32 0, i32 10
  %103 = bitcast %struct.mad_timer_t* %102 to { i64, i64 }*
  %104 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %103, i32 0, i32 0
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %103, i32 0, i32 1
  %107 = load i64, i64* %106, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %99, i64 %105, i64 %107)
  %108 = load %struct.player*, %struct.player** %8, align 8
  %109 = getelementptr inbounds %struct.player, %struct.player* %108, i32 0, i32 12
  %110 = getelementptr inbounds %struct.stats, %struct.stats* %109, i32 0, i32 7
  %111 = load i64, i64* %110, align 8
  %112 = add i64 %111, 1
  store i64 %112, i64* %110, align 8
  %113 = load %struct.player*, %struct.player** %8, align 8
  %114 = getelementptr inbounds %struct.player, %struct.player* %113, i32 0, i32 12
  %115 = getelementptr inbounds %struct.stats, %struct.stats* %114, i32 0, i32 4
  %116 = load %struct.mad_frame*, %struct.mad_frame** %7, align 8
  %117 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %116, i32 0, i32 0
  %118 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %117, i32 0, i32 10
  %119 = bitcast %struct.mad_timer_t* %118 to { i64, i64 }*
  %120 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %119, i32 0, i32 0
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %119, i32 0, i32 1
  %123 = load i64, i64* %122, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %115, i64 %121, i64 %123)
  %124 = load %struct.player*, %struct.player** %8, align 8
  %125 = getelementptr inbounds %struct.player, %struct.player* %124, i32 0, i32 1
  %126 = load i32, i32* %125, align 4
  %127 = and i32 %126, 16
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %150

; <label>:129:                                    ; preds = %91
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 3)
  %130 = add i64 %pgocount3, 1
  store i64 %130, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 3)
  %131 = load %struct.player*, %struct.player** %8, align 8
  %132 = getelementptr inbounds %struct.player, %struct.player* %131, i32 0, i32 12
  %133 = getelementptr inbounds %struct.stats, %struct.stats* %132, i32 0, i32 4
  %134 = load %struct.player*, %struct.player** %8, align 8
  %135 = getelementptr inbounds %struct.player, %struct.player* %134, i32 0, i32 5
  %136 = bitcast %struct.mad_timer_t* %133 to { i64, i64 }*
  %137 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %136, i32 0, i32 0
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %136, i32 0, i32 1
  %140 = load i64, i64* %139, align 8
  %141 = bitcast %struct.mad_timer_t* %135 to { i64, i64 }*
  %142 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %141, i32 0, i32 0
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %141, i32 0, i32 1
  %145 = load i64, i64* %144, align 8
  %146 = call i32 @mad_timer_compare(i64 %138, i64 %140, i64 %143, i64 %145)
  %147 = icmp slt i32 %146, 0
  br i1 %147, label %148, label %150

; <label>:148:                                    ; preds = %129
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 6)
  %149 = add i64 %pgocount4, 1
  store i64 %149, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 6)
  store i32 32, i32* %4, align 4
  br label %160

; <label>:150:                                    ; preds = %129, %91
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 1)
  %151 = add i64 %pgocount5, 1
  store i64 %151, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 1)
  br label %152

; <label>:152:                                    ; preds = %150, %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 0)
  %153 = add i64 %pgocount6, 1
  store i64 %153, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_decode_filter, i64 0, i64 0)
  %154 = load %struct.player*, %struct.player** %8, align 8
  %155 = getelementptr inbounds %struct.player, %struct.player* %154, i32 0, i32 11
  %156 = getelementptr inbounds %struct.output, %struct.output* %155, i32 0, i32 2
  %157 = load %struct.filter*, %struct.filter** %156, align 8
  %158 = load %struct.mad_frame*, %struct.mad_frame** %7, align 8
  %159 = call i32 @filter_run(%struct.filter* %157, %struct.mad_frame* %158)
  store i32 %159, i32* %4, align 4
  br label %160

; <label>:160:                                    ; preds = %152, %148, %89
  %161 = load i32, i32* %4, align 4
  ret i32 %161
}

; Function Attrs: nounwind uwtable
define internal i32 @decode_output(i8*, %struct.mad_header*, %struct.mad_pcm*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.mad_header*, align 8
  %7 = alloca %struct.mad_pcm*, align 8
  %8 = alloca %struct.player*, align 8
  %9 = alloca %struct.output*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %union.audio_control, align 8
  store i8* %0, i8** %5, align 8
  store %struct.mad_header* %1, %struct.mad_header** %6, align 8
  store %struct.mad_pcm* %2, %struct.mad_pcm** %7, align 8
  %14 = load i8*, i8** %5, align 8
  %15 = bitcast i8* %14 to %struct.player*
  store %struct.player* %15, %struct.player** %8, align 8
  %16 = load %struct.player*, %struct.player** %8, align 8
  %17 = getelementptr inbounds %struct.player, %struct.player* %16, i32 0, i32 11
  store %struct.output* %17, %struct.output** %9, align 8
  %18 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %19 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %18, i32 0, i32 3
  %20 = getelementptr inbounds [2 x [1152 x i32]], [2 x [1152 x i32]]* %19, i64 0, i64 0
  %21 = getelementptr inbounds [1152 x i32], [1152 x i32]* %20, i32 0, i32 0
  store i32* %21, i32** %10, align 8
  %22 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %23 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %22, i32 0, i32 3
  %24 = getelementptr inbounds [2 x [1152 x i32]], [2 x [1152 x i32]]* %23, i64 0, i64 1
  %25 = getelementptr inbounds [1152 x i32], [1152 x i32]* %24, i32 0, i32 0
  store i32* %25, i32** %11, align 8
  %26 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %27 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %26, i32 0, i32 1
  %28 = load i16, i16* %27, align 4
  %29 = zext i16 %28 to i32
  store i32 %29, i32* %12, align 4
  switch i32 %29, label %77 [
    i32 1, label %30
    i32 2, label %40
  ]

; <label>:30:                                     ; preds = %3
  store i32* null, i32** %11, align 8
  %31 = load %struct.output*, %struct.output** %9, align 8
  %32 = getelementptr inbounds %struct.output, %struct.output* %31, i32 0, i32 5
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 4
  br i1 %34, label %35, label %38

; <label>:35:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 13)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 13)
  %37 = load i32*, i32** %10, align 8
  store i32* %37, i32** %11, align 8
  store i32 2, i32* %12, align 4
  br label %38

; <label>:38:                                     ; preds = %35, %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 2)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 2)
  br label %77

; <label>:40:                                     ; preds = %3
  %41 = load %struct.output*, %struct.output** %9, align 8
  %42 = getelementptr inbounds %struct.output, %struct.output* %41, i32 0, i32 5
  %43 = load i32, i32* %42, align 8
  switch i32 %43, label %51 [
    i32 2, label %44
    i32 1, label %47
    i32 4, label %49
  ]

; <label>:44:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 24)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 24)
  %46 = load i32*, i32** %11, align 8
  store i32* %46, i32** %10, align 8
  br label %47

; <label>:47:                                     ; preds = %44, %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 14)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 14)
  store i32* null, i32** %11, align 8
  store i32 1, i32* %12, align 4
  br label %49

; <label>:49:                                     ; preds = %47, %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 4)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 4)
  br label %76

; <label>:51:                                     ; preds = %40
  %52 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %53 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %52, i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %56, label %74

; <label>:56:                                     ; preds = %51
  %57 = load %struct.output*, %struct.output** %9, align 8
  %58 = getelementptr inbounds %struct.output, %struct.output* %57, i32 0, i32 5
  %59 = load i32, i32* %58, align 8
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %72

; <label>:61:                                     ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 35)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 35)
  %63 = load %struct.player*, %struct.player** %8, align 8
  %64 = getelementptr inbounds %struct.player, %struct.player* %63, i32 0, i32 0
  %65 = load i32, i32* %64, align 8
  %66 = icmp sge i32 %65, -1
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 36)
  %68 = add i64 %pgocount6, 1
  store i64 %68, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 36)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.104, i32 0, i32 0))
  br label %69

; <label>:69:                                     ; preds = %67, %61
  %70 = load %struct.output*, %struct.output** %9, align 8
  %71 = getelementptr inbounds %struct.output, %struct.output* %70, i32 0, i32 5
  store i32 -1, i32* %71, align 8
  br label %72

; <label>:72:                                     ; preds = %69, %56
  %pgocount7 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 32)
  %73 = add i64 %pgocount7, 1
  store i64 %73, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 32)
  store i32* null, i32** %11, align 8
  store i32 1, i32* %12, align 4
  br label %74

; <label>:74:                                     ; preds = %72, %51
  %pgocount8 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 25)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 25)
  br label %76

; <label>:76:                                     ; preds = %74, %49
  br label %77

; <label>:77:                                     ; preds = %76, %38, %3
  %78 = load %struct.output*, %struct.output** %9, align 8
  %79 = getelementptr inbounds %struct.output, %struct.output* %78, i32 0, i32 3
  %80 = load i32, i32* %79, align 8
  %81 = load i32, i32* %12, align 4
  %82 = icmp ne i32 %80, %81
  br i1 %82, label %92, label %83

; <label>:83:                                     ; preds = %77
  %pgocount9 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 0)
  %84 = add i64 %pgocount9, 1
  store i64 %84, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 0)
  %85 = load %struct.output*, %struct.output** %9, align 8
  %86 = getelementptr inbounds %struct.output, %struct.output* %85, i32 0, i32 6
  %87 = load i32, i32* %86, align 4
  %88 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %89 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %88, i32 0, i32 0
  %90 = load i32, i32* %89, align 4
  %91 = icmp ne i32 %87, %90
  br i1 %91, label %92, label %338

; <label>:92:                                     ; preds = %83, %77
  %93 = load %struct.player*, %struct.player** %8, align 8
  %94 = getelementptr inbounds %struct.player, %struct.player* %93, i32 0, i32 0
  %95 = load i32, i32* %94, align 8
  %96 = icmp sge i32 %95, 1
  br i1 %96, label %97, label %111

; <label>:97:                                     ; preds = %92
  %pgocount10 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 1)
  %98 = add i64 %pgocount10, 1
  store i64 %98, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 1)
  %99 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %100 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %99, i32 0, i32 0
  %101 = load i32, i32* %100, align 4
  %102 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %103 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %102, i32 0, i32 5
  %104 = load i32, i32* %103, align 8
  %105 = icmp ne i32 %101, %104
  br i1 %105, label %106, label %111

; <label>:106:                                    ; preds = %97
  %pgocount11 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 12)
  %107 = add i64 %pgocount11, 1
  store i64 %107, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 12)
  %108 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %109 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %108, i32 0, i32 0
  %110 = load i32, i32* %109, align 4
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.105, i32 0, i32 0), i32 %110)
  br label %111

; <label>:111:                                    ; preds = %106, %97, %92
  call void @audio_control_init(%union.audio_control* %13, i32 1)
  %112 = load i32, i32* %12, align 4
  %113 = bitcast %union.audio_control* %13 to %struct.audio_config*
  %114 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %113, i32 0, i32 1
  store i32 %112, i32* %114, align 4
  %115 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %116 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %115, i32 0, i32 0
  %117 = load i32, i32* %116, align 4
  %118 = bitcast %union.audio_control* %13 to %struct.audio_config*
  %119 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %118, i32 0, i32 2
  store i32 %117, i32* %119, align 8
  %120 = load %struct.output*, %struct.output** %9, align 8
  %121 = getelementptr inbounds %struct.output, %struct.output* %120, i32 0, i32 8
  %122 = load i32, i32* %121, align 4
  %123 = bitcast %union.audio_control* %13 to %struct.audio_config*
  %124 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %123, i32 0, i32 3
  store i32 %122, i32* %124, align 4
  %125 = load %struct.output*, %struct.output** %9, align 8
  %126 = getelementptr inbounds %struct.output, %struct.output* %125, i32 0, i32 11
  %127 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %126, align 8
  %128 = ptrtoint i32 (%union.audio_control*)* %127 to i64
  call void @__llvm_profile_instrument_target(i64 %128, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_output to i8*), i32 0)
  %129 = call i32 %127(%union.audio_control* %13)
  %130 = icmp eq i32 %129, -1
  br i1 %130, label %131, label %134

; <label>:131:                                    ; preds = %111
  %pgocount12 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 3)
  %132 = add i64 %pgocount12, 1
  store i64 %132, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 3)
  %133 = load i8*, i8** @audio_error, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* %133)
  store i32 17, i32* %4, align 4
  br label %496

; <label>:134:                                    ; preds = %111
  %135 = load i32, i32* %12, align 4
  %136 = load %struct.output*, %struct.output** %9, align 8
  %137 = getelementptr inbounds %struct.output, %struct.output* %136, i32 0, i32 3
  store i32 %135, i32* %137, align 8
  %138 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %139 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %138, i32 0, i32 0
  %140 = load i32, i32* %139, align 4
  %141 = load %struct.output*, %struct.output** %9, align 8
  %142 = getelementptr inbounds %struct.output, %struct.output* %141, i32 0, i32 6
  store i32 %140, i32* %142, align 4
  %143 = bitcast %union.audio_control* %13 to %struct.audio_config*
  %144 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %143, i32 0, i32 1
  %145 = load i32, i32* %144, align 4
  %146 = load %struct.output*, %struct.output** %9, align 8
  %147 = getelementptr inbounds %struct.output, %struct.output* %146, i32 0, i32 4
  store i32 %145, i32* %147, align 4
  %148 = bitcast %union.audio_control* %13 to %struct.audio_config*
  %149 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %148, i32 0, i32 2
  %150 = load i32, i32* %149, align 8
  %151 = load %struct.output*, %struct.output** %9, align 8
  %152 = getelementptr inbounds %struct.output, %struct.output* %151, i32 0, i32 7
  store i32 %150, i32* %152, align 8
  %153 = bitcast %union.audio_control* %13 to %struct.audio_config*
  %154 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %153, i32 0, i32 3
  %155 = load i32, i32* %154, align 4
  %156 = load %struct.output*, %struct.output** %9, align 8
  %157 = getelementptr inbounds %struct.output, %struct.output* %156, i32 0, i32 9
  store i32 %155, i32* %157, align 8
  %158 = load %struct.player*, %struct.player** %8, align 8
  %159 = getelementptr inbounds %struct.player, %struct.player* %158, i32 0, i32 0
  %160 = load i32, i32* %159, align 8
  %161 = icmp sge i32 %160, -1
  br i1 %161, label %162, label %181

; <label>:162:                                    ; preds = %134
  %pgocount13 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 5)
  %163 = add i64 %pgocount13, 1
  store i64 %163, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 5)
  %164 = load %struct.output*, %struct.output** %9, align 8
  %165 = getelementptr inbounds %struct.output, %struct.output* %164, i32 0, i32 3
  %166 = load i32, i32* %165, align 8
  %167 = load %struct.output*, %struct.output** %9, align 8
  %168 = getelementptr inbounds %struct.output, %struct.output* %167, i32 0, i32 4
  %169 = load i32, i32* %168, align 4
  %170 = icmp ne i32 %166, %169
  br i1 %170, label %171, label %181

; <label>:171:                                    ; preds = %162
  %172 = load %struct.output*, %struct.output** %9, align 8
  %173 = getelementptr inbounds %struct.output, %struct.output* %172, i32 0, i32 3
  %174 = load i32, i32* %173, align 8
  %175 = icmp eq i32 %174, 1
  br i1 %175, label %176, label %178

; <label>:176:                                    ; preds = %171
  %pgocount14 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 29)
  %177 = add i64 %pgocount14, 1
  store i64 %177, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 29)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.106, i32 0, i32 0))
  br label %180

; <label>:178:                                    ; preds = %171
  %pgocount15 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 30)
  %179 = add i64 %pgocount15, 1
  store i64 %179, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 30)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.107, i32 0, i32 0))
  br label %180

; <label>:180:                                    ; preds = %178, %176
  br label %181

; <label>:181:                                    ; preds = %180, %162, %134
  %182 = load %struct.player*, %struct.player** %8, align 8
  %183 = getelementptr inbounds %struct.player, %struct.player* %182, i32 0, i32 0
  %184 = load i32, i32* %183, align 8
  %185 = icmp sge i32 %184, 0
  br i1 %185, label %186, label %203

; <label>:186:                                    ; preds = %181
  %pgocount16 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 6)
  %187 = add i64 %pgocount16, 1
  store i64 %187, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 6)
  %188 = load %struct.output*, %struct.output** %9, align 8
  %189 = getelementptr inbounds %struct.output, %struct.output* %188, i32 0, i32 6
  %190 = load i32, i32* %189, align 4
  %191 = load %struct.output*, %struct.output** %9, align 8
  %192 = getelementptr inbounds %struct.output, %struct.output* %191, i32 0, i32 7
  %193 = load i32, i32* %192, align 8
  %194 = icmp ne i32 %190, %193
  br i1 %194, label %195, label %203

; <label>:195:                                    ; preds = %186
  %pgocount17 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 23)
  %196 = add i64 %pgocount17, 1
  store i64 %196, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 23)
  %197 = load %struct.output*, %struct.output** %9, align 8
  %198 = getelementptr inbounds %struct.output, %struct.output* %197, i32 0, i32 6
  %199 = load i32, i32* %198, align 4
  %200 = load %struct.output*, %struct.output** %9, align 8
  %201 = getelementptr inbounds %struct.output, %struct.output* %200, i32 0, i32 7
  %202 = load i32, i32* %201, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.108, i32 0, i32 0), i32 %199, i32 %202)
  br label %203

; <label>:203:                                    ; preds = %195, %186, %181
  %204 = load %struct.player*, %struct.player** %8, align 8
  %205 = getelementptr inbounds %struct.player, %struct.player* %204, i32 0, i32 0
  %206 = load i32, i32* %205, align 8
  %207 = icmp sge i32 %206, -1
  br i1 %207, label %208, label %231

; <label>:208:                                    ; preds = %203
  %pgocount18 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 7)
  %209 = add i64 %pgocount18, 1
  store i64 %209, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 7)
  %210 = load %struct.output*, %struct.output** %9, align 8
  %211 = getelementptr inbounds %struct.output, %struct.output* %210, i32 0, i32 8
  %212 = load i32, i32* %211, align 4
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %214, label %231

; <label>:214:                                    ; preds = %208
  %pgocount19 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 15)
  %215 = add i64 %pgocount19, 1
  store i64 %215, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 15)
  %216 = load %struct.output*, %struct.output** %9, align 8
  %217 = getelementptr inbounds %struct.output, %struct.output* %216, i32 0, i32 8
  %218 = load i32, i32* %217, align 4
  %219 = load %struct.output*, %struct.output** %9, align 8
  %220 = getelementptr inbounds %struct.output, %struct.output* %219, i32 0, i32 9
  %221 = load i32, i32* %220, align 8
  %222 = icmp ne i32 %218, %221
  br i1 %222, label %223, label %231

; <label>:223:                                    ; preds = %214
  %pgocount20 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 28)
  %224 = add i64 %pgocount20, 1
  store i64 %224, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 28)
  %225 = load %struct.output*, %struct.output** %9, align 8
  %226 = getelementptr inbounds %struct.output, %struct.output* %225, i32 0, i32 8
  %227 = load i32, i32* %226, align 4
  %228 = load %struct.output*, %struct.output** %9, align 8
  %229 = getelementptr inbounds %struct.output, %struct.output* %228, i32 0, i32 9
  %230 = load i32, i32* %229, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.109, i32 0, i32 0), i32 %227, i32 %230)
  br label %231

; <label>:231:                                    ; preds = %223, %214, %208, %203
  %232 = load %struct.output*, %struct.output** %9, align 8
  %233 = getelementptr inbounds %struct.output, %struct.output* %232, i32 0, i32 7
  %234 = load i32, i32* %233, align 8
  %235 = load %struct.output*, %struct.output** %9, align 8
  %236 = getelementptr inbounds %struct.output, %struct.output* %235, i32 0, i32 6
  %237 = load i32, i32* %236, align 4
  %238 = sub i32 %234, %237
  %239 = call i32 @abs(i32 %238) #8
  %240 = sext i32 %239 to i64
  %241 = load %struct.output*, %struct.output** %9, align 8
  %242 = getelementptr inbounds %struct.output, %struct.output* %241, i32 0, i32 6
  %243 = load i32, i32* %242, align 4
  %244 = zext i32 %243 to i64
  %245 = mul nsw i64 6, %244
  %246 = sdiv i64 %245, 100
  %247 = icmp slt i64 %240, %246
  br i1 %247, label %248, label %263

; <label>:248:                                    ; preds = %231
  %249 = load %struct.output*, %struct.output** %9, align 8
  %250 = getelementptr inbounds %struct.output, %struct.output* %249, i32 0, i32 13
  %251 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %250, align 8
  %252 = icmp ne [2 x [3456 x i32]]* %251, null
  br i1 %252, label %253, label %261

; <label>:253:                                    ; preds = %248
  %pgocount21 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 16)
  %254 = add i64 %pgocount21, 1
  store i64 %254, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 16)
  %255 = load %struct.output*, %struct.output** %9, align 8
  %256 = getelementptr inbounds %struct.output, %struct.output* %255, i32 0, i32 13
  %257 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %256, align 8
  %258 = bitcast [2 x [3456 x i32]]* %257 to i8*
  call void @free(i8* %258) #6
  %259 = load %struct.output*, %struct.output** %9, align 8
  %260 = getelementptr inbounds %struct.output, %struct.output* %259, i32 0, i32 13
  store [2 x [3456 x i32]]* null, [2 x [3456 x i32]]** %260, align 8
  br label %261

; <label>:261:                                    ; preds = %253, %248
  %pgocount22 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 8)
  %262 = add i64 %pgocount22, 1
  store i64 %262, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 8)
  br label %337

; <label>:263:                                    ; preds = %231
  %264 = load %struct.output*, %struct.output** %9, align 8
  %265 = getelementptr inbounds %struct.output, %struct.output* %264, i32 0, i32 13
  %266 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %265, align 8
  %267 = icmp ne [2 x [3456 x i32]]* %266, null
  br i1 %267, label %268, label %269

; <label>:268:                                    ; preds = %263
  br label %282

; <label>:269:                                    ; preds = %263
  %270 = call noalias i8* @malloc(i64 27648) #6
  %271 = bitcast i8* %270 to [2 x [3456 x i32]]*
  %272 = load %struct.output*, %struct.output** %9, align 8
  %273 = getelementptr inbounds %struct.output, %struct.output* %272, i32 0, i32 13
  store [2 x [3456 x i32]]* %271, [2 x [3456 x i32]]** %273, align 8
  %274 = load %struct.output*, %struct.output** %9, align 8
  %275 = getelementptr inbounds %struct.output, %struct.output* %274, i32 0, i32 13
  %276 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %275, align 8
  %277 = icmp eq [2 x [3456 x i32]]* %276, null
  br i1 %277, label %278, label %280

; <label>:278:                                    ; preds = %269
  %pgocount23 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 34)
  %279 = add i64 %pgocount23, 1
  store i64 %279, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 34)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.110, i32 0, i32 0))
  store i32 17, i32* %4, align 4
  br label %496

; <label>:280:                                    ; preds = %269
  %pgocount24 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 31)
  %281 = add i64 %pgocount24, 1
  store i64 %281, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 31)
  br label %282

; <label>:282:                                    ; preds = %280, %268
  %283 = load %struct.output*, %struct.output** %9, align 8
  %284 = getelementptr inbounds %struct.output, %struct.output* %283, i32 0, i32 12
  %285 = getelementptr inbounds [2 x %struct.resample_state], [2 x %struct.resample_state]* %284, i64 0, i64 0
  %286 = load %struct.output*, %struct.output** %9, align 8
  %287 = getelementptr inbounds %struct.output, %struct.output* %286, i32 0, i32 6
  %288 = load i32, i32* %287, align 4
  %289 = load %struct.output*, %struct.output** %9, align 8
  %290 = getelementptr inbounds %struct.output, %struct.output* %289, i32 0, i32 7
  %291 = load i32, i32* %290, align 8
  %292 = call i32 @resample_init(%struct.resample_state* %285, i32 %288, i32 %291)
  %293 = icmp eq i32 %292, -1
  br i1 %293, label %307, label %294

; <label>:294:                                    ; preds = %282
  %pgocount25 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 21)
  %295 = add i64 %pgocount25, 1
  store i64 %295, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 21)
  %296 = load %struct.output*, %struct.output** %9, align 8
  %297 = getelementptr inbounds %struct.output, %struct.output* %296, i32 0, i32 12
  %298 = getelementptr inbounds [2 x %struct.resample_state], [2 x %struct.resample_state]* %297, i64 0, i64 1
  %299 = load %struct.output*, %struct.output** %9, align 8
  %300 = getelementptr inbounds %struct.output, %struct.output* %299, i32 0, i32 6
  %301 = load i32, i32* %300, align 4
  %302 = load %struct.output*, %struct.output** %9, align 8
  %303 = getelementptr inbounds %struct.output, %struct.output* %302, i32 0, i32 7
  %304 = load i32, i32* %303, align 8
  %305 = call i32 @resample_init(%struct.resample_state* %298, i32 %301, i32 %304)
  %306 = icmp eq i32 %305, -1
  br i1 %306, label %307, label %321

; <label>:307:                                    ; preds = %294, %282
  %pgocount26 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 22)
  %308 = add i64 %pgocount26, 1
  store i64 %308, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 22)
  %309 = load %struct.output*, %struct.output** %9, align 8
  %310 = getelementptr inbounds %struct.output, %struct.output* %309, i32 0, i32 6
  %311 = load i32, i32* %310, align 4
  %312 = load %struct.output*, %struct.output** %9, align 8
  %313 = getelementptr inbounds %struct.output, %struct.output* %312, i32 0, i32 7
  %314 = load i32, i32* %313, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.111, i32 0, i32 0), i32 %311, i32 %314)
  %315 = load %struct.output*, %struct.output** %9, align 8
  %316 = getelementptr inbounds %struct.output, %struct.output* %315, i32 0, i32 13
  %317 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %316, align 8
  %318 = bitcast [2 x [3456 x i32]]* %317 to i8*
  call void @free(i8* %318) #6
  %319 = load %struct.output*, %struct.output** %9, align 8
  %320 = getelementptr inbounds %struct.output, %struct.output* %319, i32 0, i32 13
  store [2 x [3456 x i32]]* null, [2 x [3456 x i32]]** %320, align 8
  store i32 17, i32* %4, align 4
  br label %496

; <label>:321:                                    ; preds = %294
  %322 = load %struct.player*, %struct.player** %8, align 8
  %323 = getelementptr inbounds %struct.player, %struct.player* %322, i32 0, i32 0
  %324 = load i32, i32* %323, align 8
  %325 = icmp sge i32 %324, -1
  br i1 %325, label %326, label %334

; <label>:326:                                    ; preds = %321
  %pgocount27 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 33)
  %327 = add i64 %pgocount27, 1
  store i64 %327, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 33)
  %328 = load %struct.output*, %struct.output** %9, align 8
  %329 = getelementptr inbounds %struct.output, %struct.output* %328, i32 0, i32 6
  %330 = load i32, i32* %329, align 4
  %331 = load %struct.output*, %struct.output** %9, align 8
  %332 = getelementptr inbounds %struct.output, %struct.output* %331, i32 0, i32 7
  %333 = load i32, i32* %332, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.112, i32 0, i32 0), i32 %330, i32 %333)
  br label %334

; <label>:334:                                    ; preds = %326, %321
  br label %335

; <label>:335:                                    ; preds = %334
  %pgocount28 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 27)
  %336 = add i64 %pgocount28, 1
  store i64 %336, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 27)
  br label %337

; <label>:337:                                    ; preds = %335, %261
  br label %338

; <label>:338:                                    ; preds = %337, %83
  call void @audio_control_init(%union.audio_control* %13, i32 2)
  %339 = load %struct.output*, %struct.output** %9, align 8
  %340 = getelementptr inbounds %struct.output, %struct.output* %339, i32 0, i32 3
  %341 = load i32, i32* %340, align 8
  %342 = load %struct.output*, %struct.output** %9, align 8
  %343 = getelementptr inbounds %struct.output, %struct.output* %342, i32 0, i32 4
  %344 = load i32, i32* %343, align 4
  %345 = icmp ne i32 %341, %344
  br i1 %345, label %346, label %358

; <label>:346:                                    ; preds = %338
  %347 = load %struct.output*, %struct.output** %9, align 8
  %348 = getelementptr inbounds %struct.output, %struct.output* %347, i32 0, i32 4
  %349 = load i32, i32* %348, align 4
  %350 = icmp eq i32 %349, 2
  br i1 %350, label %351, label %354

; <label>:351:                                    ; preds = %346
  %pgocount29 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 17)
  %352 = add i64 %pgocount29, 1
  store i64 %352, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 17)
  %353 = load i32*, i32** %10, align 8
  br label %356

; <label>:354:                                    ; preds = %346
  %pgocount30 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 18)
  %355 = add i64 %pgocount30, 1
  store i64 %355, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 18)
  br label %356

; <label>:356:                                    ; preds = %354, %351
  %357 = phi i32* [ %353, %351 ], [ null, %354 ]
  store i32* %357, i32** %11, align 8
  br label %358

; <label>:358:                                    ; preds = %356, %338
  %359 = load %struct.output*, %struct.output** %9, align 8
  %360 = getelementptr inbounds %struct.output, %struct.output* %359, i32 0, i32 13
  %361 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %360, align 8
  %362 = icmp ne [2 x [3456 x i32]]* %361, null
  br i1 %362, label %363, label %434

; <label>:363:                                    ; preds = %358
  %364 = load %struct.output*, %struct.output** %9, align 8
  %365 = getelementptr inbounds %struct.output, %struct.output* %364, i32 0, i32 12
  %366 = getelementptr inbounds [2 x %struct.resample_state], [2 x %struct.resample_state]* %365, i64 0, i64 0
  %367 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %368 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %367, i32 0, i32 2
  %369 = load i16, i16* %368, align 2
  %370 = zext i16 %369 to i32
  %371 = load i32*, i32** %10, align 8
  %372 = load %struct.output*, %struct.output** %9, align 8
  %373 = getelementptr inbounds %struct.output, %struct.output* %372, i32 0, i32 13
  %374 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %373, align 8
  %375 = getelementptr inbounds [2 x [3456 x i32]], [2 x [3456 x i32]]* %374, i64 0, i64 0
  %376 = getelementptr inbounds [3456 x i32], [3456 x i32]* %375, i32 0, i32 0
  %377 = call i32 @resample_block(%struct.resample_state* %366, i32 %370, i32* %371, i32* %376)
  %378 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %379 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %378, i32 0, i32 1
  store i32 %377, i32* %379, align 4
  %380 = load %struct.output*, %struct.output** %9, align 8
  %381 = getelementptr inbounds %struct.output, %struct.output* %380, i32 0, i32 13
  %382 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %381, align 8
  %383 = getelementptr inbounds [2 x [3456 x i32]], [2 x [3456 x i32]]* %382, i64 0, i64 0
  %384 = getelementptr inbounds [3456 x i32], [3456 x i32]* %383, i32 0, i32 0
  %385 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %386 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %385, i32 0, i32 2
  %387 = getelementptr inbounds [2 x i32*], [2 x i32*]* %386, i64 0, i64 0
  store i32* %384, i32** %387, align 8
  %388 = load i32*, i32** %11, align 8
  %389 = load i32*, i32** %10, align 8
  %390 = icmp eq i32* %388, %389
  br i1 %390, label %391, label %400

; <label>:391:                                    ; preds = %363
  %pgocount31 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 20)
  %392 = add i64 %pgocount31, 1
  store i64 %392, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 20)
  %393 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %394 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %393, i32 0, i32 2
  %395 = getelementptr inbounds [2 x i32*], [2 x i32*]* %394, i64 0, i64 0
  %396 = load i32*, i32** %395, align 8
  %397 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %398 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %397, i32 0, i32 2
  %399 = getelementptr inbounds [2 x i32*], [2 x i32*]* %398, i64 0, i64 1
  store i32* %396, i32** %399, align 8
  br label %433

; <label>:400:                                    ; preds = %363
  %401 = load i32*, i32** %11, align 8
  %402 = icmp ne i32* %401, null
  br i1 %402, label %403, label %427

; <label>:403:                                    ; preds = %400
  %pgocount32 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 19)
  %404 = add i64 %pgocount32, 1
  store i64 %404, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 19)
  %405 = load %struct.output*, %struct.output** %9, align 8
  %406 = getelementptr inbounds %struct.output, %struct.output* %405, i32 0, i32 12
  %407 = getelementptr inbounds [2 x %struct.resample_state], [2 x %struct.resample_state]* %406, i64 0, i64 1
  %408 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %409 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %408, i32 0, i32 2
  %410 = load i16, i16* %409, align 2
  %411 = zext i16 %410 to i32
  %412 = load i32*, i32** %11, align 8
  %413 = load %struct.output*, %struct.output** %9, align 8
  %414 = getelementptr inbounds %struct.output, %struct.output* %413, i32 0, i32 13
  %415 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %414, align 8
  %416 = getelementptr inbounds [2 x [3456 x i32]], [2 x [3456 x i32]]* %415, i64 0, i64 1
  %417 = getelementptr inbounds [3456 x i32], [3456 x i32]* %416, i32 0, i32 0
  %418 = call i32 @resample_block(%struct.resample_state* %407, i32 %411, i32* %412, i32* %417)
  %419 = load %struct.output*, %struct.output** %9, align 8
  %420 = getelementptr inbounds %struct.output, %struct.output* %419, i32 0, i32 13
  %421 = load [2 x [3456 x i32]]*, [2 x [3456 x i32]]** %420, align 8
  %422 = getelementptr inbounds [2 x [3456 x i32]], [2 x [3456 x i32]]* %421, i64 0, i64 1
  %423 = getelementptr inbounds [3456 x i32], [3456 x i32]* %422, i32 0, i32 0
  %424 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %425 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %424, i32 0, i32 2
  %426 = getelementptr inbounds [2 x i32*], [2 x i32*]* %425, i64 0, i64 1
  store i32* %423, i32** %426, align 8
  br label %432

; <label>:427:                                    ; preds = %400
  %pgocount33 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 26)
  %428 = add i64 %pgocount33, 1
  store i64 %428, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 26)
  %429 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %430 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %429, i32 0, i32 2
  %431 = getelementptr inbounds [2 x i32*], [2 x i32*]* %430, i64 0, i64 1
  store i32* null, i32** %431, align 8
  br label %432

; <label>:432:                                    ; preds = %427, %403
  br label %433

; <label>:433:                                    ; preds = %432, %391
  br label %450

; <label>:434:                                    ; preds = %358
  %pgocount34 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 10)
  %435 = add i64 %pgocount34, 1
  store i64 %435, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 10)
  %436 = load %struct.mad_pcm*, %struct.mad_pcm** %7, align 8
  %437 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %436, i32 0, i32 2
  %438 = load i16, i16* %437, align 2
  %439 = zext i16 %438 to i32
  %440 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %441 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %440, i32 0, i32 1
  store i32 %439, i32* %441, align 4
  %442 = load i32*, i32** %10, align 8
  %443 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %444 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %443, i32 0, i32 2
  %445 = getelementptr inbounds [2 x i32*], [2 x i32*]* %444, i64 0, i64 0
  store i32* %442, i32** %445, align 8
  %446 = load i32*, i32** %11, align 8
  %447 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %448 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %447, i32 0, i32 2
  %449 = getelementptr inbounds [2 x i32*], [2 x i32*]* %448, i64 0, i64 1
  store i32* %446, i32** %449, align 8
  br label %450

; <label>:450:                                    ; preds = %434, %433
  %451 = load %struct.output*, %struct.output** %9, align 8
  %452 = getelementptr inbounds %struct.output, %struct.output* %451, i32 0, i32 0
  %453 = load i32, i32* %452, align 8
  %454 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %455 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %454, i32 0, i32 3
  store i32 %453, i32* %455, align 8
  %456 = load %struct.player*, %struct.player** %8, align 8
  %457 = getelementptr inbounds %struct.player, %struct.player* %456, i32 0, i32 12
  %458 = getelementptr inbounds %struct.stats, %struct.stats* %457, i32 0, i32 17
  %459 = bitcast %union.audio_control* %13 to %struct.audio_play*
  %460 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %459, i32 0, i32 4
  store %struct.audio_stats* %458, %struct.audio_stats** %460, align 8
  %461 = load %struct.output*, %struct.output** %9, align 8
  %462 = getelementptr inbounds %struct.output, %struct.output* %461, i32 0, i32 11
  %463 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %462, align 8
  %464 = ptrtoint i32 (%union.audio_control*)* %463 to i64
  call void @__llvm_profile_instrument_target(i64 %464, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_output to i8*), i32 1)
  %465 = call i32 %463(%union.audio_control* %13)
  %466 = icmp eq i32 %465, -1
  br i1 %466, label %467, label %470

; <label>:467:                                    ; preds = %450
  %pgocount35 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 11)
  %468 = add i64 %pgocount35, 1
  store i64 %468, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 11)
  %469 = load i8*, i8** @audio_error, align 8
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i8* %469)
  store i32 17, i32* %4, align 4
  br label %496

; <label>:470:                                    ; preds = %450
  %471 = load %struct.player*, %struct.player** %8, align 8
  %472 = getelementptr inbounds %struct.player, %struct.player* %471, i32 0, i32 12
  %473 = getelementptr inbounds %struct.stats, %struct.stats* %472, i32 0, i32 9
  %474 = load i64, i64* %473, align 8
  %475 = add i64 %474, 1
  store i64 %475, i64* %473, align 8
  %476 = load %struct.player*, %struct.player** %8, align 8
  %477 = getelementptr inbounds %struct.player, %struct.player* %476, i32 0, i32 12
  %478 = getelementptr inbounds %struct.stats, %struct.stats* %477, i32 0, i32 6
  %479 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  %480 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %479, i32 0, i32 10
  %481 = bitcast %struct.mad_timer_t* %480 to { i64, i64 }*
  %482 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %481, i32 0, i32 0
  %483 = load i64, i64* %482, align 8
  %484 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %481, i32 0, i32 1
  %485 = load i64, i64* %484, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %478, i64 %483, i64 %485)
  %486 = load %struct.player*, %struct.player** %8, align 8
  %487 = getelementptr inbounds %struct.player, %struct.player* %486, i32 0, i32 0
  %488 = load i32, i32* %487, align 8
  %489 = icmp sgt i32 %488, 0
  br i1 %489, label %490, label %495

; <label>:490:                                    ; preds = %470
  %pgocount36 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 9)
  %491 = add i64 %pgocount36, 1
  store i64 %491, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_output, i64 0, i64 9)
  %492 = load %struct.player*, %struct.player** %8, align 8
  %493 = getelementptr inbounds %struct.player, %struct.player* %492, i32 0, i32 12
  %494 = load %struct.mad_header*, %struct.mad_header** %6, align 8
  call void @show_status(%struct.stats* %493, %struct.mad_header* %494, i8* null, i32 0)
  br label %495

; <label>:495:                                    ; preds = %490, %470
  store i32 0, i32* %4, align 4
  br label %496

; <label>:496:                                    ; preds = %495, %467, %307, %278, %131
  %497 = load i32, i32* %4, align 4
  ret i32 %497
}

; Function Attrs: nounwind uwtable
define internal i32 @decode_error(i8*, %struct.mad_stream*, %struct.mad_frame*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.mad_stream*, align 8
  %7 = alloca %struct.mad_frame*, align 8
  %8 = alloca %struct.player*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.id3_tag*, align 8
  store i8* %0, i8** %5, align 8
  store %struct.mad_stream* %1, %struct.mad_stream** %6, align 8
  store %struct.mad_frame* %2, %struct.mad_frame** %7, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = bitcast i8* %11 to %struct.player*
  store %struct.player* %12, %struct.player** %8, align 8
  %13 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %14 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %13, i32 0, i32 13
  %15 = load i32, i32* %14, align 8
  switch i32 %15, label %82 [
    i32 565, label %16
    i32 257, label %18
  ]

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 2)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %163

; <label>:18:                                     ; preds = %3
  %19 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %20 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %19, i32 0, i32 5
  %21 = load i8*, i8** %20, align 8
  %22 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %23 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %22, i32 0, i32 1
  %24 = load i8*, i8** %23, align 8
  %25 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %26 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %25, i32 0, i32 5
  %27 = load i8*, i8** %26, align 8
  %28 = ptrtoint i8* %24 to i64
  %29 = ptrtoint i8* %27 to i64
  %30 = sub i64 %28, %29
  %31 = call i64 @id3_tag_query(i8* %21, i64 %30)
  store i64 %31, i64* %9, align 8
  %32 = load i64, i64* %9, align 8
  %33 = icmp sgt i64 %32, 0
  br i1 %33, label %34, label %80

; <label>:34:                                     ; preds = %18
  %35 = load %struct.player*, %struct.player** %8, align 8
  %36 = getelementptr inbounds %struct.player, %struct.player* %35, i32 0, i32 0
  %37 = load i32, i32* %36, align 8
  %38 = icmp sge i32 %37, 0
  br i1 %38, label %39, label %60

; <label>:39:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 10)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 10)
  %41 = load %struct.player*, %struct.player** %8, align 8
  %42 = getelementptr inbounds %struct.player, %struct.player* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 4
  %44 = and i32 %43, 128
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %60

; <label>:46:                                     ; preds = %39
  %47 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %48 = load i64, i64* %9, align 8
  %49 = load %struct.player*, %struct.player** %8, align 8
  %50 = getelementptr inbounds %struct.player, %struct.player* %49, i32 0, i32 10
  %51 = call %struct.id3_tag* @get_id3(%struct.mad_stream* %47, i64 %48, %struct.input* %50)
  store %struct.id3_tag* %51, %struct.id3_tag** %10, align 8
  %52 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  %53 = icmp ne %struct.id3_tag* %52, null
  br i1 %53, label %54, label %58

; <label>:54:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 14)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 14)
  %56 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  call void @show_id3(%struct.id3_tag* %56)
  %57 = load %struct.id3_tag*, %struct.id3_tag** %10, align 8
  call void @id3_tag_delete(%struct.id3_tag* %57)
  br label %58

; <label>:58:                                     ; preds = %54, %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 13)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 13)
  br label %64

; <label>:60:                                     ; preds = %39, %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 6)
  %61 = add i64 %pgocount5, 1
  store i64 %61, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 6)
  %62 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %63 = load i64, i64* %9, align 8
  call void @mad_stream_skip(%struct.mad_stream* %62, i64 %63)
  br label %64

; <label>:64:                                     ; preds = %60, %58
  %65 = load %struct.player*, %struct.player** %8, align 8
  %66 = getelementptr inbounds %struct.player, %struct.player* %65, i32 0, i32 12
  %67 = getelementptr inbounds %struct.stats, %struct.stats* %66, i32 0, i32 2
  %68 = load i64, i64* %67, align 8
  %69 = load i64, i64* %9, align 8
  %70 = icmp uge i64 %68, %69
  br i1 %70, label %71, label %79

; <label>:71:                                     ; preds = %64
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 11)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 11)
  %73 = load i64, i64* %9, align 8
  %74 = load %struct.player*, %struct.player** %8, align 8
  %75 = getelementptr inbounds %struct.player, %struct.player* %74, i32 0, i32 12
  %76 = getelementptr inbounds %struct.stats, %struct.stats* %75, i32 0, i32 2
  %77 = load i64, i64* %76, align 8
  %78 = sub i64 %77, %73
  store i64 %78, i64* %76, align 8
  br label %79

; <label>:79:                                     ; preds = %71, %64
  store i32 0, i32* %4, align 4
  br label %163

; <label>:80:                                     ; preds = %18
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 7)
  %81 = add i64 %pgocount7, 1
  store i64 %81, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 7)
  br label %82

; <label>:82:                                     ; preds = %80, %3
  %83 = load %struct.player*, %struct.player** %8, align 8
  %84 = getelementptr inbounds %struct.player, %struct.player* %83, i32 0, i32 0
  %85 = load i32, i32* %84, align 8
  %86 = icmp sge i32 %85, -1
  br i1 %86, label %87, label %132

; <label>:87:                                     ; preds = %82
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 3)
  %88 = add i64 %pgocount8, 1
  store i64 %88, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 3)
  %89 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %90 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %89, i32 0, i32 13
  %91 = load i32, i32* %90, align 8
  %92 = icmp eq i32 %91, 257
  br i1 %92, label %93, label %101

; <label>:93:                                     ; preds = %87
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 8)
  %94 = add i64 %pgocount9, 1
  store i64 %94, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 8)
  %95 = load %struct.player*, %struct.player** %8, align 8
  %96 = getelementptr inbounds %struct.player, %struct.player* %95, i32 0, i32 10
  %97 = getelementptr inbounds %struct.input, %struct.input* %96, i32 0, i32 5
  %98 = load i32, i32* %97, align 8
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %101, label %._crit_edge1

._crit_edge1:                                     ; preds = %93
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 1)
  %100 = add i64 %pgocount10, 1
  store i64 %100, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 1)
  br label %107

; <label>:101:                                    ; preds = %93, %87
  %102 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %103 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %102, i32 0, i32 3
  %104 = load i32, i32* %103, align 8
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %107, label %._crit_edge

._crit_edge:                                      ; preds = %101
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 0)
  %106 = add i64 %pgocount11, 1
  store i64 %106, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 0)
  br label %132

; <label>:107:                                    ; preds = %._crit_edge1, %101
  %108 = load %struct.player*, %struct.player** %8, align 8
  %109 = getelementptr inbounds %struct.player, %struct.player* %108, i32 0, i32 12
  %110 = getelementptr inbounds %struct.stats, %struct.stats* %109, i32 0, i32 7
  %111 = load i64, i64* %110, align 8
  %112 = load %struct.player*, %struct.player** %8, align 8
  %113 = getelementptr inbounds %struct.player, %struct.player* %112, i32 0, i32 12
  %114 = getelementptr inbounds %struct.stats, %struct.stats* %113, i32 0, i32 10
  %115 = load i64, i64* %114, align 8
  %116 = icmp ne i64 %111, %115
  br i1 %116, label %117, label %132

; <label>:117:                                    ; preds = %107
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 12)
  %118 = add i64 %pgocount12, 1
  store i64 %118, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 12)
  %119 = load %struct.player*, %struct.player** %8, align 8
  %120 = getelementptr inbounds %struct.player, %struct.player* %119, i32 0, i32 12
  %121 = getelementptr inbounds %struct.stats, %struct.stats* %120, i32 0, i32 8
  %122 = load i64, i64* %121, align 8
  %123 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %124 = call i8* @mad_stream_errorstr(%struct.mad_stream* %123)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.113, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.114, i32 0, i32 0), i64 %122, i8* %124)
  %125 = load %struct.player*, %struct.player** %8, align 8
  %126 = getelementptr inbounds %struct.player, %struct.player* %125, i32 0, i32 12
  %127 = getelementptr inbounds %struct.stats, %struct.stats* %126, i32 0, i32 7
  %128 = load i64, i64* %127, align 8
  %129 = load %struct.player*, %struct.player** %8, align 8
  %130 = getelementptr inbounds %struct.player, %struct.player* %129, i32 0, i32 12
  %131 = getelementptr inbounds %struct.stats, %struct.stats* %130, i32 0, i32 10
  store i64 %128, i64* %131, align 8
  br label %132

; <label>:132:                                    ; preds = %._crit_edge, %117, %107, %82
  br label %133

; <label>:133:                                    ; preds = %132
  %134 = load %struct.mad_stream*, %struct.mad_stream** %6, align 8
  %135 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %134, i32 0, i32 13
  %136 = load i32, i32* %135, align 8
  %137 = icmp eq i32 %136, 513
  br i1 %137, label %138, label %161

; <label>:138:                                    ; preds = %133
  %139 = load %struct.player*, %struct.player** %8, align 8
  %140 = getelementptr inbounds %struct.player, %struct.player* %139, i32 0, i32 12
  %141 = getelementptr inbounds %struct.stats, %struct.stats* %140, i32 0, i32 7
  %142 = load i64, i64* %141, align 8
  %143 = load %struct.player*, %struct.player** %8, align 8
  %144 = getelementptr inbounds %struct.player, %struct.player* %143, i32 0, i32 12
  %145 = getelementptr inbounds %struct.stats, %struct.stats* %144, i32 0, i32 11
  %146 = load i64, i64* %145, align 8
  %147 = icmp eq i64 %142, %146
  br i1 %147, label %148, label %151

; <label>:148:                                    ; preds = %138
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 9)
  %149 = add i64 %pgocount13, 1
  store i64 %149, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 9)
  %150 = load %struct.mad_frame*, %struct.mad_frame** %7, align 8
  call void @mad_frame_mute(%struct.mad_frame* %150)
  br label %151

; <label>:151:                                    ; preds = %148, %138
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 4)
  %152 = add i64 %pgocount14, 1
  store i64 %152, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 4)
  %153 = load %struct.player*, %struct.player** %8, align 8
  %154 = getelementptr inbounds %struct.player, %struct.player* %153, i32 0, i32 12
  %155 = getelementptr inbounds %struct.stats, %struct.stats* %154, i32 0, i32 7
  %156 = load i64, i64* %155, align 8
  %157 = add i64 %156, 1
  %158 = load %struct.player*, %struct.player** %8, align 8
  %159 = getelementptr inbounds %struct.player, %struct.player* %158, i32 0, i32 12
  %160 = getelementptr inbounds %struct.stats, %struct.stats* %159, i32 0, i32 11
  store i64 %157, i64* %160, align 8
  store i32 32, i32* %4, align 4
  br label %163

; <label>:161:                                    ; preds = %133
  %pgocount15 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 5)
  %162 = add i64 %pgocount15, 1
  store i64 %162, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_decode_error, i64 0, i64 5)
  store i32 0, i32* %4, align 4
  br label %163

; <label>:163:                                    ; preds = %161, %151, %79, %16
  %164 = load i32, i32* %4, align 4
  ret i32 %164
}

declare i32 @mad_decoder_run(%struct.mad_decoder*, i32) #2

declare i32 @mad_decoder_finish(%struct.mad_decoder*) #2

; Function Attrs: nounwind uwtable
define internal i32 @unmap_file(i8*, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = load i64, i64* %5, align 8
  %8 = call i32 @munmap(i8* %6, i64 %7) #6
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unmap_file, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unmap_file, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %14

; <label>:12:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unmap_file, i64 0, i64 0)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unmap_file, i64 0, i64 0)
  store i32 0, i32* %3, align 4
  br label %14

; <label>:14:                                     ; preds = %12, %10
  %15 = load i32, i32* %3, align 4
  ret i32 %15
}

; Function Attrs: nounwind
declare i8* @mmap(i8*, i64, i32, i32, i32, i64) #3

; Function Attrs: nounwind
declare i32 @madvise(i8*, i64, i32) #3

declare void @mad_stream_buffer(%struct.mad_stream*, i8*, i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @xing_parse(%struct.xing*, i8*, i64, i32) #2

declare void @mad_timer_multiply(%struct.mad_timer_t*, i64) #2

declare i32 @filter_run(%struct.filter*, %struct.mad_frame*) #2

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #4

declare i32 @resample_init(%struct.resample_state*, i32, i32) #2

declare i32 @resample_block(%struct.resample_state*, i32, i32*, i32*) #2

declare i64 @id3_tag_query(i8*, i64) #2

; Function Attrs: nounwind uwtable
define internal %struct.id3_tag* @get_id3(%struct.mad_stream*, i64, %struct.input*) #0 {
  %4 = alloca %struct.mad_stream*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.input*, align 8
  %7 = alloca %struct.id3_tag*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  store %struct.mad_stream* %0, %struct.mad_stream** %4, align 8
  store i64 %1, i64* %5, align 8
  store %struct.input* %2, %struct.input** %6, align 8
  store %struct.id3_tag* null, %struct.id3_tag** %7, align 8
  store i8* null, i8** %10, align 8
  %12 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %13 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %12, i32 0, i32 1
  %14 = load i8*, i8** %13, align 8
  %15 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %16 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %15, i32 0, i32 5
  %17 = load i8*, i8** %16, align 8
  %18 = ptrtoint i8* %14 to i64
  %19 = ptrtoint i8* %17 to i64
  %20 = sub i64 %18, %19
  store i64 %20, i64* %8, align 8
  %21 = load i64, i64* %5, align 8
  %22 = load i64, i64* %8, align 8
  %23 = icmp ule i64 %21, %22
  br i1 %23, label %24, label %31

; <label>:24:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 4)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 4)
  %26 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %27 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %26, i32 0, i32 5
  %28 = load i8*, i8** %27, align 8
  store i8* %28, i8** %9, align 8
  %29 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %30 = load i64, i64* %5, align 8
  call void @mad_stream_skip(%struct.mad_stream* %29, i64 %30)
  br label %93

; <label>:31:                                     ; preds = %3
  %32 = load i64, i64* %5, align 8
  %33 = call noalias i8* @malloc(i64 %32) #6
  store i8* %33, i8** %10, align 8
  %34 = load i8*, i8** %10, align 8
  %35 = icmp eq i8* %34, null
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 5)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 5)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.115, i32 0, i32 0))
  br label %97

; <label>:38:                                     ; preds = %31
  %39 = load i8*, i8** %10, align 8
  %40 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %41 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %40, i32 0, i32 5
  %42 = load i8*, i8** %41, align 8
  %43 = load i64, i64* %8, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* %42, i64 %43, i32 1, i1 false)
  %44 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %45 = load i64, i64* %8, align 8
  call void @mad_stream_skip(%struct.mad_stream* %44, i64 %45)
  br label %46

; <label>:46:                                     ; preds = %84, %38
  %47 = load i64, i64* %8, align 8
  %48 = load i64, i64* %5, align 8
  %49 = icmp ult i64 %47, %48
  br i1 %49, label %50, label %90

; <label>:50:                                     ; preds = %46
  br label %51

; <label>:51:                                     ; preds = %72, %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 0)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 0)
  %53 = load %struct.input*, %struct.input** %6, align 8
  %54 = getelementptr inbounds %struct.input, %struct.input* %53, i32 0, i32 1
  %55 = load i32, i32* %54, align 8
  %56 = load i8*, i8** %10, align 8
  %57 = load i64, i64* %8, align 8
  %58 = getelementptr inbounds i8, i8* %56, i64 %57
  %59 = load i64, i64* %5, align 8
  %60 = load i64, i64* %8, align 8
  %61 = sub i64 %59, %60
  %62 = call i64 @read(i32 %55, i8* %58, i64 %61)
  %63 = trunc i64 %62 to i32
  store i32 %63, i32* %11, align 4
  br label %64

; <label>:64:                                     ; preds = %51
  %65 = load i32, i32* %11, align 4
  %66 = icmp eq i32 %65, -1
  br i1 %66, label %67, label %72

; <label>:67:                                     ; preds = %64
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 1)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 1)
  %69 = call i32* @__errno_location() #8
  %70 = load i32, i32* %69, align 4
  %71 = icmp eq i32 %70, 4
  br label %72

; <label>:72:                                     ; preds = %67, %64
  %73 = phi i1 [ false, %64 ], [ %71, %67 ]
  br i1 %73, label %51, label %74

; <label>:74:                                     ; preds = %72
  %75 = load i32, i32* %11, align 4
  %76 = icmp eq i32 %75, -1
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %74
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 6)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 6)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0))
  br label %97

; <label>:79:                                     ; preds = %74
  %80 = load i32, i32* %11, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %84

; <label>:82:                                     ; preds = %79
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 8)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 8)
  call void (i8*, i8*, ...) @error(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.116, i32 0, i32 0))
  br label %97

; <label>:84:                                     ; preds = %79
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 2)
  %85 = add i64 %pgocount6, 1
  store i64 %85, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 2)
  %86 = load i32, i32* %11, align 4
  %87 = sext i32 %86 to i64
  %88 = load i64, i64* %8, align 8
  %89 = add i64 %88, %87
  store i64 %89, i64* %8, align 8
  br label %46

; <label>:90:                                     ; preds = %46
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 7)
  %91 = add i64 %pgocount7, 1
  store i64 %91, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 7)
  %92 = load i8*, i8** %10, align 8
  store i8* %92, i8** %9, align 8
  br label %93

; <label>:93:                                     ; preds = %90, %24
  %94 = load i8*, i8** %9, align 8
  %95 = load i64, i64* %5, align 8
  %96 = call %struct.id3_tag* @id3_tag_parse(i8* %94, i64 %95)
  store %struct.id3_tag* %96, %struct.id3_tag** %7, align 8
  br label %97

; <label>:97:                                     ; preds = %93, %82, %77, %36
  %98 = load i8*, i8** %10, align 8
  %99 = icmp ne i8* %98, null
  br i1 %99, label %100, label %103

; <label>:100:                                    ; preds = %97
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 3)
  %101 = add i64 %pgocount8, 1
  store i64 %101, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_get_id3, i64 0, i64 3)
  %102 = load i8*, i8** %10, align 8
  call void @free(i8* %102) #6
  br label %103

; <label>:103:                                    ; preds = %100, %97
  %104 = load %struct.id3_tag*, %struct.id3_tag** %7, align 8
  ret %struct.id3_tag* %104
}

declare void @id3_tag_delete(%struct.id3_tag*) #2

declare void @mad_stream_skip(%struct.mad_stream*, i64) #2

declare i8* @mad_stream_errorstr(%struct.mad_stream*) #2

declare void @mad_frame_mute(%struct.mad_frame*) #2

declare %struct.id3_tag* @id3_tag_parse(i8*, i64) #2

; Function Attrs: nounwind
declare i32 @munmap(i8*, i64) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #6

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
