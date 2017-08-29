; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge17

.._crit_edge_crit_edge17:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge17, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %4
  %indvars.iv12 = phi i64 [ 0, %4 ], [ %indvars.iv.next13, %.._crit_edge_crit_edge ]
  %5 = trunc i64 %indvars.iv12 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %._crit_edge15, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge15 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv12
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv12
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %._crit_edge15

._crit_edge15:                                    ; preds = %7
  br label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond14, label %21, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %20
  br label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %8

; <label>:8:                                      ; preds = %._crit_edge152, %7
  %indvars.iv141 = phi i64 [ 0, %7 ], [ %indvars.iv.next142, %._crit_edge152 ]
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv141
  store double 0.000000e+00, double* %9, align 8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge151, %8
  %11 = phi double [ 0.000000e+00, %8 ], [ %23, %._crit_edge151 ]
  %indvars.iv138 = phi i64 [ 0, %8 ], [ %indvars.iv.next139.3, %._crit_edge151 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv138, i64 %indvars.iv141
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %9, align 8
  %indvars.iv.next139 = or i64 %indvars.iv138, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next139, i64 %indvars.iv141
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %9, align 8
  %indvars.iv.next139.1 = or i64 %indvars.iv138, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next139.1, i64 %indvars.iv141
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %9, align 8
  %indvars.iv.next139.2 = or i64 %indvars.iv138, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next139.2, i64 %indvars.iv141
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %9, align 8
  %indvars.iv.next139.3 = add nsw i64 %indvars.iv138, 4
  %exitcond140.3 = icmp eq i64 %indvars.iv.next139.3, 1400
  br i1 %exitcond140.3, label %24, label %._crit_edge151

._crit_edge151:                                   ; preds = %10
  br label %10

; <label>:24:                                     ; preds = %10
  %25 = fdiv double %23, %2
  store double %25, double* %9, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next142, 1200
  br i1 %exitcond143, label %._crit_edge.preheader, label %._crit_edge152

._crit_edge152:                                   ; preds = %24
  br label %8

._crit_edge.preheader:                            ; preds = %24
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %.._crit_edge_crit_edge ], [ 0, %._crit_edge.preheader ]
  %26 = getelementptr inbounds double, double* %6, i64 %indvars.iv135
  store double 0.000000e+00, double* %26, align 8
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv135
  br label %28

; <label>:28:                                     ; preds = %._crit_edge153, %._crit_edge
  %29 = phi double [ 0.000000e+00, %._crit_edge ], [ %41, %._crit_edge153 ]
  %indvars.iv132 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next133.1, %._crit_edge153 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132, i64 %indvars.iv135
  %31 = load double, double* %30, align 8
  %32 = load double, double* %27, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %26, align 8
  %indvars.iv.next133 = or i64 %indvars.iv132, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133, i64 %indvars.iv135
  %37 = load double, double* %36, align 8
  %38 = load double, double* %27, align 8
  %39 = fsub double %37, %38
  %40 = fmul double %39, %39
  %41 = fadd double %35, %40
  store double %41, double* %26, align 8
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  %exitcond134.1 = icmp eq i64 %indvars.iv.next133.1, 1400
  br i1 %exitcond134.1, label %42, label %._crit_edge153

._crit_edge153:                                   ; preds = %28
  br label %28

; <label>:42:                                     ; preds = %28
  %43 = fdiv double %41, %2
  store double %43, double* %26, align 8
  %44 = tail call double @sqrt(double %43) #4
  %45 = fcmp ugt double %44, 1.000000e-01
  %46 = select i1 %45, double %44, double 1.000000e+00
  store double %46, double* %26, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next136, 1200
  br i1 %exitcond137, label %._crit_edge105.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %42
  br label %._crit_edge

._crit_edge105.preheader:                         ; preds = %42
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %.._crit_edge105_crit_edge, %._crit_edge105.preheader
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %.._crit_edge105_crit_edge ], [ 0, %._crit_edge105.preheader ]
  br label %47

; <label>:47:                                     ; preds = %._crit_edge154, %._crit_edge105
  %indvars.iv126 = phi i64 [ 0, %._crit_edge105 ], [ %indvars.iv.next127, %._crit_edge154 ]
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv126
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv129, i64 %indvars.iv126
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %53 = tail call double @sqrt(double %2) #4
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv126
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = load double, double* %50, align 8
  %58 = fdiv double %57, %56
  store double %58, double* %50, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next127, 1200
  br i1 %exitcond128, label %59, label %._crit_edge154

._crit_edge154:                                   ; preds = %47
  br label %47

; <label>:59:                                     ; preds = %47
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next130, 1400
  br i1 %exitcond131, label %.lr.ph.preheader.preheader, label %.._crit_edge105_crit_edge

.._crit_edge105_crit_edge:                        ; preds = %59
  br label %._crit_edge105

.lr.ph.preheader.preheader:                       ; preds = %59
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge107..lr.ph.preheader_crit_edge, %.lr.ph.preheader.preheader
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge107..lr.ph.preheader_crit_edge ], [ 0, %.lr.ph.preheader.preheader ]
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge107..lr.ph.preheader_crit_edge ], [ 1, %.lr.ph.preheader.preheader ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %60, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  br label %.lr.ph

._crit_edge107:                                   ; preds = %76
  %exitcond125 = icmp eq i64 %indvars.iv.next124, 1199
  br i1 %exitcond125, label %78, label %._crit_edge107..lr.ph.preheader_crit_edge

._crit_edge107..lr.ph.preheader_crit_edge:        ; preds = %._crit_edge107
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br label %.lr.ph.preheader

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv118, %.lr.ph.preheader ], [ %indvars.iv.next121, %..lr.ph_crit_edge ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv123, i64 %indvars.iv120
  store double 0.000000e+00, double* %61, align 8
  br label %62

; <label>:62:                                     ; preds = %._crit_edge155, %.lr.ph
  %63 = phi double [ 0.000000e+00, %.lr.ph ], [ %75, %._crit_edge155 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %._crit_edge155 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv123
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv120
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %61, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv123
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv120
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %61, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %76, label %._crit_edge155

._crit_edge155:                                   ; preds = %62
  br label %62

; <label>:76:                                     ; preds = %62
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv123
  store double %75, double* %77, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next121, 1200
  br i1 %exitcond122, label %._crit_edge107, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %76
  br label %.lr.ph

; <label>:78:                                     ; preds = %._crit_edge107
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %79, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %2
  %indvars.iv14 = phi i64 [ 0, %2 ], [ %indvars.iv.next15, %.._crit_edge_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv14, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge11._crit_edge, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge11._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %8
  br label %._crit_edge11

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %._crit_edge11._crit_edge

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11
  br label %8

; <label>:19:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %20, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %19
  br label %._crit_edge

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
