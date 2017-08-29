; ModuleID = 'bf.ll'
source_filename = "bf.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [45 x i8] c"Usage: blowfish {e|d} <intput> <output> key\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"key must be in hexadecimal notation\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Bad key value.\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Bad key value.\00"
@str.1 = private unnamed_addr constant [36 x i8] c"key must be in hexadecimal notation\00"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca %struct.bf_key_st, align 8
  %4 = alloca [32 x i8], align 16
  %5 = alloca [40 x i8], align 16
  %6 = alloca [40 x i8], align 16
  %7 = alloca [32 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca [32 x i8], align 16
  %11 = getelementptr inbounds [32 x i8], [32 x i8]* %7, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull %11, i8 0, i64 32, i32 16, i1 false)
  store i32 0, i32* %8, align 4
  %12 = icmp slt i32 %0, 3
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %2
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %14) #7
  tail call void @exit(i32 1) #8
  unreachable

; <label>:16:                                     ; preds = %2
  %17 = getelementptr inbounds i8*, i8** %1, i64 1
  %18 = load i8*, i8** %17, align 8
  %19 = load i8, i8* %18, align 1
  switch i8 %19, label %20 [
    i8 101, label %23
    i8 69, label %23
    i8 100, label %.fold.split
    i8 68, label %.fold.split20
  ]

; <label>:20:                                     ; preds = %16
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %21) #7
  tail call void @exit(i32 1) #8
  unreachable

.fold.split:                                      ; preds = %16
  br label %23

.fold.split20:                                    ; preds = %16
  br label %23

; <label>:23:                                     ; preds = %16, %16, %.fold.split20, %.fold.split
  %.06 = phi i32 [ 1, %16 ], [ 1, %16 ], [ 0, %.fold.split ], [ 0, %.fold.split20 ]
  %24 = getelementptr inbounds i8*, i8** %1, i64 4
  %25 = load i8*, i8** %24, align 8
  br label %26

; <label>:26:                                     ; preds = %23, %.backedge
  %.0335 = phi i32 [ 0, %23 ], [ %42, %.backedge ]
  %.0434 = phi i32 [ 0, %23 ], [ %43, %.backedge ]
  %.0733 = phi i8* [ %25, %23 ], [ %30, %.backedge ]
  %27 = load i8, i8* %.0733, align 1
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %.critedge, label %29

; <label>:29:                                     ; preds = %26
  %30 = getelementptr inbounds i8, i8* %.0733, i64 1
  %31 = sext i8 %27 to i32
  %32 = tail call i32 @toupper(i32 %31) #9
  %33 = trunc i32 %32 to i8
  %.off = add i8 %33, -48
  %34 = icmp ult i8 %.off, 10
  br i1 %34, label %38, label %35

; <label>:35:                                     ; preds = %29
  %.off21 = add i8 %33, -65
  %36 = icmp ult i8 %.off21, 6
  br i1 %36, label %38, label %37

; <label>:37:                                     ; preds = %35
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @str.1, i64 0, i64 0))
  tail call void @exit(i32 1) #8
  unreachable

; <label>:38:                                     ; preds = %29, %35
  %.sink15 = phi i32 [ -55, %35 ], [ -48, %29 ]
  %39 = shl i32 %.0335, 4
  %sext11 = shl i32 %32, 24
  %40 = ashr exact i32 %sext11, 24
  %41 = add nsw i32 %40, %39
  %42 = add nsw i32 %41, %.sink15
  %43 = add nuw nsw i32 %.0434, 1
  %44 = and i32 %.0434, 1
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %.backedge, label %47

.backedge:                                        ; preds = %38, %47
  %46 = icmp slt i32 %43, 64
  br i1 %46, label %26, label %.critedge

; <label>:47:                                     ; preds = %38
  %48 = trunc i32 %42 to i8
  %49 = sdiv i32 %43, 2
  %50 = add nsw i32 %49, -1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [32 x i8], [32 x i8]* %4, i64 0, i64 %51
  store i8 %48, i8* %52, align 1
  br label %.backedge

.critedge:                                        ; preds = %26, %.backedge
  %.07.lcssa = phi i8* [ %.0733, %26 ], [ %30, %.backedge ]
  %53 = getelementptr inbounds [32 x i8], [32 x i8]* %4, i64 0, i64 0
  call void @BF_set_key(%struct.bf_key_st* nonnull %3, i32 8, i8* nonnull %53) #6
  %54 = load i8, i8* %.07.lcssa, align 1
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %57, label %56

; <label>:56:                                     ; preds = %.critedge
  %puts = call i32 @puts(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str, i64 0, i64 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:57:                                     ; preds = %.critedge
  %58 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0))
  %59 = icmp eq %struct._IO_FILE* %58, null
  br i1 %59, label %60, label %63

; <label>:60:                                     ; preds = %57
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %62 = call i64 @fwrite(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %61) #7
  br label %112

