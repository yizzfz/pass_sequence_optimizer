; ModuleID = 'lame.ll'
source_filename = "lame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bit_stream_struc = type { i8*, i32, %struct._IO_FILE*, i8*, i32, i64, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.ID3TAGDATA = type { i32, i32, [31 x i8], [31 x i8], [31 x i8], [5 x i8], [31 x i8], [128 x i8], [1 x i8], i8 }
%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

@bs = internal global %struct.bit_stream_struc zeroinitializer, align 8
@l3_side = internal global %struct.III_side_info_t zeroinitializer, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [65 x i8] c"Warning: highpass filter disabled.  highpass frequency to small\0A\00", align 1
@id3tag = external global %struct.ID3TAGDATA, align 4
@sfBandIndex = external local_unnamed_addr global [6 x %struct.scalefac_struct], align 16
@scalefac_band = external local_unnamed_addr global %struct.scalefac_struct, align 4
@lame_print_config.mode_names = internal unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0)], align 16
@.str.1 = private unnamed_addr constant [7 x i8] c"stereo\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"j-stereo\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"dual-ch\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"single-ch\00", align 1
@.str.5 = private unnamed_addr constant [68 x i8] c"Autoconverting from stereo to mono. Setting encoding to mono mode.\0A\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"Resampling:  input=%ikHz  output=%ikHz\0A\00", align 1
@.str.7 = private unnamed_addr constant [70 x i8] c"Using polyphase highpass filter, transition band: %.0f Hz -  %.0f Hz\0A\00", align 1
@.str.8 = private unnamed_addr constant [70 x i8] c"Using polyphase lowpass filter,  transition band:  %.0f Hz - %.0f Hz\0A\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"Analyzing %s \0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"Encoding %s to %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str.14 = private unnamed_addr constant [59 x i8] c"Encoding as %.1fkHz VBR(q=%i) %s MPEG%i LayerIII  qval=%i\0A\00", align 1
@.str.15 = private unnamed_addr constant [67 x i8] c"Encoding as %.1f kHz %d kbps %s MPEG%i LayerIII (%4.1fx)  qval=%i\0A\00", align 1
@lame_encode_frame.frameBits = internal unnamed_addr global i64 0, align 8
@lame_encode_frame.bitsPerSlot = internal unnamed_addr global i1 false, align 8
@lame_encode_frame.frac_SpF = internal unnamed_addr global double 0.000000e+00, align 8
@lame_encode_frame.slot_lag = internal unnamed_addr global double 0.000000e+00, align 8
@lame_encode_frame.sentBits = internal unnamed_addr global i64 0, align 8
@lame_encode_frame.ms_ratio = internal global [2 x double] zeroinitializer, align 16
@lame_encode_frame.ms_ener_ratio = internal global [2 x double] zeroinitializer, align 16
@.str.16 = private unnamed_addr constant [44 x i8] c"mf_size>=(BLKSIZE+gfp->framesize-FFTOFFSET)\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"lame.c\00", align 1
@__PRETTY_FUNCTION__.lame_encode_frame = private unnamed_addr constant [79 x i8] c"int lame_encode_frame(lame_global_flags *, short *, short *, int, char *, int)\00", align 1
@.str.18 = private unnamed_addr constant [36 x i8] c"Sent %ld bits = %ld slots plus %ld\0A\00", align 1
@fill_buffer_resample.itime = internal unnamed_addr global [2 x double] zeroinitializer, align 16
@fill_buffer_resample.inbuf_old = internal unnamed_addr global [2 x [5 x i16]] zeroinitializer, align 16
@fill_buffer_resample.init = internal unnamed_addr global [2 x i32] zeroinitializer, align 4
@lame_encode_buffer.frame_buffered = internal unnamed_addr global i1 false, align 4
@.str.19 = private unnamed_addr constant [18 x i8] c"MFSIZE>=mf_needed\00", align 1
@__PRETTY_FUNCTION__.lame_encode_buffer = private unnamed_addr constant [80 x i8] c"int lame_encode_buffer(lame_global_flags *, short *, short *, int, char *, int)\00", align 1
@mfbuf = internal global [2 x [3056 x i16]] zeroinitializer, align 16
@mf_samples_to_encode = internal unnamed_addr global i32 0, align 4
@mf_size = internal unnamed_addr global i32 0, align 4
@.str.20 = private unnamed_addr constant [16 x i8] c"mf_size<=MFSIZE\00", align 1
@.str.21 = private unnamed_addr constant [12 x i8] c"nsamples==0\00", align 1
@lame_encode_buffer_interleaved.frame_buffered = internal unnamed_addr global i1 false, align 4
@__PRETTY_FUNCTION__.lame_encode_buffer_interleaved = private unnamed_addr constant [83 x i8] c"int lame_encode_buffer_interleaved(lame_global_flags *, short *, int, char *, int)\00", align 1
@.str.22 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @lame_init_params(%struct.lame_global_flags*) local_unnamed_addr #0 {
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.bit_stream_struc* @bs to i8*), i8 0, i64 56, i32 8, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.III_side_info_t* @l3_side to i8*), i8 0, i64 528, i32 8, i1 false)
  %2 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  store i64 0, i64* %2, align 8
  tail call void @InitFormatBitStream() #8
  %3 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  store i32 3, i32* %7, align 4
  br label %8

; <label>:8:                                      ; preds = %6, %1
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 3
  %. = select i1 %12, i32 1, i32 2
  store i32 %., i32* %9, align 4
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %66

; <label>:16:                                     ; preds = %8
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 2
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %13, align 8
  %19 = icmp sgt i32 %18, 47999
  br i1 %19, label %28, label %20

; <label>:20:                                     ; preds = %16
  %21 = icmp sgt i32 %18, 44099
  br i1 %21, label %28, label %22

; <label>:22:                                     ; preds = %20
  %23 = icmp sgt i32 %18, 31999
  br i1 %23, label %28, label %24

; <label>:24:                                     ; preds = %22
  %25 = icmp sgt i32 %18, 23999
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %24
  %27 = icmp sgt i32 %18, 22049
  %.sink = select i1 %27, i32 22050, i32 16000
  br label %28

; <label>:28:                                     ; preds = %16, %24, %22, %20, %26
  %.sink54 = phi i32 [ %.sink, %26 ], [ 44100, %20 ], [ 32000, %22 ], [ 24000, %24 ], [ 48000, %16 ]
  store i32 %.sink54, i32* %13, align 8
  %29 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %30 = load i32, i32* %29, align 8
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %66

; <label>:32:                                     ; preds = %28
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  %34 = load i32, i32* %33, align 8
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %66

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* %13, align 8
  %38 = shl i32 %37, 4
  %39 = load i32, i32* %9, align 4
  %40 = mul nsw i32 %38, %39
  %41 = sitofp i32 %40 to double
  %42 = sitofp i32 %30 to double
  %43 = fmul double %42, 1.000000e+03
  %44 = fdiv double %41, %43
  %45 = fptrunc double %44 to float
  %46 = fcmp ogt float %45, 1.300000e+01
  br i1 %46, label %47, label %66

; <label>:47:                                     ; preds = %36
  %48 = fmul double %42, 1.000000e+04
  %49 = shl nsw i32 %39, 4
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %48, %50
  %52 = fptosi double %51 to i32
  store i32 %52, i32* %13, align 8
  %53 = icmp slt i32 %52, 16001
  br i1 %53, label %54, label %55

; <label>:54:                                     ; preds = %47
  store i32 16000, i32* %13, align 8
  br label %66

; <label>:55:                                     ; preds = %47
  %56 = icmp slt i32 %52, 22051
  br i1 %56, label %57, label %58

; <label>:57:                                     ; preds = %55
  store i32 22050, i32* %13, align 8
  br label %66

; <label>:58:                                     ; preds = %55
  %59 = icmp slt i32 %52, 24001
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %58
  store i32 24000, i32* %13, align 8
  br label %66

; <label>:61:                                     ; preds = %58
  %62 = icmp slt i32 %52, 32001
  br i1 %62, label %63, label %64

; <label>:63:                                     ; preds = %61
  store i32 32000, i32* %13, align 8
  br label %66

; <label>:64:                                     ; preds = %61
  %65 = icmp slt i32 %52, 44101
  %.sink10 = select i1 %65, i32 44100, i32 48000
  store i32 %.sink10, i32* %13, align 8
  br label %66

; <label>:66:                                     ; preds = %28, %54, %60, %64, %63, %57, %32, %36, %8
  %67 = load i32, i32* %13, align 8
  %68 = icmp slt i32 %67, 24001
  %69 = select i1 %68, i32 1, i32 2
  %70 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  store i32 %69, i32* %70, align 8
  %71 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 41
  store i32 800, i32* %71, align 8
  %72 = mul nuw nsw i32 %69, 576
  %73 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  store i32 %72, i32* %73, align 4
  %74 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %75 = load i32, i32* %74, align 8
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %80

; <label>:77:                                     ; preds = %66
  %78 = load i32, i32* %70, align 8
  %79 = icmp eq i32 %78, 1
  %.55 = select i1 %79, i32 64, i32 128
  store i32 %.55, i32* %74, align 8
  br label %80

; <label>:80:                                     ; preds = %77, %66
  %81 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 49
  store float 1.000000e+00, float* %81, align 8
  %82 = load i32, i32* %13, align 8
  %83 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 2
  %84 = load i32, i32* %83, align 4
  %85 = icmp eq i32 %82, %84
  br i1 %85, label %90, label %86

; <label>:86:                                     ; preds = %80
  %87 = sitofp i32 %84 to float
  %88 = sitofp i32 %82 to float
  %89 = fdiv float %87, %88
  store float %89, float* %81, align 8
  br label %90

; <label>:90:                                     ; preds = %80, %86
  %91 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 40
  %92 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 0
  %93 = load i64, i64* %92, align 8
  %94 = uitofp i64 %93 to float
  %95 = load float, float* %81, align 8
  %96 = load i32, i32* %73, align 4
  %97 = sitofp i32 %96 to float
  %98 = fmul float %95, %97
  %99 = fdiv float %94, %98
  %100 = fadd float %99, 2.000000e+00
  %101 = fptosi float %100 to i64
  store i64 %101, i64* %91, align 8
  %102 = load i32, i32* %74, align 8
  %103 = icmp sgt i32 %102, 319
  br i1 %103, label %104, label %106

; <label>:104:                                    ; preds = %90
  %105 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  store i32 0, i32* %105, align 8
  br label %106

; <label>:106:                                    ; preds = %104, %90
  %107 = load i32, i32* %13, align 8
  %108 = shl i32 %107, 4
  %109 = load i32, i32* %9, align 4
  %110 = mul nsw i32 %108, %109
  %111 = sitofp i32 %110 to double
  %112 = load i32, i32* %74, align 8
  %113 = sitofp i32 %112 to double
  %114 = fmul double %113, 1.000000e+03
  %115 = fdiv double %111, %114
  %116 = fptrunc double %115 to float
  %117 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  %118 = load i32, i32* %117, align 8
  %119 = icmp ne i32 %118, 0
  %120 = fcmp ogt float %116, 1.100000e+01
  %or.cond = and i1 %119, %120
  br i1 %or.cond, label %121, label %127

; <label>:121:                                    ; preds = %106
  %122 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %123 = load i32, i32* %122, align 4
  %124 = sitofp i32 %123 to double
  %125 = fadd double %124, 4.400000e+00
  %126 = fptrunc double %125 to float
  br label %127

; <label>:127:                                    ; preds = %106, %121
  %.01 = phi float [ %126, %121 ], [ %116, %106 ]
  %128 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %129 = load i32, i32* %128, align 8
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %136

; <label>:131:                                    ; preds = %127
  %132 = load i32, i32* %10, align 4
  %133 = icmp ne i32 %132, 3
  %134 = fcmp olt float %.01, 9.000000e+00
  %or.cond32 = and i1 %134, %133
  br i1 %or.cond32, label %135, label %136

; <label>:135:                                    ; preds = %131
  store i32 0, i32* %10, align 4
  br label %136

; <label>:136:                                    ; preds = %131, %135, %127
  %137 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %138 = load i32, i32* %137, align 8
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %140, label %156

; <label>:140:                                    ; preds = %136
  %141 = fpext float %.01 to double
  %142 = fmul double %141, 6.250000e-02
  %143 = tail call double @log(double %142) #8
  %144 = fmul double %143, 1.800000e+01
  %145 = fsub double 1.450000e+01, %144
  %146 = tail call double @floor(double %145) #9
  %147 = fadd double %146, 1.000000e+00
  %148 = fptosi double %147 to i32
  %149 = icmp slt i32 %148, 31
  %150 = sitofp i32 %148 to double
  %151 = fdiv double %150, 3.100000e+01
  %152 = fptrunc double %151 to float
  br i1 %149, label %153, label %156

; <label>:153:                                    ; preds = %140
  %154 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 54
  %155 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  store float %152, float* %155, align 8
  store float %152, float* %154, align 4
  br label %156

; <label>:156:                                    ; preds = %140, %153, %136
  %157 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %158 = load i32, i32* %157, align 4
  %159 = icmp sgt i32 %158, 0
  br i1 %159, label %160, label %185

; <label>:160:                                    ; preds = %156
  %161 = sitofp i32 %158 to double
  %162 = fmul double %161, 2.000000e+00
  %163 = load i32, i32* %13, align 8
  %164 = sitofp i32 %163 to double
  %165 = fdiv double %162, %164
  %166 = fptrunc double %165 to float
  %167 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 55
  store float %166, float* %167, align 8
  %168 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  %169 = load i32, i32* %168, align 4
  %170 = load i32, i32* %157, align 4
  %171 = icmp sgt i32 %169, 0
  %172 = select i1 %171, i32 %169, i32 0
  %.56 = add nsw i32 %172, %170
  %173 = sitofp i32 %.56 to double
  %174 = fmul double %173, 2.000000e+00
  %175 = load i32, i32* %13, align 8
  %176 = sitofp i32 %175 to double
  %177 = fdiv double %174, %176
  %178 = fptrunc double %177 to float
  %179 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 56
  %180 = load float, float* %167, align 8
  %181 = fcmp ogt float %180, 1.000000e+00
  %182 = select i1 %181, float 1.000000e+00, float %180
  store float %182, float* %167, align 8
  %183 = fcmp ogt float %178, 1.000000e+00
  %184 = select i1 %183, float 1.000000e+00, float %178
  store float %184, float* %179, align 4
  br label %185

; <label>:185:                                    ; preds = %160, %156
  %186 = load i32, i32* %137, align 8
  %187 = icmp sgt i32 %186, 0
  br i1 %187, label %188, label %226

; <label>:188:                                    ; preds = %185
  %189 = sitofp i32 %186 to double
  %190 = fmul double %189, 2.000000e+00
  %191 = load i32, i32* %13, align 8
  %192 = sitofp i32 %191 to double
  %193 = fdiv double %190, %192
  %194 = fptrunc double %193 to float
  %195 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 54
  store float %194, float* %195, align 4
  %196 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  %197 = load i32, i32* %196, align 8
  %198 = icmp sgt i32 %197, -1
  %199 = load i32, i32* %137, align 8
  br i1 %198, label %200, label %210

; <label>:200:                                    ; preds = %188
  %201 = sub nsw i32 %199, %197
  %202 = sitofp i32 %201 to double
  %203 = fmul double %202, 2.000000e+00
  %204 = load i32, i32* %13, align 8
  %205 = sitofp i32 %204 to double
  %206 = fdiv double %203, %205
  %207 = fptrunc double %206 to float
  %208 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  store float %207, float* %208, align 8
  %209 = fcmp olt float %207, 0.000000e+00
  br i1 %209, label %.sink.split, label %218

; <label>:210:                                    ; preds = %188
  %211 = sitofp i32 %199 to double
  %212 = fmul double %211, 2.000000e+00
  %213 = load i32, i32* %13, align 8
  %214 = sitofp i32 %213 to double
  %215 = fdiv double %212, %214
  %216 = fptrunc double %215 to float
  br label %.sink.split

.sink.split:                                      ; preds = %200, %210
  %.sink20 = phi float [ %216, %210 ], [ 0.000000e+00, %200 ]
  %217 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  store float %.sink20, float* %217, align 8
  br label %218

; <label>:218:                                    ; preds = %.sink.split, %200
  %219 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  %220 = load float, float* %219, align 8
  %221 = fcmp ogt float %220, 1.000000e+00
  %222 = select i1 %221, float 1.000000e+00, float %220
  store float %222, float* %219, align 8
  %223 = load float, float* %195, align 4
  %224 = fcmp ogt float %223, 1.000000e+00
  %225 = select i1 %224, float 1.000000e+00, float %223
  store float %225, float* %195, align 4
  br label %226

