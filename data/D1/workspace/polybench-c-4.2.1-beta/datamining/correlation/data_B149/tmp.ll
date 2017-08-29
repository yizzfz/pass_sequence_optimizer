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
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge5

.._crit_edge_crit_edge5:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge5, %.._crit_edge_crit_edge, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %2
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.._crit_edge_crit_edge ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %._crit_edge5, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge5 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %._crit_edge5

._crit_edge5:                                     ; preds = %7
  br label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %21, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %20
  br label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph55.split.us.preheader:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  store double 1.000000e-01, double* %9, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph55.split.us

.lr.ph55.split.us:                                ; preds = %._crit_edge52.us..lr.ph55.split.us_crit_edge, %.lr.ph55.split.us.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge52.us..lr.ph55.split.us_crit_edge ], [ 0, %.lr.ph55.split.us.preheader ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv18
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr126 = shl nsw i64 %indvars.iv18, 3
  %sunkaddr127 = add i64 %sunkaddr, %sunkaddr126
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to double*
  br label %11

; <label>:11:                                     ; preds = %._crit_edge, %.lr.ph55.split.us
  %indvars.iv108 = phi i64 [ 0, %.lr.ph55.split.us ], [ %indvars.iv.next109.1.1, %._crit_edge ]
  %12 = phi double [ 0.000000e+00, %.lr.ph55.split.us ], [ %24, %._crit_edge ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv18
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr128, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv18
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr128, align 8
  %indvars.iv.next109.1 = or i64 %indvars.iv108, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next109.1, i64 %indvars.iv18
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr128, align 8
  %indvars.iv.next109.133 = or i64 %indvars.iv108, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next109.133, i64 %indvars.iv18
  %23 = load double, double* %22, align 8
  %24 = fadd double %23, %21
  store double %24, double* %sunkaddr128, align 8
  %indvars.iv.next109.1.1 = add nsw i64 %indvars.iv108, 4
  %exitcond110.1.1 = icmp eq i64 %indvars.iv.next109.1.1, 1400
  br i1 %exitcond110.1.1, label %._crit_edge52.us, label %._crit_edge

._crit_edge:                                      ; preds = %11
  br label %11

._crit_edge52.us:                                 ; preds = %11
  %25 = fdiv double %24, %0
  store double %25, double* %sunkaddr128, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond20, label %.lr.ph49.split.us.preheader, label %._crit_edge52.us..lr.ph55.split.us_crit_edge

._crit_edge52.us..lr.ph55.split.us_crit_edge:     ; preds = %._crit_edge52.us
  br label %.lr.ph55.split.us

.lr.ph49.split.us.preheader:                      ; preds = %._crit_edge52.us
  %26 = load double*, double** %8, align 8
  %27 = load double, double* %9, align 8
  br label %.lr.ph49.split.us

.lr.ph49.split.us:                                ; preds = %._crit_edge47.us..lr.ph49.split.us_crit_edge, %.lr.ph49.split.us.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge47.us..lr.ph49.split.us_crit_edge ], [ 0, %.lr.ph49.split.us.preheader ]
  %28 = phi double* [ %26, %._crit_edge47.us..lr.ph49.split.us_crit_edge ], [ %4, %.lr.ph49.split.us.preheader ]
  %29 = getelementptr inbounds double, double* %28, i64 %indvars.iv15
  store double 0.000000e+00, double* %29, align 8
  %sunkaddr134 = shl nsw i64 %indvars.iv15, 3
  %sunkaddr135 = add i64 %sunkaddr, %sunkaddr134
  %sunkaddr136 = inttoptr i64 %sunkaddr135 to double*
  %sunkaddr137 = ptrtoint double* %28 to i64
  %sunkaddr139 = add i64 %sunkaddr137, %sunkaddr134
  %sunkaddr140 = inttoptr i64 %sunkaddr139 to double*
  br label %30

; <label>:30:                                     ; preds = %._crit_edge38, %.lr.ph49.split.us
  %indvars.iv102 = phi i64 [ 0, %.lr.ph49.split.us ], [ %indvars.iv.next103.1, %._crit_edge38 ]
  %31 = phi double [ 0.000000e+00, %.lr.ph49.split.us ], [ %43, %._crit_edge38 ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv15
  %33 = load double, double* %32, align 8
  %34 = load double, double* %sunkaddr136, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %36, %31
  store double %37, double* %sunkaddr140, align 8
  %indvars.iv.next103 = or i64 %indvars.iv102, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next103, i64 %indvars.iv15
  %39 = load double, double* %38, align 8
  %40 = load double, double* %sunkaddr136, align 8
  %41 = fsub double %39, %40
  %42 = fmul double %41, %41
  %43 = fadd double %42, %37
  store double %43, double* %sunkaddr140, align 8
  %indvars.iv.next103.1 = add nuw nsw i64 %indvars.iv102, 2
  %exitcond104.1 = icmp eq i64 %indvars.iv.next103.1, 1400
  br i1 %exitcond104.1, label %._crit_edge47.us, label %._crit_edge38

._crit_edge38:                                    ; preds = %30
  br label %30

._crit_edge47.us:                                 ; preds = %30
  %44 = fdiv double %43, %0
  store double %44, double* %sunkaddr140, align 8
  %45 = getelementptr inbounds double, double* %26, i64 %indvars.iv15
  %46 = load double, double* %45, align 8
  %47 = tail call double @sqrt(double %46) #4
  %48 = fcmp ugt double %47, %27
  %49 = select i1 %48, double %47, double 1.000000e+00
  store double %49, double* %45, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %._crit_edge11.us.preheader, label %._crit_edge47.us..lr.ph49.split.us_crit_edge

._crit_edge47.us..lr.ph49.split.us_crit_edge:     ; preds = %._crit_edge47.us
  br label %.lr.ph49.split.us

._crit_edge11.us.preheader:                       ; preds = %._crit_edge47.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge42.us.._crit_edge11.us_crit_edge, %._crit_edge11.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge42.us.._crit_edge11.us_crit_edge ], [ 0, %._crit_edge11.us.preheader ]
  %50 = phi [1200 x double]* [ %64, %._crit_edge42.us.._crit_edge11.us_crit_edge ], [ %1, %._crit_edge11.us.preheader ]
  br label %51

; <label>:51:                                     ; preds = %._crit_edge39, %._crit_edge11.us
  %indvars.iv98 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next99, %._crit_edge39 ]
  %52 = phi [1200 x double]* [ %50, %._crit_edge11.us ], [ %64, %._crit_edge39 ]
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv98
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %indvars.iv12, i64 %indvars.iv98
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %58 = load double, double* %5, align 8
  %59 = tail call double @sqrt(double %58) #4
  %60 = load double*, double** %8, align 8
  %61 = getelementptr inbounds double, double* %60, i64 %indvars.iv98
  %62 = load double, double* %61, align 8
  %63 = fmul double %59, %62
  %64 = load [1200 x double]*, [1200 x double]** %6, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv12, i64 %indvars.iv98
  %66 = load double, double* %65, align 8
  %67 = fdiv double %66, %63
  store double %67, double* %65, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next99, 1200
  br i1 %exitcond100, label %._crit_edge42.us, label %._crit_edge39

