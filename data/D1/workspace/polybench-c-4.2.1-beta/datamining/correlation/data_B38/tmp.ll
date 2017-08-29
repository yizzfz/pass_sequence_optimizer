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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
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
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv6 = phi i64 [ 0, %4 ], [ %indvars.iv.next7, %22 ]
  %5 = trunc i64 %indvars.iv6 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv6, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv6, %indvars.iv.next
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  br i1 true, label %.lr.ph79, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph79:                                         ; preds = %7
  br i1 true, label %.lr.ph79.split.us.preheader, label %.lr.ph79.split.preheader

.lr.ph79.split.preheader:                         ; preds = %.lr.ph79
  br i1 true, label %.lr.ph79.split.prol.loopexit, label %.lr.ph79.split.prol.preheader

.lr.ph79.split.prol.preheader:                    ; preds = %.lr.ph79.split.preheader
  br label %.lr.ph79.split.prol

.lr.ph79.split.prol:                              ; preds = %.lr.ph79.split.prol.preheader
  %8 = fdiv double 0.000000e+00, %2
  store double %8, double* %5, align 8
  br label %.lr.ph79.split.prol.loopexit

.lr.ph79.split.prol.loopexit:                     ; preds = %.lr.ph79.split.preheader, %.lr.ph79.split.prol
  %indvars.iv144.unr = phi i64 [ 0, %.lr.ph79.split.preheader ], [ 1, %.lr.ph79.split.prol ]
  %storemerge77.unr = phi i64 [ 0, %.lr.ph79.split.preheader ], [ 1, %.lr.ph79.split.prol ]
  br i1 false, label %._crit_edge.loopexit166, label %.lr.ph79.split.preheader.new

.lr.ph79.split.preheader.new:                     ; preds = %.lr.ph79.split.prol.loopexit
  br label %.lr.ph79.split

.lr.ph79.split.us.preheader:                      ; preds = %.lr.ph79
  br label %.lr.ph79.split.us

.lr.ph79.split.us:                                ; preds = %.lr.ph79.split.us.preheader, %._crit_edge74.us
  %indvars.iv141 = phi i64 [ 0, %.lr.ph79.split.us.preheader ], [ %indvars.iv.next142, %._crit_edge74.us ]
  %storemerge77.us = phi i64 [ 0, %.lr.ph79.split.us.preheader ], [ %indvars.iv.next142, %._crit_edge74.us ]
  %sext149 = shl i64 %storemerge77.us, 32
  %9 = ashr exact i64 %sext149, 32
  %10 = getelementptr inbounds double, double* %5, i64 %9
  store double 0.000000e+00, double* %10, align 8
  %11 = getelementptr inbounds double, double* %5, i64 %indvars.iv141
  br i1 true, label %.prol.loopexit138, label %.lr.ph79.split.us..prol.preheader137_crit_edge

.lr.ph79.split.us..prol.preheader137_crit_edge:   ; preds = %.lr.ph79.split.us
  %.pre = load double, double* %11, align 8
  br label %.prol.preheader137

