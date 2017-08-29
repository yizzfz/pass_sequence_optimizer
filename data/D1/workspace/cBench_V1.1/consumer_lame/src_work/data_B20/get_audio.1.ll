; ModuleID = 'get_audio.ll'
source_filename = "get_audio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.fmt_chunk_data_struct = type { i16, i16, i64, i64, i16, i16 }
%struct.IFF_AIFF_struct = type { i16, i64, i16, float, i64, %struct.blockAlign_struct }
%struct.blockAlign_struct = type { i64, i64 }

@count_samples_carefully = internal unnamed_addr global i1 false, align 4
@get_audio.num_samples_read = internal unnamed_addr global i64 0, align 8
@num_samples = internal global i64 0, align 8
@musicin = internal unnamed_addr global %struct._IO_FILE* null, align 8
@input_bitrate = internal global i32 0, align 4
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [34 x i8] c"Could not close audio input file\0A\00", align 1
@samp_freq = internal global i32 0, align 4
@num_channels = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"Could not find \22%s\22.\0A\00", align 1
@.str.4 = private unnamed_addr constant [45 x i8] c"Error reading headers in mp3 input file %s.\0A\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"Assuming raw pcm input file\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c" : Forcing byte-swapping\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"Error reading input file\0A\00", align 1
@NativeByteOrder = external local_unnamed_addr global i32, align 4
@.str.9 = private unnamed_addr constant [27 x i8] c"byte order not determined\0A\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.11 = private unnamed_addr constant [38 x i8] c"%d-bit sample-size is not supported!\0A\00", align 1
@.str.12 = private unnamed_addr constant [32 x i8] c"Sound data is not PCM in \22%s\22.\0A\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"Sound data is not %d bits in \22%s\22.\0A\00", align 1
@.str.14 = private unnamed_addr constant [43 x i8] c"Sound data is not mono or stereo in \22%s\22.\0A\00", align 1
@.str.15 = private unnamed_addr constant [37 x i8] c"Block size is not %d bytes in \22%s\22.\0A\00", align 1
@.str.16 = private unnamed_addr constant [39 x i8] c"Block offset is not %d bytes in \22%s\22.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @lame_init_infile(%struct.lame_global_flags* nocapture) local_unnamed_addr #0 {
  store i1 false, i1* @count_samples_carefully, align 4
  %2 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 31
  %3 = load i8*, i8** %2, align 8
  %4 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  %7 = load i32, i32* %6, align 8
  %8 = tail call %struct._IO_FILE* @OpenSndFile(%struct.lame_global_flags* %0, i8* %3, i32 %5, i32 %7)
  %9 = tail call i32 @GetSndSampleRate()
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %1
  store i32 %9, i32* %4, align 4
  br label %12

; <label>:12:                                     ; preds = %1, %11
  %13 = tail call i32 @GetSndChannels()
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

; <label>:15:                                     ; preds = %12
  store i32 %13, i32* %6, align 8
  br label %16

; <label>:16:                                     ; preds = %12, %15
  %17 = tail call i64 @GetSndSamples()
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 0
  store i64 %17, i64* %18, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define %struct._IO_FILE* @OpenSndFile(%struct.lame_global_flags* nocapture, i8*, i32, i32) local_unnamed_addr #0 {
  %5 = alloca %struct.stat, align 8
  store i64 4294967295, i64* @num_samples, align 8
  store i32 %2, i32* @samp_freq, align 4
  store i32 %3, i32* @num_channels, align 4
  %6 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)) #8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %4
  %9 = load i64, i64* bitcast (%struct._IO_FILE** @stdin to i64*), align 8
  store i64 %9, i64* bitcast (%struct._IO_FILE** @musicin to i64*), align 8
  br label %16

; <label>:10:                                     ; preds = %4
  %11 = tail call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0))
  store %struct._IO_FILE* %11, %struct._IO_FILE** @musicin, align 8
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0), i8* %1) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:16:                                     ; preds = %10, %8
  store i32 0, i32* @input_bitrate, align 4
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  %18 = load i32, i32* %17, align 8
  switch i32 %18, label %26 [
    i32 3, label %19
    i32 4, label %.thread
  ]

; <label>:19:                                     ; preds = %16
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %21 = tail call i32 @lame_decode_initfile(%struct._IO_FILE* %20, i32* nonnull @num_channels, i32* nonnull @samp_freq, i32* nonnull @input_bitrate, i64* nonnull @num_samples) #7
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %23, label %38

; <label>:23:                                     ; preds = %19
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.4, i64 0, i64 0), i8* %1) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:26:                                     ; preds = %16
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  tail call void @parse_file_header(%struct.lame_global_flags* nonnull %0, %struct._IO_FILE* %27)
  %.pr = load i32, i32* %17, align 8
  %28 = icmp eq i32 %.pr, 4
  br i1 %28, label %.thread, label %38

.thread:                                          ; preds = %16, %26
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %29) #9
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 30
  %32 = load i32, i32* %31, align 4
  %33 = icmp eq i32 %32, 1
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %33, label %35, label %37

