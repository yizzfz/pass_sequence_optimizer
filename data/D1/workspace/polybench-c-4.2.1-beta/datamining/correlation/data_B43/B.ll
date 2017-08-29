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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [1200 x [1200 x double]]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1200, i32* %5, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  store i8* %11, i8** %7, align 8
  %12 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %13 = bitcast [1200 x [1200 x double]]** %8 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %15 = bitcast [1200 x double]** %9 to i8**
  store i8* %14, i8** %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %17 = bitcast [1200 x double]** %10 to i8**
  store i8* %16, i8** %17, align 8
  %18 = bitcast i8* %11 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %6, [1200 x double]* %18)
  tail call void (...) @polybench_timer_start() #4
  %19 = load double, double* %6, align 8
  %20 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %8, align 8
  %21 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %20, i64 0, i64 0
  %22 = load [1200 x double]*, [1200 x double]** %9, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 0
  %24 = load [1200 x double]*, [1200 x double]** %10, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 0, i64 0
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %19, [1200 x double]* %18, [1200 x double]* %21, double* %23, double* %25)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %26 = load i32, i32* %3, align 4
  %27 = icmp sgt i32 %26, 42
  %28 = bitcast [1200 x [1200 x double]]* %20 to i8*
  %29 = bitcast [1200 x double]* %22 to i8*
  %30 = bitcast [1200 x double]* %24 to i8*
  br i1 %27, label %31, label %._crit_edge

; <label>:31:                                     ; preds = %2
  %32 = load i8**, i8*** %4, align 8
  %33 = load i8*, i8** %32, align 8
  %strcmpload = load i8, i8* %33, align 1
  %34 = icmp eq i8 %strcmpload, 0
  br i1 %34, label %35, label %._crit_edge

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %5, align 4
  tail call fastcc void @print_array(i32 %36, [1200 x double]* %21)
  br label %._crit_edge

._crit_edge:                                      ; preds = %31, %2, %35
  %37 = load i8*, i8** %7, align 8
  tail call void @free(i8* %37) #4
  tail call void @free(i8* %28) #4
  tail call void @free(i8* %29) #4
  tail call void @free(i8* %30) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv6 = phi i64 [ 0, %2 ], [ %indvars.iv.next7, %20 ]
  %3 = trunc i64 %indvars.iv6 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv6, %indvars.iv.next
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph79, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph79:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph79.split.us.preheader, label %.lr.ph79.split.preheader

.lr.ph79.split.preheader:                         ; preds = %.lr.ph79
  %10 = sext i32 %0 to i64
  %xtraiter175 = and i64 %10, 1
  %lcmp.mod176 = icmp eq i64 %xtraiter175, 0
  br i1 %lcmp.mod176, label %.lr.ph79.split.prol.loopexit, label %.lr.ph79.split.prol.preheader

.lr.ph79.split.prol.preheader:                    ; preds = %.lr.ph79.split.preheader
  br label %.lr.ph79.split.prol

.lr.ph79.split.prol:                              ; preds = %.lr.ph79.split.prol.preheader
  %11 = fdiv double 0.000000e+00, %2
  store double %11, double* %5, align 8
  br label %.lr.ph79.split.prol.loopexit