; <label>:226:                                    ; preds = %218, %185
  %227 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 59
  %228 = load i32, i32* %227, align 8
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %230, label %342

; <label>:230:                                    ; preds = %226
  %231 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  %232 = load float, float* %231, align 8
  %233 = fcmp ogt float %232, 0.000000e+00
  br i1 %233, label %.preheader63, label %281

.preheader63:                                     ; preds = %230
  %234 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 54
  %235 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 57
  br label %236

; <label>:236:                                    ; preds = %cdce.end, %.preheader63
  %.0271 = phi i32 [ 0, %.preheader63 ], [ %264, %cdce.end ]
  %.0669 = phi i32 [ 999, %.preheader63 ], [ %.17, %cdce.end ]
  %237 = sitofp i32 %.0271 to double
  %238 = fdiv double %237, 3.100000e+01
  %239 = load float, float* %234, align 4
  %240 = fpext float %239 to double
  %241 = fcmp ult double %238, %240
  br i1 %241, label %245, label %242

; <label>:242:                                    ; preds = %236
  %243 = load i32, i32* %235, align 8
  %244 = icmp slt i32 %243, %.0271
  %..02 = select i1 %244, i32 %243, i32 %.0271
  store i32 %..02, i32* %235, align 8
  br label %245

; <label>:245:                                    ; preds = %236, %242
  %246 = load float, float* %231, align 8
  %247 = fpext float %246 to double
  %248 = fcmp olt double %247, %238
  br i1 %248, label %249, label %cdce.end

; <label>:249:                                    ; preds = %245
  %250 = load float, float* %234, align 4
  %251 = fpext float %250 to double
  %252 = fcmp olt double %238, %251
  br i1 %252, label %253, label %cdce.end

; <label>:253:                                    ; preds = %249
  %254 = icmp slt i32 %.0669, %.0271
  %.06..02 = select i1 %254, i32 %.0669, i32 %.0271
  %255 = fsub double %247, %238
  %256 = fmul double %255, 0x3FF921FB54442D18
  %257 = fsub float %250, %246
  %258 = fpext float %257 to double
  %259 = fdiv double %256, %258
  %260 = fcmp oeq double %259, 0xFFF0000000000000
  %261 = fcmp oeq double %259, 0x7FF0000000000000
  %262 = or i1 %261, %260
  br i1 %262, label %cdce.call, label %cdce.end, !prof !1

cdce.call:                                        ; preds = %253
  %263 = tail call double @cos(double %259) #8
  br label %cdce.end

cdce.end:                                         ; preds = %cdce.call, %253, %245, %249
  %.17 = phi i32 [ %.0669, %249 ], [ %.0669, %245 ], [ %.06..02, %253 ], [ %.06..02, %cdce.call ]
  %264 = add nuw nsw i32 %.0271, 1
  %exitcond73 = icmp eq i32 %264, 32
  br i1 %exitcond73, label %265, label %236

; <label>:265:                                    ; preds = %cdce.end
  %266 = icmp eq i32 %.17, 999
  br i1 %266, label %267, label %270

; <label>:267:                                    ; preds = %265
  %268 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 57
  %269 = load i32, i32* %268, align 8
  br label %270

; <label>:270:                                    ; preds = %265, %267
  %.06.sink = phi i32 [ %269, %267 ], [ %.17, %265 ]
  %271 = sitofp i32 %.06.sink to double
  %272 = fadd double %271, -7.500000e-01
  %273 = fdiv double %272, 3.100000e+01
  %274 = fptrunc double %273 to float
  store float %274, float* %231, align 8
  %275 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 57
  %276 = load i32, i32* %275, align 8
  %277 = sitofp i32 %276 to double
  %278 = fdiv double %277, 3.100000e+01
  %279 = fptrunc double %278 to float
  %280 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 54
  store float %279, float* %280, align 4
  br label %281

; <label>:281:                                    ; preds = %270, %230
  %282 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 56
  %283 = load float, float* %282, align 4
  %284 = fcmp ogt float %283, 0.000000e+00
  br i1 %284, label %285, label %292

; <label>:285:                                    ; preds = %281
  %286 = fpext float %283 to double
  %287 = fcmp olt double %286, 0x3F964BF964BF964C
  br i1 %287, label %288, label %thread-pre-split

; <label>:288:                                    ; preds = %285
  %289 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 55
  store float 0.000000e+00, float* %289, align 8
  store float 0.000000e+00, float* %282, align 4
  %290 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %291 = tail call i64 @fwrite(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i64 0, i64 0), i64 64, i64 1, %struct._IO_FILE* %290) #10
  br label %thread-pre-split

thread-pre-split:                                 ; preds = %288, %285
  %.pr = load float, float* %282, align 4
  br label %292

; <label>:292:                                    ; preds = %thread-pre-split, %281
  %293 = phi float [ %.pr, %thread-pre-split ], [ %283, %281 ]
  %294 = fcmp ogt float %293, 0.000000e+00
  br i1 %294, label %.preheader62, label %342

.preheader62:                                     ; preds = %292
  %295 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 55
  %296 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 58
  br label %297

; <label>:297:                                    ; preds = %cdce.end60, %.preheader62
  %.1368 = phi i32 [ 0, %.preheader62 ], [ %326, %cdce.end60 ]
  %.267 = phi i32 [ -1, %.preheader62 ], [ %.3, %cdce.end60 ]
  %298 = sitofp i32 %.1368 to double
  %299 = fdiv double %298, 3.100000e+01
  %300 = load float, float* %295, align 8
  %301 = fpext float %300 to double
  %302 = fcmp ugt double %299, %301
  br i1 %302, label %306, label %303

; <label>:303:                                    ; preds = %297
  %304 = load i32, i32* %296, align 4
  %305 = icmp sgt i32 %304, %.1368
  %..13 = select i1 %305, i32 %304, i32 %.1368
  store i32 %..13, i32* %296, align 4
  br label %306

; <label>:306:                                    ; preds = %297, %303
  %307 = load float, float* %295, align 8
  %308 = fpext float %307 to double
  %309 = fcmp olt double %308, %299
  br i1 %309, label %310, label %cdce.end60

; <label>:310:                                    ; preds = %306
  %311 = load float, float* %282, align 4
  %312 = fpext float %311 to double
  %313 = fcmp olt double %299, %312
  br i1 %313, label %314, label %cdce.end60

; <label>:314:                                    ; preds = %310
  %315 = icmp sgt i32 %.267, %.1368
  %316 = select i1 %315, i32 %.267, i32 %.1368
  %317 = fsub double %312, %299
  %318 = fmul double %317, 0x3FF921FB54442D18
  %319 = fsub float %311, %307
  %320 = fpext float %319 to double
  %321 = fdiv double %318, %320
  %322 = fcmp oeq double %321, 0xFFF0000000000000
  %323 = fcmp oeq double %321, 0x7FF0000000000000
  %324 = or i1 %323, %322
  br i1 %324, label %cdce.call59, label %cdce.end60, !prof !1

cdce.call59:                                      ; preds = %314
  %325 = tail call double @cos(double %321) #8
  br label %cdce.end60

cdce.end60:                                       ; preds = %cdce.call59, %314, %306, %310
  %.3 = phi i32 [ %.267, %310 ], [ %.267, %306 ], [ %316, %314 ], [ %316, %cdce.call59 ]
  %326 = add nuw nsw i32 %.1368, 1
  %exitcond72 = icmp eq i32 %326, 32
  br i1 %exitcond72, label %327, label %297

; <label>:327:                                    ; preds = %cdce.end60
  %328 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 58
  %329 = load i32, i32* %328, align 4
  %330 = sitofp i32 %329 to double
  %331 = fdiv double %330, 3.100000e+01
  %332 = fptrunc double %331 to float
  %333 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 55
  store float %332, float* %333, align 8
  %334 = icmp eq i32 %.3, -1
  br i1 %334, label %335, label %337

; <label>:335:                                    ; preds = %327
  %336 = load i32, i32* %328, align 4
  br label %337

; <label>:337:                                    ; preds = %327, %335
  %.2.sink = phi i32 [ %336, %335 ], [ %.3, %327 ]
  %338 = sitofp i32 %.2.sink to double
  %339 = fadd double %338, 7.500000e-01
  %340 = fdiv double %339, 3.100000e+01
  %341 = fptrunc double %340 to float
  store float %341, float* %282, align 4
  br label %342

; <label>:342:                                    ; preds = %292, %337, %226
  %343 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 52
  store i32 0, i32* %343, align 4
  %344 = load i32, i32* %10, align 4
  %345 = icmp eq i32 %344, 3
  %346 = select i1 %345, i32 1, i32 2
  store i32 %346, i32* %9, align 4
  %347 = load i32, i32* %13, align 8
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %350 = tail call i32 @SmpFrqIndex(i64 %348, i32* %349) #8
  %351 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 51
  store i32 %350, i32* %351, align 8
  %352 = icmp slt i32 %350, 0
  br i1 %352, label %353, label %355

; <label>:353:                                    ; preds = %342
  %354 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  tail call void @display_bitrates(%struct._IO_FILE* %354) #8
  tail call void @exit(i32 1) #11
  unreachable

; <label>:355:                                    ; preds = %342
  %356 = load i32, i32* %74, align 8
  %357 = load i32, i32* %349, align 8
  %358 = load i32, i32* %13, align 8
  %359 = tail call i32 @BitrateIndex(i32 %356, i32 %357, i32 %358) #8
  %360 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 50
  store i32 %359, i32* %360, align 4
  %361 = icmp slt i32 %359, 0
  br i1 %361, label %362, label %364

; <label>:362:                                    ; preds = %355
  %363 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  tail call void @display_bitrates(%struct._IO_FILE* %363) #8
  tail call void @exit(i32 1) #11
  unreachable

; <label>:364:                                    ; preds = %355
  %365 = load i32, i32* %117, align 8
  %366 = icmp eq i32 %365, 0
  br i1 %366, label %.thread, label %367

; <label>:367:                                    ; preds = %364
  %368 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %369 = load i32, i32* %368, align 4
  %370 = icmp eq i32 %369, 0
  br i1 %370, label %371, label %388

; <label>:371:                                    ; preds = %367
  %372 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 48
  %373 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %374 = load i32, i32* %373, align 8
  %375 = icmp sgt i32 %374, 255
  %.57 = select i1 %375, i32 14, i32 13
  store i32 %.57, i32* %372, align 4
  %376 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %377 = load i32, i32* %376, align 4
  %378 = icmp eq i32 %377, 0
  br i1 %378, label %379, label %380

; <label>:379:                                    ; preds = %371
  store i32 14, i32* %372, align 4
  %.pr33 = load i32, i32* %376, align 4
  br label %380

; <label>:380:                                    ; preds = %379, %371
  %381 = phi i32 [ %.pr33, %379 ], [ %377, %371 ]
  %382 = icmp sgt i32 %381, 3
  br i1 %382, label %383, label %384

; <label>:383:                                    ; preds = %380
  store i32 12, i32* %372, align 4
  br label %384

; <label>:384:                                    ; preds = %383, %380
  %385 = load i32, i32* %376, align 4
  %386 = icmp sgt i32 %385, 7
  br i1 %386, label %387, label %396

; <label>:387:                                    ; preds = %384
  store i32 9, i32* %372, align 4
  br label %396

; <label>:388:                                    ; preds = %367
  %389 = load i32, i32* %349, align 8
  %390 = load i32, i32* %13, align 8
  %391 = tail call i32 @BitrateIndex(i32 %369, i32 %389, i32 %390) #8
  %392 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 48
  store i32 %391, i32* %392, align 4
  %393 = icmp slt i32 %391, 0
  br i1 %393, label %394, label %396

; <label>:394:                                    ; preds = %388
  %395 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  tail call void @display_bitrates(%struct._IO_FILE* %395) #8
  tail call void @exit(i32 1) #11
  unreachable

; <label>:396:                                    ; preds = %388, %384, %387
  %397 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %398 = load i32, i32* %397, align 8
  %399 = icmp eq i32 %398, 0
  br i1 %399, label %400, label %402

; <label>:400:                                    ; preds = %396
  %401 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 47
  store i32 1, i32* %401, align 8
  br label %410

; <label>:402:                                    ; preds = %396
  %403 = load i32, i32* %349, align 8
  %404 = load i32, i32* %13, align 8
  %405 = tail call i32 @BitrateIndex(i32 %398, i32 %403, i32 %404) #8
  %406 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 47
  store i32 %405, i32* %406, align 8
  %407 = icmp slt i32 %405, 0
  br i1 %407, label %408, label %410

; <label>:408:                                    ; preds = %402
  %409 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  tail call void @display_bitrates(%struct._IO_FILE* %409) #8
  tail call void @exit(i32 1) #11
  unreachable

; <label>:410:                                    ; preds = %400, %402
  %.pr35 = load i32, i32* %117, align 8
  %411 = icmp eq i32 %.pr35, 0
  br i1 %411, label %.thread, label %412

; <label>:412:                                    ; preds = %410
  %413 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %414 = load i32, i32* %413, align 4
  %415 = icmp slt i32 %414, 2
  %.58 = select i1 %415, i32 %414, i32 2
  store i32 %.58, i32* %413, align 4
  br label %.thread

.thread:                                          ; preds = %364, %410, %412
  %416 = load i32, i32* %10, align 4
  %417 = icmp eq i32 %416, 3
  br i1 %417, label %418, label %420

; <label>:418:                                    ; preds = %.thread
  %419 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 10
  store i32 0, i32* %419, align 4
  br label %420

; <label>:420:                                    ; preds = %418, %.thread
  %421 = load i32, i32* %117, align 8
  %422 = icmp eq i32 %421, 0
  br i1 %422, label %423, label %425

; <label>:423:                                    ; preds = %420
  %424 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  store i32 0, i32* %424, align 8
  br label %425

; <label>:425:                                    ; preds = %423, %420
  %426 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 32
  %427 = load i8*, i8** %426, align 8
  %428 = icmp eq i8* %427, null
  br i1 %428, label %.thread38, label %429

; <label>:429:                                    ; preds = %425
  %430 = load i8, i8* %427, align 1
  %431 = icmp eq i8 %430, 45
  br i1 %431, label %432, label %434

; <label>:432:                                    ; preds = %429
  %433 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  store i32 0, i32* %433, align 8
  br label %434

; <label>:434:                                    ; preds = %432, %429
  %.pr37 = load i8*, i8** %426, align 8
  %435 = icmp eq i8* %.pr37, null
  br i1 %435, label %.thread38, label %436

; <label>:436:                                    ; preds = %434
  %437 = load i8, i8* %.pr37, align 1
  %438 = icmp eq i8 %437, 45
  br i1 %438, label %.thread38, label %439

.thread38:                                        ; preds = %425, %436, %434
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  br label %439

; <label>:439:                                    ; preds = %.thread38, %436
  %440 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 4
  %441 = load i32, i32* %440, align 4
  %442 = icmp eq i32 %441, 0
  br i1 %442, label %445, label %443

; <label>:443:                                    ; preds = %439
  %444 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  store i32 0, i32* %444, align 8
  br label %445

; <label>:445:                                    ; preds = %439, %443
  tail call void @init_bit_stream_w(%struct.bit_stream_struc* nonnull @bs) #8
  %446 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %447 = load i32, i32* %446, align 4
  %448 = icmp eq i32 %447, 9
  br i1 %448, label %449, label %451

; <label>:449:                                    ; preds = %445
  %450 = bitcast i32* %227 to i8*
  call void @llvm.memset.p0i8.i64(i8* %450, i8 0, i64 24, i32 8, i1 false)
  %.pr39 = load i32, i32* %446, align 4
  br label %451

; <label>:451:                                    ; preds = %449, %445
  %452 = phi i32 [ %.pr39, %449 ], [ %447, %445 ]
  %453 = icmp eq i32 %452, 8
  br i1 %453, label %.thread42, label %454

.thread42:                                        ; preds = %451
  store i32 7, i32* %446, align 4
  br label %456

; <label>:454:                                    ; preds = %451
  %.pr41 = load i32, i32* %446, align 4
  %455 = icmp eq i32 %.pr41, 7
  br i1 %455, label %456, label %462

