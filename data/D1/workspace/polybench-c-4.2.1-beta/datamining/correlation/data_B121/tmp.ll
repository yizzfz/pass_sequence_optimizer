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
.lr.ph51.split.us.preheader:
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
  br label %.lr.ph51.split.us

.lr.ph51.split.us:                                ; preds = %._crit_edge.us, %.lr.ph51.split.us.preheader
  %indvars.iv21 = phi i64 [ 0, %.lr.ph51.split.us.preheader ], [ %indvars.iv.next22, %._crit_edge.us ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv21
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr121 = shl nsw i64 %indvars.iv21, 3
  %sunkaddr122 = add i64 %sunkaddr, %sunkaddr121
  %sunkaddr123 = inttoptr i64 %sunkaddr122 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph51.split.us
  %indvars.iv104 = phi i64 [ 0, %.lr.ph51.split.us ], [ %indvars.iv.next105.1.1, %._crit_edge ]
  %11 = phi double [ 0.000000e+00, %.lr.ph51.split.us ], [ %23, %._crit_edge ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv21
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr123, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv21
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr123, align 8
  %indvars.iv.next105.1 = or i64 %indvars.iv104, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next105.1, i64 %indvars.iv21
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr123, align 8
  %indvars.iv.next105.134 = or i64 %indvars.iv104, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next105.134, i64 %indvars.iv21
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %sunkaddr123, align 8
  %indvars.iv.next105.1.1 = add nsw i64 %indvars.iv104, 4
  %exitcond106.1.1 = icmp eq i64 %indvars.iv.next105.1.1, 1400
  br i1 %exitcond106.1.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %24 = fdiv double %23, %0
  store double %24, double* %sunkaddr123, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond29, label %.lr.ph47.split.us.preheader, label %.lr.ph51.split.us

.lr.ph47.split.us.preheader:                      ; preds = %._crit_edge.us
  %25 = load double*, double** %8, align 8
  %26 = load double, double* %9, align 8
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %._crit_edge45.us, %.lr.ph47.split.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.lr.ph47.split.us.preheader ], [ %indvars.iv.next20, %._crit_edge45.us ]
  %27 = phi double* [ %4, %.lr.ph47.split.us.preheader ], [ %25, %._crit_edge45.us ]
  %28 = getelementptr inbounds double, double* %27, i64 %indvars.iv19
  store double 0.000000e+00, double* %28, align 8
  %sunkaddr129 = shl nsw i64 %indvars.iv19, 3
  %sunkaddr130 = add i64 %sunkaddr, %sunkaddr129
  %sunkaddr131 = inttoptr i64 %sunkaddr130 to double*
  %sunkaddr132 = ptrtoint double* %27 to i64
  %sunkaddr134 = add i64 %sunkaddr132, %sunkaddr129
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to double*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %.lr.ph47.split.us
  %indvars.iv98 = phi i64 [ 0, %.lr.ph47.split.us ], [ %indvars.iv.next99.1, %._crit_edge5 ]
  %29 = phi double [ 0.000000e+00, %.lr.ph47.split.us ], [ %41, %._crit_edge5 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv19
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr131, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %34, %29
  store double %35, double* %sunkaddr135, align 8
  %indvars.iv.next99 = or i64 %indvars.iv98, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next99, i64 %indvars.iv19
  %37 = load double, double* %36, align 8
  %38 = load double, double* %sunkaddr131, align 8
  %39 = fsub double %37, %38
  %40 = fmul double %39, %39
  %41 = fadd double %40, %35
  store double %41, double* %sunkaddr135, align 8
  %indvars.iv.next99.1 = add nuw nsw i64 %indvars.iv98, 2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next99.1, 1400
  br i1 %exitcond100.1, label %._crit_edge45.us, label %._crit_edge5

._crit_edge45.us:                                 ; preds = %._crit_edge5
  %42 = fdiv double %41, %0
  store double %42, double* %sunkaddr135, align 8
  %43 = getelementptr inbounds double, double* %25, i64 %indvars.iv19
  %44 = load double, double* %43, align 8
  %45 = tail call double @sqrt(double %44) #4
  %46 = fcmp ugt double %45, %26
  %47 = select i1 %46, double %45, double 1.000000e+00
  store double %47, double* %43, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond28, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph47.split.us

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge45.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge11._crit_edge.us, %._crit_edge9.._crit_edge11_crit_edge.us.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %48 = phi [1200 x double]* [ %61, %._crit_edge11._crit_edge.us ], [ %1, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv94 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next95, %._crit_edge11.us ]
  %49 = phi [1200 x double]* [ %48, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %61, %._crit_edge11.us ]
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv94
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %indvars.iv17, i64 %indvars.iv94
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %55 = load double, double* %5, align 8
  %56 = tail call double @sqrt(double %55) #4
  %57 = load double*, double** %8, align 8
  %58 = getelementptr inbounds double, double* %57, i64 %indvars.iv94
  %59 = load double, double* %58, align 8
  %60 = fmul double %56, %59
  %61 = load [1200 x double]*, [1200 x double]** %6, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 %indvars.iv17, i64 %indvars.iv94
  %63 = load double, double* %62, align 8
  %64 = fdiv double %63, %60
  store double %64, double* %62, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next95, 1200
  br i1 %exitcond96, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next18, 1400
  br i1 %exitcond27, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge12.us..lr.ph.us.us.preheader_crit_edge
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge12.us..lr.ph.us.us.preheader_crit_edge ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge12.us..lr.ph.us.us.preheader_crit_edge ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %65 = phi [1200 x double]* [ %71, %._crit_edge12.us..lr.ph.us.us.preheader_crit_edge ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv15, i64 %indvars.iv15
  store double 1.000000e+00, double* %66, align 8
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge24.us.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %67 = icmp slt i64 %indvars.iv.next16, 1199
  br i1 %67, label %._crit_edge12.us..lr.ph.us.us.preheader_crit_edge, label %._crit_edge12._crit_edge

._crit_edge12.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge12.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge24.us.us, %.lr.ph.us.us.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv11, %.lr.ph.us.us.preheader ], [ %indvars.iv.next14, %._crit_edge24.us.us ]
  %68 = phi [1200 x double]* [ %65, %.lr.ph.us.us.preheader ], [ %71, %._crit_edge24.us.us ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv15, i64 %indvars.iv13
  store double 0.000000e+00, double* %69, align 8
  %70 = load [1200 x double]*, [1200 x double]** %6, align 8
  %71 = load [1200 x double]*, [1200 x double]** %7, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv15, i64 %indvars.iv13
  %.pre = load double, double* %72, align 8
  br label %._crit_edge6

._crit_edge24.us.us:                              ; preds = %._crit_edge6
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv13, i64 %indvars.iv15
  store double %86, double* %73, align 8
  %indvars.iv.next14 = add nuw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %.lr.ph.us.us

._crit_edge6:                                     ; preds = %._crit_edge6, %.lr.ph.us.us
  %74 = phi double [ %.pre, %.lr.ph.us.us ], [ %86, %._crit_edge6 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge6 ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv, i64 %indvars.iv15
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv, i64 %indvars.iv13
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %79, %74
  store double %80, double* %72, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv15
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv13
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %85, %80
  store double %86, double* %72, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge24.us.us, label %._crit_edge6

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 1199, i64 1199
  store double 1.000000e+00, double* %87, align 8
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
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %6 = add i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2.us

; <label>:10:                                     ; preds = %._crit_edge2.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge2.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