; <label>:35:                                     ; preds = %.thread
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %34) #9
  br label %38

; <label>:37:                                     ; preds = %.thread
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #9
  br label %38

; <label>:38:                                     ; preds = %26, %37, %35, %19
  %39 = load i64, i64* @num_samples, align 8
  %40 = icmp eq i64 %39, 4294967295
  br i1 %40, label %41, label %71

; <label>:41:                                     ; preds = %38
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %44 = icmp eq %struct._IO_FILE* %42, %43
  br i1 %44, label %71, label %45

; <label>:45:                                     ; preds = %41
  %46 = call i32 @stat(i8* %1, %struct.stat* nonnull %5) #7
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %71

; <label>:48:                                     ; preds = %45
  %49 = load i32, i32* %17, align 8
  %50 = icmp eq i32 %49, 3
  %51 = getelementptr inbounds %struct.stat, %struct.stat* %5, i64 0, i32 8
  %52 = load i64, i64* %51, align 8
  br i1 %50, label %53, label %65

; <label>:53:                                     ; preds = %48
  %54 = sitofp i64 %52 to double
  %55 = fmul double %54, 8.000000e+00
  %56 = tail call i32 @GetSndBitrate()
  %57 = sitofp i32 %56 to double
  %58 = fmul double %57, 1.000000e+03
  %59 = fdiv double %55, %58
  %60 = fptrunc double %59 to float
  %61 = tail call i32 @GetSndSampleRate()
  %62 = sitofp i32 %61 to float
  %63 = fmul float %62, %60
  %64 = fptoui float %63 to i64
  br label %70

; <label>:65:                                     ; preds = %48
  %66 = tail call i32 @GetSndChannels()
  %67 = shl nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = sdiv i64 %52, %68
  br label %70

; <label>:70:                                     ; preds = %65, %53
  %storemerge = phi i64 [ %69, %65 ], [ %64, %53 ]
  store i64 %storemerge, i64* @num_samples, align 8
  br label %71

; <label>:71:                                     ; preds = %45, %70, %41, %38
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  ret %struct._IO_FILE* %72
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @GetSndSampleRate() local_unnamed_addr #1 {
  %1 = load i32, i32* @samp_freq, align 4
  ret i32 %1
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @GetSndChannels() local_unnamed_addr #1 {
  %1 = load i32, i32* @num_channels, align 4
  ret i32 %1
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i64 @GetSndSamples() local_unnamed_addr #1 {
  %1 = load i64, i64* @num_samples, align 8
  ret i64 %1
}

; Function Attrs: noinline nounwind uwtable
define void @lame_close_infile(%struct.lame_global_flags* nocapture readnone) local_unnamed_addr #0 {
  tail call void @CloseSndFile(%struct.lame_global_flags* undef)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @CloseSndFile(%struct.lame_global_flags* nocapture readnone) local_unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %3 = tail call i32 @fclose(%struct._IO_FILE* %2)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %6) #9
  tail call void @exit(i32 2) #10
  unreachable

; <label>:8:                                      ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @lame_readframe(%struct.lame_global_flags* nocapture, [1152 x i16]*) local_unnamed_addr #0 {
  %3 = tail call i32 @get_audio(%struct.lame_global_flags* %0, [1152 x i16]* %1, i32 undef)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %12

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 40
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %9 = load i64, i64* %8, align 8
  %10 = add nsw i64 %9, 2
  %11 = icmp slt i64 %7, %10
  %. = select i1 %11, i64 %7, i64 %10
  store i64 %., i64* %6, align 8
  br label %12

; <label>:12:                                     ; preds = %5, %2
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 40
  %16 = load i64, i64* %15, align 8
  %17 = icmp slt i64 %14, %16
  br i1 %17, label %19, label %18

; <label>:18:                                     ; preds = %12
  store i64 %14, i64* %15, align 8
  br label %19

; <label>:19:                                     ; preds = %12, %18
  ret i32 %3
}

; Function Attrs: noinline nounwind uwtable
define i32 @get_audio(%struct.lame_global_flags* nocapture readonly, [1152 x i16]*, i32) local_unnamed_addr #0 {
  %4 = alloca [2304 x i16], align 16
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %8 = load i64, i64* %7, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %3
  store i64 0, i64* @get_audio.num_samples_read, align 8
  %11 = tail call i64 @GetSndSamples()
  store i64 %11, i64* @num_samples, align 8
  br label %12

; <label>:12:                                     ; preds = %10, %3
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %14 = load i32, i32* %13, align 8
  %15 = mul nsw i32 %14, 576
  %.b = load i1, i1* @count_samples_carefully, align 4
  br i1 %.b, label %16, label %25

; <label>:16:                                     ; preds = %12
  %17 = load i64, i64* @num_samples, align 8
  %18 = load i64, i64* @get_audio.num_samples_read, align 8
  %19 = icmp ult i64 %17, %18
  %20 = select i1 %19, i64 %17, i64 %18
  %21 = sub i64 %17, %20
  %22 = sext i32 %15 to i64
  %23 = icmp ult i64 %21, %22
  %24 = trunc i64 %21 to i32
  %.0 = select i1 %23, i32 %24, i32 %15
  br label %25