._crit_edge39:                                    ; preds = %51
  br label %51

._crit_edge42.us:                                 ; preds = %51
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond14, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge42.us.._crit_edge11.us_crit_edge

._crit_edge42.us.._crit_edge11.us_crit_edge:      ; preds = %._crit_edge42.us
  br label %._crit_edge11.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge42.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge29.us-lcssa.us.us..lr.ph.us.us.preheader_crit_edge, %.lr.ph.us.us.preheader.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge29.us-lcssa.us.us..lr.ph.us.us.preheader_crit_edge ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge29.us-lcssa.us.us..lr.ph.us.us.preheader_crit_edge ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %68 = phi [1200 x double]* [ %73, %._crit_edge29.us-lcssa.us.us..lr.ph.us.us.preheader_crit_edge ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv9, i64 %indvars.iv9
  store double 1.000000e+00, double* %69, align 8
  br label %.lr.ph.us.us

._crit_edge29.us-lcssa.us.us:                     ; preds = %._crit_edge24.us.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1199
  br i1 %exitcond11, label %._crit_edge31, label %._crit_edge29.us-lcssa.us.us..lr.ph.us.us.preheader_crit_edge

._crit_edge29.us-lcssa.us.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge29.us-lcssa.us.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge24.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge24.us.us..lr.ph.us.us_crit_edge ], [ %indvars.iv5, %.lr.ph.us.us.preheader ]
  %70 = phi [1200 x double]* [ %73, %._crit_edge24.us.us..lr.ph.us.us_crit_edge ], [ %68, %.lr.ph.us.us.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv9, i64 %indvars.iv7
  store double 0.000000e+00, double* %71, align 8
  %72 = load [1200 x double]*, [1200 x double]** %6, align 8
  %73 = load [1200 x double]*, [1200 x double]** %7, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv9, i64 %indvars.iv7
  %.pre = load double, double* %74, align 8
  br label %76

._crit_edge24.us.us:                              ; preds = %76
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv7, i64 %indvars.iv9
  store double %89, double* %75, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %._crit_edge29.us-lcssa.us.us, label %._crit_edge24.us.us..lr.ph.us.us_crit_edge

._crit_edge24.us.us..lr.ph.us.us_crit_edge:       ; preds = %._crit_edge24.us.us
  br label %.lr.ph.us.us

; <label>:76:                                     ; preds = %._crit_edge40, %.lr.ph.us.us
  %77 = phi double [ %.pre, %.lr.ph.us.us ], [ %89, %._crit_edge40 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge40 ]
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv, i64 %indvars.iv9
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv, i64 %indvars.iv7
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %82, %77
  store double %83, double* %74, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv.next, i64 %indvars.iv9
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv.next, i64 %indvars.iv7
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %88, %83
  store double %89, double* %74, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge24.us.us, label %._crit_edge40

._crit_edge40:                                    ; preds = %76
  br label %76

._crit_edge31:                                    ; preds = %._crit_edge29.us-lcssa.us.us
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 1199, i64 1199
  store double 1.000000e+00, double* %90, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge2.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge3.us.._crit_edge2.us_crit_edge, %._crit_edge2.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge3.us.._crit_edge2.us_crit_edge ], [ 0, %._crit_edge2.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us._crit_edge, %._crit_edge2.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %6
  br label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %6

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge5, label %._crit_edge3.us.._crit_edge2.us_crit_edge

._crit_edge3.us.._crit_edge2.us_crit_edge:        ; preds = %._crit_edge3.us
  br label %._crit_edge2.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