; <label>:456:                                    ; preds = %.thread42, %454
  store i32 0, i32* %227, align 8
  %457 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 63
  store i32 1, i32* %457, align 8
  %458 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 60
  store i32 0, i32* %458, align 4
  %459 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 61
  store i32 0, i32* %459, align 8
  %460 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 62
  store i32 0, i32* %460, align 4
  %461 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 64
  store i32 0, i32* %461, align 4
  %.pr43 = load i32, i32* %446, align 4
  br label %462

; <label>:462:                                    ; preds = %456, %454
  %463 = phi i32 [ %.pr43, %456 ], [ %.pr41, %454 ]
  %464 = icmp eq i32 %463, 6
  br i1 %464, label %.thread46, label %465

.thread46:                                        ; preds = %462
  store i32 5, i32* %446, align 4
  br label %467

; <label>:465:                                    ; preds = %462
  %.pr45 = load i32, i32* %446, align 4
  %466 = icmp eq i32 %.pr45, 5
  br i1 %466, label %467, label %473

; <label>:467:                                    ; preds = %.thread46, %465
  store i32 0, i32* %227, align 8
  %468 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 63
  store i32 1, i32* %468, align 8
  %469 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 60
  store i32 0, i32* %469, align 4
  %470 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 61
  store i32 1, i32* %470, align 8
  %471 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 62
  store i32 0, i32* %471, align 4
  %472 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 64
  store i32 0, i32* %472, align 4
  %.pr47 = load i32, i32* %446, align 4
  br label %473

; <label>:473:                                    ; preds = %467, %465
  %474 = phi i32 [ %.pr47, %467 ], [ %.pr45, %465 ]
  %475 = icmp eq i32 %474, 4
  br i1 %475, label %.sink.split75, label %476

; <label>:476:                                    ; preds = %473
  %.pr49 = load i32, i32* %446, align 4
  switch i32 %.pr49, label %483 [
    i32 3, label %.sink.split75
    i32 2, label %477
  ]

.sink.split75:                                    ; preds = %473, %476
  store i32 2, i32* %446, align 4
  br label %477

; <label>:477:                                    ; preds = %476, %.sink.split75
  store i32 0, i32* %227, align 8
  %478 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 63
  store i32 1, i32* %478, align 8
  %479 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 60
  store i32 1, i32* %479, align 4
  %480 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 61
  store i32 1, i32* %480, align 8
  %481 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 62
  store i32 0, i32* %481, align 4
  %482 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 64
  store i32 1, i32* %482, align 4
  br label %483

; <label>:483:                                    ; preds = %476, %477
  %484 = load i32, i32* %446, align 4
  %485 = icmp eq i32 %484, 1
  br i1 %485, label %486, label %492

; <label>:486:                                    ; preds = %483
  store i32 0, i32* %227, align 8
  %487 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 63
  store i32 1, i32* %487, align 8
  %488 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 60
  store i32 1, i32* %488, align 4
  %489 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 61
  store i32 1, i32* %489, align 8
  %490 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 62
  store i32 1, i32* %490, align 4
  %491 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 64
  store i32 1, i32* %491, align 4
  %.pr53 = load i32, i32* %446, align 4
  br label %492

; <label>:492:                                    ; preds = %486, %483
  %493 = phi i32 [ %.pr53, %486 ], [ %484, %483 ]
  %494 = icmp eq i32 %493, 0
  br i1 %494, label %507, label %.preheader61.preheader

.preheader61.preheader:                           ; preds = %492
  %495 = load i32, i32* %351, align 8
  %496 = load i32, i32* %349, align 8
  %497 = mul nsw i32 %496, 3
  %498 = add nsw i32 %497, %495
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %499, i32 0, i64 0
  %501 = load i32, i32* %500, align 4
  store i32 %501, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 0), align 4
  %502 = load i32, i32* %351, align 8
  %503 = load i32, i32* %349, align 8
  %504 = mul nsw i32 %503, 3
  %505 = add nsw i32 %504, %502
  %506 = sext i32 %505 to i64
  br label %.preheader61.1

; <label>:507:                                    ; preds = %492
  store i32 1, i32* %227, align 8
  %508 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 63
  store i32 1, i32* %508, align 8
  %509 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 60
  store i32 1, i32* %509, align 4
  %510 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 61
  store i32 3, i32* %510, align 8
  %511 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 62
  store i32 2, i32* %511, align 4
  %512 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 64
  store i32 2, i32* %512, align 4
  tail call void @exit(i32 -99) #11
  unreachable

.preheader:                                       ; preds = %.preheader61.1
  %513 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %632, i32 1, i64 0
  %514 = load i32, i32* %513, align 4
  store i32 %514, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 0), align 4
  %515 = load i32, i32* %351, align 8
  %516 = load i32, i32* %349, align 8
  %517 = mul nsw i32 %516, 3
  %518 = add nsw i32 %517, %515
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %519, i32 1, i64 1
  %521 = load i32, i32* %520, align 4
  store i32 %521, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 1), align 4
  %522 = load i32, i32* %351, align 8
  %523 = load i32, i32* %349, align 8
  %524 = mul nsw i32 %523, 3
  %525 = add nsw i32 %524, %522
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %526, i32 1, i64 2
  %528 = load i32, i32* %527, align 4
  store i32 %528, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 2), align 4
  %529 = load i32, i32* %351, align 8
  %530 = load i32, i32* %349, align 8
  %531 = mul nsw i32 %530, 3
  %532 = add nsw i32 %531, %529
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %533, i32 1, i64 3
  %535 = load i32, i32* %534, align 4
  store i32 %535, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 3), align 4
  %536 = load i32, i32* %351, align 8
  %537 = load i32, i32* %349, align 8
  %538 = mul nsw i32 %537, 3
  %539 = add nsw i32 %538, %536
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %540, i32 1, i64 4
  %542 = load i32, i32* %541, align 4
  store i32 %542, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 4), align 4
  %543 = load i32, i32* %351, align 8
  %544 = load i32, i32* %349, align 8
  %545 = mul nsw i32 %544, 3
  %546 = add nsw i32 %545, %543
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %547, i32 1, i64 5
  %549 = load i32, i32* %548, align 4
  store i32 %549, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 5), align 4
  %550 = load i32, i32* %351, align 8
  %551 = load i32, i32* %349, align 8
  %552 = mul nsw i32 %551, 3
  %553 = add nsw i32 %552, %550
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %554, i32 1, i64 6
  %556 = load i32, i32* %555, align 4
  store i32 %556, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 6), align 4
  %557 = load i32, i32* %351, align 8
  %558 = load i32, i32* %349, align 8
  %559 = mul nsw i32 %558, 3
  %560 = add nsw i32 %559, %557
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %561, i32 1, i64 7
  %563 = load i32, i32* %562, align 4
  store i32 %563, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 7), align 4
  %564 = load i32, i32* %351, align 8
  %565 = load i32, i32* %349, align 8
  %566 = mul nsw i32 %565, 3
  %567 = add nsw i32 %566, %564
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %568, i32 1, i64 8
  %570 = load i32, i32* %569, align 4
  store i32 %570, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 8), align 4
  %571 = load i32, i32* %351, align 8
  %572 = load i32, i32* %349, align 8
  %573 = mul nsw i32 %572, 3
  %574 = add nsw i32 %573, %571
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %575, i32 1, i64 9
  %577 = load i32, i32* %576, align 4
  store i32 %577, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 9), align 4
  %578 = load i32, i32* %351, align 8
  %579 = load i32, i32* %349, align 8
  %580 = mul nsw i32 %579, 3
  %581 = add nsw i32 %580, %578
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %582, i32 1, i64 10
  %584 = load i32, i32* %583, align 4
  store i32 %584, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 10), align 4
  %585 = load i32, i32* %351, align 8
  %586 = load i32, i32* %349, align 8
  %587 = mul nsw i32 %586, 3
  %588 = add nsw i32 %587, %585
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %589, i32 1, i64 11
  %591 = load i32, i32* %590, align 4
  store i32 %591, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 11), align 4
  %592 = load i32, i32* %351, align 8
  %593 = load i32, i32* %349, align 8
  %594 = mul nsw i32 %593, 3
  %595 = add nsw i32 %594, %592
  %596 = sext i32 %595 to i64
  %597 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %596, i32 1, i64 12
  %598 = load i32, i32* %597, align 4
  store i32 %598, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 12), align 4
  %599 = load i32, i32* %351, align 8
  %600 = load i32, i32* %349, align 8
  %601 = mul nsw i32 %600, 3
  %602 = add nsw i32 %601, %599
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %603, i32 1, i64 13
  %605 = load i32, i32* %604, align 4
  store i32 %605, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 13), align 4
  %606 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  %607 = load i32, i32* %606, align 8
  %608 = icmp eq i32 %607, 0
  br i1 %608, label %615, label %609

; <label>:609:                                    ; preds = %.preheader
  %610 = load i32, i32* %349, align 8
  %611 = sub nsw i32 1, %610
  %612 = load i32, i32* %10, align 4
  %613 = load i32, i32* %351, align 8
  %614 = tail call i32 @InitVbrTag(%struct.bit_stream_struc* nonnull @bs, i32 %611, i32 %612, i32 %613) #8
  br label %615

; <label>:615:                                    ; preds = %.preheader, %609
  ret void

.preheader61.1:                                   ; preds = %.preheader61.preheader, %.preheader61.1
  %616 = phi i64 [ %506, %.preheader61.preheader ], [ %632, %.preheader61.1 ]
  %indvars.iv.next77 = phi i64 [ 1, %.preheader61.preheader ], [ %indvars.iv.next, %.preheader61.1 ]
  %indvars.iv76 = phi i64 [ 0, %.preheader61.preheader ], [ %indvars.iv.next.1, %.preheader61.1 ]
  %617 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %616, i32 0, i64 %indvars.iv.next77
  %618 = load i32, i32* %617, align 4
  %619 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next77
  store i32 %618, i32* %619, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv76, 2
  %620 = load i32, i32* %351, align 8
  %621 = load i32, i32* %349, align 8
  %622 = mul nsw i32 %621, 3
  %623 = add nsw i32 %622, %620
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %624, i32 0, i64 %indvars.iv.next.1
  %626 = load i32, i32* %625, align 4
  %627 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next.1
  store i32 %626, i32* %627, align 4
  %indvars.iv.next = or i64 %indvars.iv.next.1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 23
  %628 = load i32, i32* %351, align 8
  %629 = load i32, i32* %349, align 8
  %630 = mul nsw i32 %629, 3
  %631 = add nsw i32 %630, %628
  %632 = sext i32 %631 to i64
  br i1 %exitcond, label %.preheader, label %.preheader61.1
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @InitFormatBitStream() local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare double @floor(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @log(double) local_unnamed_addr #4

; Function Attrs: nounwind
declare double @cos(double) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #4

declare i32 @SmpFrqIndex(i64, i32*) local_unnamed_addr #2

declare void @display_bitrates(%struct._IO_FILE*) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

declare i32 @BitrateIndex(i32, i32, i32) local_unnamed_addr #2

declare void @init_bit_stream_w(%struct.bit_stream_struc*) local_unnamed_addr #2

declare i32 @InitVbrTag(%struct.bit_stream_struc*, i32, i32, i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @lame_print_config(%struct.lame_global_flags* readonly) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 8
  %4 = sitofp i32 %3 to double
  %5 = fdiv double %4, 1.000000e+03
  %6 = fptrunc double %5 to float
  %7 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 49
  %8 = load float, float* %7, align 8
  %9 = fmul float %8, %6
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %11 = load i32, i32* %10, align 4
  %12 = shl nsw i32 %11, 4
  %13 = sitofp i32 %12 to float
  %14 = fmul float %6, %13
  %15 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %16 = load i32, i32* %15, align 8
  %17 = sitofp i32 %16 to float
  %18 = fdiv float %14, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  tail call void @lame_print_version(%struct._IO_FILE* %19) #8
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  %21 = load i32, i32* %20, align 8
  %22 = icmp eq i32 %21, 2
  br i1 %22, label %23, label %29

; <label>:23:                                     ; preds = %1
  %24 = load i32, i32* %10, align 4
  %25 = icmp eq i32 %24, 1
  br i1 %25, label %26, label %29

; <label>:26:                                     ; preds = %23
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.5, i64 0, i64 0), i64 67, i64 1, %struct._IO_FILE* %27) #10
  br label %29

; <label>:29:                                     ; preds = %26, %23, %1
  %30 = load float, float* %7, align 8
  %31 = fcmp une float %30, 1.000000e+00
  br i1 %31, label %32, label %37

; <label>:32:                                     ; preds = %29
  %33 = fptosi float %6 to i32
  %34 = fptosi float %9 to i32
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i64 0, i64 0), i32 %34, i32 %33) #10
  br label %37

; <label>:37:                                     ; preds = %32, %29
  %38 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 56
  %39 = load float, float* %38, align 4
  %40 = fcmp ogt float %39, 0.000000e+00
  br i1 %40, label %41, label %52

; <label>:41:                                     ; preds = %37
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 55
  %44 = load float, float* %43, align 8
  %45 = fmul float %6, %44
  %46 = fmul float %45, 5.000000e+02
  %47 = fpext float %46 to double
  %48 = fmul float %6, %39
  %49 = fmul float %48, 5.000000e+02
  %50 = fpext float %49 to double
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.7, i64 0, i64 0), double %47, double %50) #10
  br label %52

; <label>:52:                                     ; preds = %41, %37
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  %54 = load float, float* %53, align 8
  %55 = fcmp ogt float %54, 0.000000e+00
  br i1 %55, label %56, label %67

; <label>:56:                                     ; preds = %52
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = fmul float %6, %54
  %59 = fmul float %58, 5.000000e+02
  %60 = fpext float %59 to double
  %61 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 54
  %62 = load float, float* %61, align 4
  %63 = fmul float %6, %62
  %64 = fmul float %63, 5.000000e+02
  %65 = fpext float %64 to double
  %66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.8, i64 0, i64 0), double %60, double %65) #10
  br label %67

; <label>:67:                                     ; preds = %56, %52
  %68 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 4
  %69 = load i32, i32* %68, align 4
  %70 = icmp eq i32 %69, 0
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 31
  %73 = load i8*, i8** %72, align 8
  br i1 %70, label %76, label %74

; <label>:74:                                     ; preds = %67
  %75 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* %73) #10
  br label %120

; <label>:76:                                     ; preds = %67
  %77 = tail call i32 @strcmp(i8* %73, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0)) #12
  %78 = icmp eq i32 %77, 0
  %. = select i1 %78, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0), i8* %73
  %79 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 32
  %80 = load i8*, i8** %79, align 8
  %81 = tail call i32 @strcmp(i8* %80, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0)) #12
  %82 = icmp eq i32 %81, 0
  %83 = select i1 %82, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0), i8* %80
  %84 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.10, i64 0, i64 0), i8* %., i8* %83) #10
  %85 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  %86 = load i32, i32* %85, align 8
  %87 = icmp eq i32 %86, 0
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %89 = load i32, i32* %2, align 8
  %90 = sitofp i32 %89 to double
  %91 = fdiv double %90, 1.000000e+03
  br i1 %87, label %106, label %92

; <label>:92:                                     ; preds = %76
  %93 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %94 = load i32, i32* %93, align 4
  %95 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %96 = load i32, i32* %95, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [4 x i8*], [4 x i8*]* @lame_print_config.mode_names, i64 0, i64 %97
  %99 = load i8*, i8** %98, align 8
  %100 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %101 = load i32, i32* %100, align 8
  %102 = sub nsw i32 2, %101
  %103 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %104 = load i32, i32* %103, align 4
  %105 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.14, i64 0, i64 0), double %91, i32 %94, i8* %99, i32 %102, i32 %104) #10
  br label %120

; <label>:106:                                    ; preds = %76
  %107 = load i32, i32* %15, align 8
  %108 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %109 = load i32, i32* %108, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [4 x i8*], [4 x i8*]* @lame_print_config.mode_names, i64 0, i64 %110
  %112 = load i8*, i8** %111, align 8
  %113 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %114 = load i32, i32* %113, align 8
  %115 = sub nsw i32 2, %114
  %116 = fpext float %18 to double
  %117 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %118 = load i32, i32* %117, align 4
  %119 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.15, i64 0, i64 0), double %91, i32 %107, i8* %112, i32 %115, double %116, i32 %118) #10
  br label %120

; <label>:120:                                    ; preds = %92, %106, %74
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %122 = tail call i32 @fflush(%struct._IO_FILE* %121)
  ret void
}