; <label>:25:                                     ; preds = %16, %12
  %.1 = phi i32 [ %15, %12 ], [ %.0, %16 ]
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 3
  br i1 %28, label %29, label %32

; <label>:29:                                     ; preds = %25
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %31 = tail call i32 @read_samples_mp3(%struct.lame_global_flags* undef, %struct._IO_FILE* %30, [1152 x i16]* %1, i32 undef)
  br label %.loopexit

; <label>:32:                                     ; preds = %25
  %33 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 0
  %34 = mul nsw i32 %15, %6
  %35 = mul nsw i32 %.1, %6
  %36 = call i32 @read_samples_pcm(%struct.lame_global_flags* nonnull %0, i16* nonnull %33, i32 %34, i32 %35)
  %37 = sdiv i32 %36, %6
  %38 = icmp sgt i32 %14, 0
  br i1 %38, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %32
  %39 = icmp eq i32 %6, 2
  %40 = sext i32 %6 to i64
  %41 = sext i32 %15 to i64
  br i1 %39, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  %42 = icmp sgt i64 %41, 1
  %smax = select i1 %42, i64 %41, i64 1
  %min.iters.check = icmp ult i64 %smax, 8
  br i1 %min.iters.check, label %.lr.ph.split.preheader12, label %min.iters.checked

.lr.ph.split.preheader12:                         ; preds = %min.iters.checked, %middle.block, %.lr.ph.split.preheader
  %indvars.iv7.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph.split

min.iters.checked:                                ; preds = %.lr.ph.split.preheader
  %n.vec = and i64 %smax, 9223372036854775744
  %cmp.zero = icmp ne i64 %n.vec, 0
  %ident.check = icmp eq i32 %6, 1
  %or.cond = and i1 %cmp.zero, %ident.check
  br i1 %or.cond, label %vector.body.preheader, label %.lr.ph.split.preheader12

vector.body.preheader:                            ; preds = %min.iters.checked
  br i1 false, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  br i1 true, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %vector.body.preheader
  br i1 false, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ 0, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %43 = mul nsw i64 %index, %40
  %44 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 %43
  %45 = bitcast i16* %44 to <8 x i16>*
  %wide.load = load <8 x i16>, <8 x i16>* %45, align 16
  %46 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 0, i64 %index
  %47 = bitcast i16* %46 to <8 x i16>*
  store <8 x i16> %wide.load, <8 x i16>* %47, align 2
  %48 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 1, i64 %index
  %49 = bitcast i16* %48 to <8 x i16>*
  store <8 x i16> zeroinitializer, <8 x i16>* %49, align 2
  %index.next = or i64 %index, 8
  %50 = mul nsw i64 %index.next, %40
  %51 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 %50
  %52 = bitcast i16* %51 to <8 x i16>*
  %wide.load.1 = load <8 x i16>, <8 x i16>* %52, align 16
  %53 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 0, i64 %index.next
  %54 = bitcast i16* %53 to <8 x i16>*
  store <8 x i16> %wide.load.1, <8 x i16>* %54, align 2
  %55 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 1, i64 %index.next
  %56 = bitcast i16* %55 to <8 x i16>*
  store <8 x i16> zeroinitializer, <8 x i16>* %56, align 2
  %index.next.1 = or i64 %index, 16
  %57 = mul nsw i64 %index.next.1, %40
  %58 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 %57
  %59 = bitcast i16* %58 to <8 x i16>*
  %wide.load.2 = load <8 x i16>, <8 x i16>* %59, align 16
  %60 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 0, i64 %index.next.1
  %61 = bitcast i16* %60 to <8 x i16>*
  store <8 x i16> %wide.load.2, <8 x i16>* %61, align 2
  %62 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 1, i64 %index.next.1
  %63 = bitcast i16* %62 to <8 x i16>*
  store <8 x i16> zeroinitializer, <8 x i16>* %63, align 2
  %index.next.2 = or i64 %index, 24
  %64 = mul nsw i64 %index.next.2, %40
  %65 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 %64
  %66 = bitcast i16* %65 to <8 x i16>*
  %wide.load.3 = load <8 x i16>, <8 x i16>* %66, align 16
  %67 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 0, i64 %index.next.2
  %68 = bitcast i16* %67 to <8 x i16>*
  store <8 x i16> %wide.load.3, <8 x i16>* %68, align 2
  %69 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 1, i64 %index.next.2
  %70 = bitcast i16* %69 to <8 x i16>*
  store <8 x i16> zeroinitializer, <8 x i16>* %70, align 2
  %index.next.3 = add i64 %index, 32
  %71 = icmp eq i64 %index.next.3, %n.vec
  br i1 %71, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %.loopexit, label %.lr.ph.split.preheader12

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %.lr.ph.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph.split.us ], [ 0, %.lr.ph.split.us.preheader ]
  %72 = mul nsw i64 %indvars.iv, %40
  %73 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 %72
  %74 = load i16, i16* %73, align 2
  %75 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 0, i64 %indvars.iv
  store i16 %74, i16* %75, align 2
  %indvars.iv.tr = trunc i64 %indvars.iv to i32
  %76 = shl i32 %indvars.iv.tr, 1
  %77 = or i32 %76, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 %78
  %80 = load i16, i16* %79, align 2
  %81 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 1, i64 %indvars.iv
  store i16 %80, i16* %81, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = icmp slt i64 %indvars.iv.next, %41
  br i1 %82, label %.lr.ph.split.us, label %.loopexit.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader12, %.lr.ph.split
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %.lr.ph.split ], [ %indvars.iv7.ph, %.lr.ph.split.preheader12 ]
  %83 = mul nsw i64 %indvars.iv7, %40
  %84 = getelementptr inbounds [2304 x i16], [2304 x i16]* %4, i64 0, i64 %83
  %85 = load i16, i16* %84, align 2
  %86 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 0, i64 %indvars.iv7
  store i16 %85, i16* %86, align 2
  %87 = getelementptr inbounds [1152 x i16], [1152 x i16]* %1, i64 1, i64 %indvars.iv7
  store i16 0, i16* %87, align 2
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %88 = icmp slt i64 %indvars.iv.next8, %41
  br i1 %88, label %.lr.ph.split, label %.loopexit.loopexit13, !llvm.loop !6

