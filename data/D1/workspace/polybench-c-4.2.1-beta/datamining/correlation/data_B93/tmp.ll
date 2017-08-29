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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv2 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %20 ]
  %3 = trunc i64 %indvars.iv2 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2
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
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph55:
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
  %10 = ptrtoint double* %3 to i64
  br label %.lr.ph55.split.us

.lr.ph55.split.us:                                ; preds = %._crit_edge52.us, %.lr.ph55
  %indvars.iv48 = phi i64 [ 0, %.lr.ph55 ], [ %indvars.iv.next49, %._crit_edge52.us ]
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  store double 0.000000e+00, double* %11, align 8
  %.pre143 = shl nsw i64 %indvars.iv48, 3
  %sunkaddr57 = add i64 %10, %.pre143
  %12 = inttoptr i64 %sunkaddr57 to double*
  %13 = inttoptr i64 %sunkaddr57 to double*
  br label %.lr.ph55.split.us.new

.lr.ph55.split.us.new:                            ; preds = %.lr.ph55.split.us.new, %.lr.ph55.split.us
  %indvars.iv123 = phi i64 [ 0, %.lr.ph55.split.us ], [ %indvars.iv.next124.1.1, %.lr.ph55.split.us.new ]
  %14 = phi double [ 0.000000e+00, %.lr.ph55.split.us ], [ %26, %.lr.ph55.split.us.new ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv48
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %12, align 8
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv48
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %12, align 8
  %indvars.iv.next124.1 = or i64 %indvars.iv123, 2
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next124.1, i64 %indvars.iv48
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %13, align 8
  %indvars.iv.next124.158 = or i64 %indvars.iv123, 3
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next124.158, i64 %indvars.iv48
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %13, align 8
  %indvars.iv.next124.1.1 = add nsw i64 %indvars.iv123, 4
  %exitcond126.1.1 = icmp eq i64 %indvars.iv.next124.1.1, 1400
  br i1 %exitcond126.1.1, label %._crit_edge52.us, label %.lr.ph55.split.us.new

._crit_edge52.us:                                 ; preds = %.lr.ph55.split.us.new
  %27 = fdiv double %26, %0
  store double %27, double* %13, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 1200
  br i1 %exitcond50, label %._crit_edge9..lr.ph49_crit_edge, label %.lr.ph55.split.us

._crit_edge9..lr.ph49_crit_edge:                  ; preds = %._crit_edge52.us
  %.pre = load double*, double** %8, align 8
  %.pre139 = load double, double* %9, align 8
  br label %.lr.ph49.split.us

.lr.ph49.split.us:                                ; preds = %._crit_edge47.us, %._crit_edge9..lr.ph49_crit_edge
  %indvars.iv45 = phi i64 [ 0, %._crit_edge9..lr.ph49_crit_edge ], [ %indvars.iv.next46, %._crit_edge47.us ]
  %28 = phi double* [ %4, %._crit_edge9..lr.ph49_crit_edge ], [ %.pre, %._crit_edge47.us ]
  %29 = getelementptr inbounds double, double* %28, i64 %indvars.iv45
  store double 0.000000e+00, double* %29, align 8
  %sunkaddr64 = shl nsw i64 %indvars.iv45, 3
  %sunkaddr67 = ptrtoint double* %28 to i64
  %sunkaddr69 = add i64 %sunkaddr67, %sunkaddr64
  %30 = inttoptr i64 %sunkaddr69 to double*
  %sunkaddr175 = add i64 %10, %sunkaddr64
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to double*
  br label %.lr.ph49.split.us.new

.lr.ph49.split.us.new:                            ; preds = %.lr.ph49.split.us, %.lr.ph49.split.us.new
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %.lr.ph49.split.us.new ], [ 0, %.lr.ph49.split.us ]
  %31 = phi double [ %43, %.lr.ph49.split.us.new ], [ 0.000000e+00, %.lr.ph49.split.us ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv45
  %33 = load double, double* %32, align 8
  %34 = load double, double* %sunkaddr176, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %36, %31
  store double %37, double* %30, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next108, i64 %indvars.iv45
  %39 = load double, double* %38, align 8
  %40 = load double, double* %sunkaddr176, align 8
  %41 = fsub double %39, %40
  %42 = fmul double %41, %41
  %43 = fadd double %42, %37
  store double %43, double* %30, align 8
  %indvars.iv.next108.1 = add nuw nsw i64 %indvars.iv107, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next108.1, 1400
  br i1 %exitcond110.1, label %._crit_edge47.us, label %.lr.ph49.split.us.new

._crit_edge47.us:                                 ; preds = %.lr.ph49.split.us.new
  %44 = fdiv double %43, %0
  store double %44, double* %30, align 8
  %45 = getelementptr inbounds double, double* %.pre, i64 %indvars.iv45
  %46 = load double, double* %45, align 8
  %47 = tail call double @sqrt(double %46) #4
  %48 = fcmp ugt double %47, %.pre139
  %49 = select i1 %48, double %47, double 1.000000e+00
  store double %49, double* %45, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond47, label %._crit_edge11.us.preheader, label %.lr.ph49.split.us

._crit_edge11.us.preheader:                       ; preds = %._crit_edge47.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge42.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge42.us ], [ 0, %._crit_edge11.us.preheader ]
  %50 = phi [1200 x double]* [ %64, %._crit_edge42.us ], [ %1, %._crit_edge11.us.preheader ]
  br label %51