declare void @lame_print_version(%struct._IO_FILE*) local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define i32 @lame_encode_frame(%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32) local_unnamed_addr #0 {
  %7 = alloca [2 x [2 x [576 x double]]], align 16
  %8 = alloca [2 x [2 x [576 x i32]]], align 16
  %9 = alloca [2 x [2 x %struct.III_psy_ratio]], align 16
  %10 = alloca [2 x [2 x %struct.III_psy_ratio]], align 16
  %11 = alloca [2 x [2 x %struct.III_scalefac_t]], align 16
  %12 = alloca <2 x i16*>, align 16
  %tmpcast = bitcast <2 x i16*>* %12 to [2 x i16*]*
  %13 = alloca [2 x [2 x double]], align 16
  %14 = alloca [2 x [2 x double]], align 16
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  %18 = alloca <2 x i16*>, align 16
  %tmpcast51 = bitcast <2 x i16*>* %18 to [2 x i16*]*
  %19 = alloca [2 x i32], align 4
  store double 0.000000e+00, double* %17, align 8
  %20 = bitcast [2 x [2 x %struct.III_psy_ratio]]* %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %20, i8 0, i64 3904, i32 16, i1 false)
  %21 = bitcast [2 x [2 x %struct.III_psy_ratio]]* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %21, i8 0, i64 3904, i32 16, i1 false)
  %22 = bitcast [2 x [2 x %struct.III_scalefac_t]]* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %22, i8 0, i64 976, i32 16, i1 false)
  %23 = getelementptr inbounds <2 x i16*>, <2 x i16*>* %12, i64 0, i64 0
  store i16* %1, i16** %23, align 16
  %24 = getelementptr inbounds [2 x i16*], [2 x i16*]* %tmpcast, i64 0, i64 1
  store i16* %2, i16** %24, align 8
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 52
  store i32 0, i32* %25, align 4
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %27 = load i64, i64* %26, align 8
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %53

; <label>:29:                                     ; preds = %6
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %31 = load i32, i32* %30, align 8
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.000000e+03
  %34 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %35 = load i32, i32* %34, align 8
  store i64 0, i64* @lame_encode_frame.sentBits, align 8
  store i1 true, i1* @lame_encode_frame.bitsPerSlot, align 8
  %36 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  %37 = load i32, i32* %36, align 4
  %38 = mul nsw i32 %37, %35
  %39 = sitofp i32 %38 to double
  %40 = fmul double %33, 8.000000e+00
  %41 = fdiv double %39, %40
  %42 = fadd double %41, 1.000000e-09
  %43 = tail call double @floor(double %42) #9
  %44 = fsub double %41, %43
  %45 = tail call double @fabs(double %44) #9
  %46 = fcmp olt double %45, 1.000000e-09
  %storemerge = select i1 %46, double 0.000000e+00, double %44
  store double %storemerge, double* @lame_encode_frame.frac_SpF, align 8
  %47 = fsub double -0.000000e+00, %storemerge
  store double %47, double* @lame_encode_frame.slot_lag, align 8
  %48 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  %not.32 = fcmp une double %storemerge, 0.000000e+00
  %storemerge12 = zext i1 %not.32 to i32
  store i32 %storemerge12, i32* %48, align 4
  %49 = load i32, i32* %36, align 4
  %50 = add nsw i32 %49, 752
  %51 = icmp sgt i32 %50, %3
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %29
  tail call void @__assert_fail(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), i32 661, i8* getelementptr inbounds ([79 x i8], [79 x i8]* @__PRETTY_FUNCTION__.lame_encode_frame, i64 0, i64 0)) #11
  unreachable

; <label>:53:                                     ; preds = %29, %6
  %54 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 15
  %55 = load i32, i32* %54, align 8
  switch i32 %55, label %60 [
    i32 0, label %56
    i32 1, label %58
  ]

; <label>:56:                                     ; preds = %53
  %57 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  store i32 0, i32* %57, align 4
  br label %88

; <label>:58:                                     ; preds = %53
  %59 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  store i32 1, i32* %59, align 4
  br label %88

; <label>:60:                                     ; preds = %53
  %61 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  %62 = load i32, i32* %61, align 8
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %66, label %64

; <label>:64:                                     ; preds = %60
  %65 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  store i32 0, i32* %65, align 4
  br label %88

; <label>:66:                                     ; preds = %60
  %67 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 17
  %68 = load i32, i32* %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %72, label %70

; <label>:70:                                     ; preds = %66
  %71 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  store i32 0, i32* %71, align 4
  br label %88

; <label>:72:                                     ; preds = %66
  %73 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %74 = fcmp une double %73, 0.000000e+00
  br i1 %74, label %75, label %88

; <label>:75:                                     ; preds = %72
  %76 = load double, double* @lame_encode_frame.slot_lag, align 8
  %77 = fadd double %73, -1.000000e+00
  %78 = fcmp ogt double %76, %77
  br i1 %78, label %79, label %82

; <label>:79:                                     ; preds = %75
  %80 = fsub double %76, %73
  store double %80, double* @lame_encode_frame.slot_lag, align 8
  %81 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  store i32 0, i32* %81, align 4
  br label %88

; <label>:82:                                     ; preds = %75
  %83 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  store i32 1, i32* %83, align 4
  %84 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %85 = fsub double 1.000000e+00, %84
  %86 = load double, double* @lame_encode_frame.slot_lag, align 8
  %87 = fadd double %86, %85
  store double %87, double* @lame_encode_frame.slot_lag, align 8
  br label %88

; <label>:88:                                     ; preds = %64, %72, %82, %79, %70, %58, %56
  %89 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 4
  %90 = load i32, i32* %89, align 4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %111

; <label>:92:                                     ; preds = %88
  %93 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 7
  %94 = load i32, i32* %93, align 8
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %111

; <label>:96:                                     ; preds = %92
  %97 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %98 = load i32, i32* %97, align 8
  %99 = icmp eq i32 %98, 0
  %100 = load i64, i64* %26, align 8
  %101 = select i1 %99, i64 200, i64 50
  %102 = srem i64 %100, %101
  %103 = icmp eq i64 %102, 0
  br i1 %103, label %104, label %111

; <label>:104:                                    ; preds = %96
  %105 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %106 = load i32, i32* %105, align 8
  %107 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 40
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  %110 = load i32, i32* %109, align 4
  tail call void @timestatus(i32 %106, i64 %100, i64 %108, i32 %110) #8
  br label %111

; <label>:111:                                    ; preds = %96, %104, %92, %88
  %112 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 63
  %113 = load i32, i32* %112, align 8
  %114 = icmp eq i32 %113, 0
  %115 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %116 = load i32, i32* %115, align 8
  br i1 %114, label %.preheader14, label %119

.preheader14:                                     ; preds = %111
  %117 = icmp sgt i32 %116, 0
  br i1 %117, label %.preheader13.lr.ph, label %.loopexit

.preheader13.lr.ph:                               ; preds = %.preheader14
  %118 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.preheader13

; <label>:119:                                    ; preds = %111
  %120 = add nsw i32 %116, -1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 %121
  %123 = load double, double* %122, align 8
  %124 = load i32, i32* %115, align 8
  %125 = icmp sgt i32 %124, 0
  br i1 %125, label %.preheader15.lr.ph, label %.loopexit

.preheader15.lr.ph:                               ; preds = %119
  %126 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %127 = getelementptr inbounds <2 x i16*>, <2 x i16*>* %18, i64 0, i64 0
  %128 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %9, i64 0, i64 0
  %129 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %10, i64 0, i64 0
  %130 = getelementptr inbounds [2 x i32], [2 x i32]* %19, i64 0, i64 0
  %wide.load.prol = load <2 x i16*>, <2 x i16*>* %12, align 16
  %131 = getelementptr inbounds <2 x i16*>, <2 x i16*>* %12, i64 0, i64 2
  %132 = bitcast i16** %131 to <2 x i16*>*
  %133 = extractelement <2 x i16*> %wide.load.prol, i32 0
  %134 = extractelement <2 x i16*> %wide.load.prol, i32 1
  %135 = getelementptr inbounds <2 x i16*>, <2 x i16*>* %18, i64 0, i64 2
  %136 = bitcast i16** %135 to <2 x i16*>*
  br label %.preheader15

.preheader15:                                     ; preds = %.preheader15.lr.ph, %._crit_edge30
  %indvars.iv44 = phi i64 [ 0, %.preheader15.lr.ph ], [ %indvars.iv.next45, %._crit_edge30 ]
  %137 = load i32, i32* %126, align 4
  %138 = icmp sgt i32 %137, 0
  br i1 %138, label %.lr.ph25, label %._crit_edge26

.lr.ph25:                                         ; preds = %.preheader15
  %139 = mul nsw i64 %indvars.iv44, 576
  %140 = add nsw i64 %139, 304
  %141 = load i32, i32* %126, align 4
  %142 = sext i32 %141 to i64
  %143 = icmp sgt i64 %142, 1
  %smax = select i1 %143, i64 %142, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph25
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %144 = add nsw i64 %n.vec, -4
  %145 = lshr exact i64 %144, 2
  %146 = and i64 %145, 1
  %lcmp.mod = icmp eq i64 %146, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %wide.load49.prol = load <2 x i16*>, <2 x i16*>* %132, align 16
  %147 = getelementptr inbounds i16, i16* %133, i64 %140
  %148 = getelementptr inbounds i16, i16* %134, i64 %140
  %149 = extractelement <2 x i16*> %wide.load49.prol, i32 0
  %150 = getelementptr inbounds i16, i16* %149, i64 %140
  %151 = extractelement <2 x i16*> %wide.load49.prol, i32 1
  %152 = getelementptr inbounds i16, i16* %151, i64 %140
  %153 = insertelement <2 x i16*> undef, i16* %147, i32 0
  %154 = insertelement <2 x i16*> %153, i16* %148, i32 1
  %155 = insertelement <2 x i16*> undef, i16* %150, i32 0
  %156 = insertelement <2 x i16*> %155, i16* %152, i32 1
  store <2 x i16*> %154, <2 x i16*>* %18, align 16
  store <2 x i16*> %156, <2 x i16*>* %136, align 16
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %157 = icmp eq i64 %145, 0
  br i1 %157, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %158 = getelementptr inbounds [2 x i16*], [2 x i16*]* %tmpcast, i64 0, i64 %index
  %159 = bitcast i16** %158 to <2 x i16*>*
  %wide.load = load <2 x i16*>, <2 x i16*>* %159, align 16
  %160 = getelementptr i16*, i16** %158, i64 2
  %161 = bitcast i16** %160 to <2 x i16*>*
  %wide.load49 = load <2 x i16*>, <2 x i16*>* %161, align 16
  %162 = extractelement <2 x i16*> %wide.load, i32 0
  %163 = getelementptr inbounds i16, i16* %162, i64 %140
  %164 = extractelement <2 x i16*> %wide.load, i32 1
  %165 = getelementptr inbounds i16, i16* %164, i64 %140
  %166 = extractelement <2 x i16*> %wide.load49, i32 0
  %167 = getelementptr inbounds i16, i16* %166, i64 %140
  %168 = extractelement <2 x i16*> %wide.load49, i32 1
  %169 = getelementptr inbounds i16, i16* %168, i64 %140
  %170 = insertelement <2 x i16*> undef, i16* %163, i32 0
  %171 = insertelement <2 x i16*> %170, i16* %165, i32 1
  %172 = insertelement <2 x i16*> undef, i16* %167, i32 0
  %173 = insertelement <2 x i16*> %172, i16* %169, i32 1
  %174 = getelementptr inbounds [2 x i16*], [2 x i16*]* %tmpcast51, i64 0, i64 %index
  %175 = bitcast i16** %174 to <2 x i16*>*
  store <2 x i16*> %171, <2 x i16*>* %175, align 16
  %176 = getelementptr i16*, i16** %174, i64 2
  %177 = bitcast i16** %176 to <2 x i16*>*
  store <2 x i16*> %173, <2 x i16*>* %177, align 16
  %index.next = add i64 %index, 4
  %178 = getelementptr inbounds [2 x i16*], [2 x i16*]* %tmpcast, i64 0, i64 %index.next
  %179 = bitcast i16** %178 to <2 x i16*>*
  %wide.load.1 = load <2 x i16*>, <2 x i16*>* %179, align 16
  %180 = getelementptr i16*, i16** %178, i64 2
  %181 = bitcast i16** %180 to <2 x i16*>*
  %wide.load49.1 = load <2 x i16*>, <2 x i16*>* %181, align 16
  %182 = extractelement <2 x i16*> %wide.load.1, i32 0
  %183 = getelementptr inbounds i16, i16* %182, i64 %140
  %184 = extractelement <2 x i16*> %wide.load.1, i32 1
  %185 = getelementptr inbounds i16, i16* %184, i64 %140
  %186 = extractelement <2 x i16*> %wide.load49.1, i32 0
  %187 = getelementptr inbounds i16, i16* %186, i64 %140
  %188 = extractelement <2 x i16*> %wide.load49.1, i32 1
  %189 = getelementptr inbounds i16, i16* %188, i64 %140
  %190 = insertelement <2 x i16*> undef, i16* %183, i32 0
  %191 = insertelement <2 x i16*> %190, i16* %185, i32 1
  %192 = insertelement <2 x i16*> undef, i16* %187, i32 0
  %193 = insertelement <2 x i16*> %192, i16* %189, i32 1
  %194 = getelementptr inbounds [2 x i16*], [2 x i16*]* %tmpcast51, i64 0, i64 %index.next
  %195 = bitcast i16** %194 to <2 x i16*>*
  store <2 x i16*> %191, <2 x i16*>* %195, align 16
  %196 = getelementptr i16*, i16** %194, i64 2
  %197 = bitcast i16** %196 to <2 x i16*>*
  store <2 x i16*> %193, <2 x i16*>* %197, align 16
  %index.next.1 = add i64 %index, 8
  %198 = icmp eq i64 %index.next.1, %n.vec
  br i1 %198, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !2

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %._crit_edge26, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph25
  %indvars.iv40.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph25 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %scalar.ph ], [ %indvars.iv40.ph, %scalar.ph.preheader ]
  %199 = getelementptr inbounds [2 x i16*], [2 x i16*]* %tmpcast, i64 0, i64 %indvars.iv40
  %200 = load i16*, i16** %199, align 8
  %201 = getelementptr inbounds i16, i16* %200, i64 %140
  %202 = getelementptr inbounds [2 x i16*], [2 x i16*]* %tmpcast51, i64 0, i64 %indvars.iv40
  store i16* %201, i16** %202, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %203 = icmp slt i64 %indvars.iv.next41, %142
  br i1 %203, label %scalar.ph, label %._crit_edge26.loopexit, !llvm.loop !5

._crit_edge26.loopexit:                           ; preds = %scalar.ph
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %middle.block, %.preheader15
  %204 = getelementptr inbounds [2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 %indvars.iv44
  %205 = getelementptr inbounds [2 x double], [2 x double]* @lame_encode_frame.ms_ener_ratio, i64 0, i64 %indvars.iv44
  %206 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %13, i64 0, i64 %indvars.iv44, i64 0
  %207 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %14, i64 0, i64 %indvars.iv44, i64 0
  %208 = trunc i64 %indvars.iv44 to i32
  call void @L3psycho_anal(%struct.lame_global_flags* nonnull %0, i16** nonnull %127, i32 %208, double* %204, double* nonnull %17, double* %205, [2 x %struct.III_psy_ratio]* nonnull %128, [2 x %struct.III_psy_ratio]* nonnull %129, double* %206, double* %207, i32* nonnull %130) #8
  %209 = load i32, i32* %126, align 4
  %210 = icmp sgt i32 %209, 0
  br i1 %210, label %.lr.ph29.preheader, label %._crit_edge30

.lr.ph29.preheader:                               ; preds = %._crit_edge26
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %.lr.ph29
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %.lr.ph29 ], [ 0, %.lr.ph29.preheader ]
  %211 = getelementptr inbounds [2 x i32], [2 x i32]* %19, i64 0, i64 %indvars.iv42
  %212 = load i32, i32* %211, align 4
  %213 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 %indvars.iv44, i32 0, i64 %indvars.iv42, i32 0, i32 6
  store i32 %212, i32* %213, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %214 = load i32, i32* %126, align 4
  %215 = sext i32 %214 to i64
  %216 = icmp slt i64 %indvars.iv.next43, %215
  br i1 %216, label %.lr.ph29, label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %.lr.ph29
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %._crit_edge26
  %indvars.iv.next45 = add nuw i64 %indvars.iv44, 1
  %217 = load i32, i32* %115, align 8
  %218 = sext i32 %217 to i64
  %219 = icmp slt i64 %indvars.iv.next45, %218
  br i1 %219, label %.preheader15, label %.loopexit.loopexit50