.prol.preheader137:                               ; preds = %.lr.ph79.split.us..prol.preheader137_crit_edge, %.prol.preheader137
  %12 = phi double [ %15, %.prol.preheader137 ], [ %.pre, %.lr.ph79.split.us..prol.preheader137_crit_edge ]
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %.prol.preheader137 ], [ 0, %.lr.ph79.split.us..prol.preheader137_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader137 ], [ 0, %.lr.ph79.split.us..prol.preheader137_crit_edge ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133.prol, i64 %indvars.iv141
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %11, align 8
  %indvars.iv.next134.prol = add nuw nsw i64 %indvars.iv133.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit138.loopexit, label %.prol.preheader137, !llvm.loop !1

.prol.loopexit138.loopexit:                       ; preds = %.prol.preheader137
  br label %.prol.loopexit138

.prol.loopexit138:                                ; preds = %.prol.loopexit138.loopexit, %.lr.ph79.split.us
  %indvars.iv133.unr = phi i64 [ 0, %.lr.ph79.split.us ], [ %indvars.iv.next134.prol, %.prol.loopexit138.loopexit ]
  br i1 false, label %.prol.loopexit138.._crit_edge74.us_crit_edge, label %.prol.loopexit138..lr.ph79.split.us.new_crit_edge

.prol.loopexit138.._crit_edge74.us_crit_edge:     ; preds = %.prol.loopexit138
  %.pre162 = load double, double* %11, align 8
  br label %._crit_edge74.us

.prol.loopexit138..lr.ph79.split.us.new_crit_edge: ; preds = %.prol.loopexit138
  %.pre161 = load double, double* %11, align 8
  br label %.lr.ph79.split.us.new

.lr.ph79.split.us.new:                            ; preds = %.prol.loopexit138..lr.ph79.split.us.new_crit_edge, %.lr.ph79.split.us.new
  %16 = phi double [ %28, %.lr.ph79.split.us.new ], [ %.pre161, %.prol.loopexit138..lr.ph79.split.us.new_crit_edge ]
  %indvars.iv133 = phi i64 [ %indvars.iv.next134.3, %.lr.ph79.split.us.new ], [ %indvars.iv133.unr, %.prol.loopexit138..lr.ph79.split.us.new_crit_edge ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv141
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %11, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134, i64 %indvars.iv141
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %11, align 8
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134.1, i64 %indvars.iv141
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %11, align 8
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134.2, i64 %indvars.iv141
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %11, align 8
  %indvars.iv.next134.3 = add nsw i64 %indvars.iv133, 4
  %exitcond136.3 = icmp eq i64 %indvars.iv.next134.3, 1400
  br i1 %exitcond136.3, label %._crit_edge74.us.loopexit, label %.lr.ph79.split.us.new

._crit_edge74.us.loopexit:                        ; preds = %.lr.ph79.split.us.new
  br label %._crit_edge74.us

._crit_edge74.us:                                 ; preds = %._crit_edge74.us.loopexit, %.prol.loopexit138.._crit_edge74.us_crit_edge
  %29 = phi double [ %.pre162, %.prol.loopexit138.._crit_edge74.us_crit_edge ], [ %28, %._crit_edge74.us.loopexit ]
  %30 = fdiv double %29, %2
  store double %30, double* %11, align 8
  %indvars.iv.next142 = add nsw i64 %indvars.iv141, 1
  %31 = icmp slt i64 %indvars.iv.next142, 1200
  br i1 %31, label %.lr.ph79.split.us, label %._crit_edge.loopexit

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
  br i1 true, label %.lr.ph66.split.us.preheader, label %.lr.ph66.split.preheader

.lr.ph66.split.preheader:                         ; preds = %.lr.ph66
  br label %.lr.ph66.split

.lr.ph66.split.us.preheader:                      ; preds = %.lr.ph66
  br label %.lr.ph66.split.us

.lr.ph66.split.us:                                ; preds = %.lr.ph66.split.us.preheader, %._crit_edge10.us
  %indvars.iv127 = phi i64 [ 0, %.lr.ph66.split.us.preheader ], [ %indvars.iv.next128, %._crit_edge10.us ]
  %storemerge165.us = phi i64 [ 0, %.lr.ph66.split.us.preheader ], [ %indvars.iv.next128, %._crit_edge10.us ]
  %sext147 = shl i64 %storemerge165.us, 32
  %32 = ashr exact i64 %sext147, 32
  %33 = getelementptr inbounds double, double* %6, i64 %32
  store double 0.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv127
  %35 = getelementptr inbounds double, double* %6, i64 %indvars.iv127
  %.pre163 = load double, double* %35, align 8
  br i1 true, label %.prol.loopexit172.unr-lcssa, label %.prol.preheader171

.prol.preheader171:                               ; preds = %.lr.ph66.split.us
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader171
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv127
  %38 = load double, double* %37, align 8
  %39 = load double, double* %34, align 8
  %40 = fsub double %38, %39
  %41 = fmul double %40, %40
  %42 = fadd double %.pre163, %41
  store double %42, double* %35, align 8
  br label %.prol.loopexit172.unr-lcssa

.prol.loopexit172.unr-lcssa:                      ; preds = %.lr.ph66.split.us, %36
  %.unr.ph = phi double [ %42, %36 ], [ %.pre163, %.lr.ph66.split.us ]
  %indvars.iv124.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph66.split.us ]
  %.lcssa169.unr.ph = phi double [ %42, %36 ], [ undef, %.lr.ph66.split.us ]
  br label %.prol.loopexit172

.prol.loopexit172:                                ; preds = %.prol.loopexit172.unr-lcssa
  br i1 false, label %._crit_edge62.us, label %.lr.ph66.split.us.new

.lr.ph66.split.us.new:                            ; preds = %.prol.loopexit172
  br label %46

; <label>:43:                                     ; preds = %._crit_edge62.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge62.us, %43
  %44 = phi double [ %62, %43 ], [ 1.000000e+00, %._crit_edge62.us ]
  store double %44, double* %35, align 8
  %indvars.iv.next128 = add nsw i64 %indvars.iv127, 1
  %45 = icmp slt i64 %indvars.iv.next128, 1200
  br i1 %45, label %.lr.ph66.split.us, label %.._crit_edge9_crit_edge.loopexit

; <label>:46:                                     ; preds = %46, %.lr.ph66.split.us.new
  %47 = phi double [ %.unr.ph, %.lr.ph66.split.us.new ], [ %59, %46 ]
  %indvars.iv124 = phi i64 [ %indvars.iv124.unr.ph, %.lr.ph66.split.us.new ], [ %indvars.iv.next125.1, %46 ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv127
  %49 = load double, double* %48, align 8
  %50 = load double, double* %34, align 8
  %51 = fsub double %49, %50
  %52 = fmul double %51, %51
  %53 = fadd double %47, %52
  store double %53, double* %35, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next125, i64 %indvars.iv127
  %55 = load double, double* %54, align 8
  %56 = load double, double* %34, align 8
  %57 = fsub double %55, %56
  %58 = fmul double %57, %57
  %59 = fadd double %53, %58
  store double %59, double* %35, align 8
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  %60 = icmp slt i64 %indvars.iv.next125.1, 1400
  br i1 %60, label %46, label %._crit_edge62.us.unr-lcssa

._crit_edge62.us.unr-lcssa:                       ; preds = %46
  br label %._crit_edge62.us

._crit_edge62.us:                                 ; preds = %.prol.loopexit172, %._crit_edge62.us.unr-lcssa
  %.lcssa169 = phi double [ %.lcssa169.unr.ph, %.prol.loopexit172 ], [ %59, %._crit_edge62.us.unr-lcssa ]
  %61 = fdiv double %.lcssa169, %2
  store double %61, double* %35, align 8
  %62 = tail call double @sqrt(double %61) #4
  store double %62, double* %35, align 8
  %63 = fcmp ugt double %62, 1.000000e-01
  br i1 %63, label %43, label %._crit_edge10.us

.lr.ph79.split:                                   ; preds = %.lr.ph79.split, %.lr.ph79.split.preheader.new
  %indvars.iv144 = phi i64 [ %indvars.iv144.unr, %.lr.ph79.split.preheader.new ], [ %indvars.iv.next145.1, %.lr.ph79.split ]
  %storemerge77 = phi i64 [ %storemerge77.unr, %.lr.ph79.split.preheader.new ], [ %indvars.iv.next145.1, %.lr.ph79.split ]
  %sext148 = shl i64 %storemerge77, 32
  %64 = ashr exact i64 %sext148, 32
  %65 = getelementptr inbounds double, double* %5, i64 %64
  store double 0.000000e+00, double* %65, align 8
  %66 = getelementptr inbounds double, double* %5, i64 %indvars.iv144
  %67 = load double, double* %66, align 8
  %68 = fdiv double %67, %2
  store double %68, double* %66, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %sext148.1 = shl i64 %indvars.iv.next145, 32
  %69 = ashr exact i64 %sext148.1, 32
  %70 = getelementptr inbounds double, double* %5, i64 %69
  store double 0.000000e+00, double* %70, align 8
  %71 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next145
  %72 = load double, double* %71, align 8
  %73 = fdiv double %72, %2
  store double %73, double* %71, align 8
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  %74 = icmp slt i64 %indvars.iv.next145.1, 1200
  br i1 %74, label %.lr.ph79.split, label %._crit_edge.loopexit166.unr-lcssa

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge10.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit165:              ; preds = %._crit_edge10
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit165, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  br i1 true, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge9
  br i1 true, label %._crit_edge11.us.preheader, label %.._crit_edge12_crit_edge.loopexit85

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge52.us
  %indvars.iv122 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next123, %._crit_edge52.us ]
  br label %75

; <label>:75:                                     ; preds = %._crit_edge11.us, %75
  %indvars.iv120 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next121, %75 ]
  %76 = getelementptr inbounds double, double* %5, i64 %indvars.iv120
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv122, i64 %indvars.iv120
  %79 = load double, double* %78, align 8
  %80 = fsub double %79, %77
  store double %80, double* %78, align 8
  %81 = tail call double @sqrt(double %2) #4
  %82 = getelementptr inbounds double, double* %6, i64 %indvars.iv120
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = load double, double* %78, align 8
  %86 = fdiv double %85, %84
  store double %86, double* %78, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %87 = icmp slt i64 %indvars.iv.next121, 1200
  br i1 %87, label %75, label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %75
  %indvars.iv.next123 = add nsw i64 %indvars.iv122, 1
  %88 = icmp slt i64 %indvars.iv.next123, 1400
  br i1 %88, label %._crit_edge11.us, label %.._crit_edge12_crit_edge.loopexit

