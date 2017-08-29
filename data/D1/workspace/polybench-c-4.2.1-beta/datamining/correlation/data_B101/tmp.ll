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
  %exitcond = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph51:
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
  br label %.lr.ph51.split.us

.lr.ph51.split.us:                                ; preds = %._crit_edge.us, %.lr.ph51
  %indvars.iv26 = phi i64 [ 0, %.lr.ph51 ], [ %indvars.iv.next27, %._crit_edge.us ]
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv26
  store double 0.000000e+00, double* %11, align 8
  %.pre139 = shl nsw i64 %indvars.iv26, 3
  %sunkaddr53 = add i64 %10, %.pre139
  %12 = inttoptr i64 %sunkaddr53 to double*
  %13 = inttoptr i64 %sunkaddr53 to double*
  br label %.lr.ph51.split.us.new

.lr.ph51.split.us.new:                            ; preds = %.lr.ph51.split.us.new, %.lr.ph51.split.us
  %indvars.iv119 = phi i64 [ 0, %.lr.ph51.split.us ], [ %indvars.iv.next120.1.1, %.lr.ph51.split.us.new ]
  %14 = phi double [ 0.000000e+00, %.lr.ph51.split.us ], [ %26, %.lr.ph51.split.us.new ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv119, i64 %indvars.iv26
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %12, align 8
  %indvars.iv.next120 = or i64 %indvars.iv119, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next120, i64 %indvars.iv26
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %12, align 8
  %indvars.iv.next120.1 = or i64 %indvars.iv119, 2
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next120.1, i64 %indvars.iv26
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %13, align 8
  %indvars.iv.next120.136 = or i64 %indvars.iv119, 3
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next120.136, i64 %indvars.iv26
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %13, align 8
  %indvars.iv.next120.1.1 = add nsw i64 %indvars.iv119, 4
  %exitcond122.1.1 = icmp eq i64 %indvars.iv.next120.1.1, 1400
  br i1 %exitcond122.1.1, label %._crit_edge.us, label %.lr.ph51.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph51.split.us.new
  %27 = fdiv double %26, %0
  store double %27, double* %13, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond28, label %.._crit_edge_crit_edge..lr.ph47_crit_edge, label %.lr.ph51.split.us

.._crit_edge_crit_edge..lr.ph47_crit_edge:        ; preds = %._crit_edge.us
  %.pre = load double*, double** %8, align 8
  %.pre135 = load double, double* %9, align 8
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %._crit_edge45.us, %.._crit_edge_crit_edge..lr.ph47_crit_edge
  %indvars.iv23 = phi i64 [ 0, %.._crit_edge_crit_edge..lr.ph47_crit_edge ], [ %indvars.iv.next24, %._crit_edge45.us ]
  %28 = phi double* [ %4, %.._crit_edge_crit_edge..lr.ph47_crit_edge ], [ %.pre, %._crit_edge45.us ]
  %29 = getelementptr inbounds double, double* %28, i64 %indvars.iv23
  store double 0.000000e+00, double* %29, align 8
  %sunkaddr60 = shl nsw i64 %indvars.iv23, 3
  %sunkaddr63 = ptrtoint double* %28 to i64
  %sunkaddr65 = add i64 %sunkaddr63, %sunkaddr60
  %30 = inttoptr i64 %sunkaddr65 to double*
  %sunkaddr171 = add i64 %10, %sunkaddr60
  %sunkaddr172 = inttoptr i64 %sunkaddr171 to double*
  br label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.lr.ph47.split.us, %.lr.ph47.split.us.new
  %indvars.iv103 = phi i64 [ %indvars.iv.next104.1, %.lr.ph47.split.us.new ], [ 0, %.lr.ph47.split.us ]
  %31 = phi double [ %43, %.lr.ph47.split.us.new ], [ 0.000000e+00, %.lr.ph47.split.us ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv23
  %33 = load double, double* %32, align 8
  %34 = load double, double* %sunkaddr172, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %36, %31
  store double %37, double* %30, align 8
  %indvars.iv.next104 = or i64 %indvars.iv103, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next104, i64 %indvars.iv23
  %39 = load double, double* %38, align 8
  %40 = load double, double* %sunkaddr172, align 8
  %41 = fsub double %39, %40
  %42 = fmul double %41, %41
  %43 = fadd double %42, %37
  store double %43, double* %30, align 8
  %indvars.iv.next104.1 = add nuw nsw i64 %indvars.iv103, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next104.1, 1400
  br i1 %exitcond106.1, label %._crit_edge45.us, label %.lr.ph47.split.us.new

._crit_edge45.us:                                 ; preds = %.lr.ph47.split.us.new
  %44 = fdiv double %43, %0
  store double %44, double* %30, align 8
  %45 = getelementptr inbounds double, double* %.pre, i64 %indvars.iv23
  %46 = load double, double* %45, align 8
  %47 = tail call double @sqrt(double %46) #4
  %48 = fcmp ugt double %47, %.pre135
  %49 = select i1 %48, double %47, double 1.000000e+00
  store double %49, double* %45, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond25, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph47.split.us

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge45.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %50 = phi [1200 x double]* [ %63, %._crit_edge11._crit_edge.us ], [ %1, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv98 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next99, %._crit_edge11.us ]
  %51 = phi [1200 x double]* [ %50, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %63, %._crit_edge11.us ]
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv98
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %51, i64 %indvars.iv20, i64 %indvars.iv98
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %57 = load double, double* %5, align 8
  %58 = tail call double @sqrt(double %57) #4
  %59 = load double*, double** %8, align 8
  %60 = getelementptr inbounds double, double* %59, i64 %indvars.iv98
  %61 = load double, double* %60, align 8
  %62 = fmul double %58, %61
  %63 = load [1200 x double]*, [1200 x double]** %6, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv20, i64 %indvars.iv98
  %65 = load double, double* %64, align 8
  %66 = fdiv double %65, %62
  store double %66, double* %64, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, 1200
  br i1 %exitcond101, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1400
  br i1 %exitcond22, label %.lr.ph30.split.us.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph30.split.us.preheader:                      ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge12.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge12.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge12.us ], [ 1, %.lr.ph30.split.us.preheader ]
  %67 = phi [1200 x double]* [ %72, %._crit_edge12.us ], [ %2, %.lr.ph30.split.us.preheader ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv17, i64 %indvars.iv17
  store double 1.000000e+00, double* %68, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1199
  br i1 %exitcond19, label %._crit_edge12._crit_edge, label %.lr.ph30.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, %.lr.ph30.split.us
  %indvars.iv15 = phi i64 [ %indvars.iv13, %.lr.ph30.split.us ], [ %indvars.iv.next16, %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge ]
  %69 = phi [1200 x double]* [ %67, %.lr.ph30.split.us ], [ %72, %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv17, i64 %indvars.iv15
  store double 0.000000e+00, double* %70, align 8
  %71 = load [1200 x double]*, [1200 x double]** %6, align 8
  %72 = load [1200 x double]*, [1200 x double]** %7, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv17, i64 %indvars.iv15
  %.pre136 = load double, double* %73, align 8
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %74 = phi double [ %86, %.lr.ph.us.us.new ], [ %.pre136, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv, i64 %indvars.iv17
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv, i64 %indvars.iv15
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %79, %74
  store double %80, double* %73, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv.next, i64 %indvars.iv17
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv.next, i64 %indvars.iv15
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %85, %80
  store double %86, double* %73, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge:   ; preds = %.lr.ph.us.us.new
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv15, i64 %indvars.iv17
  store double %86, double* %87, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %.lr.ph.us.us

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 1199, i64 1199
  store double 1.000000e+00, double* %88, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.._crit_edge_crit_edge.us.preheader ], [ %indvars.iv.next2, %._crit_edge._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
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