.preheader13:                                     ; preds = %.preheader13.lr.ph, %._crit_edge22
  %indvars.iv38 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next39, %._crit_edge22 ]
  %220 = load i32, i32* %118, align 4
  %221 = icmp sgt i32 %220, 0
  br i1 %221, label %.lr.ph21.preheader, label %._crit_edge22

.lr.ph21.preheader:                               ; preds = %.preheader13
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader, %.lr.ph21
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %.lr.ph21 ], [ 0, %.lr.ph21.preheader ]
  %222 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 %indvars.iv38, i32 0, i64 %indvars.iv36, i32 0, i32 6
  store i32 0, i32* %222, align 8
  %223 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %13, i64 0, i64 %indvars.iv38, i64 %indvars.iv36
  store double 7.000000e+02, double* %223, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %224 = load i32, i32* %118, align 4
  %225 = sext i32 %224 to i64
  %226 = icmp slt i64 %indvars.iv.next37, %225
  br i1 %226, label %.lr.ph21, label %._crit_edge22.loopexit

._crit_edge22.loopexit:                           ; preds = %.lr.ph21
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.preheader13
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %227 = load i32, i32* %115, align 8
  %228 = sext i32 %227 to i64
  %229 = icmp slt i64 %indvars.iv.next39, %228
  br i1 %229, label %.preheader13, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge22
  br label %.loopexit

.loopexit.loopexit50:                             ; preds = %._crit_edge30
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit50, %.loopexit.loopexit, %119, %.preheader14
  %.0 = phi double [ 0.000000e+00, %.preheader14 ], [ %123, %119 ], [ 0.000000e+00, %.loopexit.loopexit ], [ %123, %.loopexit.loopexit50 ]
  %230 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %231 = load i32, i32* %230, align 8
  %232 = icmp sgt i32 %231, 0
  br i1 %232, label %.preheader.lr.ph, label %._crit_edge19

.preheader.lr.ph:                                 ; preds = %.loopexit
  %233 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv34 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next35, %._crit_edge ]
  %234 = load i32, i32* %233, align 4
  %235 = icmp sgt i32 %234, 0
  br i1 %235, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %236 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 %indvars.iv34, i32 0, i64 %indvars.iv, i32 0, i32 7
  store i32 0, i32* %236, align 4
  %237 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 %indvars.iv34, i32 0, i64 %indvars.iv, i32 0, i32 6
  %238 = load i32, i32* %237, align 8
  %239 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 %indvars.iv34, i32 0, i64 %indvars.iv, i32 0, i32 5
  %not. = icmp ne i32 %238, 0
  %.sink = zext i1 %not. to i32
  store i32 %.sink, i32* %239, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %240 = load i32, i32* %233, align 4
  %241 = sext i32 %240 to i64
  %242 = icmp slt i64 %indvars.iv.next, %241
  br i1 %242, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %243 = load i32, i32* %230, align 8
  %244 = sext i32 %243 to i64
  %245 = icmp slt i64 %indvars.iv.next35, %244
  br i1 %245, label %.preheader, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.loopexit
  %246 = load i16*, i16** %23, align 16
  %247 = load i16*, i16** %24, align 8
  %248 = getelementptr inbounds [2 x [2 x [576 x double]]], [2 x [2 x [576 x double]]]* %7, i64 0, i64 0
  call void @mdct_sub48(%struct.lame_global_flags* nonnull %0, i16* %246, i16* %247, [2 x [576 x double]]* nonnull %248, %struct.III_side_info_t* nonnull @l3_side) #8
  %249 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %250 = load i32, i32* %249, align 4
  %251 = icmp eq i32 %250, 1
  %252 = zext i1 %251 to i32
  br i1 %251, label %253, label %264

; <label>:253:                                    ; preds = %._crit_edge19
  %254 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 0, i32 0, i64 0, i32 0, i32 6), align 8
  %255 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 0, i32 0, i64 1, i32 0, i32 6), align 8
  %256 = icmp eq i32 %254, %255
  br i1 %256, label %257, label %261

; <label>:257:                                    ; preds = %253
  %258 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 1, i32 0, i64 0, i32 0, i32 6), align 8
  %259 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i64 0, i32 4, i64 1, i32 0, i64 1, i32 0, i32 6), align 8
  %260 = icmp eq i32 %258, %259
  br label %261

; <label>:261:                                    ; preds = %257, %253
  %262 = phi i1 [ false, %253 ], [ %260, %257 ]
  %263 = zext i1 %262 to i32
  br label %264

; <label>:264:                                    ; preds = %261, %._crit_edge19
  %.04 = phi i32 [ %263, %261 ], [ %252, %._crit_edge19 ]
  %265 = icmp eq i32 %.04, 0
  br i1 %265, label %276, label %266

; <label>:266:                                    ; preds = %264
  %267 = load double, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 0), align 16
  %268 = load double, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 1), align 8
  %269 = fadd double %267, %268
  %270 = fadd double %.0, %269
  %271 = load double, double* %17, align 8
  %272 = fadd double %271, %270
  %273 = fmul double %272, 2.500000e-01
  %274 = fcmp olt double %273, 3.500000e-01
  br i1 %274, label %275, label %276

; <label>:275:                                    ; preds = %266
  store i32 2, i32* %25, align 4
  br label %276

; <label>:276:                                    ; preds = %266, %275, %264
  %277 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 10
  %278 = load i32, i32* %277, align 4
  %279 = icmp eq i32 %278, 0
  br i1 %279, label %281, label %280

; <label>:280:                                    ; preds = %276
  store i32 2, i32* %25, align 4
  br label %281

; <label>:281:                                    ; preds = %276, %280
  %282 = load i32, i32* %25, align 4
  %283 = icmp eq i32 %282, 2
  %. = select i1 %283, [2 x [2 x %struct.III_psy_ratio]]* %10, [2 x [2 x %struct.III_psy_ratio]]* %9
  %.11 = select i1 %283, [2 x [2 x double]]* %14, [2 x [2 x double]]* %13
  %284 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  %285 = load i32, i32* %284, align 8
  %286 = icmp eq i32 %285, 0
  %287 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %.11, i64 0, i64 0
  %288 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %., i64 0, i64 0
  %289 = getelementptr inbounds [2 x [2 x [576 x i32]]], [2 x [2 x [576 x i32]]]* %8, i64 0, i64 0
  %290 = getelementptr inbounds [2 x [2 x %struct.III_scalefac_t]], [2 x [2 x %struct.III_scalefac_t]]* %11, i64 0, i64 0
  br i1 %286, label %292, label %291

; <label>:291:                                    ; preds = %281
  call void @VBR_iteration_loop(%struct.lame_global_flags* nonnull %0, [2 x double]* %287, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 0), [2 x [576 x double]]* nonnull %248, [2 x %struct.III_psy_ratio]* %288, %struct.III_side_info_t* nonnull @l3_side, [2 x [576 x i32]]* nonnull %289, [2 x %struct.III_scalefac_t]* nonnull %290) #8
  br label %293

; <label>:292:                                    ; preds = %281
  call void @iteration_loop(%struct.lame_global_flags* nonnull %0, [2 x double]* %287, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 0), [2 x [576 x double]]* nonnull %248, [2 x %struct.III_psy_ratio]* %288, %struct.III_side_info_t* nonnull @l3_side, [2 x [576 x i32]]* nonnull %289, [2 x %struct.III_scalefac_t]* nonnull %290) #8
  br label %293

; <label>:293:                                    ; preds = %292, %291
  call void @getframebits(%struct.lame_global_flags* nonnull %0, i32* nonnull %16, i32* nonnull %15) #8
  %294 = load i32, i32* %16, align 4
  call void @III_format_bitstream(%struct.lame_global_flags* nonnull %0, i32 %294, [2 x [576 x i32]]* nonnull %289, %struct.III_side_info_t* nonnull @l3_side, [2 x %struct.III_scalefac_t]* nonnull %290, %struct.bit_stream_struc* nonnull @bs) #8
  %295 = load i64, i64* getelementptr inbounds (%struct.bit_stream_struc, %struct.bit_stream_struc* @bs, i64 0, i32 5), align 8
  %296 = load i64, i64* @lame_encode_frame.sentBits, align 8
  %297 = sub i64 %295, %296
  store i64 %297, i64* @lame_encode_frame.frameBits, align 8
  %298 = and i64 %297, 7
  %299 = icmp eq i64 %298, 0
  br i1 %299, label %304, label %300

; <label>:300:                                    ; preds = %293
  %301 = lshr i64 %297, 3
  %302 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %303 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %302, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.18, i64 0, i64 0), i64 %297, i64 %301, i64 %298) #10
  br label %304

; <label>:304:                                    ; preds = %293, %300
  %305 = load i64, i64* @lame_encode_frame.frameBits, align 8
  %306 = load i64, i64* @lame_encode_frame.sentBits, align 8
  %307 = add i64 %306, %305
  store i64 %307, i64* @lame_encode_frame.sentBits, align 8
  %308 = call i32 @copy_buffer(i8* %4, i32 %5, %struct.bit_stream_struc* nonnull @bs) #8
  %309 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  %310 = load i32, i32* %309, align 8
  %311 = icmp eq i32 %310, 0
  br i1 %311, label %316, label %312

; <label>:312:                                    ; preds = %304
  %313 = load i64, i64* @lame_encode_frame.sentBits, align 8
  %314 = lshr i64 %313, 3
  %315 = trunc i64 %314 to i32
  call void @AddVbrFrame(i32 %315) #8
  br label %316

; <label>:316:                                    ; preds = %304, %312
  %317 = load i64, i64* %26, align 8
  %318 = add nsw i64 %317, 1
  store i64 %318, i64* %26, align 8
  ret i32 %308
}

; Function Attrs: nounwind readnone
declare double @fabs(double) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #5

declare void @timestatus(i32, i64, i64, i32) local_unnamed_addr #2

declare void @L3psycho_anal(%struct.lame_global_flags*, i16**, i32, double*, double*, double*, [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]*, double*, double*, i32*) local_unnamed_addr #2

declare void @mdct_sub48(%struct.lame_global_flags*, i16*, i16*, [2 x [576 x double]]*, %struct.III_side_info_t*) local_unnamed_addr #2

declare void @VBR_iteration_loop(%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) local_unnamed_addr #2

declare void @iteration_loop(%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) local_unnamed_addr #2

declare void @getframebits(%struct.lame_global_flags*, i32*, i32*) local_unnamed_addr #2

declare void @III_format_bitstream(%struct.lame_global_flags*, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*, %struct.bit_stream_struc*) local_unnamed_addr #2

declare i32 @copy_buffer(i8*, i32, %struct.bit_stream_struc*) local_unnamed_addr #2

declare void @AddVbrFrame(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @fill_buffer_resample(%struct.lame_global_flags* nocapture readonly, i16* nocapture, i32, i16* nocapture readonly, i32, i32* nocapture, i32) local_unnamed_addr #0 {
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %9 = load i64, i64* %8, align 8
  %10 = icmp eq i64 %9, 0
  %11 = sext i32 %6 to i64
  %12 = getelementptr inbounds [2 x i32], [2 x i32]* @fill_buffer_resample.init, i64 0, i64 %11
  br i1 %10, label %13, label %.thread

; <label>:13:                                     ; preds = %7
  %14 = load i32, i32* %12, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %13
  %17 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %11, i64 0
  %18 = bitcast i16* %17 to i8*
  %19 = getelementptr inbounds [2 x double], [2 x double]* @fill_buffer_resample.itime, i64 0, i64 %11
  store i32 1, i32* %12, align 4
  store double 0.000000e+00, double* %19, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 10, i32 2, i1 false)
  br label %20

; <label>:20:                                     ; preds = %13, %16
  %.pr = load i64, i64* %8, align 8
  %21 = icmp eq i64 %.pr, 0
  %22 = sext i32 %6 to i64
  %23 = getelementptr inbounds [2 x i32], [2 x i32]* @fill_buffer_resample.init, i64 0, i64 %22
  br i1 %21, label %25, label %.thread

.thread:                                          ; preds = %7, %20
  %24 = phi i32* [ %23, %20 ], [ %12, %7 ]
  store i32 0, i32* %24, align 4
  br label %25

; <label>:25:                                     ; preds = %20, %.thread
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 49
  %27 = load float, float* %26, align 8
  %28 = fpext float %27 to double
  %29 = fadd double %28, 5.000000e-01
  %30 = tail call double @floor(double %29) #9
  %31 = fsub double %28, %30
  %32 = tail call double @fabs(double %31) #9
  %33 = fcmp olt double %32, 1.000000e-04
  %34 = icmp sgt i32 %2, 0
  br i1 %34, label %.lr.ph, label %140

.lr.ph:                                           ; preds = %25
  %35 = sext i32 %6 to i64
  %36 = getelementptr inbounds [2 x double], [2 x double]* @fill_buffer_resample.itime, i64 0, i64 %35
  %37 = load double, double* %36, align 8
  %38 = sext i32 %2 to i64
  br label %39

; <label>:39:                                     ; preds = %.lr.ph, %136
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %136 ]
  %.020 = phi i32 [ 0, %.lr.ph ], [ %138, %136 ]
  %40 = trunc i64 %indvars.iv to i32
  %41 = sitofp i32 %40 to float
  %42 = load float, float* %26, align 8
  %43 = fmul float %41, %42
  %44 = fpext float %43 to double
  %45 = fsub double %44, %37
  %46 = tail call double @floor(double %45) #9
  %47 = fptosi double %46 to i32
  %48 = add nsw i32 %47, 2
  %49 = icmp slt i32 %48, %4
  %50 = trunc i64 %indvars.iv to i32
  br i1 %49, label %51, label %._crit_edge.loopexit

; <label>:51:                                     ; preds = %39
  %52 = sitofp i32 %47 to double
  %53 = fadd double %37, %52
  %54 = fsub double %44, %53
  %55 = fadd double %54, -1.000000e+00
  %56 = icmp slt i32 %47, 0
  br i1 %56, label %59, label %.thread12

.thread12:                                        ; preds = %51
  %57 = sext i32 %47 to i64
  %58 = getelementptr inbounds i16, i16* %3, i64 %57
  %.in13 = load i16, i16* %58, align 2
  br label %68

; <label>:59:                                     ; preds = %51
  %60 = add nsw i32 %47, 5
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %35, i64 %61
  %.in = load i16, i16* %62, align 2
  %63 = icmp eq i32 %47, -1
  br i1 %63, label %68, label %64

; <label>:64:                                     ; preds = %59
  %65 = add nsw i32 %47, 6
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %35, i64 %66
  br label %72

; <label>:68:                                     ; preds = %59, %.thread12
  %.in15 = phi i16 [ %.in13, %.thread12 ], [ %.in, %59 ]
  %69 = add nsw i32 %47, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, i16* %3, i64 %70
  br label %72

; <label>:72:                                     ; preds = %68, %64
  %.in14 = phi i16 [ %.in, %64 ], [ %.in15, %68 ]
  %.in3.in = phi i16* [ %67, %64 ], [ %71, %68 ]
  %.in3 = load i16, i16* %.in3.in, align 2
  br i1 %33, label %73, label %82

; <label>:73:                                     ; preds = %72
  %74 = sitofp i16 %.in3 to double
  %75 = fmul double %54, %74
  %76 = sitofp i16 %.in14 to double
  %77 = fmul double %55, %76
  %78 = fsub double %75, %77
  %79 = fadd double %78, 5.000000e-01
  %80 = tail call double @floor(double %79) #9
  %81 = fptosi double %80 to i16
  br label %136

; <label>:82:                                     ; preds = %72
  %83 = fadd double %54, 1.000000e+00
  %84 = fadd double %54, -2.000000e+00
  %85 = icmp slt i32 %47, 1
  br i1 %85, label %90, label %.thread16

.thread16:                                        ; preds = %82
  %86 = add nsw i32 %47, -1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i16, i16* %3, i64 %87
  %.in417 = load i16, i16* %88, align 2
  %89 = sext i16 %.in417 to i32
  br label %100

; <label>:90:                                     ; preds = %82
  %91 = add nsw i32 %47, 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %35, i64 %92
  %.in4 = load i16, i16* %93, align 2
  %94 = sext i16 %.in4 to i32
  %95 = icmp slt i32 %47, -2
  br i1 %95, label %96, label %100

; <label>:96:                                     ; preds = %90
  %97 = add nsw i32 %47, 7
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %35, i64 %98
  br label %104

; <label>:100:                                    ; preds = %.thread16, %90
  %101 = phi i32 [ %89, %.thread16 ], [ %94, %90 ]
  %102 = sext i32 %48 to i64
  %103 = getelementptr inbounds i16, i16* %3, i64 %102
  br label %104