.loopexit.loopexit:                               ; preds = %.lr.ph.split.us
  br label %.loopexit

.loopexit.loopexit13:                             ; preds = %.lr.ph.split
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit13, %.loopexit.loopexit, %middle.block, %32, %29
  %.01 = phi i32 [ %31, %29 ], [ %37, %32 ], [ %37, %middle.block ], [ %37, %.loopexit.loopexit ], [ %37, %.loopexit.loopexit13 ]
  %89 = load i64, i64* @num_samples, align 8
  %90 = icmp eq i64 %89, 4294967295
  br i1 %90, label %95, label %91

; <label>:91:                                     ; preds = %.loopexit
  %92 = sext i32 %.01 to i64
  %93 = load i64, i64* @get_audio.num_samples_read, align 8
  %94 = add i64 %93, %92
  store i64 %94, i64* @get_audio.num_samples_read, align 8
  br label %95

; <label>:95:                                     ; preds = %.loopexit, %91
  ret i32 %.01
}

; Function Attrs: noinline nounwind uwtable
define i32 @read_samples_mp3(%struct.lame_global_flags* nocapture readnone, %struct._IO_FILE*, [1152 x i16]*, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 0
  %6 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 0
  %7 = tail call i32 @lame_decode_fromfile(%struct._IO_FILE* %1, i16* %5, i16* %6) #7
  %cond = icmp eq i32 %7, -1
  br i1 %cond, label %.preheader.preheader, label %25

.preheader.preheader:                             ; preds = %4
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.preheader ], [ 0, %.preheader.preheader ]
  %8 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv
  store i16 0, i16* %8, align 2
  %9 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv
  store i16 0, i16* %9, align 2
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv.next
  store i16 0, i16* %10, align 2
  %11 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv.next
  store i16 0, i16* %11, align 2
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv.next.1
  store i16 0, i16* %12, align 2
  %13 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv.next.1
  store i16 0, i16* %13, align 2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %14 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv.next.2
  store i16 0, i16* %14, align 2
  %15 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv.next.2
  store i16 0, i16* %15, align 2
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %16 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv.next.3
  store i16 0, i16* %16, align 2
  %17 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv.next.3
  store i16 0, i16* %17, align 2
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %18 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv.next.4
  store i16 0, i16* %18, align 2
  %19 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv.next.4
  store i16 0, i16* %19, align 2
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %20 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv.next.5
  store i16 0, i16* %20, align 2
  %21 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv.next.5
  store i16 0, i16* %21, align 2
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %22 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 0, i64 %indvars.iv.next.6
  store i16 0, i16* %22, align 2
  %23 = getelementptr inbounds [1152 x i16], [1152 x i16]* %2, i64 1, i64 %indvars.iv.next.6
  store i16 0, i16* %23, align 2
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1152
  br i1 %exitcond.7, label %24, label %.preheader

; <label>:24:                                     ; preds = %.preheader
  br i1 %cond, label %26, label %25

; <label>:25:                                     ; preds = %4, %24
  br label %26

; <label>:26:                                     ; preds = %24, %25
  %.0 = phi i32 [ %7, %25 ], [ 0, %24 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @read_samples_pcm(%struct.lame_global_flags* nocapture readonly, i16*, i32, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 1
  %8 = bitcast i16* %1 to i8*
  %9 = sext i32 %3 to i64
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %11 = tail call i64 @fread(i8* %8, i64 2, i64 %9, %struct._IO_FILE* %10)
  %12 = trunc i64 %11 to i32
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %14 = tail call i32 @ferror(%struct._IO_FILE* %13) #7
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %19, label %16

; <label>:16:                                     ; preds = %4
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.8, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %17) #9
  tail call void @exit(i32 2) #10
  unreachable

; <label>:19:                                     ; preds = %4
  %20 = load i32, i32* @NativeByteOrder, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %28

; <label>:22:                                     ; preds = %19
  %23 = tail call i32 @DetermineByteOrder() #7
  store i32 %23, i32* @NativeByteOrder, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25:                                     ; preds = %22
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %26) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:28:                                     ; preds = %22, %19
  %.not = xor i1 %7, true
  %29 = load i32, i32* @NativeByteOrder, align 4
  %30 = icmp eq i32 %29, 2
  %or.cond = and i1 %30, %.not
  br i1 %or.cond, label %31, label %32