; <label>:51:                                     ; preds = %51, %._crit_edge11.us
  %indvars.iv102 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next103, %51 ]
  %52 = phi [1200 x double]* [ %50, %._crit_edge11.us ], [ %64, %51 ]
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv102
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %indvars.iv42, i64 %indvars.iv102
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %58 = load double, double* %5, align 8
  %59 = tail call double @sqrt(double %58) #4
  %60 = load double*, double** %8, align 8
  %61 = getelementptr inbounds double, double* %60, i64 %indvars.iv102
  %62 = load double, double* %61, align 8
  %63 = fmul double %59, %62
  %64 = load [1200 x double]*, [1200 x double]** %6, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv42, i64 %indvars.iv102
  %66 = load double, double* %65, align 8
  %67 = fdiv double %66, %63
  store double %67, double* %65, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 1200
  br i1 %exitcond105, label %._crit_edge42.us, label %51

._crit_edge42.us:                                 ; preds = %51
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next43, 1400
  br i1 %exitcond44, label %.lr.ph30.split.us.preheader, label %._crit_edge11.us

.lr.ph30.split.us.preheader:                      ; preds = %._crit_edge42.us
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge29.us-lcssa.us.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge29.us-lcssa.us.us ], [ 1, %.lr.ph30.split.us.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge29.us-lcssa.us.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %68 = phi [1200 x double]* [ %73, %._crit_edge29.us-lcssa.us.us ], [ %2, %.lr.ph30.split.us.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv27, i64 %indvars.iv27
  store double 1.000000e+00, double* %69, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  br label %.lr.ph.us.us

._crit_edge29.us-lcssa.us.us:                     ; preds = %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 1199
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  br i1 %exitcond29, label %._crit_edge31, label %.lr.ph30.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, %.lr.ph30.split.us
  %indvars.iv40 = phi i64 [ %indvars.iv38, %.lr.ph30.split.us ], [ %indvars.iv.next41, %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge ]
  %70 = phi [1200 x double]* [ %68, %.lr.ph30.split.us ], [ %73, %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv27, i64 %indvars.iv40
  store double 0.000000e+00, double* %71, align 8
  %72 = load [1200 x double]*, [1200 x double]** %6, align 8
  %73 = load [1200 x double]*, [1200 x double]** %7, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv27, i64 %indvars.iv40
  %.pre140 = load double, double* %74, align 8
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %75 = phi double [ %87, %.lr.ph.us.us.new ], [ %.pre140, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv, i64 %indvars.iv27
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv, i64 %indvars.iv40
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %74, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv.next, i64 %indvars.iv27
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv.next, i64 %indvars.iv40
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fadd double %86, %81
  store double %87, double* %74, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge:   ; preds = %.lr.ph.us.us.new
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv40, i64 %indvars.iv27
  store double %87, double* %88, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond, label %._crit_edge29.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge31:                                    ; preds = %._crit_edge29.us-lcssa.us.us
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 1199, i64 1199
  store double 1.000000e+00, double* %89, align 8
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

._crit_edge2.us:                                  ; preds = %._crit_edge3.us, %._crit_edge2.us.preheader
  %indvars.iv1 = phi i64 [ 0, %._crit_edge2.us.preheader ], [ %indvars.iv.next2, %._crit_edge3.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %._crit_edge2.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %6

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge5, label %._crit_edge2.us

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