; <label>:104:                                    ; preds = %100, %96
  %105 = phi i32 [ %94, %96 ], [ %101, %100 ]
  %.in5.in = phi i16* [ %99, %96 ], [ %103, %100 ]
  %.in5 = load i16, i16* %.in5.in, align 2
  %106 = sub nsw i32 0, %105
  %107 = sitofp i32 %106 to double
  %108 = fmul double %54, %107
  %109 = fmul double %55, %108
  %110 = fmul double %84, %109
  %111 = fdiv double %110, 6.000000e+00
  %112 = fadd double %111, 5.000000e-01
  %113 = sitofp i16 %.in14 to double
  %114 = fmul double %83, %113
  %115 = fmul double %55, %114
  %116 = fmul double %84, %115
  %117 = fmul double %116, 5.000000e-01
  %118 = fadd double %117, %112
  %119 = sitofp i16 %.in3 to double
  %120 = fmul double %83, %119
  %121 = fmul double %54, %120
  %122 = fmul double %84, %121
  %123 = fmul double %122, 5.000000e-01
  %124 = fsub double %118, %123
  %125 = sitofp i16 %.in5 to double
  %126 = fmul double %83, %125
  %127 = fmul double %54, %126
  %128 = fmul double %55, %127
  %129 = fdiv double %128, 6.000000e+00
  %130 = fadd double %129, %124
  %131 = tail call double @floor(double %130) #9
  %132 = fptosi double %131 to i32
  %133 = icmp sgt i32 %132, 32767
  %134 = icmp sgt i32 %132, -32767
  %.sink18 = select i1 %134, i32 %132, i32 -32767
  %135 = trunc i32 %.sink18 to i16
  %.sink.sink = select i1 %133, i16 32767, i16 %135
  br label %136

; <label>:136:                                    ; preds = %104, %73
  %.sink.sink.sink = phi i16 [ %81, %73 ], [ %.sink.sink, %104 ]
  %137 = getelementptr inbounds i16, i16* %1, i64 %indvars.iv
  store i16 %.sink.sink.sink, i16* %137, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %138 = add nuw nsw i32 %.020, 1
  %139 = icmp slt i64 %indvars.iv.next, %38
  br i1 %139, label %39, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %39, %136
  %.0.lcssa.ph = phi i32 [ %138, %136 ], [ %50, %39 ]
  %phitmp = add i32 %47, 2
  br label %140

; <label>:140:                                    ; preds = %25, %._crit_edge.loopexit
  %.0.lcssa = phi i32 [ 0, %25 ], [ %.0.lcssa.ph, %._crit_edge.loopexit ]
  %.1 = phi i32 [ 2, %25 ], [ %phitmp, %._crit_edge.loopexit ]
  %141 = icmp sgt i32 %.1, %4
  %142 = select i1 %141, i32 %4, i32 %.1
  store i32 %142, i32* %5, align 4
  %143 = sitofp i32 %142 to float
  %144 = sitofp i32 %.0.lcssa to float
  %145 = load float, float* %26, align 8
  %146 = fmul float %144, %145
  %147 = fsub float %143, %146
  %148 = fpext float %147 to double
  %149 = sext i32 %6 to i64
  %150 = getelementptr inbounds [2 x double], [2 x double]* @fill_buffer_resample.itime, i64 0, i64 %149
  %151 = load double, double* %150, align 8
  %152 = fadd double %151, %148
  store double %152, double* %150, align 8
  %153 = load i32, i32* %5, align 4
  %154 = add i32 %153, -5
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i16, i16* %3, i64 %155
  %157 = load i16, i16* %156, align 2
  %158 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %149, i64 0
  store i16 %157, i16* %158, align 2
  %159 = load i32, i32* %5, align 4
  %160 = add i32 %159, -4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i16, i16* %3, i64 %161
  %163 = load i16, i16* %162, align 2
  %164 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %149, i64 1
  store i16 %163, i16* %164, align 2
  %165 = load i32, i32* %5, align 4
  %166 = add i32 %165, -3
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i16, i16* %3, i64 %167
  %169 = load i16, i16* %168, align 2
  %170 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %149, i64 2
  store i16 %169, i16* %170, align 2
  %171 = load i32, i32* %5, align 4
  %172 = add i32 %171, -2
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i16, i16* %3, i64 %173
  %175 = load i16, i16* %174, align 2
  %176 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %149, i64 3
  store i16 %175, i16* %176, align 2
  %177 = load i32, i32* %5, align 4
  %178 = add i32 %177, -1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i16, i16* %3, i64 %179
  %181 = load i16, i16* %180, align 2
  %182 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %149, i64 4
  store i16 %181, i16* %182, align 2
  ret i32 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define i32 @fill_buffer(%struct.lame_global_flags* nocapture readnone, i16* nocapture, i32, i16* nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = icmp slt i32 %2, %4
  %. = select i1 %6, i32 %2, i32 %4
  %7 = bitcast i16* %1 to i8*
  %8 = bitcast i16* %3 to i8*
  %9 = sext i32 %. to i64
  %10 = shl nsw i64 %9, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 %10, i32 1, i1 false)
  ret i32 %.
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define i32 @lame_encode_buffer(%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32) local_unnamed_addr #0 {
  %7 = alloca [2 x i16*], align 16
  %8 = alloca i32, align 4
  %9 = getelementptr inbounds [2 x i16*], [2 x i16*]* %7, i64 0, i64 0
  store i16* %1, i16** %9, align 16
  %10 = getelementptr inbounds [2 x i16*], [2 x i16*]* %7, i64 0, i64 1
  store i16* %2, i16** %10, align 8
  %11 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %12, 752
  %14 = icmp slt i32 %13, 3057
  br i1 %14, label %16, label %15

; <label>:15:                                     ; preds = %6
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), i32 990, i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer, i64 0, i64 0)) #11
  unreachable

; <label>:16:                                     ; preds = %6
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %18 = load i64, i64* %17, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %16
  %.b = load i1, i1* @lame_encode_buffer.frame_buffered, align 4
  br i1 %.b, label %thread-pre-split, label %21

; <label>:21:                                     ; preds = %20
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([2 x [3056 x i16]]* @mfbuf to i8*), i8 0, i64 12224, i32 16, i1 false)
  store i1 true, i1* @lame_encode_buffer.frame_buffered, align 4
  store i32 1088, i32* @mf_samples_to_encode, align 4
  store i32 752, i32* @mf_size, align 4
  br label %thread-pre-split

thread-pre-split:                                 ; preds = %20, %21
  %.pr = load i64, i64* %17, align 8
  br label %22

; <label>:22:                                     ; preds = %thread-pre-split, %16
  %23 = phi i64 [ %.pr, %thread-pre-split ], [ %18, %16 ]
  %24 = icmp eq i64 %23, 1
  br i1 %24, label %25, label %26

; <label>:25:                                     ; preds = %22
  store i1 false, i1* @lame_encode_buffer.frame_buffered, align 4
  br label %26

; <label>:26:                                     ; preds = %25, %22
  %27 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 2
  br i1 %29, label %32, label %.preheader11

.preheader11.loopexit:                            ; preds = %.lr.ph29.new
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %middle.block, %.prol.loopexit45, %32, %26
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 49
  br label %.outer

; <label>:32:                                     ; preds = %26
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %34 = load i32, i32* %33, align 4
  %35 = icmp eq i32 %34, 1
  %36 = icmp sgt i32 %3, 0
  %or.cond = and i1 %35, %36
  br i1 %or.cond, label %.lr.ph29, label %.preheader11

.lr.ph29:                                         ; preds = %32
  %37 = load i16*, i16** %9, align 16
  %38 = load i16*, i16** %10, align 8
  %xtraiter46 = and i32 %3, 1
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.prol.loopexit45, label %.prol.preheader44

.prol.preheader44:                                ; preds = %.lr.ph29
  %39 = load i16, i16* %37, align 2
  %40 = sext i16 %39 to i32
  %41 = load i16, i16* %38, align 2
  %42 = sext i16 %41 to i32
  %43 = add nsw i32 %42, %40
  %44 = sdiv i32 %43, 2
  %45 = trunc i32 %44 to i16
  store i16 %45, i16* %37, align 2
  store i16 0, i16* %38, align 2
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.lr.ph29, %.prol.preheader44
  %indvars.iv41.unr = phi i64 [ 0, %.lr.ph29 ], [ 1, %.prol.preheader44 ]
  %46 = icmp eq i32 %3, 1
  br i1 %46, label %.preheader11, label %.lr.ph29.new.preheader

.lr.ph29.new.preheader:                           ; preds = %.prol.loopexit45
  %wide.trip.count43.1 = zext i32 %3 to i64
  %47 = add nsw i64 %wide.trip.count43.1, -2
  %48 = sub nsw i64 %47, %indvars.iv41.unr
  %49 = lshr i64 %48, 1
  %50 = add nuw i64 %49, 1
  %min.iters.check = icmp ult i64 %50, 8
  br i1 %min.iters.check, label %.lr.ph29.new.preheader76, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph29.new.preheader
  %n.mod.vf = and i64 %50, 7
  %n.vec = sub i64 %50, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph29.new.preheader76, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i16, i16* %37, i64 %indvars.iv41.unr
  %51 = add nsw i64 %wide.trip.count43.1, -2
  %52 = sub nsw i64 %51, %indvars.iv41.unr
  %53 = and i64 %52, -2
  %54 = or i64 %indvars.iv41.unr, %53
  %55 = add nsw i64 %54, 2
  %scevgep65 = getelementptr i16, i16* %37, i64 %55
  %scevgep67 = getelementptr i16, i16* %38, i64 %indvars.iv41.unr
  %scevgep69 = getelementptr i16, i16* %38, i64 %55
  %bound0 = icmp ult i16* %scevgep, %scevgep69
  %bound1 = icmp ult i16* %scevgep67, %scevgep65
  %memcheck.conflict = and i1 %bound0, %bound1
  %56 = shl nuw i64 %49, 1
  %57 = or i64 %indvars.iv41.unr, %56
  %58 = add i64 %57, 2
  %59 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %58, %59
  br i1 %memcheck.conflict, label %.lr.ph29.new.preheader76, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %60 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv41.unr, %60
  %61 = getelementptr inbounds i16, i16* %37, i64 %offset.idx
  %62 = bitcast i16* %61 to <16 x i16>*
  %wide.vec = load <16 x i16>, <16 x i16>* %62, align 2, !alias.scope !7, !noalias !10
  %strided.vec = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %strided.vec71 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %63 = sext <8 x i16> %strided.vec to <8 x i32>
  %64 = getelementptr inbounds i16, i16* %38, i64 %offset.idx
  %65 = bitcast i16* %64 to <16 x i16>*
  %wide.vec72 = load <16 x i16>, <16 x i16>* %65, align 2, !alias.scope !10
  %strided.vec73 = shufflevector <16 x i16> %wide.vec72, <16 x i16> undef, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %strided.vec74 = shufflevector <16 x i16> %wide.vec72, <16 x i16> undef, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %66 = sext <8 x i16> %strided.vec73 to <8 x i32>
  %67 = add nsw <8 x i32> %66, %63
  %68 = sdiv <8 x i32> %67, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %69 = trunc <8 x i32> %68 to <8 x i16>
  %70 = add nuw nsw i64 %offset.idx, 1
  %71 = getelementptr inbounds i16, i16* %37, i64 %70
  %72 = sext <8 x i16> %strided.vec71 to <8 x i32>
  %73 = getelementptr inbounds i16, i16* %38, i64 %70
  %74 = sext <8 x i16> %strided.vec74 to <8 x i32>
  %75 = add nsw <8 x i32> %74, %72
  %76 = sdiv <8 x i32> %75, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %77 = trunc <8 x i32> %76 to <8 x i16>
  %78 = getelementptr i16, i16* %71, i64 -1
  %79 = bitcast i16* %78 to <16 x i16>*
  %interleaved.vec = shufflevector <8 x i16> %69, <8 x i16> %77, <16 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11, i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  store <16 x i16> %interleaved.vec, <16 x i16>* %79, align 2, !alias.scope !7, !noalias !10
  %80 = getelementptr i16, i16* %73, i64 -1
  %81 = bitcast i16* %80 to <16 x i16>*
  store <16 x i16> zeroinitializer, <16 x i16>* %81, align 2, !alias.scope !10
  %index.next = add i64 %index, 8
  %82 = icmp eq i64 %index.next, %n.vec
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader11, label %.lr.ph29.new.preheader76

.lr.ph29.new.preheader76:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph29.new.preheader
  %indvars.iv41.ph = phi i64 [ %indvars.iv41.unr, %vector.memcheck ], [ %indvars.iv41.unr, %min.iters.checked ], [ %indvars.iv41.unr, %.lr.ph29.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph29.new

.lr.ph29.new:                                     ; preds = %.lr.ph29.new.preheader76, %.lr.ph29.new
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %.lr.ph29.new ], [ %indvars.iv41.ph, %.lr.ph29.new.preheader76 ]
  %83 = getelementptr inbounds i16, i16* %37, i64 %indvars.iv41
  %84 = load i16, i16* %83, align 2
  %85 = sext i16 %84 to i32
  %86 = getelementptr inbounds i16, i16* %38, i64 %indvars.iv41
  %87 = load i16, i16* %86, align 2
  %88 = sext i16 %87 to i32
  %89 = add nsw i32 %88, %85
  %90 = sdiv i32 %89, 2
  %91 = trunc i32 %90 to i16
  store i16 %91, i16* %83, align 2
  %92 = getelementptr inbounds i16, i16* %38, i64 %indvars.iv41
  store i16 0, i16* %92, align 2
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %93 = getelementptr inbounds i16, i16* %37, i64 %indvars.iv.next42
  %94 = load i16, i16* %93, align 2
  %95 = sext i16 %94 to i32
  %96 = getelementptr inbounds i16, i16* %38, i64 %indvars.iv.next42
  %97 = load i16, i16* %96, align 2
  %98 = sext i16 %97 to i32
  %99 = add nsw i32 %98, %95
  %100 = sdiv i32 %99, 2
  %101 = trunc i32 %100 to i16
  store i16 %101, i16* %93, align 2
  %102 = getelementptr inbounds i16, i16* %38, i64 %indvars.iv.next42
  store i16 0, i16* %102, align 2
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond.149 = icmp eq i64 %indvars.iv.next42.1, %wide.trip.count43.1
  br i1 %exitcond.149, label %.preheader11.loopexit, label %.lr.ph29.new, !llvm.loop !13

.outer.loopexit:                                  ; preds = %._crit_edge26.us
  br label %.outer.backedge

.outer.loopexit75:                                ; preds = %.preheader
  br label %.outer.backedge

.outer:                                           ; preds = %.outer.backedge, %.preheader11
  %.09.ph = phi i32 [ 0, %.preheader11 ], [ %146, %.outer.backedge ]
  %.07.ph = phi i8* [ %4, %.preheader11 ], [ %145, %.outer.backedge ]
  %.06.ph = phi i32 [ %3, %.preheader11 ], [ %130, %.outer.backedge ]
  br label %103

; <label>:103:                                    ; preds = %.outer, %135
  %.06 = phi i32 [ %130, %135 ], [ %.06.ph, %.outer ]
  %104 = icmp sgt i32 %.06, 0
  br i1 %104, label %105, label %182

; <label>:105:                                    ; preds = %103
  store i32 0, i32* %8, align 4
  %106 = load i32, i32* %30, align 4
  %107 = icmp sgt i32 %106, 0
  br i1 %107, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %105
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %121
  %indvars.iv = phi i64 [ %indvars.iv.next, %121 ], [ 0, %.lr.ph.preheader ]
  %108 = load float, float* %31, align 8
  %109 = fcmp une float %108, 1.000000e+00
  %110 = load i32, i32* @mf_size, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv, i64 %111
  %113 = load i32, i32* %11, align 4
  %114 = getelementptr inbounds [2 x i16*], [2 x i16*]* %7, i64 0, i64 %indvars.iv
  %115 = load i16*, i16** %114, align 8
  br i1 %109, label %116, label %119

; <label>:116:                                    ; preds = %.lr.ph
  %117 = trunc i64 %indvars.iv to i32
  %118 = call i32 @fill_buffer_resample(%struct.lame_global_flags* nonnull %0, i16* %112, i32 %113, i16* %115, i32 %.06, i32* nonnull %8, i32 %117)
  br label %121