; <label>:31:                                     ; preds = %28
  tail call void @SwapBytesInWords(i16* %1, i32 %12) #7
  br label %32

; <label>:32:                                     ; preds = %28, %31
  %33 = load i32, i32* @NativeByteOrder, align 4
  %34 = icmp eq i32 %33, 1
  %or.cond3 = and i1 %7, %34
  br i1 %or.cond3, label %35, label %36

; <label>:35:                                     ; preds = %32
  tail call void @SwapBytesInWords(i16* %1, i32 %12) #7
  br label %36

; <label>:36:                                     ; preds = %35, %32
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 30
  %38 = load i32, i32* %37, align 4
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %36
  tail call void @SwapBytesInWords(i16* %1, i32 %12) #7
  br label %41

; <label>:41:                                     ; preds = %40, %36
  %42 = icmp slt i32 %12, %2
  br i1 %42, label %43, label %.loopexit

; <label>:43:                                     ; preds = %41
  %44 = icmp sgt i32 %12, 0
  %. = select i1 %44, i32 %12, i32 0
  %45 = icmp slt i32 %., %2
  br i1 %45, label %.loopexit.loopexit, label %.loopexit

.loopexit.loopexit:                               ; preds = %43
  %46 = zext i32 %. to i64
  %scevgep = getelementptr i16, i16* %1, i64 %46
  %scevgep5 = bitcast i16* %scevgep to i8*
  %47 = add i32 %2, -1
  %48 = sub i32 %47, %.
  %49 = zext i32 %48 to i64
  %50 = shl nuw nsw i64 %49, 1
  %51 = add nuw nsw i64 %50, 2
  call void @llvm.memset.p0i8.i64(i8* %scevgep5, i8 0, i64 %51, i32 2, i1 false)
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %43, %41
  ret i32 %12
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @GetSndBitrate() local_unnamed_addr #1 {
  %1 = load i32, i32* @input_bitrate, align 4
  ret i32 %1
}

declare i32 @lame_decode_fromfile(%struct._IO_FILE*, i16*, i16*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @fskip(%struct._IO_FILE* nocapture, i64, i32) local_unnamed_addr #0 {
  %4 = alloca [1024 x i8], align 16
  %5 = icmp sgt i64 %1, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %6 = getelementptr inbounds [1024 x i8], [1024 x i8]* %4, i64 0, i64 0
  br label %7

; <label>:7:                                      ; preds = %.lr.ph, %7
  %.01 = phi i64 [ %1, %.lr.ph ], [ %11, %7 ]
  %8 = icmp slt i64 %.01, 1024
  %..0 = select i1 %8, i64 %.01, i64 1024
  %sext = shl i64 %..0, 32
  %9 = ashr exact i64 %sext, 32
  %10 = call i64 @fread(i8* nonnull %6, i64 1, i64 %9, %struct._IO_FILE* %0)
  %11 = sub i64 %.01, %10
  %12 = icmp sgt i64 %11, 0
  br i1 %12, label %7, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %.0.lcssa = phi i64 [ %1, %3 ], [ %11, %._crit_edge.loopexit ]
  %13 = trunc i64 %.0.lcssa to i32
  ret i32 %13
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

declare i32 @lame_decode_initfile(%struct._IO_FILE*, i32*, i32*, i32*, i64*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @parse_file_header(%struct.lame_global_flags* nocapture, %struct._IO_FILE*) local_unnamed_addr #0 {
  %3 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %1) #7
  store i1 false, i1* @count_samples_carefully, align 4
  %4 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  store i32 4, i32* %4, align 8
  switch i32 %3, label %.thread [
    i32 1380533830, label %5
    i32 1179603533, label %9
  ]

; <label>:5:                                      ; preds = %2
  %6 = tail call fastcc i32 @parse_wave_header(%struct._IO_FILE* %1)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %13, label %8

; <label>:8:                                      ; preds = %5
  store i32 1, i32* %4, align 8
  store i1 true, i1* @count_samples_carefully, align 4
  br label %13

; <label>:9:                                      ; preds = %2
  %10 = tail call fastcc i32 @parse_aiff_header(%struct._IO_FILE* %1)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12:                                     ; preds = %9
  store i32 2, i32* %4, align 8
  store i1 true, i1* @count_samples_carefully, align 4
  br label %13

; <label>:13:                                     ; preds = %9, %12, %8, %5
  %.pr = load i32, i32* %4, align 8
  %14 = icmp eq i32 %.pr, 4
  br i1 %14, label %.thread, label %16

.thread:                                          ; preds = %2, %13
  %15 = tail call i32 @fseek(%struct._IO_FILE* %1, i64 0, i32 0)
  store i32 4, i32* %4, align 8
  br label %16

; <label>:16:                                     ; preds = %.thread, %13
  ret void
}