.lr.ph66.split:                                   ; preds = %.lr.ph66.split.preheader, %._crit_edge10
  %indvars.iv130 = phi i64 [ 0, %.lr.ph66.split.preheader ], [ %indvars.iv.next131, %._crit_edge10 ]
  %storemerge165 = phi i64 [ 0, %.lr.ph66.split.preheader ], [ %indvars.iv.next131, %._crit_edge10 ]
  %sext = shl i64 %storemerge165, 32
  %89 = ashr exact i64 %sext, 32
  %90 = getelementptr inbounds double, double* %6, i64 %89
  store double 0.000000e+00, double* %90, align 8
  %91 = getelementptr inbounds double, double* %6, i64 %indvars.iv130
  %92 = load double, double* %91, align 8
  %93 = fdiv double %92, %2
  store double %93, double* %91, align 8
  %94 = tail call double @sqrt(double %93) #4
  store double %94, double* %91, align 8
  %95 = fcmp ugt double %94, 1.000000e-01
  br i1 %95, label %96, label %._crit_edge10

; <label>:96:                                     ; preds = %.lr.ph66.split
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph66.split, %96
  %97 = phi double [ %94, %96 ], [ 1.000000e+00, %.lr.ph66.split ]
  store double %97, double* %91, align 8
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, 1
  %98 = icmp slt i64 %indvars.iv.next131, 1200
  br i1 %98, label %.lr.ph66.split, label %.._crit_edge9_crit_edge.loopexit165

