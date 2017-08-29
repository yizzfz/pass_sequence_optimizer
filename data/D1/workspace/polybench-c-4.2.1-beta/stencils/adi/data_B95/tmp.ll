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
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader.us ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %8, double* %9, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  br label %.preheader4..lr.ph11.split.us_crit_edge

.preheader4..lr.ph11.split.us_crit_edge:          ; preds = %._crit_edge22..preheader4..lr.ph11.split.us_crit_edge_crit_edge, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %97, %._crit_edge22..preheader4..lr.ph11.split.us_crit_edge_crit_edge ]
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge9.us, %.preheader4..lr.ph11.split.us_crit_edge
  %indvars.iv28 = phi i64 [ 1, %.preheader4..lr.ph11.split.us_crit_edge ], [ %13, %._crit_edge9.us ]
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
  %13 = add nuw nsw i64 %indvars.iv28, 1
  br label %23

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond38 = icmp eq i64 %13, 999
  br i1 %exitcond38, label %.lr.ph21.split.us.preheader, label %.lr.ph11.split.us

.lr.ph21.split.us.preheader:                      ; preds = %._crit_edge9.us
  br label %.lr.ph21.split.us

.lr.ph8.us:                                       ; preds = %.lr.ph8.us..lr.ph8.us_crit_edge, %._crit_edge.us..lr.ph8.us_crit_edge
  %14 = phi double [ 1.000000e+00, %._crit_edge.us..lr.ph8.us_crit_edge ], [ %20, %.lr.ph8.us..lr.ph8.us_crit_edge ]
  %indvars.iv26 = phi i64 [ 998, %._crit_edge.us..lr.ph8.us_crit_edge ], [ %indvars.iv.next27, %.lr.ph8.us..lr.ph8.us_crit_edge ]
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv26
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %14
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv26
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv28
  store double %20, double* %21, align 8
  %22 = icmp sgt i64 %indvars.iv26, 1
  br i1 %22, label %.lr.ph8.us..lr.ph8.us_crit_edge, label %._crit_edge9.us

.lr.ph8.us..lr.ph8.us_crit_edge:                  ; preds = %.lr.ph8.us
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  br label %.lr.ph8.us

; <label>:23:                                     ; preds = %._crit_edge, %.lr.ph11.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 1, %.lr.ph11.split.us ]
  %24 = add nsw i64 %indvars.iv, -1
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %12
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %13
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %24
  %.lhs = fmul double %26, 0xC09F400000000001
  %31 = fadd double %.lhs, 0x40AF420000000001
  %32 = fdiv double 0x409F400000000001, %31
  store double %32, double* %27, align 8
  %33 = bitcast double* %28 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %38 = fsub double %37, %36
  %39 = load double, double* %29, align 8
  %40 = fmul double %39, 0xC08F400000000001
  %41 = fsub double %38, %40
  %42 = load double, double* %30, align 8
  %43 = fmul double %42, 0xC09F400000000001
  %44 = fsub double %41, %43
  %45 = fdiv double %44, %31
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv
  store double %45, double* %46, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %._crit_edge.us..lr.ph8.us_crit_edge, label %._crit_edge

._crit_edge:                                      ; preds = %23
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %23

._crit_edge.us..lr.ph8.us_crit_edge:              ; preds = %23
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %47, align 8
  br label %.lr.ph8.us

.lr.ph21.split.us:                                ; preds = %.lr.ph21.split.us.preheader, %._crit_edge19.us
  %indvars.iv36 = phi i64 [ %56, %._crit_edge19.us ], [ 1, %.lr.ph21.split.us.preheader ]
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 0, i64 0
  store double 1.000000e+00, double* %49, align 8
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %50, align 8
  %51 = bitcast [1000 x double]* %48 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36
  %54 = bitcast [1000 x double]* %53 to i64*
  store i64 %52, i64* %54, align 8
  %55 = add nsw i64 %indvars.iv36, -1
  %56 = add nuw nsw i64 %indvars.iv36, 1
  br label %66

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond39 = icmp eq i64 %56, 999
  br i1 %exitcond39, label %._crit_edge22, label %.lr.ph21.split.us

.lr.ph18.us:                                      ; preds = %.lr.ph18.us..lr.ph18.us_crit_edge, %._crit_edge15.us..lr.ph18.us_crit_edge
  %57 = phi double [ 1.000000e+00, %._crit_edge15.us..lr.ph18.us_crit_edge ], [ %63, %.lr.ph18.us..lr.ph18.us_crit_edge ]
  %indvars.iv34 = phi i64 [ 998, %._crit_edge15.us..lr.ph18.us_crit_edge ], [ %indvars.iv.next35, %.lr.ph18.us..lr.ph18.us_crit_edge ]
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv34
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %57
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv34
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv34
  store double %63, double* %64, align 8
  %65 = icmp sgt i64 %indvars.iv34, 1
  br i1 %65, label %.lr.ph18.us..lr.ph18.us_crit_edge, label %._crit_edge19.us

.lr.ph18.us..lr.ph18.us_crit_edge:                ; preds = %.lr.ph18.us
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, -1
  br label %.lr.ph18.us

; <label>:66:                                     ; preds = %._crit_edge40, %.lr.ph21.split.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge40 ], [ 1, %.lr.ph21.split.us ]
  %67 = add nsw i64 %indvars.iv30, -1
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %67
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv30
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %55, i64 %indvars.iv30
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %56, i64 %indvars.iv30
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %67
  %75 = insertelement <2 x double> undef, double %69, i32 0
  %76 = shufflevector <2 x double> %75, <2 x double> undef, <2 x i32> zeroinitializer
  %77 = fmul <2 x double> %76, <double 0xC08F400000000001, double 0xC08F400000000001>
  %78 = fadd <2 x double> %77, <double 0x409F440000000001, double 0x409F440000000001>
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fdiv double 0x408F400000000001, %79
  store double %81, double* %70, align 8
  %82 = load double, double* %71, align 8
  %83 = fmul double %82, 0xC09F400000000001
  %84 = load double, double* %72, align 8
  %85 = fmul double %84, 0xC0AF3E0000000001
  %86 = fsub double %85, %83
  %87 = load double, double* %73, align 8
  %88 = fmul double %87, 0xC09F400000000001
  %89 = fsub double %86, %88
  %90 = load double, double* %74, align 8
  %91 = fmul double %90, 0xC08F400000000001
  %92 = fsub double %89, %91
  %93 = fdiv double %92, %80
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv30
  store double %93, double* %94, align 8
  %exitcond33 = icmp eq i64 %indvars.iv30, 998
  br i1 %exitcond33, label %._crit_edge15.us..lr.ph18.us_crit_edge, label %._crit_edge40

._crit_edge40:                                    ; preds = %66
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br label %66

._crit_edge15.us..lr.ph18.us_crit_edge:           ; preds = %66
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 999
  store double 1.000000e+00, double* %95, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %96 = icmp slt i32 %.0323, 500
  br i1 %96, label %._crit_edge22..preheader4..lr.ph11.split.us_crit_edge_crit_edge, label %._crit_edge24

._crit_edge22..preheader4..lr.ph11.split.us_crit_edge_crit_edge: ; preds = %._crit_edge22
  %97 = add nuw nsw i32 %.0323, 1
  br label %.preheader4..lr.ph11.split.us_crit_edge

._crit_edge24:                                    ; preds = %._crit_edge22
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

.preheader.us:                                    ; preds = %._crit_edge3.us, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge3.us ]
  %6 = mul nuw nsw i64 %indvars.iv6, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %._crit_edge.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge.us._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
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