; Function Attrs: nounwind
declare i32 @stat(i8* nocapture readonly, %struct.stat* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @ferror(%struct._IO_FILE* nocapture) local_unnamed_addr #5

declare i32 @DetermineByteOrder() local_unnamed_addr #2

declare void @SwapBytesInWords(i16*, i32) local_unnamed_addr #2

declare i32 @Read32BitsHighLow(%struct._IO_FILE*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @parse_wave_header(%struct._IO_FILE*) unnamed_addr #0 {
  %2 = alloca %struct.fmt_chunk_data_struct, align 8
  %3 = bitcast %struct.fmt_chunk_data_struct* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %3, i8 0, i64 32, i32 8, i1 false)
  %4 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %5 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %6 = icmp eq i32 %5, 1463899717
  br i1 %6, label %.preheader, label %.thread

.preheader:                                       ; preds = %1
  %7 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 0
  %8 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 1
  %9 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 2
  %10 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 3
  %11 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 4
  %12 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 5
  %.promoted = load i16, i16* %7, align 8
  %.promoted5 = load i16, i16* %8, align 2
  %.promoted7 = load i64, i64* %9, align 8
  %.promoted9 = load i64, i64* %10, align 8
  %.promoted11 = load i16, i16* %11, align 8
  %.promoted13 = load i16, i16* %12, align 2
  br label %13

; <label>:13:                                     ; preds = %.preheader, %48
  %14 = phi i16 [ %.promoted13, %.preheader ], [ %49, %48 ]
  %15 = phi i16 [ %.promoted11, %.preheader ], [ %50, %48 ]
  %16 = phi i64 [ %.promoted9, %.preheader ], [ %51, %48 ]
  %17 = phi i64 [ %.promoted7, %.preheader ], [ %52, %48 ]
  %18 = phi i16 [ %.promoted5, %.preheader ], [ %53, %48 ]
  %19 = phi i16 [ %.promoted, %.preheader ], [ %54, %48 ]
  %.014 = phi i32 [ 0, %.preheader ], [ %55, %48 ]
  %20 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  switch i32 %20, label %43 [
    i32 1718449184, label %21
    i32 1684108385, label %57
  ]

; <label>:21:                                     ; preds = %13
  %22 = tail call i32 @Read32Bits(%struct._IO_FILE* %0) #7
  %23 = icmp slt i32 %22, 16
  br i1 %23, label %.thread.loopexit, label %24

; <label>:24:                                     ; preds = %21
  %25 = tail call i32 @Read16BitsLowHigh(%struct._IO_FILE* %0) #7
  %26 = trunc i32 %25 to i16
  %27 = tail call i32 @Read16BitsLowHigh(%struct._IO_FILE* %0) #7
  %28 = trunc i32 %27 to i16
  %29 = tail call i32 @Read32Bits(%struct._IO_FILE* %0) #7
  %30 = sext i32 %29 to i64
  %31 = tail call i32 @Read32Bits(%struct._IO_FILE* %0) #7
  %32 = sext i32 %31 to i64
  %33 = tail call i32 @Read16BitsLowHigh(%struct._IO_FILE* %0) #7
  %34 = trunc i32 %33 to i16
  %35 = tail call i32 @Read16BitsLowHigh(%struct._IO_FILE* %0) #7
  %36 = trunc i32 %35 to i16
  %37 = icmp eq i32 %22, 16
  br i1 %37, label %48, label %38

; <label>:38:                                     ; preds = %24
  %39 = sext i32 %22 to i64
  %40 = add nsw i64 %39, -16
  %41 = tail call i32 @fskip(%struct._IO_FILE* %0, i64 %40, i32 undef)
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %48, label %.thread.loopexit

; <label>:43:                                     ; preds = %13
  %44 = tail call i32 @Read32Bits(%struct._IO_FILE* %0) #7
  %45 = sext i32 %44 to i64
  %46 = tail call i32 @fskip(%struct._IO_FILE* %0, i64 %45, i32 undef)
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %.thread.loopexit

; <label>:48:                                     ; preds = %38, %24, %43
  %49 = phi i16 [ %36, %38 ], [ %36, %24 ], [ %14, %43 ]
  %50 = phi i16 [ %34, %38 ], [ %34, %24 ], [ %15, %43 ]
  %51 = phi i64 [ %32, %38 ], [ %32, %24 ], [ %16, %43 ]
  %52 = phi i64 [ %30, %38 ], [ %30, %24 ], [ %17, %43 ]
  %53 = phi i16 [ %28, %38 ], [ %28, %24 ], [ %18, %43 ]
  %54 = phi i16 [ %26, %38 ], [ %26, %24 ], [ %19, %43 ]
  %55 = add nuw nsw i32 %.014, 1
  %56 = icmp slt i32 %55, 20
  br i1 %56, label %13, label %.thread.loopexit

; <label>:57:                                     ; preds = %13
  store i16 %19, i16* %7, align 8
  store i16 %18, i16* %8, align 2
  store i64 %17, i64* %9, align 8
  store i64 %16, i64* %10, align 8
  store i16 %15, i16* %11, align 8
  store i16 %14, i16* %12, align 2
  %58 = tail call i32 @Read32Bits(%struct._IO_FILE* %0) #7
  %59 = sext i32 %58 to i64
  call fastcc void @wave_check(%struct.fmt_chunk_data_struct* nonnull %2)
  %60 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 1
  %61 = load i16, i16* %60, align 2
  %62 = zext i16 %61 to i32
  store i32 %62, i32* @num_channels, align 4
  %63 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 2
  %64 = load i64, i64* %63, align 8
  %65 = trunc i64 %64 to i32
  store i32 %65, i32* @samp_freq, align 4
  %66 = load i16, i16* %60, align 2
  %67 = zext i16 %66 to i64
  %68 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %2, i64 0, i32 5
  %69 = load i16, i16* %68, align 2
  %70 = zext i16 %69 to i64
  %71 = mul nuw nsw i64 %70, %67
  %72 = lshr i64 %71, 3
  %73 = sdiv i64 %59, %72
  store i64 %73, i64* @num_samples, align 8
  br label %.thread

.thread.loopexit:                                 ; preds = %21, %38, %43, %48
  %74 = phi i16 [ %14, %21 ], [ %36, %38 ], [ %14, %43 ], [ %49, %48 ]
  %75 = phi i16 [ %15, %21 ], [ %34, %38 ], [ %15, %43 ], [ %50, %48 ]
  %76 = phi i64 [ %16, %21 ], [ %32, %38 ], [ %16, %43 ], [ %51, %48 ]
  %77 = phi i64 [ %17, %21 ], [ %30, %38 ], [ %17, %43 ], [ %52, %48 ]
  %78 = phi i16 [ %18, %21 ], [ %28, %38 ], [ %18, %43 ], [ %53, %48 ]
  %79 = phi i16 [ %19, %21 ], [ %26, %38 ], [ %19, %43 ], [ %54, %48 ]
  store i16 %79, i16* %7, align 8
  store i16 %78, i16* %8, align 2
  store i64 %77, i64* %9, align 8
  store i64 %76, i64* %10, align 8
  store i16 %75, i16* %11, align 8
  store i16 %74, i16* %12, align 2
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %57, %1
  %.0 = phi i32 [ 0, %1 ], [ 1, %57 ], [ 0, %.thread.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @parse_aiff_header(%struct._IO_FILE*) unnamed_addr #0 {
  %2 = alloca %struct.IFF_AIFF_struct, align 8
  %3 = bitcast %struct.IFF_AIFF_struct* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %3, i8 0, i64 48, i32 8, i1 false)
  %4 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %5 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %6 = icmp eq i32 %5, 1095321158
  %7 = icmp sgt i32 %4, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.lr.ph, label %.thread

.lr.ph:                                           ; preds = %1
  %8 = sext i32 %4 to i64
  %9 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 0
  %10 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 1
  %11 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 2
  %12 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 3
  %.promoted = load i16, i16* %9, align 8
  %.promoted9 = load i64, i64* %10, align 8
  %.promoted14 = load i16, i16* %11, align 8
  %.promoted19 = load float, float* %12, align 4
  br label %13

; <label>:13:                                     ; preds = %.lr.ph, %49
  %14 = phi float [ %.promoted19, %.lr.ph ], [ %50, %49 ]
  %15 = phi i16 [ %.promoted14, %.lr.ph ], [ %51, %49 ]
  %16 = phi i64 [ %.promoted9, %.lr.ph ], [ %52, %49 ]
  %17 = phi i16 [ %.promoted, %.lr.ph ], [ %53, %49 ]
  %.023 = phi i64 [ %8, %.lr.ph ], [ %.1, %49 ]
  %18 = add nsw i64 %.023, -4
  %19 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  switch i32 %19, label %44 [
    i32 1129270605, label %20
    i32 1397968452, label %34
  ]

; <label>:20:                                     ; preds = %13
  %21 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %22 = sext i32 %21 to i64
  %23 = tail call i32 @Read16BitsHighLow(%struct._IO_FILE* %0) #7
  %24 = trunc i32 %23 to i16
  %25 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %26 = sext i32 %25 to i64
  %27 = tail call i32 @Read16BitsHighLow(%struct._IO_FILE* %0) #7
  %28 = trunc i32 %27 to i16
  %29 = tail call double @ReadIeeeExtendedHighLow(%struct._IO_FILE* %0) #7
  %30 = fptrunc double %29 to float
  %31 = add nsw i64 %22, -18
  %32 = tail call i32 @fskip(%struct._IO_FILE* %0, i64 %31, i32 undef)
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %49, label %.thread.loopexit.sink.split

; <label>:34:                                     ; preds = %13
  store i16 %17, i16* %9, align 8
  store i64 %16, i64* %10, align 8
  store i16 %15, i16* %11, align 8
  store float %14, float* %12, align 4
  %35 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %36 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 5, i32 0
  store i64 %37, i64* %38, align 8
  %39 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 5, i32 1
  store i64 %40, i64* %41, align 8
  %42 = tail call i32 @fskip(%struct._IO_FILE* %0, i64 %37, i32 undef)
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %55, label %.thread

; <label>:44:                                     ; preds = %13
  %45 = tail call i32 @Read32BitsHighLow(%struct._IO_FILE* %0) #7
  %46 = sext i32 %45 to i64
  %47 = tail call i32 @fskip(%struct._IO_FILE* %0, i64 %46, i32 undef)
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %.thread.loopexit.sink.split

; <label>:49:                                     ; preds = %44, %20
  %50 = phi float [ %30, %20 ], [ %14, %44 ]
  %51 = phi i16 [ %28, %20 ], [ %15, %44 ]
  %52 = phi i64 [ %26, %20 ], [ %16, %44 ]
  %53 = phi i16 [ %24, %20 ], [ %17, %44 ]
  %.pn = phi i64 [ %22, %20 ], [ %46, %44 ]
  %.1 = sub i64 %18, %.pn
  %54 = icmp sgt i64 %.1, 0
  br i1 %54, label %13, label %.thread.loopexit.sink.split

; <label>:55:                                     ; preds = %34
  %56 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 4
  store i64 1397968452, i64* %56, align 8
  call fastcc void @aiff_check2(%struct.IFF_AIFF_struct* nonnull %2)
  %57 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 0
  %58 = load i16, i16* %57, align 8
  %59 = sext i16 %58 to i32
  store i32 %59, i32* @num_channels, align 4
  %60 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 3
  %61 = load float, float* %60, align 4
  %62 = fptosi float %61 to i32
  store i32 %62, i32* @samp_freq, align 4
  %63 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %2, i64 0, i32 1
  %64 = load i64, i64* %63, align 8
  store i64 %64, i64* @num_samples, align 8
  br label %.thread

.thread.loopexit.sink.split:                      ; preds = %20, %49, %44
  %.lcssa8.sink = phi i16 [ %17, %44 ], [ %53, %49 ], [ %24, %20 ]
  %.lcssa13.sink = phi i64 [ %16, %44 ], [ %52, %49 ], [ %26, %20 ]
  %.lcssa18.sink = phi i16 [ %15, %44 ], [ %51, %49 ], [ %28, %20 ]
  %.lcssa23.sink = phi float [ %14, %44 ], [ %50, %49 ], [ %30, %20 ]
  store i16 %.lcssa8.sink, i16* %9, align 8
  store i64 %.lcssa13.sink, i64* %10, align 8
  store i16 %.lcssa18.sink, i16* %11, align 8
  store float %.lcssa23.sink, float* %12, align 4
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit.sink.split, %55, %34, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %34 ], [ 1, %55 ], [ 0, %.thread.loopexit.sink.split ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fseek(%struct._IO_FILE* nocapture, i64, i32) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #6

declare i32 @Read32Bits(%struct._IO_FILE*) local_unnamed_addr #2

declare i32 @Read16BitsLowHigh(%struct._IO_FILE*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @wave_check(%struct.fmt_chunk_data_struct* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %0, i64 0, i32 5
  %3 = load i16, i16* %2, align 2
  %4 = icmp eq i16 %3, 16
  br i1 %4, label %9, label %5

; <label>:5:                                      ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = zext i16 %3 to i32
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.11, i64 0, i64 0), i32 %7) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:9:                                      ; preds = %1
  ret void
}

