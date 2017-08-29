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
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv2 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %19 ]
  %3 = trunc i64 %indvars.iv2 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv2
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp ne i64 %indvars.iv.next3, 1400
  br i1 %exitcond, label %.._crit_edge_crit_edge, label %20

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double* nocapture, double*) unnamed_addr #0 {
  %6 = alloca double, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double, align 8
  store double %0, double* %6, align 8
  store [1200 x double]* %1, [1200 x double]** %7, align 8
  store [1200 x double]* %2, [1200 x double]** %8, align 8
  store double* %4, double** %9, align 8
  store double 1.000000e-01, double* %10, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  br label %._crit_edge100

.._crit_edge_crit_edge:                           ; preds = %27
  %11 = load double*, double** %9, align 8
  %12 = load double, double* %10, align 8
  br label %._crit_edge10._crit_edge

._crit_edge100:                                   ; preds = %27, %5
  %indvars.iv15 = phi i64 [ 0, %5 ], [ %indvars.iv.next16, %27 ]
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  store double 0.000000e+00, double* %13, align 8
  %sunkaddr77 = shl nsw i64 %indvars.iv15, 3
  %sunkaddr78 = add i64 %sunkaddr, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge100
  %indvars.iv65 = phi i64 [ 0, %._crit_edge100 ], [ %indvars.iv.next66.1.1, %._crit_edge ]
  %14 = phi double [ 0.000000e+00, %._crit_edge100 ], [ %26, %._crit_edge ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv15
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr79, align 8
  %indvars.iv.next66 = or i64 %indvars.iv65, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next66, i64 %indvars.iv15
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr79, align 8
  %indvars.iv.next66.1 = or i64 %indvars.iv65, 2
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next66.1, i64 %indvars.iv15
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %sunkaddr79, align 8
  %indvars.iv.next66.121 = or i64 %indvars.iv65, 3
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next66.121, i64 %indvars.iv15
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %sunkaddr79, align 8
  %indvars.iv.next66.1.1 = add nuw nsw i64 %indvars.iv65, 4
  %exitcond67.1.1 = icmp eq i64 %indvars.iv.next66.1.1, 1400
  br i1 %exitcond67.1.1, label %27, label %._crit_edge

; <label>:27:                                     ; preds = %._crit_edge
  %28 = fdiv double %26, %0
  store double %28, double* %sunkaddr79, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond29 = icmp ne i64 %indvars.iv.next16, 1200
  br i1 %exitcond29, label %._crit_edge100, label %.._crit_edge_crit_edge

._crit_edge10._crit_edge:                         ; preds = %._crit_edge10, %.._crit_edge_crit_edge
  %indvars.iv13 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next14, %._crit_edge10 ]
  %29 = phi double* [ %4, %.._crit_edge_crit_edge ], [ %11, %._crit_edge10 ]
  %30 = getelementptr inbounds double, double* %29, i64 %indvars.iv13
  store double 0.000000e+00, double* %30, align 8
  %sunkaddr85 = shl nsw i64 %indvars.iv13, 3
  %sunkaddr86 = add i64 %sunkaddr, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  %sunkaddr88 = ptrtoint double* %29 to i64
  %sunkaddr90 = add i64 %sunkaddr88, %sunkaddr85
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101, %._crit_edge10._crit_edge
  %indvars.iv62 = phi i64 [ 0, %._crit_edge10._crit_edge ], [ %indvars.iv.next63.1, %._crit_edge101 ]
  %31 = phi double [ 0.000000e+00, %._crit_edge10._crit_edge ], [ %43, %._crit_edge101 ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv13
  %33 = load double, double* %32, align 8
  %34 = load double, double* %sunkaddr87, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %36, %31
  store double %37, double* %sunkaddr91, align 8
  %indvars.iv.next63 = or i64 %indvars.iv62, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next63, i64 %indvars.iv13
  %39 = load double, double* %38, align 8
  %40 = load double, double* %sunkaddr87, align 8
  %41 = fsub double %39, %40
  %42 = fmul double %41, %41
  %43 = fadd double %42, %37
  store double %43, double* %sunkaddr91, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next63.1, 1400
  br i1 %exitcond64.1, label %._crit_edge10, label %._crit_edge101

._crit_edge10:                                    ; preds = %._crit_edge101
  %44 = fdiv double %43, %0
  store double %44, double* %sunkaddr91, align 8
  %45 = getelementptr inbounds double, double* %11, i64 %indvars.iv13
  %46 = load double, double* %45, align 8
  %47 = tail call double @sqrt(double %46) #4
  %48 = fcmp ugt double %47, %12
  %. = select i1 %48, double %47, double 1.000000e+00
  store double %., double* %45, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond28 = icmp ne i64 %indvars.iv.next14, 1200
  br i1 %exitcond28, label %._crit_edge10._crit_edge, label %._crit_edge9.._crit_edge11_crit_edge.preheader

._crit_edge9.._crit_edge11_crit_edge.preheader:   ; preds = %._crit_edge10
  br label %._crit_edge9.._crit_edge11_crit_edge

._crit_edge9.._crit_edge11_crit_edge:             ; preds = %._crit_edge9.._crit_edge11_crit_edge.preheader, %._crit_edge9
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge9 ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.preheader ]
  %49 = phi [1200 x double]* [ %62, %._crit_edge9 ], [ %1, %._crit_edge9.._crit_edge11_crit_edge.preheader ]
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11, %._crit_edge9.._crit_edge11_crit_edge
  %indvars.iv60 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge ], [ %indvars.iv.next61, %._crit_edge11 ]
  %50 = phi [1200 x double]* [ %49, %._crit_edge9.._crit_edge11_crit_edge ], [ %62, %._crit_edge11 ]
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv60
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %50, i64 %indvars.iv11, i64 %indvars.iv60
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %52
  store double %55, double* %53, align 8
  %56 = load double, double* %6, align 8
  %57 = tail call double @sqrt(double %56) #4
  %58 = load double*, double** %9, align 8
  %59 = getelementptr inbounds double, double* %58, i64 %indvars.iv60
  %60 = load double, double* %59, align 8
  %61 = fmul double %57, %60
  %62 = load [1200 x double]*, [1200 x double]** %7, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %62, i64 %indvars.iv11, i64 %indvars.iv60
  %64 = load double, double* %63, align 8
  %65 = fdiv double %64, %61
  store double %65, double* %63, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond, label %._crit_edge9, label %._crit_edge11