; <label>:63:                                     ; preds = %57
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* nonnull %58, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i64* nonnull %9) #6
  %65 = call i32 @fclose(%struct._IO_FILE* nonnull %58)
  %66 = getelementptr inbounds i8*, i8** %1, i64 2
  %67 = load i8*, i8** %66, align 8
  %68 = call %struct._IO_FILE* @fopen(i8* %67, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  %69 = icmp eq %struct._IO_FILE* %68, null
  br i1 %69, label %70, label %73

; <label>:70:                                     ; preds = %63
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %71) #7
  call void @exit(i32 1) #8
  unreachable

; <label>:73:                                     ; preds = %63
  %74 = getelementptr inbounds i8*, i8** %1, i64 3
  %75 = load i8*, i8** %74, align 8
  %76 = call %struct._IO_FILE* @fopen(i8* %75, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0))
  %77 = icmp eq %struct._IO_FILE* %76, null
  br i1 %77, label %83, label %.preheader23

.preheader23:                                     ; preds = %73
  %78 = call i32 @feof(%struct._IO_FILE* nonnull %68) #6
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %.preheader22.lr.ph, label %._crit_edge32

.preheader22.lr.ph:                               ; preds = %.preheader23
  %80 = getelementptr inbounds [32 x i8], [32 x i8]* %10, i64 0, i64 0
  %81 = getelementptr inbounds [40 x i8], [40 x i8]* %5, i64 0, i64 0
  %82 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 0
  br label %.preheader22

; <label>:83:                                     ; preds = %73
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %85 = call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %84) #7
  call void @exit(i32 1) #8
  unreachable

.loopexit.loopexit:                               ; preds = %.lr.ph31
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %86 = call i32 @feof(%struct._IO_FILE* nonnull %68) #6
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %.preheader22, label %._crit_edge32.loopexit

.preheader22:                                     ; preds = %.preheader22.lr.ph, %.loopexit
  %88 = call i32 @feof(%struct._IO_FILE* nonnull %68) #6
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader22
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %90 = call i32 @_IO_getc(%struct._IO_FILE* nonnull %68)
  %91 = trunc i32 %90 to i8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %92 = getelementptr inbounds [40 x i8], [40 x i8]* %5, i64 0, i64 %indvars.iv
  store i8 %91, i8* %92, align 1
  %93 = call i32 @feof(%struct._IO_FILE* nonnull %68) #6
  %94 = icmp eq i32 %93, 0
  %95 = icmp slt i64 %indvars.iv.next, 40
  %. = and i1 %95, %94
  br i1 %., label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %96 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader22
  %.2.lcssa = phi i32 [ 0, %.preheader22 ], [ %96, %._crit_edge.loopexit ]
  %97 = load i32, i32* %8, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %80, i8* nonnull %11, i64 32, i32 16, i1 false)
  %98 = load i64, i64* %9, align 8
  %99 = icmp sgt i64 %98, 0
  br i1 %99, label %.lr.ph29, label %.preheader

.lr.ph29:                                         ; preds = %._crit_edge
  %100 = sext i32 %.2.lcssa to i64
  br label %102

.preheader.loopexit:                              ; preds = %102
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %._crit_edge
  %101 = icmp sgt i32 %.2.lcssa, 0
  br i1 %101, label %.lr.ph31.preheader, label %.loopexit

.lr.ph31.preheader:                               ; preds = %.preheader
  %wide.trip.count = zext i32 %.2.lcssa to i64
  br label %.lr.ph31

; <label>:102:                                    ; preds = %.lr.ph29, %102
  %.0227 = phi i64 [ 0, %.lr.ph29 ], [ %103, %102 ]
  store i32 %97, i32* %8, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %11, i8* nonnull %80, i64 32, i32 16, i1 false)
  call void @BF_cfb64_encrypt(i8* nonnull %81, i8* nonnull %82, i64 %100, %struct.bf_key_st* nonnull %3, i8* nonnull %11, i32* nonnull %8, i32 %.06) #6
  %103 = add nuw nsw i64 %.0227, 1
  %104 = load i64, i64* %9, align 8
  %105 = icmp slt i64 %103, %104
  br i1 %105, label %102, label %.preheader.loopexit

.lr.ph31:                                         ; preds = %.lr.ph31.preheader, %.lr.ph31
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %.lr.ph31 ], [ 0, %.lr.ph31.preheader ]
  %106 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 %indvars.iv36
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = call i32 @fputc(i32 %108, %struct._IO_FILE* nonnull %76)
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph31

._crit_edge32.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.preheader23
  %110 = call i32 @fclose(%struct._IO_FILE* nonnull %68)
  %111 = call i32 @fclose(%struct._IO_FILE* nonnull %76)
  br label %112

; <label>:112:                                    ; preds = %._crit_edge32, %60
  %.0 = phi i32 [ 1, %60 ], [ 0, %._crit_edge32 ]
  ret i32 %.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) local_unnamed_addr #3

declare void @BF_set_key(%struct.bf_key_st*, i32, i8*) local_unnamed_addr #4

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #5

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

declare void @BF_cfb64_encrypt(i8*, i8*, i64, %struct.bf_key_st*, i8*, i32*, i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