.lr.ph79.split.prol.loopexit:                     ; preds = %.lr.ph79.split.preheader, %.lr.ph79.split.prol
  %indvars.iv144.unr = phi i64 [ 0, %.lr.ph79.split.preheader ], [ 1, %.lr.ph79.split.prol ]
  %storemerge77.unr = phi i64 [ 0, %.lr.ph79.split.preheader ], [ 1, %.lr.ph79.split.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %._crit_edge.loopexit166, label %.lr.ph79.split.preheader.new

.lr.ph79.split.preheader.new:                     ; preds = %.lr.ph79.split.prol.loopexit
  br label %.lr.ph79.split

.lr.ph79.split.us.preheader:                      ; preds = %.lr.ph79
  %13 = add i32 %1, -1
  %14 = sext i32 %0 to i64
  %xtraiter139 = and i32 %1, 3
  %lcmp.mod140 = icmp eq i32 %xtraiter139, 0
  %15 = icmp ult i32 %13, 3
  %wide.trip.count135.3 = zext i32 %1 to i64
  br label %.lr.ph79.split.us

.lr.ph79.split.us:                                ; preds = %.lr.ph79.split.us.preheader, %._crit_edge74.us
  %indvars.iv141 = phi i64 [ 0, %.lr.ph79.split.us.preheader ], [ %indvars.iv.next142, %._crit_edge74.us ]
  %storemerge77.us = phi i64 [ 0, %.lr.ph79.split.us.preheader ], [ %indvars.iv.next142, %._crit_edge74.us ]
  %sext149 = shl i64 %storemerge77.us, 32
  %16 = ashr exact i64 %sext149, 32
  %17 = getelementptr inbounds double, double* %5, i64 %16
  store double 0.000000e+00, double* %17, align 8
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv141
  br i1 %lcmp.mod140, label %.prol.loopexit138, label %.lr.ph79.split.us..prol.preheader137_crit_edge

.lr.ph79.split.us..prol.preheader137_crit_edge:   ; preds = %.lr.ph79.split.us
  %.pre = load double, double* %18, align 8
  br label %.prol.preheader137

.prol.preheader137:                               ; preds = %.lr.ph79.split.us..prol.preheader137_crit_edge, %.prol.preheader137
  %19 = phi double [ %22, %.prol.preheader137 ], [ %.pre, %.lr.ph79.split.us..prol.preheader137_crit_edge ]
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %.prol.preheader137 ], [ 0, %.lr.ph79.split.us..prol.preheader137_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader137 ], [ %xtraiter139, %.lr.ph79.split.us..prol.preheader137_crit_edge ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133.prol, i64 %indvars.iv141
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %18, align 8
  %indvars.iv.next134.prol = add nuw nsw i64 %indvars.iv133.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit138.loopexit, label %.prol.preheader137, !llvm.loop !1

.prol.loopexit138.loopexit:                       ; preds = %.prol.preheader137
  br label %.prol.loopexit138

.prol.loopexit138:                                ; preds = %.prol.loopexit138.loopexit, %.lr.ph79.split.us
  %indvars.iv133.unr = phi i64 [ 0, %.lr.ph79.split.us ], [ %indvars.iv.next134.prol, %.prol.loopexit138.loopexit ]
  br i1 %15, label %.prol.loopexit138.._crit_edge74.us_crit_edge, label %.prol.loopexit138..lr.ph79.split.us.new_crit_edge

.prol.loopexit138.._crit_edge74.us_crit_edge:     ; preds = %.prol.loopexit138
  %.pre162 = load double, double* %18, align 8
  br label %._crit_edge74.us

.prol.loopexit138..lr.ph79.split.us.new_crit_edge: ; preds = %.prol.loopexit138
  %.pre161 = load double, double* %18, align 8
  br label %.lr.ph79.split.us.new

.lr.ph79.split.us.new:                            ; preds = %.prol.loopexit138..lr.ph79.split.us.new_crit_edge, %.lr.ph79.split.us.new
  %23 = phi double [ %35, %.lr.ph79.split.us.new ], [ %.pre161, %.prol.loopexit138..lr.ph79.split.us.new_crit_edge ]
  %indvars.iv133 = phi i64 [ %indvars.iv.next134.3, %.lr.ph79.split.us.new ], [ %indvars.iv133.unr, %.prol.loopexit138..lr.ph79.split.us.new_crit_edge ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv141
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %18, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134, i64 %indvars.iv141
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %18, align 8
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134.1, i64 %indvars.iv141
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %18, align 8
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134.2, i64 %indvars.iv141
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %18, align 8
  %indvars.iv.next134.3 = add nsw i64 %indvars.iv133, 4
  %exitcond136.3 = icmp eq i64 %indvars.iv.next134.3, %wide.trip.count135.3
  br i1 %exitcond136.3, label %._crit_edge74.us.loopexit, label %.lr.ph79.split.us.new

._crit_edge74.us.loopexit:                        ; preds = %.lr.ph79.split.us.new
  br label %._crit_edge74.us

._crit_edge74.us:                                 ; preds = %._crit_edge74.us.loopexit, %.prol.loopexit138.._crit_edge74.us_crit_edge
  %36 = phi double [ %.pre162, %.prol.loopexit138.._crit_edge74.us_crit_edge ], [ %35, %._crit_edge74.us.loopexit ]
  %37 = fdiv double %36, %2
  store double %37, double* %18, align 8
  %indvars.iv.next142 = add nsw i64 %indvars.iv141, 1
  %38 = icmp slt i64 %indvars.iv.next142, %14
  br i1 %38, label %.lr.ph79.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge74.us
  br label %._crit_edge

._crit_edge.loopexit166.unr-lcssa:                ; preds = %.lr.ph79.split
  br label %._crit_edge.loopexit166

._crit_edge.loopexit166:                          ; preds = %.lr.ph79.split.prol.loopexit, %._crit_edge.loopexit166.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit166, %._crit_edge.loopexit
  br i1 true, label %.lr.ph66, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph66:                                         ; preds = %._crit_edge
  br i1 %9, label %.lr.ph66.split.us.preheader, label %.lr.ph66.split.preheader

.lr.ph66.split.preheader:                         ; preds = %.lr.ph66
  %39 = sext i32 %0 to i64
  br label %.lr.ph66.split

.lr.ph66.split.us.preheader:                      ; preds = %.lr.ph66
  %40 = sext i32 %1 to i64
  %41 = sext i32 %0 to i64
  %xtraiter173 = and i64 %40, 1
  %lcmp.mod174 = icmp eq i64 %xtraiter173, 0
  %42 = icmp eq i32 %1, 1
  br label %.lr.ph66.split.us

.lr.ph66.split.us:                                ; preds = %.lr.ph66.split.us.preheader, %._crit_edge10.us
  %indvars.iv127 = phi i64 [ 0, %.lr.ph66.split.us.preheader ], [ %indvars.iv.next128, %._crit_edge10.us ]
  %storemerge165.us = phi i64 [ 0, %.lr.ph66.split.us.preheader ], [ %indvars.iv.next128, %._crit_edge10.us ]
  %sext147 = shl i64 %storemerge165.us, 32
  %43 = ashr exact i64 %sext147, 32
  %44 = getelementptr inbounds double, double* %6, i64 %43
  store double 0.000000e+00, double* %44, align 8
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv127
  %46 = getelementptr inbounds double, double* %6, i64 %indvars.iv127
  %.pre163 = load double, double* %46, align 8
  br i1 %lcmp.mod174, label %.prol.loopexit172.unr-lcssa, label %.prol.preheader171

.prol.preheader171:                               ; preds = %.lr.ph66.split.us
  br label %47

; <label>:47:                                     ; preds = %.prol.preheader171
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv127
  %49 = load double, double* %48, align 8
  %50 = load double, double* %45, align 8
  %51 = fsub double %49, %50
  %52 = fmul double %51, %51
  %53 = fadd double %.pre163, %52
  store double %53, double* %46, align 8
  br label %.prol.loopexit172.unr-lcssa

.prol.loopexit172.unr-lcssa:                      ; preds = %.lr.ph66.split.us, %47
  %.unr.ph = phi double [ %53, %47 ], [ %.pre163, %.lr.ph66.split.us ]
  %indvars.iv124.unr.ph = phi i64 [ 1, %47 ], [ 0, %.lr.ph66.split.us ]
  %.lcssa169.unr.ph = phi double [ %53, %47 ], [ undef, %.lr.ph66.split.us ]
  br label %.prol.loopexit172

.prol.loopexit172:                                ; preds = %.prol.loopexit172.unr-lcssa
  br i1 %42, label %._crit_edge62.us, label %.lr.ph66.split.us.new

.lr.ph66.split.us.new:                            ; preds = %.prol.loopexit172
  br label %57

; <label>:54:                                     ; preds = %._crit_edge62.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge62.us, %54
  %55 = phi double [ %73, %54 ], [ 1.000000e+00, %._crit_edge62.us ]
  store double %55, double* %46, align 8
  %indvars.iv.next128 = add nsw i64 %indvars.iv127, 1
  %56 = icmp slt i64 %indvars.iv.next128, %41
  br i1 %56, label %.lr.ph66.split.us, label %.._crit_edge9_crit_edge.loopexit

; <label>:57:                                     ; preds = %57, %.lr.ph66.split.us.new
  %58 = phi double [ %.unr.ph, %.lr.ph66.split.us.new ], [ %70, %57 ]
  %indvars.iv124 = phi i64 [ %indvars.iv124.unr.ph, %.lr.ph66.split.us.new ], [ %indvars.iv.next125.1, %57 ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv127
  %60 = load double, double* %59, align 8
  %61 = load double, double* %45, align 8
  %62 = fsub double %60, %61
  %63 = fmul double %62, %62
  %64 = fadd double %58, %63
  store double %64, double* %46, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next125, i64 %indvars.iv127
  %66 = load double, double* %65, align 8
  %67 = load double, double* %45, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %70 = fadd double %64, %69
  store double %70, double* %46, align 8
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  %71 = icmp slt i64 %indvars.iv.next125.1, %40
  br i1 %71, label %57, label %._crit_edge62.us.unr-lcssa

._crit_edge62.us.unr-lcssa:                       ; preds = %57
  br label %._crit_edge62.us

._crit_edge62.us:                                 ; preds = %.prol.loopexit172, %._crit_edge62.us.unr-lcssa
  %.lcssa169 = phi double [ %.lcssa169.unr.ph, %.prol.loopexit172 ], [ %70, %._crit_edge62.us.unr-lcssa ]
  %72 = fdiv double %.lcssa169, %2
  store double %72, double* %46, align 8
  %73 = tail call double @sqrt(double %72) #4
  store double %73, double* %46, align 8
  %74 = fcmp ugt double %73, 1.000000e-01
  br i1 %74, label %54, label %._crit_edge10.us

.lr.ph79.split:                                   ; preds = %.lr.ph79.split, %.lr.ph79.split.preheader.new
  %indvars.iv144 = phi i64 [ %indvars.iv144.unr, %.lr.ph79.split.preheader.new ], [ %indvars.iv.next145.1, %.lr.ph79.split ]
  %storemerge77 = phi i64 [ %storemerge77.unr, %.lr.ph79.split.preheader.new ], [ %indvars.iv.next145.1, %.lr.ph79.split ]
  %sext148 = shl i64 %storemerge77, 32
  %75 = ashr exact i64 %sext148, 32
  %76 = getelementptr inbounds double, double* %5, i64 %75
  store double 0.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds double, double* %5, i64 %indvars.iv144
  %78 = load double, double* %77, align 8
  %79 = fdiv double %78, %2
  store double %79, double* %77, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %sext148.1 = shl i64 %indvars.iv.next145, 32
  %80 = ashr exact i64 %sext148.1, 32
  %81 = getelementptr inbounds double, double* %5, i64 %80
  store double 0.000000e+00, double* %81, align 8
  %82 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next145
  %83 = load double, double* %82, align 8
  %84 = fdiv double %83, %2
  store double %84, double* %82, align 8
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  %85 = icmp slt i64 %indvars.iv.next145.1, %10
  br i1 %85, label %.lr.ph79.split, label %._crit_edge.loopexit166.unr-lcssa

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge10.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit165:              ; preds = %._crit_edge10
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit165, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %86 = icmp sgt i32 %1, 0
  br i1 %86, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge9
  br i1 %8, label %._crit_edge11.us.preheader, label %.._crit_edge12_crit_edge.loopexit85

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  %87 = sext i32 %0 to i64
  %88 = sext i32 %1 to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge52.us
  %indvars.iv122 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next123, %._crit_edge52.us ]
  br label %89

; <label>:89:                                     ; preds = %._crit_edge11.us, %89
  %indvars.iv120 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next121, %89 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv120
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv122, i64 %indvars.iv120
  %93 = load double, double* %92, align 8
  %94 = fsub double %93, %91
  store double %94, double* %92, align 8
  %95 = tail call double @sqrt(double %2) #4
  %96 = getelementptr inbounds double, double* %6, i64 %indvars.iv120
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = load double, double* %92, align 8
  %100 = fdiv double %99, %98
  store double %100, double* %92, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %101 = icmp slt i64 %indvars.iv.next121, %87
  br i1 %101, label %89, label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %89
  %indvars.iv.next123 = add nsw i64 %indvars.iv122, 1
  %102 = icmp slt i64 %indvars.iv.next123, %88
  br i1 %102, label %._crit_edge11.us, label %.._crit_edge12_crit_edge.loopexit

.lr.ph66.split:                                   ; preds = %.lr.ph66.split.preheader, %._crit_edge10
  %indvars.iv130 = phi i64 [ 0, %.lr.ph66.split.preheader ], [ %indvars.iv.next131, %._crit_edge10 ]
  %storemerge165 = phi i64 [ 0, %.lr.ph66.split.preheader ], [ %indvars.iv.next131, %._crit_edge10 ]
  %sext = shl i64 %storemerge165, 32
  %103 = ashr exact i64 %sext, 32
  %104 = getelementptr inbounds double, double* %6, i64 %103
  store double 0.000000e+00, double* %104, align 8
  %105 = getelementptr inbounds double, double* %6, i64 %indvars.iv130
  %106 = load double, double* %105, align 8
  %107 = fdiv double %106, %2
  store double %107, double* %105, align 8
  %108 = tail call double @sqrt(double %107) #4
  store double %108, double* %105, align 8
  %109 = fcmp ugt double %108, 1.000000e-01
  br i1 %109, label %110, label %._crit_edge10

; <label>:110:                                    ; preds = %.lr.ph66.split
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph66.split, %110
  %111 = phi double [ %108, %110 ], [ 1.000000e+00, %.lr.ph66.split ]
  store double %111, double* %105, align 8
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, 1
  %112 = icmp slt i64 %indvars.iv.next131, %39
  br i1 %112, label %.lr.ph66.split, label %.._crit_edge9_crit_edge.loopexit165

.._crit_edge12_crit_edge.loopexit:                ; preds = %._crit_edge52.us
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge.loopexit85:              ; preds = %._crit_edge11.lr.ph
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %.._crit_edge12_crit_edge.loopexit85, %.._crit_edge12_crit_edge.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.._crit_edge12_crit_edge, %._crit_edge9
  %113 = add nsw i32 %0, -1
  %114 = icmp sgt i32 %0, 1
  br i1 %114, label %.lr.ph29, label %170

.lr.ph29:                                         ; preds = %._crit_edge12
  br i1 %86, label %.lr.ph29.split.us.preheader, label %.lr.ph29.split.preheader

.lr.ph29.split.preheader:                         ; preds = %.lr.ph29
  %115 = add i32 %0, 1
  %116 = add i32 %0, -2
  %117 = sext i32 %113 to i64
  br label %.lr.ph29.split

.lr.ph29.split.us.preheader:                      ; preds = %.lr.ph29
  %118 = sext i32 %113 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %119 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %.lr.ph29.split.us.preheader, %._crit_edge23.us-lcssa.us.us
  %indvars.iv106 = phi i64 [ 0, %.lr.ph29.split.us.preheader ], [ %indvars.iv.next107, %._crit_edge23.us-lcssa.us.us ]
  %storemerge328.us = phi i32 [ 0, %.lr.ph29.split.us.preheader ], [ %124, %._crit_edge23.us-lcssa.us.us ]
  %120 = sext i32 %storemerge328.us to i64
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %120, i64 %120
  store double 1.000000e+00, double* %121, align 8
  %storemerge419.us = add nsw i32 %storemerge328.us, 1
  %122 = icmp slt i32 %storemerge419.us, %0
  br i1 %122, label %.lr.ph22.us, label %._crit_edge23.us-lcssa.us.us

._crit_edge23.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge17.us.us
  br label %._crit_edge23.us-lcssa.us.us

._crit_edge23.us-lcssa.us.us:                     ; preds = %._crit_edge23.us-lcssa.us.us.loopexit, %.lr.ph29.split.us
  %indvars.iv.next107 = add nsw i64 %indvars.iv106, 1
  %123 = icmp slt i64 %indvars.iv.next107, %118
  %124 = trunc i64 %indvars.iv.next107 to i32
  br i1 %123, label %.lr.ph29.split.us, label %._crit_edge30.loopexit

.lr.ph22.us:                                      ; preds = %.lr.ph29.split.us
  %125 = sext i32 %storemerge419.us to i64
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv106
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge17.us.us, %.lr.ph22.us
  %indvars.iv102 = phi i64 [ %125, %.lr.ph22.us ], [ %indvars.iv.next103, %._crit_edge17.us.us ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv106, i64 %indvars.iv102
  store double 0.000000e+00, double* %127, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %128 = load double, double* %126, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv102
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fadd double %131, 0.000000e+00
  store double %132, double* %127, align 8
  %133 = bitcast double %132 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %134 = phi i64 [ %133, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %135 = phi double [ %132, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %119, label %._crit_edge17.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge17.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %136 = bitcast double %152 to i64
  br label %._crit_edge17.us.us

._crit_edge17.us.us:                              ; preds = %._crit_edge17.us.us.loopexit, %.prol.loopexit
  %137 = phi i64 [ %134, %.prol.loopexit ], [ %136, %._crit_edge17.us.us.loopexit ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv106
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next103 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %._crit_edge23.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %140 = phi double [ %152, %.lr.ph.us.us.new ], [ %135, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv106
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv102
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %145, %140
  store double %146, double* %127, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv106
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv102
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fadd double %151, %146
  store double %152, double* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge17.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph29.split:                                   ; preds = %.lr.ph29.split.preheader, %._crit_edge23
  %indvars.iv118 = phi i64 [ 0, %.lr.ph29.split.preheader ], [ %indvars.iv.next119, %._crit_edge23 ]
  %storemerge328 = phi i32 [ 0, %.lr.ph29.split.preheader ], [ %169, %._crit_edge23 ]
  %153 = sext i32 %storemerge328 to i64
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %153, i64 %153
  store double 1.000000e+00, double* %154, align 8
  %storemerge419 = add nsw i32 %storemerge328, 1
  %155 = icmp slt i32 %storemerge419, %0
  br i1 %155, label %.lr.ph22, label %._crit_edge23

.lr.ph22:                                         ; preds = %.lr.ph29.split
  %156 = sext i32 %storemerge419 to i64
  %157 = sub i32 %115, %storemerge328
  %xtraiter116 = and i32 %157, 1
  %lcmp.mod117 = icmp eq i32 %xtraiter116, 0
  br i1 %lcmp.mod117, label %.prol.loopexit115, label %.prol.preheader114

.prol.preheader114:                               ; preds = %.lr.ph22
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv118, i64 %156
  store double 0.000000e+00, double* %158, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %156, i64 %indvars.iv118
  %160 = bitcast double* %159 to i64*
  store i64 0, i64* %160, align 8
  %indvars.iv.next109.prol = add nsw i64 %156, 1
  br label %.prol.loopexit115

.prol.loopexit115:                                ; preds = %.prol.preheader114, %.lr.ph22
  %indvars.iv108.unr.ph = phi i64 [ %indvars.iv.next109.prol, %.prol.preheader114 ], [ %156, %.lr.ph22 ]
  %161 = icmp eq i32 %116, %storemerge328
  br i1 %161, label %._crit_edge23, label %.lr.ph22.new.preheader

.lr.ph22.new.preheader:                           ; preds = %.prol.loopexit115
  br label %.lr.ph22.new

.lr.ph22.new:                                     ; preds = %.lr.ph22.new.preheader, %.lr.ph22.new
  %indvars.iv108 = phi i64 [ %indvars.iv.next109.1, %.lr.ph22.new ], [ %indvars.iv108.unr.ph, %.lr.ph22.new.preheader ]
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv118, i64 %indvars.iv108
  store double 0.000000e+00, double* %162, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv108, i64 %indvars.iv118
  %164 = bitcast double* %163 to i64*
  store i64 0, i64* %164, align 8
  %indvars.iv.next109 = add nsw i64 %indvars.iv108, 1
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv118, i64 %indvars.iv.next109
  store double 0.000000e+00, double* %165, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next109, i64 %indvars.iv118
  %167 = bitcast double* %166 to i64*
  store i64 0, i64* %167, align 8
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  %lftr.wideiv110.1 = trunc i64 %indvars.iv.next109.1 to i32
  %exitcond111.1 = icmp eq i32 %lftr.wideiv110.1, %0
  br i1 %exitcond111.1, label %._crit_edge23.loopexit, label %.lr.ph22.new

._crit_edge23.loopexit:                           ; preds = %.lr.ph22.new
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.prol.loopexit115, %.lr.ph29.split
  %indvars.iv.next119 = add nsw i64 %indvars.iv118, 1
  %168 = icmp slt i64 %indvars.iv.next119, %117
  %169 = trunc i64 %indvars.iv.next119 to i32
  br i1 %168, label %.lr.ph29.split, label %._crit_edge30.loopexit164

._crit_edge30.loopexit:                           ; preds = %._crit_edge23.us-lcssa.us.us
  br label %._crit_edge30

._crit_edge30.loopexit164:                        ; preds = %._crit_edge23
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit164, %._crit_edge30.loopexit
  br label %170

; <label>:170:                                    ; preds = %._crit_edge30, %._crit_edge12
  %171 = sext i32 %113 to i64
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %171, i64 %171
  store double 1.000000e+00, double* %172, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %22

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge6.loopexit11

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %10

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %21 = icmp slt i64 %indvars.iv.next14, %8
  br i1 %21, label %._crit_edge.us, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge6

._crit_edge6.loopexit11:                          ; preds = %._crit_edge.lr.ph
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit11, %._crit_edge6.loopexit
  br label %22

; <label>:22:                                     ; preds = %._crit_edge6, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