.._crit_edge12_crit_edge.loopexit:                ; preds = %._crit_edge52.us
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge.loopexit85:              ; preds = %._crit_edge11.lr.ph
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %.._crit_edge12_crit_edge.loopexit85, %.._crit_edge12_crit_edge.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.._crit_edge12_crit_edge, %._crit_edge9
  br i1 true, label %.lr.ph29, label %149

.lr.ph29:                                         ; preds = %._crit_edge12
  br i1 true, label %.lr.ph29.split.us.preheader, label %.lr.ph29.split.preheader

.lr.ph29.split.preheader:                         ; preds = %.lr.ph29
  br label %.lr.ph29.split

.lr.ph29.split.us.preheader:                      ; preds = %.lr.ph29
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %.lr.ph29.split.us.preheader, %._crit_edge23.us-lcssa.us.us
  %indvars.iv106 = phi i64 [ 0, %.lr.ph29.split.us.preheader ], [ %indvars.iv.next107, %._crit_edge23.us-lcssa.us.us ]
  %storemerge328.us = phi i32 [ 0, %.lr.ph29.split.us.preheader ], [ %103, %._crit_edge23.us-lcssa.us.us ]
  %99 = sext i32 %storemerge328.us to i64
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %99, i64 %99
  store double 1.000000e+00, double* %100, align 8
  %storemerge419.us = add nsw i32 %storemerge328.us, 1
  %101 = icmp slt i32 %storemerge419.us, 1200
  br i1 %101, label %.lr.ph22.us, label %._crit_edge23.us-lcssa.us.us

