; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv6 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next7, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv6, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader.us ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %8, double* %9, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge24..preheader4_crit_edge, %.preheader4.lr.ph
  %.0325 = phi i32 [ 1, %.preheader4.lr.ph ], [ %94, %._crit_edge24..preheader4_crit_edge ]
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge9.us, %.preheader4
  %indvars.iv30 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next31, %._crit_edge9.us ]
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv30
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv30, -1
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br label %22

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond40 = icmp eq i64 %indvars.iv.next31, 999
  br i1 %exitcond40, label %.lr.ph15.us.preheader, label %.lr.ph12.split.us

.lr.ph15.us.preheader:                            ; preds = %._crit_edge9.us
  br label %.lr.ph15.us

.lr.ph8.us:                                       ; preds = %.lr.ph8.us..lr.ph8.us_crit_edge, %._crit_edge.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %.lr.ph8.us..lr.ph8.us_crit_edge ], [ 998, %._crit_edge.us ]
  %13 = phi double [ %19, %.lr.ph8.us..lr.ph8.us_crit_edge ], [ 1.000000e+00, %._crit_edge.us ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv28
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %13
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv28
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv30
  store double %19, double* %20, align 8
  %21 = icmp sgt i64 %indvars.iv28, 1
  br i1 %21, label %.lr.ph8.us..lr.ph8.us_crit_edge, label %._crit_edge9.us

.lr.ph8.us..lr.ph8.us_crit_edge:                  ; preds = %.lr.ph8.us
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, -1
  br label %.lr.ph8.us

; <label>:22:                                     ; preds = %._crit_edge, %.lr.ph12.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 1, %.lr.ph12.split.us ]
  %23 = add nsw i64 %indvars.iv, -1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %23
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %12
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next31
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %23
  %.rhs = fmul double %25, 0xC09F400000000001
  %30 = fadd double %.rhs, 0x40AF420000000001
  %31 = fdiv double 0x409F400000000001, %30
  store double %31, double* %26, align 8
  %32 = bitcast double* %27 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %32, align 8
  %34 = fmul <2 x double> %33, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %35 = extractelement <2 x double> %34, i32 0
  %36 = extractelement <2 x double> %34, i32 1
  %37 = fsub double %36, %35
  %38 = load double, double* %28, align 8
  %39 = fmul double %38, 0xC08F400000000001
  %40 = fsub double %37, %39
  %41 = load double, double* %29, align 8
  %42 = fmul double %41, 0xC09F400000000001
  %43 = fsub double %40, %42
  %44 = fdiv double %43, %30
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv
  store double %44, double* %45, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %22
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %22

._crit_edge.us:                                   ; preds = %22
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv30
  store double 1.000000e+00, double* %46, align 8
  br label %.lr.ph8.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader, %._crit_edge20.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge20.us ], [ 1, %.lr.ph15.us.preheader ]
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 0
  store double 1.000000e+00, double* %47, align 8
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 0
  store double 0.000000e+00, double* %48, align 8
  %49 = bitcast double* %47 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38
  %52 = bitcast [1000 x double]* %51 to i64*
  store i64 %50, i64* %52, align 8
  %53 = add nsw i64 %indvars.iv38, -1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  br label %63

._crit_edge20.us:                                 ; preds = %.lr.ph19.us
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 999
  br i1 %exitcond41, label %._crit_edge24, label %.lr.ph15.us

.lr.ph19.us:                                      ; preds = %.lr.ph19.us..lr.ph19.us_crit_edge, %._crit_edge16.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %.lr.ph19.us..lr.ph19.us_crit_edge ], [ 998, %._crit_edge16.us ]
  %54 = phi double [ %60, %.lr.ph19.us..lr.ph19.us_crit_edge ], [ 1.000000e+00, %._crit_edge16.us ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv36
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %54
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv36
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv36
  store double %60, double* %61, align 8
  %62 = icmp sgt i64 %indvars.iv36, 1
  br i1 %62, label %.lr.ph19.us..lr.ph19.us_crit_edge, label %._crit_edge20.us

.lr.ph19.us..lr.ph19.us_crit_edge:                ; preds = %.lr.ph19.us
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, -1
  br label %.lr.ph19.us

; <label>:63:                                     ; preds = %._crit_edge42, %.lr.ph15.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge42 ], [ 1, %.lr.ph15.us ]
  %64 = add nsw i64 %indvars.iv32, -1
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %64
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv32
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %53, i64 %indvars.iv32
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next39, i64 %indvars.iv32
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %64
  %72 = insertelement <2 x double> undef, double %66, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> undef, <2 x i32> zeroinitializer
  %74 = fmul <2 x double> %73, <double 0xC08F400000000001, double 0xC08F400000000001>
  %75 = fadd <2 x double> %74, <double 0x409F440000000001, double 0x409F440000000001>
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fdiv double 0x408F400000000001, %76
  store double %78, double* %67, align 8
  %79 = load double, double* %68, align 8
  %80 = fmul double %79, 0xC09F400000000001
  %81 = load double, double* %69, align 8
  %82 = fmul double %81, 0xC0AF3E0000000001
  %83 = fsub double %82, %80
  %84 = load double, double* %70, align 8
  %85 = fmul double %84, 0xC09F400000000001
  %86 = fsub double %83, %85
  %87 = load double, double* %71, align 8
  %88 = fmul double %87, 0xC08F400000000001
  %89 = fsub double %86, %88
  %90 = fdiv double %89, %77
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv32
  store double %90, double* %91, align 8
  %exitcond35 = icmp eq i64 %indvars.iv32, 998
  br i1 %exitcond35, label %._crit_edge16.us, label %._crit_edge42

._crit_edge42:                                    ; preds = %63
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  br label %63

._crit_edge16.us:                                 ; preds = %63
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 999
  store double 1.000000e+00, double* %92, align 8
  br label %.lr.ph19.us

._crit_edge24:                                    ; preds = %._crit_edge20.us
  %93 = icmp slt i32 %.0325, 500
  br i1 %93, label %._crit_edge24..preheader4_crit_edge, label %._crit_edge26

._crit_edge24..preheader4_crit_edge:              ; preds = %._crit_edge24
  %94 = add nuw nsw i32 %.0325, 1
  br label %.preheader4

._crit_edge26:                                    ; preds = %._crit_edge24
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv7 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next8, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
