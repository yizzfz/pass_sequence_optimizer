; ModuleID = 'qsort_large.ll'
source_filename = "qsort_large.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.my3DVertexStruct = type { i32, i32, i32, double }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"sorted_output.dat\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"wt\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\0AError: Can't open output file\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @compare(i8* nocapture readonly, i8* nocapture readonly) #0 {
  %3 = getelementptr inbounds i8, i8* %0, i64 16
  %4 = bitcast i8* %3 to double*
  %5 = load double, double* %4, align 8
  %6 = getelementptr inbounds i8, i8* %1, i64 16
  %7 = bitcast i8* %6 to double*
  %8 = load double, double* %7, align 8
  %9 = fcmp ogt double %5, %8
  %not. = fcmp une double %5, %8
  %10 = sext i1 %not. to i32
  %11 = select i1 %9, i32 1, i32 %10
  ret i32 %11
}

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly, i32) local_unnamed_addr #1 {
  %4 = alloca [60000 x %struct.my3DVertexStruct], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = icmp slt i32 %0, 2
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %10) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:12:                                     ; preds = %3
  %13 = getelementptr inbounds i8*, i8** %1, i64 1
  %14 = load i8*, i8** %13, align 8
  %15 = tail call %struct._IO_FILE* @fopen(i8* %14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* nonnull %5) #5
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %.lr.ph8.preheader, label %.critedge

.lr.ph8.preheader:                                ; preds = %12
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %25
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %25 ], [ 0, %.lr.ph8.preheader ]
  %.06 = phi i32 [ %42, %25 ], [ 0, %.lr.ph8.preheader ]
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* nonnull %6) #5
  %19 = icmp eq i32 %18, 1
  %20 = trunc i64 %indvars.iv13 to i32
  br i1 %19, label %21, label %.critedge.loopexit

; <label>:21:                                     ; preds = %.lr.ph8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* nonnull %7) #5
  %23 = icmp eq i32 %22, 1
  %24 = icmp slt i64 %indvars.iv13, 60000
  %. = and i1 %24, %23
  br i1 %., label %25, label %.critedge.loopexit

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %4, i64 0, i64 %indvars.iv13, i32 0
  store i32 %26, i32* %27, align 8
  %28 = load i32, i32* %6, align 4
  %29 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %4, i64 0, i64 %indvars.iv13, i32 1
  store i32 %28, i32* %29, align 4
  %30 = load i32, i32* %7, align 4
  %31 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %4, i64 0, i64 %indvars.iv13, i32 2
  store i32 %30, i32* %31, align 8
  %32 = load i32, i32* %5, align 4
  %33 = sitofp i32 %32 to double
  %pow2 = fmul double %33, %33
  %34 = load i32, i32* %6, align 4
  %35 = sitofp i32 %34 to double
  %pow22 = fmul double %35, %35
  %36 = fadd double %pow2, %pow22
  %37 = load i32, i32* %7, align 4
  %38 = sitofp i32 %37 to double
  %pow23 = fmul double %38, %38
  %39 = fadd double %36, %pow23
  %40 = call double @sqrt(double %39) #5
  %41 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %4, i64 0, i64 %indvars.iv13, i32 3
  store double %40, double* %41, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %42 = add nuw nsw i32 %.06, 1
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* nonnull %5) #5
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %.lr.ph8, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %25, %.lr.ph8, %21
  %.0.lcssa.ph = phi i32 [ %42, %25 ], [ %20, %.lr.ph8 ], [ %20, %21 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %12
  %.0.lcssa = phi i32 [ 0, %12 ], [ %.0.lcssa.ph, %.critedge.loopexit ]
  %45 = call i32 @fclose(%struct._IO_FILE* %15)
  %46 = icmp eq i32 %2, 0
  br i1 %46, label %.thread, label %48

.thread:                                          ; preds = %.critedge
  %47 = bitcast [60000 x %struct.my3DVertexStruct]* %4 to i8*
  call void @qsortx(i8* nonnull %47, i32 %.0.lcssa, i32 24, i32 (i8*, i8*)* nonnull @compare) #5
  br label %70

; <label>:48:                                     ; preds = %.critedge
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.3, i64 0, i64 0), i32 %.0.lcssa)
  %50 = bitcast [60000 x %struct.my3DVertexStruct]* %4 to i8*
  call void @qsortx(i8* nonnull %50, i32 %.0.lcssa, i32 24, i32 (i8*, i8*)* nonnull @compare) #5
  %51 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0))
  %52 = icmp eq %struct._IO_FILE* %51, null
  br i1 %52, label %57, label %.preheader

.preheader:                                       ; preds = %48
  %53 = icmp sgt i32 %.0.lcssa, 0
  br i1 %53, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %54 = udiv i32 %.0.lcssa, 100
  %55 = zext i32 %54 to i64
  %56 = sext i32 %.0.lcssa to i64
  br label %60

; <label>:57:                                     ; preds = %48
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %58) #6
  call void @exit(i32 1) #7
  unreachable

; <label>:60:                                     ; preds = %.lr.ph, %60
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %60 ]
  %61 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %4, i64 0, i64 %indvars.iv, i32 0
  %62 = load i32, i32* %61, align 8
  %63 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %4, i64 0, i64 %indvars.iv, i32 1
  %64 = load i32, i32* %63, align 4
  %65 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %4, i64 0, i64 %indvars.iv, i32 2
  %66 = load i32, i32* %65, align 8
  %67 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* nonnull %51, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i32 %62, i32 %64, i32 %66)
  %indvars.iv.next = add i64 %indvars.iv, %55
  %68 = icmp slt i64 %indvars.iv.next, %56
  br i1 %68, label %60, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %60
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %69 = call i32 @fclose(%struct._IO_FILE* nonnull %51)
  br label %70

; <label>:70:                                     ; preds = %.thread, %._crit_edge
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @qsortx(i8*, i32, i32, i32 (i8*, i8*)*) local_unnamed_addr #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