._crit_edge23.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge17.us.us
  br label %._crit_edge23.us-lcssa.us.us

._crit_edge23.us-lcssa.us.us:                     ; preds = %._crit_edge23.us-lcssa.us.us.loopexit, %.lr.ph29.split.us
  %indvars.iv.next107 = add nsw i64 %indvars.iv106, 1
  %102 = icmp slt i64 %indvars.iv.next107, 1199
  %103 = trunc i64 %indvars.iv.next107 to i32
  br i1 %102, label %.lr.ph29.split.us, label %._crit_edge30.loopexit

.lr.ph22.us:                                      ; preds = %.lr.ph29.split.us
  %104 = sext i32 %storemerge419.us to i64
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv106
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge17.us.us, %.lr.ph22.us
  %indvars.iv102 = phi i64 [ %104, %.lr.ph22.us ], [ %indvars.iv.next103, %._crit_edge17.us.us ]
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv106, i64 %indvars.iv102
  store double 0.000000e+00, double* %106, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %107 = load double, double* %105, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv102
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fadd double %110, 0.000000e+00
  store double %111, double* %106, align 8
  %112 = bitcast double %111 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %113 = phi i64 [ %112, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %114 = phi double [ %111, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge17.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge17.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %115 = bitcast double %131 to i64
  br label %._crit_edge17.us.us

._crit_edge17.us.us:                              ; preds = %._crit_edge17.us.us.loopexit, %.prol.loopexit
  %116 = phi i64 [ %113, %.prol.loopexit ], [ %115, %._crit_edge17.us.us.loopexit ]
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv106
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next103 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 1200
  br i1 %exitcond, label %._crit_edge23.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %119 = phi double [ %131, %.lr.ph.us.us.new ], [ %114, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv106
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv102
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fadd double %124, %119
  store double %125, double* %106, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv106
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv102
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fadd double %130, %125
  store double %131, double* %106, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge17.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph29.split:                                   ; preds = %.lr.ph29.split.preheader, %._crit_edge23
  %indvars.iv118 = phi i64 [ 0, %.lr.ph29.split.preheader ], [ %indvars.iv.next119, %._crit_edge23 ]
  %storemerge328 = phi i32 [ 0, %.lr.ph29.split.preheader ], [ %148, %._crit_edge23 ]
  %132 = sext i32 %storemerge328 to i64
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %132, i64 %132
  store double 1.000000e+00, double* %133, align 8
  %storemerge419 = add nsw i32 %storemerge328, 1
  %134 = icmp slt i32 %storemerge419, 1200
  br i1 %134, label %.lr.ph22, label %._crit_edge23

.lr.ph22:                                         ; preds = %.lr.ph29.split
  %135 = sext i32 %storemerge419 to i64
  %136 = sub i32 1201, %storemerge328
  %xtraiter116 = and i32 %136, 1
  %lcmp.mod117 = icmp eq i32 %xtraiter116, 0
  br i1 %lcmp.mod117, label %.prol.loopexit115, label %.prol.preheader114

.prol.preheader114:                               ; preds = %.lr.ph22
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv118, i64 %135
  store double 0.000000e+00, double* %137, align 8
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %135, i64 %indvars.iv118
  %139 = bitcast double* %138 to i64*
  store i64 0, i64* %139, align 8
  %indvars.iv.next109.prol = add nsw i64 %135, 1
  br label %.prol.loopexit115

.prol.loopexit115:                                ; preds = %.prol.preheader114, %.lr.ph22
  %indvars.iv108.unr.ph = phi i64 [ %indvars.iv.next109.prol, %.prol.preheader114 ], [ %135, %.lr.ph22 ]
  %140 = icmp eq i32 1198, %storemerge328
  br i1 %140, label %._crit_edge23, label %.lr.ph22.new.preheader

.lr.ph22.new.preheader:                           ; preds = %.prol.loopexit115
  br label %.lr.ph22.new

.lr.ph22.new:                                     ; preds = %.lr.ph22.new.preheader, %.lr.ph22.new
  %indvars.iv108 = phi i64 [ %indvars.iv.next109.1, %.lr.ph22.new ], [ %indvars.iv108.unr.ph, %.lr.ph22.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv118, i64 %indvars.iv108
  store double 0.000000e+00, double* %141, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv108, i64 %indvars.iv118
  %143 = bitcast double* %142 to i64*
  store i64 0, i64* %143, align 8
  %indvars.iv.next109 = add nsw i64 %indvars.iv108, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv118, i64 %indvars.iv.next109
  store double 0.000000e+00, double* %144, align 8
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next109, i64 %indvars.iv118
  %146 = bitcast double* %145 to i64*
  store i64 0, i64* %146, align 8
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  %lftr.wideiv110.1 = trunc i64 %indvars.iv.next109.1 to i32
  %exitcond111.1 = icmp eq i32 %lftr.wideiv110.1, 1200
  br i1 %exitcond111.1, label %._crit_edge23.loopexit, label %.lr.ph22.new

._crit_edge23.loopexit:                           ; preds = %.lr.ph22.new
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.prol.loopexit115, %.lr.ph29.split
  %indvars.iv.next119 = add nsw i64 %indvars.iv118, 1
  %147 = icmp slt i64 %indvars.iv.next119, 1199
  %148 = trunc i64 %indvars.iv.next119 to i32
  br i1 %147, label %.lr.ph29.split, label %._crit_edge30.loopexit164

._crit_edge30.loopexit:                           ; preds = %._crit_edge23.us-lcssa.us.us
  br label %._crit_edge30

._crit_edge30.loopexit164:                        ; preds = %._crit_edge23
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit164, %._crit_edge30.loopexit
  br label %149

; <label>:149:                                    ; preds = %._crit_edge30, %._crit_edge12
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %150, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %._crit_edge.lr.ph, label %20

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge6.loopexit11

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %7 = mul nsw i64 %indvars.iv13, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %9 = add nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge4.us, label %8

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %19 = icmp slt i64 %indvars.iv.next14, 1200
  br i1 %19, label %._crit_edge.us, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge6

._crit_edge6.loopexit11:                          ; preds = %._crit_edge.lr.ph
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit11, %._crit_edge6.loopexit
  br label %20

; <label>:20:                                     ; preds = %._crit_edge6, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
