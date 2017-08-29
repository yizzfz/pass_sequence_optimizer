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
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
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
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub nuw nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %3, %9
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.lr.ph11.split.us.preheader

.lr.ph11.split.us.preheader:                      ; preds = %.preheader4.lr.ph, %._crit_edge22
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %109, %._crit_edge22 ]
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge9.us, %.lr.ph11.split.us.preheader
  %indvars.iv28 = phi i64 [ 1, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next29, %._crit_edge9.us ]
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv28
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv28, -1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  br label %29

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond38 = icmp eq i64 %indvars.iv.next29, 999
  br i1 %exitcond38, label %.lr.ph14.us.preheader, label %.lr.ph11.split.us

.lr.ph14.us.preheader:                            ; preds = %._crit_edge9.us
  br label %.lr.ph14.us

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %.lr.ph8.us.preheader
  %indvars.iv26 = phi i64 [ 998, %.lr.ph8.us.preheader ], [ %indvars.iv.next27.1, %.lr.ph8.us ]
  %13 = phi double [ 1.000000e+00, %.lr.ph8.us.preheader ], [ %26, %.lr.ph8.us ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv26
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %13
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv26
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv28
  store double %19, double* %20, align 8
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next27
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %19
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv.next27
  %25 = load double, double* %24, align 8
  %26 = fadd double %23, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next27, i64 %indvars.iv28
  store double %26, double* %27, align 8
  %28 = icmp sgt i64 %indvars.iv.next27, 1
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, -2
  br i1 %28, label %.lr.ph8.us, label %._crit_edge9.us

; <label>:29:                                     ; preds = %29, %.lr.ph11.split.us
  %indvars.iv = phi i64 [ 1, %.lr.ph11.split.us ], [ %indvars.iv.next, %29 ]
  %30 = add nsw i64 %indvars.iv, -1
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %12
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next29
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %30
  %.rhs = fmul double %32, 0xC09F400000000001
  %37 = fadd double %.rhs, 0x40AF420000000001
  %38 = fdiv double 0x409F400000000001, %37
  store double %38, double* %33, align 8
  %39 = bitcast double* %34 to <2 x double>*
  %40 = load <2 x double>, <2 x double>* %39, align 8
  %41 = fmul <2 x double> %40, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %44 = fsub double %43, %42
  %45 = load double, double* %35, align 8
  %46 = fmul double %45, 0xC08F400000000001
  %47 = fsub double %44, %46
  %48 = load double, double* %36, align 8
  %49 = fmul double %48, 0xC09F400000000001
  %50 = fsub double %47, %49
  %51 = fdiv double %50, %37
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv
  store double %51, double* %52, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.lr.ph8.us.preheader, label %29

.lr.ph8.us.preheader:                             ; preds = %29
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %53, align 8
  br label %.lr.ph8.us

.lr.ph14.us:                                      ; preds = %.lr.ph14.us.preheader, %._crit_edge19.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge19.us ], [ 1, %.lr.ph14.us.preheader ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %54, i64 0, i64 0
  store double 1.000000e+00, double* %55, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %56, align 8
  %57 = bitcast [1000 x double]* %54 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36
  %60 = bitcast [1000 x double]* %59 to i64*
  store i64 %58, i64* %60, align 8
  %61 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br label %78

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 999
  br i1 %exitcond39, label %._crit_edge22, label %.lr.ph14.us

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %.lr.ph18.us.preheader
  %indvars.iv34 = phi i64 [ 998, %.lr.ph18.us.preheader ], [ %indvars.iv.next35.1, %.lr.ph18.us ]
  %62 = phi double [ 1.000000e+00, %.lr.ph18.us.preheader ], [ %75, %.lr.ph18.us ]
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv34
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %62
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv34
  %67 = load double, double* %66, align 8
  %68 = fadd double %65, %67
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv34
  store double %68, double* %69, align 8
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, -1
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next35
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %68
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv.next35
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next35
  store double %75, double* %76, align 8
  %77 = icmp sgt i64 %indvars.iv.next35, 1
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, -2
  br i1 %77, label %.lr.ph18.us, label %._crit_edge19.us

; <label>:78:                                     ; preds = %78, %.lr.ph14.us
  %indvars.iv30 = phi i64 [ 1, %.lr.ph14.us ], [ %indvars.iv.next31, %78 ]
  %79 = add nsw i64 %indvars.iv30, -1
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %79
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv30
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %61, i64 %indvars.iv30
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next37, i64 %indvars.iv30
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %79
  %87 = insertelement <2 x double> undef, double %81, i32 0
  %88 = shufflevector <2 x double> %87, <2 x double> undef, <2 x i32> zeroinitializer
  %89 = fmul <2 x double> %88, <double 0xC08F400000000001, double 0xC08F400000000001>
  %90 = fadd <2 x double> %89, <double 0x409F440000000001, double 0x409F440000000001>
  %91 = extractelement <2 x double> %90, i32 0
  %92 = extractelement <2 x double> %90, i32 1
  %93 = fdiv double 0x408F400000000001, %91
  store double %93, double* %82, align 8
  %94 = load double, double* %83, align 8
  %95 = fmul double %94, 0xC09F400000000001
  %96 = load double, double* %84, align 8
  %97 = fmul double %96, 0xC0AF3E0000000001
  %98 = fsub double %97, %95
  %99 = load double, double* %85, align 8
  %100 = fmul double %99, 0xC09F400000000001
  %101 = fsub double %98, %100
  %102 = load double, double* %86, align 8
  %103 = fmul double %102, 0xC08F400000000001
  %104 = fsub double %101, %103
  %105 = fdiv double %104, %92
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv30
  store double %105, double* %106, align 8
  %exitcond33 = icmp eq i64 %indvars.iv30, 998
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br i1 %exitcond33, label %.lr.ph18.us.preheader, label %78

.lr.ph18.us.preheader:                            ; preds = %78
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 999
  store double 1.000000e+00, double* %107, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %108 = icmp slt i32 %.0323, 500
  %109 = add nuw nsw i32 %.0323, 1
  br i1 %108, label %.lr.ph11.split.us.preheader, label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv6, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