; <label>:119:                                    ; preds = %.lr.ph
  %120 = tail call i32 @fill_buffer(%struct.lame_global_flags* undef, i16* %112, i32 %113, i16* %115, i32 %.06)
  store i32 %120, i32* %8, align 4
  br label %121

; <label>:121:                                    ; preds = %119, %116
  %.1 = phi i32 [ %118, %116 ], [ %120, %119 ]
  %122 = load i32, i32* %8, align 4
  %123 = load i16*, i16** %114, align 8
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds i16, i16* %123, i64 %124
  store i16* %125, i16** %114, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %126 = load i32, i32* %30, align 4
  %127 = sext i32 %126 to i64
  %128 = icmp slt i64 %indvars.iv.next, %127
  br i1 %128, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %121
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %105
  %.01.lcssa = phi i32 [ 0, %105 ], [ %.1, %._crit_edge.loopexit ]
  %129 = load i32, i32* %8, align 4
  %130 = sub nsw i32 %.06, %129
  %131 = load i32, i32* @mf_size, align 4
  %132 = add nsw i32 %131, %.01.lcssa
  store i32 %132, i32* @mf_size, align 4
  %133 = icmp slt i32 %132, 3057
  br i1 %133, label %135, label %134

; <label>:134:                                    ; preds = %._crit_edge
  tail call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), i32 1040, i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer, i64 0, i64 0)) #11
  unreachable

; <label>:135:                                    ; preds = %._crit_edge
  %136 = load i32, i32* @mf_samples_to_encode, align 4
  %137 = add nsw i32 %136, %.01.lcssa
  store i32 %137, i32* @mf_samples_to_encode, align 4
  %138 = load i32, i32* @mf_size, align 4
  %139 = icmp slt i32 %138, %13
  br i1 %139, label %103, label %140

; <label>:140:                                    ; preds = %135
  %141 = tail call i32 @lame_encode_frame(%struct.lame_global_flags* nonnull %0, i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0, i64 0), i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1, i64 0), i32 %138, i8* %.07.ph, i32 %5)
  %142 = icmp eq i32 %141, -1
  br i1 %142, label %.loopexit12.loopexit, label %143

; <label>:143:                                    ; preds = %140
  %144 = sext i32 %141 to i64
  %145 = getelementptr inbounds i8, i8* %.07.ph, i64 %144
  %146 = add nsw i32 %141, %.09.ph
  %147 = load i32, i32* %11, align 4
  %148 = load i32, i32* @mf_size, align 4
  %149 = sub nsw i32 %148, %147
  store i32 %149, i32* @mf_size, align 4
  %150 = load i32, i32* @mf_samples_to_encode, align 4
  %151 = sub nsw i32 %150, %147
  store i32 %151, i32* @mf_samples_to_encode, align 4
  %152 = load i32, i32* %30, align 4
  %153 = icmp sgt i32 %152, 0
  br i1 %153, label %.preheader.lr.ph, label %.outer.backedge

.outer.backedge:                                  ; preds = %143, %.outer.loopexit, %.outer.loopexit75
  br label %.outer

.preheader.lr.ph:                                 ; preds = %143
  %154 = load i32, i32* @mf_size, align 4
  %155 = icmp sgt i32 %154, 0
  br i1 %155, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %156 = load i32, i32* %30, align 4
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %154, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %157 = icmp eq i32 %154, 1
  %wide.trip.count.1 = zext i32 %154 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge26.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge26.us ], [ 0, %.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %158 = load i32, i32* %11, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv39, i64 %159
  %161 = load i16, i16* %160, align 2
  %162 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv39, i64 0
  store i16 %161, i16* %162, align 16
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %157, label %._crit_edge26.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.preheader.us.new ], [ %indvars.iv37.unr.ph, %.preheader.us.new.preheader ]
  %163 = load i32, i32* %11, align 4
  %164 = trunc i64 %indvars.iv37 to i32
  %165 = add nsw i32 %163, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv39, i64 %166
  %168 = load i16, i16* %167, align 2
  %169 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv39, i64 %indvars.iv37
  store i16 %168, i16* %169, align 2
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %170 = load i32, i32* %11, align 4
  %171 = trunc i64 %indvars.iv.next38 to i32
  %172 = add nsw i32 %170, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv39, i64 %173
  %175 = load i16, i16* %174, align 2
  %176 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv39, i64 %indvars.iv.next38
  store i16 %175, i16* %176, align 2
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge26.us.loopexit, label %.preheader.us.new

._crit_edge26.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %.prol.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %177 = load i32, i32* %30, align 4
  %178 = sext i32 %177 to i64
  %179 = icmp slt i64 %indvars.iv.next40, %178
  br i1 %179, label %.preheader.us, label %.outer.loopexit

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.1327 = phi i32 [ %180, %.preheader ], [ 0, %.preheader.preheader ]
  %180 = add nuw nsw i32 %.1327, 1
  %181 = icmp slt i32 %180, %156
  br i1 %181, label %.preheader, label %.outer.loopexit75

; <label>:182:                                    ; preds = %103
  %183 = icmp eq i32 %.06, 0
  br i1 %183, label %.loopexit12, label %184

; <label>:184:                                    ; preds = %182
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), i32 1061, i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer, i64 0, i64 0)) #11
  unreachable

.loopexit12.loopexit:                             ; preds = %140
  br label %.loopexit12

.loopexit12:                                      ; preds = %.loopexit12.loopexit, %182
  %.0 = phi i32 [ %.09.ph, %182 ], [ -1, %.loopexit12.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @lame_encode_buffer_interleaved(%struct.lame_global_flags*, i16*, i32, i8*, i32) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  %7 = load i32, i32* %6, align 4
  %8 = add nsw i32 %7, 752
  %9 = icmp slt i32 %8, 3057
  br i1 %9, label %11, label %10

; <label>:10:                                     ; preds = %5
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), i32 1078, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer_interleaved, i64 0, i64 0)) #11
  unreachable

; <label>:11:                                     ; preds = %5
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %11
  %16 = tail call i32 @lame_encode_buffer(%struct.lame_global_flags* nonnull %0, i16* %1, i16* null, i32 %2, i8* %3, i32 %4)
  br label %.loopexit11

; <label>:17:                                     ; preds = %11
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 49
  %19 = load float, float* %18, align 8
  %20 = fcmp une float %19, 1.000000e+00
  br i1 %20, label %21, label %52

; <label>:21:                                     ; preds = %17
  %22 = sext i32 %2 to i64
  %23 = shl nsw i64 %22, 1
  %24 = tail call noalias i8* @malloc(i64 %23) #8
  %25 = bitcast i8* %24 to i16*
  %26 = tail call noalias i8* @malloc(i64 %23) #8
  %27 = bitcast i8* %26 to i16*
  %28 = icmp eq i8* %24, null
  %29 = icmp eq i8* %26, null
  %or.cond = or i1 %28, %29
  br i1 %or.cond, label %.loopexit11, label %.preheader

.preheader:                                       ; preds = %21
  %30 = icmp sgt i32 %2, 0
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %31 = load i16, i16* %1, align 2
  store i16 %31, i16* %25, align 2
  %32 = getelementptr inbounds i16, i16* %1, i64 1
  %33 = load i16, i16* %32, align 2
  store i16 %33, i16* %27, align 2
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %34 = icmp eq i32 %2, 1
  br i1 %34, label %._crit_edge, label %.lr.ph.preheader60

.lr.ph.preheader60:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader60, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader60 ]
  %35 = shl nsw i64 %indvars.iv, 1
  %36 = getelementptr inbounds i16, i16* %1, i64 %35
  %37 = load i16, i16* %36, align 2
  %38 = getelementptr inbounds i16, i16* %25, i64 %indvars.iv
  store i16 %37, i16* %38, align 2
  %39 = or i64 %35, 1
  %40 = getelementptr inbounds i16, i16* %1, i64 %39
  %41 = load i16, i16* %40, align 2
  %42 = getelementptr inbounds i16, i16* %27, i64 %indvars.iv
  store i16 %41, i16* %42, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = shl nsw i64 %indvars.iv.next, 1
  %44 = getelementptr inbounds i16, i16* %1, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = getelementptr inbounds i16, i16* %25, i64 %indvars.iv.next
  store i16 %45, i16* %46, align 2
  %47 = or i64 %43, 1
  %48 = getelementptr inbounds i16, i16* %1, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = getelementptr inbounds i16, i16* %27, i64 %indvars.iv.next
  store i16 %49, i16* %50, align 2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %51 = tail call i32 @lame_encode_buffer(%struct.lame_global_flags* %0, i16* %25, i16* %27, i32 %2, i8* %3, i32 %4)
  tail call void @free(i8* %24) #8
  tail call void @free(i8* %26) #8
  br label %.loopexit11

; <label>:52:                                     ; preds = %17
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %54 = load i64, i64* %53, align 8
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %58

; <label>:56:                                     ; preds = %52
  %.b = load i1, i1* @lame_encode_buffer_interleaved.frame_buffered, align 4
  br i1 %.b, label %thread-pre-split, label %57

; <label>:57:                                     ; preds = %56
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([2 x [3056 x i16]]* @mfbuf to i8*), i8 0, i64 12224, i32 16, i1 false)
  store i1 true, i1* @lame_encode_buffer_interleaved.frame_buffered, align 4
  store i32 1088, i32* @mf_samples_to_encode, align 4
  store i32 752, i32* @mf_size, align 4
  br label %thread-pre-split

thread-pre-split:                                 ; preds = %56, %57
  %.pr = load i64, i64* %53, align 8
  br label %58

; <label>:58:                                     ; preds = %thread-pre-split, %52
  %59 = phi i64 [ %.pr, %thread-pre-split ], [ %54, %52 ]
  %60 = icmp eq i64 %59, 1
  br i1 %60, label %61, label %62

; <label>:61:                                     ; preds = %58
  store i1 false, i1* @lame_encode_buffer_interleaved.frame_buffered, align 4
  br label %62

; <label>:62:                                     ; preds = %61, %58
  %63 = load i32, i32* %12, align 8
  %64 = icmp eq i32 %63, 2
  br i1 %64, label %66, label %.preheader10

.preheader10.loopexit:                            ; preds = %.lr.ph31
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %middle.block, %66, %62
  %65 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.outer

; <label>:66:                                     ; preds = %62
  %67 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %68 = load i32, i32* %67, align 4
  %69 = icmp eq i32 %68, 1
  %70 = icmp sgt i32 %2, 0
  %or.cond32 = and i1 %69, %70
  br i1 %or.cond32, label %.lr.ph31.preheader, label %.preheader10

.lr.ph31.preheader:                               ; preds = %66
  %wide.trip.count59 = zext i32 %2 to i64
  %min.iters.check = icmp ult i32 %2, 8
  br i1 %min.iters.check, label %.lr.ph31.preheader81, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph31.preheader
  %71 = and i32 %2, 7
  %n.mod.vf = zext i32 %71 to i64
  %n.vec = sub nsw i64 %wide.trip.count59, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph31.preheader81, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %72 = shl nsw i64 %index, 1
  %73 = getelementptr inbounds i16, i16* %1, i64 %72
  %74 = bitcast i16* %73 to <16 x i16>*
  %wide.vec = load <16 x i16>, <16 x i16>* %74, align 2
  %strided.vec = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %strided.vec79 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %75 = sext <8 x i16> %strided.vec to <8 x i32>
  %76 = or i64 %72, 1
  %77 = getelementptr inbounds i16, i16* %1, i64 %76
  %78 = sext <8 x i16> %strided.vec79 to <8 x i32>
  %79 = add nsw <8 x i32> %78, %75
  %80 = sdiv <8 x i32> %79, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %81 = trunc <8 x i32> %80 to <8 x i16>
  %82 = getelementptr i16, i16* %77, i64 -1
  %83 = bitcast i16* %82 to <16 x i16>*
  %interleaved.vec = shufflevector <8 x i16> %81, <8 x i16> zeroinitializer, <16 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11, i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  store <16 x i16> %interleaved.vec, <16 x i16>* %83, align 2
  %index.next = add i64 %index, 8
  %84 = icmp eq i64 %index.next, %n.vec
  br i1 %84, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %71, 0
  br i1 %cmp.n, label %.preheader10, label %.lr.ph31.preheader81

.lr.ph31.preheader81:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph31.preheader
  %indvars.iv57.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph31.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph31

.lr.ph31:                                         ; preds = %.lr.ph31.preheader81, %.lr.ph31
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.lr.ph31 ], [ %indvars.iv57.ph, %.lr.ph31.preheader81 ]
  %85 = shl nsw i64 %indvars.iv57, 1
  %86 = getelementptr inbounds i16, i16* %1, i64 %85
  %87 = load i16, i16* %86, align 2
  %88 = sext i16 %87 to i32
  %89 = or i64 %85, 1
  %90 = getelementptr inbounds i16, i16* %1, i64 %89
  %91 = load i16, i16* %90, align 2
  %92 = sext i16 %91 to i32
  %93 = add nsw i32 %92, %88
  %94 = sdiv i32 %93, 2
  %95 = trunc i32 %94 to i16
  store i16 %95, i16* %86, align 2
  store i16 0, i16* %90, align 2
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond, label %.preheader10.loopexit, label %.lr.ph31, !llvm.loop !15

.outer.loopexit:                                  ; preds = %._crit_edge28.us
  br label %.outer.backedge

.outer.loopexit80:                                ; preds = %.preheader9
  br label %.outer.backedge

.outer:                                           ; preds = %.outer.backedge, %.preheader10
  %.07.ph = phi i32 [ 0, %.preheader10 ], [ %154, %.outer.backedge ]
  %.04.ph = phi i8* [ %3, %.preheader10 ], [ %153, %.outer.backedge ]
  %.03.ph = phi i32 [ %2, %.preheader10 ], [ %138, %.outer.backedge ]
  %.02.ph = phi i16* [ %1, %.preheader10 ], [ %137, %.outer.backedge ]
  br label %96

; <label>:96:                                     ; preds = %.outer, %143
  %.03 = phi i32 [ %138, %143 ], [ %.03.ph, %.outer ]
  %.02 = phi i16* [ %137, %143 ], [ %.02.ph, %.outer ]
  %97 = icmp sgt i32 %.03, 0
  br i1 %97, label %98, label %190

; <label>:98:                                     ; preds = %96
  %99 = load i32, i32* %6, align 4
  %100 = icmp slt i32 %99, %.03
  %..03 = select i1 %100, i32 %99, i32 %.03
  %101 = icmp sgt i32 %..03, 0
  br i1 %101, label %.lr.ph24, label %._crit_edge25

.lr.ph24:                                         ; preds = %98
  %102 = load i32, i32* @mf_size, align 4
  %103 = sext i32 %102 to i64
  %104 = sext i32 %102 to i64
  %105 = sext i32 %..03 to i64
  %106 = icmp sgt i32 %.03, %99
  %107 = select i1 %106, i32 %99, i32 %.03
  %xtraiter44 = and i32 %..03, 1
  %lcmp.mod45 = icmp eq i32 %xtraiter44, 0
  br i1 %lcmp.mod45, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph24
  %108 = load i16, i16* %.02, align 2
  %109 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0, i64 %104
  store i16 %108, i16* %109, align 2
  %110 = getelementptr inbounds i16, i16* %.02, i64 1
  %111 = load i16, i16* %110, align 2
  %112 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1, i64 %103
  store i16 %111, i16* %112, align 2
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph24
  %indvars.iv42.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph24 ]
  %113 = icmp eq i32 %107, 1
  br i1 %113, label %._crit_edge25, label %.lr.ph24.new.preheader

.lr.ph24.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph24.new

.lr.ph24.new:                                     ; preds = %.lr.ph24.new.preheader, %.lr.ph24.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %.lr.ph24.new ], [ %indvars.iv42.unr.ph, %.lr.ph24.new.preheader ]
  %114 = shl nsw i64 %indvars.iv42, 1
  %115 = getelementptr inbounds i16, i16* %.02, i64 %114
  %116 = load i16, i16* %115, align 2
  %117 = add nsw i64 %104, %indvars.iv42
  %118 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0, i64 %117
  store i16 %116, i16* %118, align 2
  %119 = or i64 %114, 1
  %120 = getelementptr inbounds i16, i16* %.02, i64 %119
  %121 = load i16, i16* %120, align 2
  %122 = add nsw i64 %103, %indvars.iv42
  %123 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1, i64 %122
  store i16 %121, i16* %123, align 2
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %124 = shl nsw i64 %indvars.iv.next43, 1
  %125 = getelementptr inbounds i16, i16* %.02, i64 %124
  %126 = load i16, i16* %125, align 2
  %127 = add nsw i64 %104, %indvars.iv.next43
  %128 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0, i64 %127
  store i16 %126, i16* %128, align 2
  %129 = or i64 %124, 1
  %130 = getelementptr inbounds i16, i16* %.02, i64 %129
  %131 = load i16, i16* %130, align 2
  %132 = add nsw i64 %103, %indvars.iv.next43
  %133 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1, i64 %132
  store i16 %131, i16* %133, align 2
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %134 = icmp slt i64 %indvars.iv.next43.1, %105
  br i1 %134, label %.lr.ph24.new, label %._crit_edge25.loopexit

