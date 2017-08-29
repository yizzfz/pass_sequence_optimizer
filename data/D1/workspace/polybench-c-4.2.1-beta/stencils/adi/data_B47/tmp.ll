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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = sub nuw nsw i64 %1, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 1.000000e+03, double 1.000000e+03>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.preheader4..lr.ph11.split.us_crit_edge

.preheader4..lr.ph11.split.us_crit_edge:          ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %90, %._crit_edge22 ]
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge9.us, %.preheader4..lr.ph11.split.us_crit_edge
  %indvars.iv28 = phi i64 [ 1, %.preheader4..lr.ph11.split.us_crit_edge ], [ %indvars.iv.next29, %._crit_edge9.us ]
  %4 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv28
  store double 1.000000e+00, double* %4, align 8
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 0
  store double 0.000000e+00, double* %5, align 8
  %6 = bitcast double* %4 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28
  %9 = bitcast [1000 x double]* %8 to i64*
  store i64 %7, i64* %9, align 8
  %10 = add nsw i64 %indvars.iv28, -1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  br label %._crit_edge

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 999
  br i1 %exitcond30, label %.lr.ph14.us.preheader, label %.lr.ph11.split.us

.lr.ph14.us.preheader:                            ; preds = %._crit_edge9.us
  br label %.lr.ph14.us

.lr.ph8.us:                                       ; preds = %.lr.ph8.us..lr.ph8.us_crit_edge, %._crit_edge.us..lr.ph8.us_crit_edge
  %indvars.iv26 = phi i64 [ 998, %._crit_edge.us..lr.ph8.us_crit_edge ], [ %indvars.iv.next27, %.lr.ph8.us..lr.ph8.us_crit_edge ]
  %11 = phi double [ 1.000000e+00, %._crit_edge.us..lr.ph8.us_crit_edge ], [ %17, %.lr.ph8.us..lr.ph8.us_crit_edge ]
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv26
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %11
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv26
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv28
  store double %17, double* %18, align 8
  %19 = icmp sgt i64 %indvars.iv26, 1
  br i1 %19, label %.lr.ph8.us..lr.ph8.us_crit_edge, label %._crit_edge9.us

.lr.ph8.us..lr.ph8.us_crit_edge:                  ; preds = %.lr.ph8.us
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  br label %.lr.ph8.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph11.split.us
  %indvars.iv = phi i64 [ 1, %.lr.ph11.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %20 = add nsw i64 %indvars.iv, -1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %20
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %10
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next29
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %20
  %.lhs = fmul double %22, 0xC09F400000000001
  %27 = fadd double %.lhs, 0x40AF420000000001
  %28 = fdiv double 0x409F400000000001, %27
  store double %28, double* %23, align 8
  %29 = bitcast double* %24 to <2 x double>*
  %30 = load <2 x double>, <2 x double>* %29, align 8
  %31 = fmul <2 x double> %30, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fsub double %33, %32
  %35 = load double, double* %25, align 8
  %36 = fmul double %35, 0xC08F400000000001
  %37 = fsub double %34, %36
  %38 = load double, double* %26, align 8
  %39 = fmul double %38, 0xC09F400000000001
  %40 = fsub double %37, %39
  %41 = fdiv double %40, %27
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.us..lr.ph8.us_crit_edge, label %._crit_edge

._crit_edge.us..lr.ph8.us_crit_edge:              ; preds = %._crit_edge
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %43, align 8
  br label %.lr.ph8.us

.lr.ph14.us:                                      ; preds = %.lr.ph14.us.preheader, %._crit_edge19.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge19.us ], [ 1, %.lr.ph14.us.preheader ]
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 0, i64 0
  store double 1.000000e+00, double* %45, align 8
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %46, align 8
  %47 = bitcast [1000 x double]* %44 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36
  %50 = bitcast [1000 x double]* %49 to i64*
  store i64 %48, i64* %50, align 8
  %51 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br label %._crit_edge39

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 999
  br i1 %exitcond38, label %._crit_edge22, label %.lr.ph14.us

.lr.ph18.us:                                      ; preds = %.lr.ph18.us..lr.ph18.us_crit_edge, %._crit_edge15.us..lr.ph18.us_crit_edge
  %indvars.iv34 = phi i64 [ 998, %._crit_edge15.us..lr.ph18.us_crit_edge ], [ %indvars.iv.next35, %.lr.ph18.us..lr.ph18.us_crit_edge ]
  %52 = phi double [ 1.000000e+00, %._crit_edge15.us..lr.ph18.us_crit_edge ], [ %58, %.lr.ph18.us..lr.ph18.us_crit_edge ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv34
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %52
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv34
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv34
  store double %58, double* %59, align 8
  %60 = icmp sgt i64 %indvars.iv34, 1
  br i1 %60, label %.lr.ph18.us..lr.ph18.us_crit_edge, label %._crit_edge19.us

.lr.ph18.us..lr.ph18.us_crit_edge:                ; preds = %.lr.ph18.us
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, -1
  br label %.lr.ph18.us

._crit_edge39:                                    ; preds = %._crit_edge39, %.lr.ph14.us
  %indvars.iv31 = phi i64 [ 1, %.lr.ph14.us ], [ %indvars.iv.next32, %._crit_edge39 ]
  %61 = add nsw i64 %indvars.iv31, -1
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %61
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv31
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %51, i64 %indvars.iv31
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv31
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next37, i64 %indvars.iv31
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %61
  %69 = insertelement <2 x double> undef, double %63, i32 0
  %70 = shufflevector <2 x double> %69, <2 x double> undef, <2 x i32> zeroinitializer
  %71 = fmul <2 x double> %70, <double 0xC08F400000000001, double 0xC08F400000000001>
  %72 = fadd <2 x double> %71, <double 0x409F440000000001, double 0x409F440000000001>
  %73 = extractelement <2 x double> %72, i32 0
  %74 = extractelement <2 x double> %72, i32 1
  %75 = fdiv double 0x408F400000000001, %73
  store double %75, double* %64, align 8
  %76 = load double, double* %65, align 8
  %77 = fmul double %76, 0xC09F400000000001
  %78 = load double, double* %66, align 8
  %79 = fmul double %78, 0xC0AF3E0000000001
  %80 = fsub double %79, %77
  %81 = load double, double* %67, align 8
  %82 = fmul double %81, 0xC09F400000000001
  %83 = fsub double %80, %82
  %84 = load double, double* %68, align 8
  %85 = fmul double %84, 0xC08F400000000001
  %86 = fsub double %83, %85
  %87 = fdiv double %86, %74
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv31
  store double %87, double* %88, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond33, label %._crit_edge15.us..lr.ph18.us_crit_edge, label %._crit_edge39

._crit_edge15.us..lr.ph18.us_crit_edge:           ; preds = %._crit_edge39
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 999
  store double 1.000000e+00, double* %89, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %90 = add nuw nsw i32 %.0323, 1
  %exitcond40 = icmp eq i32 %90, 501
  br i1 %exitcond40, label %._crit_edge24, label %.preheader4..lr.ph11.split.us_crit_edge

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv7 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next8, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
