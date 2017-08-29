; ModuleID = 'tif_unix.ll'
source_filename = "tif_unix.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@TIFFOpen.module = internal constant [9 x i8] c"TIFFOpen\00", align 1
@.str = private unnamed_addr constant [16 x i8] c"%s: Cannot open\00", align 1
@_TIFFwarningHandler = local_unnamed_addr global void (i8*, i8*, %struct.__va_list_tag*)* @unixWarningHandler, align 8
@_TIFFerrorHandler = local_unnamed_addr global void (i8*, i8*, %struct.__va_list_tag*)* @unixErrorHandler, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Warning, \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c".\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define %struct.tiff* @TIFFFdOpen(i32, i8*, i8*) local_unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = inttoptr i64 %4 to i8*
  %6 = tail call %struct.tiff* @TIFFClientOpen(i8* %1, i8* %2, i8* %5, i32 (i8*, i8*, i32)* nonnull @_tiffReadProc, i32 (i8*, i8*, i32)* nonnull @_tiffWriteProc, i32 (i8*, i32, i32)* nonnull @_tiffSeekProc, i32 (i8*)* nonnull @_tiffCloseProc, i32 (i8*)* nonnull @_tiffSizeProc, i32 (i8*, i8**, i32*)* nonnull @_tiffMapProc, void (i8*, i8*, i32)* nonnull @_tiffUnmapProc) #7
  %7 = icmp eq %struct.tiff* %6, null
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i64 0, i32 1
  store i32 %0, i32* %9, align 8
  br label %10

; <label>:10:                                     ; preds = %3, %8
  ret %struct.tiff* %6
}

declare %struct.tiff* @TIFFClientOpen(i8*, i8*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @_tiffReadProc(i8*, i8* nocapture, i32) #0 {
  %4 = ptrtoint i8* %0 to i64
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %2 to i64
  %7 = tail call i64 @read(i32 %5, i8* %1, i64 %6) #7
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_tiffWriteProc(i8*, i8* nocapture readonly, i32) #0 {
  %4 = ptrtoint i8* %0 to i64
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %2 to i64
  %7 = tail call i64 @write(i32 %5, i8* %1, i64 %6) #7
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_tiffSeekProc(i8*, i32, i32) #0 {
  %4 = ptrtoint i8* %0 to i64
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %1 to i64
  %7 = tail call i64 @lseek(i32 %5, i64 %6, i32 %2) #7
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_tiffCloseProc(i8*) #0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = trunc i64 %2 to i32
  %4 = tail call i32 @close(i32 %3) #7
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_tiffSizeProc(i8*) #0 {
  %2 = alloca %struct.stat, align 8
  %3 = ptrtoint i8* %0 to i64
  %4 = trunc i64 %3 to i32
  %5 = call i32 @fstat(i32 %4, %struct.stat* nonnull %2) #7
  %6 = icmp slt i32 %5, 0
  %7 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 8
  %8 = load i64, i64* %7, align 8
  %phitmp = trunc i64 %8 to i32
  %9 = select i1 %6, i32 0, i32 %phitmp
  ret i32 %9
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @_tiffMapProc(i8* nocapture readnone, i8** nocapture readnone, i32* nocapture readnone) #2 {
  ret i32 0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @_tiffUnmapProc(i8* nocapture, i8* nocapture, i32) #2 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define %struct.tiff* @TIFFOpen(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i32 @_TIFFgetMode(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @TIFFOpen.module, i64 0, i64 0)) #7
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %11, label %5

; <label>:5:                                      ; preds = %2
  %6 = tail call i32 (i8*, i32, ...) @open(i8* %0, i32 %3, i32 438) #7
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %5
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @TIFFOpen.module, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i8* %0) #7
  br label %11

; <label>:9:                                      ; preds = %5
  %10 = tail call %struct.tiff* @TIFFFdOpen(i32 %6, i8* %0, i8* %1)
  br label %11

; <label>:11:                                     ; preds = %2, %9, %8
  %.0 = phi %struct.tiff* [ null, %8 ], [ %10, %9 ], [ null, %2 ]
  ret %struct.tiff* %.0
}

declare i32 @_TIFFgetMode(i8*, i8*) local_unnamed_addr #1

declare i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #1

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define noalias i8* @_TIFFmalloc(i32) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = tail call noalias i8* @malloc(i64 %2) #7
  ret i8* %3
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define void @_TIFFfree(i8* nocapture) local_unnamed_addr #0 {
  tail call void @free(i8* %0) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define noalias i8* @_TIFFrealloc(i8* nocapture, i32) local_unnamed_addr #0 {
  %3 = sext i32 %1 to i64
  %4 = tail call i8* @realloc(i8* %0, i64 %3) #7
  ret i8* %4
}

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define void @_TIFFmemset(i8* nocapture, i32, i32) local_unnamed_addr #0 {
  %4 = trunc i32 %1 to i8
  %5 = sext i32 %2 to i64
  tail call void @llvm.memset.p0i8.i64(i8* %0, i8 %4, i64 %5, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: noinline nounwind uwtable
define void @_TIFFmemcpy(i8* nocapture, i8* nocapture readonly, i32) local_unnamed_addr #0 {
  %4 = sext i32 %2 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 %4, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: noinline nounwind readonly uwtable
define i32 @_TIFFmemcmp(i8* nocapture readonly, i8* nocapture readonly, i32) local_unnamed_addr #5 {
  %4 = sext i32 %2 to i64
  %5 = tail call i32 @memcmp(i8* %0, i8* %1, i64 %4) #8
  ret i32 %5
}

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #6

; Function Attrs: noinline nounwind uwtable
define internal void @unixWarningHandler(i8*, i8* nocapture readonly, %struct.__va_list_tag*) #0 {
  %4 = icmp eq i8* %0, null
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %3
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* nonnull %0) #9
  br label %8

; <label>:8:                                      ; preds = %3, %5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i64 9, i64 1, %struct._IO_FILE* %9) #9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i32 @vfprintf(%struct._IO_FILE* %11, i8* %1, %struct.__va_list_tag* %2) #9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i64 2, i64 1, %struct._IO_FILE* %13) #9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @unixErrorHandler(i8*, i8* nocapture readonly, %struct.__va_list_tag*) #0 {
  %4 = icmp eq i8* %0, null
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %3
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* nonnull %0) #9
  br label %8

; <label>:8:                                      ; preds = %3, %5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i32 @vfprintf(%struct._IO_FILE* %9, i8* %1, %struct.__va_list_tag* %2) #9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i64 2, i64 1, %struct._IO_FILE* %11) #9
  ret void
}

declare i64 @read(i32, i8* nocapture, i64) local_unnamed_addr #1

declare i64 @write(i32, i8* nocapture readonly, i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) local_unnamed_addr #3

declare i32 @close(i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fstat(i32, %struct.stat* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @vfprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, %struct.__va_list_tag*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noinline nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