._crit_edge25.loopexit:                           ; preds = %.lr.ph24.new
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.prol.loopexit, %98
  %135 = shl nsw i32 %..03, 1
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i16, i16* %.02, i64 %136
  %138 = sub nsw i32 %.03, %..03
  %139 = load i32, i32* @mf_size, align 4
  %140 = add nsw i32 %139, %..03
  store i32 %140, i32* @mf_size, align 4
  %141 = icmp slt i32 %140, 3057
  br i1 %141, label %143, label %142

; <label>:142:                                    ; preds = %._crit_edge25
  tail call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), i32 1135, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer_interleaved, i64 0, i64 0)) #11
  unreachable

; <label>:143:                                    ; preds = %._crit_edge25
  %144 = load i32, i32* @mf_samples_to_encode, align 4
  %145 = add nsw i32 %144, %..03
  store i32 %145, i32* @mf_samples_to_encode, align 4
  %146 = load i32, i32* @mf_size, align 4
  %147 = icmp slt i32 %146, %8
  br i1 %147, label %96, label %148

; <label>:148:                                    ; preds = %143
  %149 = tail call i32 @lame_encode_frame(%struct.lame_global_flags* %0, i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0, i64 0), i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1, i64 0), i32 %146, i8* %.04.ph, i32 %4)
  %150 = icmp eq i32 %149, -1
  br i1 %150, label %.loopexit11.loopexit, label %151

; <label>:151:                                    ; preds = %148
  %152 = sext i32 %149 to i64
  %153 = getelementptr inbounds i8, i8* %.04.ph, i64 %152
  %154 = add nsw i32 %149, %.07.ph
  %155 = load i32, i32* %6, align 4
  %156 = load i32, i32* @mf_size, align 4
  %157 = sub nsw i32 %156, %155
  store i32 %157, i32* @mf_size, align 4
  %158 = load i32, i32* @mf_samples_to_encode, align 4
  %159 = sub nsw i32 %158, %155
  store i32 %159, i32* @mf_samples_to_encode, align 4
  %160 = load i32, i32* %65, align 4
  %161 = icmp sgt i32 %160, 0
  br i1 %161, label %.preheader9.lr.ph, label %.outer.backedge

.outer.backedge:                                  ; preds = %151, %.outer.loopexit, %.outer.loopexit80
  br label %.outer

.preheader9.lr.ph:                                ; preds = %151
  %162 = load i32, i32* @mf_size, align 4
  %163 = icmp sgt i32 %162, 0
  br i1 %163, label %.preheader9.us.preheader, label %.preheader9.preheader

.preheader9.preheader:                            ; preds = %.preheader9.lr.ph
  %164 = load i32, i32* %65, align 4
  br label %.preheader9

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %xtraiter51 = and i32 %162, 1
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  %165 = icmp eq i32 %162, 1
  %wide.trip.count48.1 = zext i32 %162 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge28.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge28.us ], [ 0, %.preheader9.us.preheader ]
  br i1 %lcmp.mod52, label %.prol.loopexit50, label %.prol.preheader49

.prol.preheader49:                                ; preds = %.preheader9.us
  %166 = load i32, i32* %6, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv55, i64 %167
  %169 = load i16, i16* %168, align 2
  %170 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv55, i64 0
  store i16 %169, i16* %170, align 16
  br label %.prol.loopexit50

.prol.loopexit50:                                 ; preds = %.prol.preheader49, %.preheader9.us
  %indvars.iv46.unr.ph = phi i64 [ 1, %.prol.preheader49 ], [ 0, %.preheader9.us ]
  br i1 %165, label %._crit_edge28.us, label %.preheader9.us.new.preheader

.preheader9.us.new.preheader:                     ; preds = %.prol.loopexit50
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new.preheader, %.preheader9.us.new
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %.preheader9.us.new ], [ %indvars.iv46.unr.ph, %.preheader9.us.new.preheader ]
  %171 = load i32, i32* %6, align 4
  %172 = trunc i64 %indvars.iv46 to i32
  %173 = add nsw i32 %171, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv55, i64 %174
  %176 = load i16, i16* %175, align 2
  %177 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv55, i64 %indvars.iv46
  store i16 %176, i16* %177, align 2
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %178 = load i32, i32* %6, align 4
  %179 = trunc i64 %indvars.iv.next47 to i32
  %180 = add nsw i32 %178, %179
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv55, i64 %181
  %183 = load i16, i16* %182, align 2
  %184 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next47
  store i16 %183, i16* %184, align 2
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond.154 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count48.1
  br i1 %exitcond.154, label %._crit_edge28.us.loopexit, label %.preheader9.us.new

._crit_edge28.us.loopexit:                        ; preds = %.preheader9.us.new
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %._crit_edge28.us.loopexit, %.prol.loopexit50
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %185 = load i32, i32* %65, align 4
  %186 = sext i32 %185 to i64
  %187 = icmp slt i64 %indvars.iv.next56, %186
  br i1 %187, label %.preheader9.us, label %.outer.loopexit

.preheader9:                                      ; preds = %.preheader9.preheader, %.preheader9
  %.0129 = phi i32 [ %188, %.preheader9 ], [ 0, %.preheader9.preheader ]
  %188 = add nuw nsw i32 %.0129, 1
  %189 = icmp slt i32 %188, %164
  br i1 %189, label %.preheader9, label %.outer.loopexit80

; <label>:190:                                    ; preds = %96
  %191 = icmp eq i32 %.03, 0
  br i1 %191, label %.loopexit11, label %192

; <label>:192:                                    ; preds = %190
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), i32 1156, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer_interleaved, i64 0, i64 0)) #11
  unreachable

.loopexit11.loopexit:                             ; preds = %148
  br label %.loopexit11

.loopexit11:                                      ; preds = %.loopexit11.loopexit, %190, %21, %._crit_edge, %15
  %.0 = phi i32 [ %16, %15 ], [ %51, %._crit_edge ], [ -1, %21 ], [ %.07.ph, %190 ], [ -1, %.loopexit11.loopexit ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define i32 @lame_encode(%struct.lame_global_flags*, [1152 x i16]*, i8*, i32) local_unnamed_addr #0 {
  %5 = load i32, i32* @mf_samples_to_encode, align 4
  %6 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 0, i64 0
  %7 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 1, i64 0
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %9 = load i32, i32* %8, align 8
  %10 = mul nsw i32 %9, 576
  %11 = tail call i32 @lame_encode_buffer(%struct.lame_global_flags* %0, i16* %6, i16* %7, i32 %10, i8* %2, i32 %3)
  store i32 %5, i32* @mf_samples_to_encode, align 4
  ret i32 %11
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @lame_init(%struct.lame_global_flags*) local_unnamed_addr #7 {
  %2 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 36
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 33
  store i32 0, i32* %3, align 8
  %4 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 34
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  store i32 1, i32* %5, align 8
  %6 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 35
  store float 0.000000e+00, float* %6, align 8
  %7 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 17
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  store i64 0, i64* %8, align 8
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 4
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %11 = bitcast i32* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 16, i32 8, i1 false)
  store i32 5, i32* %10, align 4
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  store i32 0, i32* %12, align 8
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 59
  store i32 0, i32* %13, align 8
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  store i32 0, i32* %14, align 8
  %15 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  store i32 -1, i32* %16, align 8
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  store i32 -1, i32* %17, align 4
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 57
  %20 = bitcast float* %18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 16, i32 8, i1 false)
  store i32 32, i32* %19, align 8
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 58
  store i32 -1, i32* %21, align 4
  %22 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 37
  store i32 0, i32* %22, align 8
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 49
  store float 1.000000e+00, float* %23, align 8
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 15
  store i32 2, i32* %24, align 8
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  store i32 0, i32* %25, align 4
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 30
  store i32 0, i32* %26, align 4
  %27 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 7
  store i32 0, i32* %27, align 8
  %28 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 40
  store i64 0, i64* %28, align 8
  %29 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  store i32 0, i32* %29, align 8
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  store i32 4, i32* %30, align 4
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  store i32 0, i32* %31, align 8
  %32 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  store i32 0, i32* %32, align 4
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 47
  store i32 1, i32* %33, align 8
  %34 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 48
  store i32 13, i32* %34, align 4
  %35 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  store i32 1, i32* %35, align 8
  %36 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  store i32 1, i32* %36, align 4
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %38 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 13
  %39 = bitcast i32* %37 to i8*
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 16, i32 8, i1 false)
  store i32 1, i32* %38, align 8
  %40 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 16
  store i32 0, i32* %40, align 4
  %41 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 14
  store i32 0, i32* %41, align 4
  %42 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 38
  store i32 0, i32* %42, align 4
  %43 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 2
  store i32 44100, i32* %43, align 4
  %44 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  store i32 0, i32* %44, align 8
  %45 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  store i32 2, i32* %45, align 8
  %46 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 0
  store i64 4294967295, i64* %46, align 8
  %47 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 31
  %48 = bitcast i8** %47 to i8*
  call void @llvm.memset.p0i8.i64(i8* %48, i8 0, i64 16, i32 8, i1 false)
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @lame_encode_finish(%struct.lame_global_flags*, i8*, i32) local_unnamed_addr #0 {
  %4 = alloca [2 x [1152 x i16]], align 16
  %5 = bitcast [2 x [1152 x i16]]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %5, i8 0, i64 4608, i32 16, i1 false)
  %.pr = load i32, i32* @mf_samples_to_encode, align 4
  %6 = icmp sgt i32 %.pr, 0
  br i1 %6, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %7 = icmp eq i32 %2, 0
  %8 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %4, i64 0, i64 0
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  br i1 %7, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %12
  %.028.us = phi i8* [ %14, %12 ], [ %1, %.lr.ph.split.us.preheader ]
  %.037.us = phi i32 [ %15, %12 ], [ 0, %.lr.ph.split.us.preheader ]
  %10 = call i32 @lame_encode(%struct.lame_global_flags* %0, [1152 x i16]* nonnull %8, i8* %.028.us, i32 0)
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %.us-lcssa.us.loopexit, label %12

; <label>:12:                                     ; preds = %.lr.ph.split.us
  %13 = sext i32 %10 to i64
  %14 = getelementptr inbounds i8, i8* %.028.us, i64 %13
  %15 = add nsw i32 %10, %.037.us
  %16 = load i32, i32* %9, align 4
  %17 = load i32, i32* @mf_samples_to_encode, align 4
  %18 = sub nsw i32 %17, %16
  store i32 %18, i32* @mf_samples_to_encode, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %23
  %.028 = phi i8* [ %25, %23 ], [ %1, %.lr.ph.split.preheader ]
  %.037 = phi i32 [ %26, %23 ], [ 0, %.lr.ph.split.preheader ]
  %20 = sub nsw i32 %2, %.037
  %21 = call i32 @lame_encode(%struct.lame_global_flags* %0, [1152 x i16]* nonnull %8, i8* %.028, i32 %20)
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %.us-lcssa.us.loopexit25, label %23

.us-lcssa.us.loopexit:                            ; preds = %.lr.ph.split.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit25:                          ; preds = %.lr.ph.split
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit25, %.us-lcssa.us.loopexit
  call void @desalloc_buffer(%struct.bit_stream_struc* nonnull @bs) #8
  br label %59

; <label>:23:                                     ; preds = %.lr.ph.split
  %24 = sext i32 %21 to i64
  %25 = getelementptr inbounds i8, i8* %.028, i64 %24
  %26 = add nsw i32 %21, %.037
  %27 = load i32, i32* %9, align 4
  %28 = load i32, i32* @mf_samples_to_encode, align 4
  %29 = sub nsw i32 %28, %27
  store i32 %29, i32* @mf_samples_to_encode, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph.split, label %._crit_edge.loopexit26

._crit_edge.loopexit:                             ; preds = %12
  br label %._crit_edge

._crit_edge.loopexit26:                           ; preds = %23
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit26, %._crit_edge.loopexit, %3
  %.03.lcssa = phi i32 [ 0, %3 ], [ %15, %._crit_edge.loopexit ], [ %26, %._crit_edge.loopexit26 ]
  %.02.lcssa = phi i8* [ %1, %3 ], [ %14, %._crit_edge.loopexit ], [ %25, %._crit_edge.loopexit26 ]
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %31, align 8
  %34 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 4
  %35 = load i32, i32* %34, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %51

; <label>:37:                                     ; preds = %._crit_edge
  %38 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 7
  %39 = load i32, i32* %38, align 8
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %51

; <label>:41:                                     ; preds = %37
  %42 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %43 = load i32, i32* %42, align 8
  %44 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 40
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  %47 = load i32, i32* %46, align 4
  call void @timestatus(i32 %43, i64 %33, i64 %45, i32 %47) #8
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %48) #10
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = call i32 @fflush(%struct._IO_FILE* %49)
  br label %51

; <label>:51:                                     ; preds = %37, %._crit_edge, %41
  call void @III_FlushBitstream() #8
  %52 = sub nsw i32 %2, %.03.lcssa
  %53 = icmp eq i32 %2, 0
  %.4 = select i1 %53, i32 0, i32 %52
  %54 = call i32 @copy_buffer(i8* %.02.lcssa, i32 %.4, %struct.bit_stream_struc* nonnull @bs) #8
  %55 = icmp eq i32 %54, -1
  br i1 %55, label %56, label %57

; <label>:56:                                     ; preds = %51
  call void @desalloc_buffer(%struct.bit_stream_struc* nonnull @bs) #8
  br label %59

; <label>:57:                                     ; preds = %51
  %58 = add nsw i32 %54, %.03.lcssa
  call void @desalloc_buffer(%struct.bit_stream_struc* nonnull @bs) #8
  br label %59

; <label>:59:                                     ; preds = %57, %56, %.us-lcssa.us
  %.0 = phi i32 [ -1, %.us-lcssa.us ], [ -1, %56 ], [ %58, %57 ]
  ret i32 %.0
}

declare void @desalloc_buffer(%struct.bit_stream_struc*) local_unnamed_addr #2

declare void @III_FlushBitstream() local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @lame_mp3_tags(%struct.lame_global_flags* nocapture readonly) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %16, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %7 = load i32, i32* %6, align 4
  %8 = mul nsw i32 %7, 100
  %9 = sdiv i32 %8, 9
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 32
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %13 = load i32, i32* %12, align 8
  %14 = sub nsw i32 1, %13
  %15 = tail call i32 @PutVbrTag(i8* %11, i32 %9, i32 %14) #8
  br label %16

; <label>:16:                                     ; preds = %1, %5
  %17 = load i32, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %23, label %19

; <label>:19:                                     ; preds = %16
  tail call void @id3_buildtag(%struct.ID3TAGDATA* nonnull @id3tag) #8
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 32
  %21 = load i8*, i8** %20, align 8
  %22 = tail call i32 @id3_writetag(i8* %21, %struct.ID3TAGDATA* nonnull @id3tag) #8
  br label %23

; <label>:23:                                     ; preds = %16, %19
  ret void
}

declare i32 @PutVbrTag(i8*, i32, i32) local_unnamed_addr #2

declare void @id3_buildtag(%struct.ID3TAGDATA*) local_unnamed_addr #2

declare i32 @id3_writetag(i8*, %struct.ID3TAGDATA*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @lame_version(%struct.lame_global_flags* nocapture readnone, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @get_lame_version() #8
  %4 = tail call i8* @strncpy(i8* %1, i8* %3, i64 20) #8
  ret void
}

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #4

declare i8* @get_lame_version() local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #8

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #8

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone }
attributes #10 = { cold }
attributes #11 = { noreturn nounwind }
attributes #12 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!"branch_weights", i32 1, i32 2000}
!2 = distinct !{!2, !3, !4}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6, !3, !4}
!6 = !{!"llvm.loop.unroll.runtime.disable"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !3, !4}
!13 = distinct !{!13, !3, !4}
!14 = distinct !{!14, !3, !4}
!15 = distinct !{!15, !6, !3, !4}