._crit_edge9:                                     ; preds = %._crit_edge11
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond27 = icmp ne i64 %indvars.iv.next12, 1400
  br i1 %exitcond27, label %._crit_edge9.._crit_edge11_crit_edge, label %..lr.ph_crit_edge.preheader

..lr.ph_crit_edge.preheader:                      ; preds = %._crit_edge9
  br label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %..lr.ph_crit_edge.preheader, %._crit_edge12...lr.ph_crit_edge_crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge12...lr.ph_crit_edge_crit_edge ], [ 0, %..lr.ph_crit_edge.preheader ]
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge12...lr.ph_crit_edge_crit_edge ], [ 1, %..lr.ph_crit_edge.preheader ]
  %66 = phi [1200 x double]* [ %71, %._crit_edge12...lr.ph_crit_edge_crit_edge ], [ %2, %..lr.ph_crit_edge.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv9, i64 %indvars.iv9
  store double 1.000000e+00, double* %67, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %86, %..lr.ph_crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv5, %..lr.ph_crit_edge ], [ %indvars.iv.next8, %86 ]
  %68 = phi [1200 x double]* [ %66, %..lr.ph_crit_edge ], [ %71, %86 ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv9, i64 %indvars.iv7
  store double 0.000000e+00, double* %69, align 8
  %70 = load [1200 x double]*, [1200 x double]** %7, align 8
  %71 = load [1200 x double]*, [1200 x double]** %8, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv9, i64 %indvars.iv7
  %.pre = load double, double* %72, align 8
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102, %.lr.ph
  %73 = phi double [ %.pre, %.lr.ph ], [ %85, %._crit_edge102 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %._crit_edge102 ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv, i64 %indvars.iv9
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv, i64 %indvars.iv7
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %78, %73
  store double %79, double* %72, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv9
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv7
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %84, %79
  store double %85, double* %72, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %86, label %._crit_edge102

; <label>:86:                                     ; preds = %._crit_edge102
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv7, i64 %indvars.iv9
  store double %85, double* %87, align 8
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  %exitcond26 = icmp ne i64 %indvars.iv.next8, 1200
  br i1 %exitcond26, label %.lr.ph, label %._crit_edge12

._crit_edge12:                                    ; preds = %86
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %88 = icmp slt i64 %indvars.iv.next10, 1199
  br i1 %88, label %._crit_edge12...lr.ph_crit_edge_crit_edge, label %89

._crit_edge12...lr.ph_crit_edge_crit_edge:        ; preds = %._crit_edge12
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br label %..lr.ph_crit_edge

; <label>:89:                                     ; preds = %._crit_edge12
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 1199, i64 1199
  store double 1.000000e+00, double* %90, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next, %._crit_edge2 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2

; <label>:11:                                     ; preds = %._crit_edge2._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge2._crit_edge

; <label>:17:                                     ; preds = %._crit_edge2
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp ne i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %.._crit_edge_crit_edge, label %18

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