declare i32 @Read16BitsHighLow(%struct._IO_FILE*) local_unnamed_addr #2

declare double @ReadIeeeExtendedHighLow(%struct._IO_FILE*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @aiff_check2(%struct.IFF_AIFF_struct* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %0, i64 0, i32 4
  %3 = load i64, i64* %2, align 8
  %4 = icmp eq i64 %3, 1397968452
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %0, i64 0, i32 2
  %10 = load i16, i16* %9, align 8
  %11 = icmp eq i16 %10, 16
  br i1 %11, label %15, label %12

; <label>:12:                                     ; preds = %8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i64 0, i64 0), i32 16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:15:                                     ; preds = %8
  %16 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %0, i64 0, i32 0
  %17 = load i16, i16* %16, align 8
  %.off = add i16 %17, -1
  %switch = icmp ult i16 %.off, 2
  br i1 %switch, label %21, label %18

; <label>:18:                                     ; preds = %15
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:21:                                     ; preds = %15
  %22 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %0, i64 0, i32 5, i32 1
  %23 = load i64, i64* %22, align 8
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %28, label %25

; <label>:25:                                     ; preds = %21
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.15, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:28:                                     ; preds = %21
  %29 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %0, i64 0, i32 5, i32 0
  %30 = load i64, i64* %29, align 8
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %35, label %32

; <label>:32:                                     ; preds = %28
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.16, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)) #9
  tail call void @exit(i32 1) #10
  unreachable

; <label>:35:                                     ; preds = %28
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #7

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !4, !5}
