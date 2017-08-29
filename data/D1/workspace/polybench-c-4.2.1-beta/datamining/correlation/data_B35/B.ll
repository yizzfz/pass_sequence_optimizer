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
  call void (...) @polybench_timer_start() #4
  %19 = load double, double* %6, align 8
  %20 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %8, align 8
  %21 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %20, i64 0, i64 0
  %22 = load [1200 x double]*, [1200 x double]** %9, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 0
  %24 = load [1200 x double]*, [1200 x double]** %10, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 0, i64 0
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %19, [1200 x double]* %18, [1200 x double]* %21, double* %23, double* %25)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call fastcc void @print_array(i32 %36, [1200 x double]* %21)
  br label %._crit_edge

._crit_edge:                                      ; preds = %31, %2, %35
  %37 = load i8*, i8** %7, align 8
  call void @free(i8* %37) #4
  call void @free(i8* %28) #4
  call void @free(i8* %29) #4
  call void @free(i8* %30) #4
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
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond8, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph78, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph78:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %.lr.ph78.split.us.preheader, label %.lr.ph78.split.preheader

.lr.ph78.split.preheader:                         ; preds = %.lr.ph78
  %xtraiter194 = and i64 %10, 1
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %.lr.ph78.split.prol.loopexit, label %.lr.ph78.split.prol.preheader

.lr.ph78.split.prol.preheader:                    ; preds = %.lr.ph78.split.preheader
  br label %.lr.ph78.split.prol

.lr.ph78.split.prol:                              ; preds = %.lr.ph78.split.prol.preheader
  %11 = fdiv double 0.000000e+00, %2
  store double %11, double* %5, align 8
  br label %.lr.ph78.split.prol.loopexit

.lr.ph78.split.prol.loopexit:                     ; preds = %.lr.ph78.split.preheader, %.lr.ph78.split.prol
  %indvars.iv150.unr = phi i64 [ 0, %.lr.ph78.split.preheader ], [ 1, %.lr.ph78.split.prol ]
  %storemerge76.unr = phi i64 [ 0, %.lr.ph78.split.preheader ], [ 1, %.lr.ph78.split.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %._crit_edge.loopexit187, label %.lr.ph78.split.preheader.new

.lr.ph78.split.preheader.new:                     ; preds = %.lr.ph78.split.prol.loopexit
  br label %.lr.ph78.split

.lr.ph78.split.us.preheader:                      ; preds = %.lr.ph78
  %13 = zext i32 %1 to i64
  %14 = add nsw i64 %13, -1
  %xtraiter159 = and i64 %13, 3
  %lcmp.mod160 = icmp eq i64 %xtraiter159, 0
  %15 = icmp ult i64 %14, 3
  br label %.lr.ph78.split.us

.lr.ph78.split.us:                                ; preds = %.lr.ph78.split.us.preheader, %._crit_edge73.us
  %indvars.iv147 = phi i64 [ 0, %.lr.ph78.split.us.preheader ], [ %indvars.iv.next148, %._crit_edge73.us ]
  %storemerge76.us = phi i64 [ 0, %.lr.ph78.split.us.preheader ], [ %indvars.iv.next148, %._crit_edge73.us ]
  %sext165 = shl i64 %storemerge76.us, 32
  %16 = ashr exact i64 %sext165, 32
  %17 = getelementptr inbounds double, double* %5, i64 %16
  store double 0.000000e+00, double* %17, align 8
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv147
  br i1 %lcmp.mod160, label %.prol.loopexit158, label %.lr.ph78.split.us..prol.preheader157_crit_edge

.lr.ph78.split.us..prol.preheader157_crit_edge:   ; preds = %.lr.ph78.split.us
  %.pre = load double, double* %18, align 8
  br label %.prol.preheader157

.prol.preheader157:                               ; preds = %.lr.ph78.split.us..prol.preheader157_crit_edge, %.prol.preheader157
  %19 = phi double [ %22, %.prol.preheader157 ], [ %.pre, %.lr.ph78.split.us..prol.preheader157_crit_edge ]
  %indvars.iv143.prol = phi i64 [ %indvars.iv.next144.prol, %.prol.preheader157 ], [ 0, %.lr.ph78.split.us..prol.preheader157_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader157 ], [ %xtraiter159, %.lr.ph78.split.us..prol.preheader157_crit_edge ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv143.prol, i64 %indvars.iv147
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %18, align 8
  %indvars.iv.next144.prol = add nuw nsw i64 %indvars.iv143.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit158.loopexit, label %.prol.preheader157, !llvm.loop !1

.prol.loopexit158.loopexit:                       ; preds = %.prol.preheader157
  br label %.prol.loopexit158

.prol.loopexit158:                                ; preds = %.prol.loopexit158.loopexit, %.lr.ph78.split.us
  %indvars.iv143.unr = phi i64 [ 0, %.lr.ph78.split.us ], [ %xtraiter159, %.prol.loopexit158.loopexit ]
  br i1 %15, label %.prol.loopexit158.._crit_edge73.us_crit_edge, label %.prol.loopexit158..lr.ph78.split.us.new_crit_edge

.prol.loopexit158.._crit_edge73.us_crit_edge:     ; preds = %.prol.loopexit158
  %.pre183 = load double, double* %18, align 8
  br label %._crit_edge73.us

.prol.loopexit158..lr.ph78.split.us.new_crit_edge: ; preds = %.prol.loopexit158
  %.pre182 = load double, double* %18, align 8
  br label %.lr.ph78.split.us.new

.lr.ph78.split.us.new:                            ; preds = %.prol.loopexit158..lr.ph78.split.us.new_crit_edge, %.lr.ph78.split.us.new
  %23 = phi double [ %35, %.lr.ph78.split.us.new ], [ %.pre182, %.prol.loopexit158..lr.ph78.split.us.new_crit_edge ]
  %indvars.iv143 = phi i64 [ %indvars.iv.next144.3, %.lr.ph78.split.us.new ], [ %indvars.iv143.unr, %.prol.loopexit158..lr.ph78.split.us.new_crit_edge ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv143, i64 %indvars.iv147
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %18, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next144, i64 %indvars.iv147
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %18, align 8
  %indvars.iv.next144.1 = add nsw i64 %indvars.iv143, 2
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next144.1, i64 %indvars.iv147
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %18, align 8
  %indvars.iv.next144.2 = add nsw i64 %indvars.iv143, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next144.2, i64 %indvars.iv147
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %18, align 8
  %indvars.iv.next144.3 = add nuw nsw i64 %indvars.iv143, 4
  %exitcond146.3 = icmp eq i64 %indvars.iv.next144.3, %13
  br i1 %exitcond146.3, label %._crit_edge73.us.loopexit, label %.lr.ph78.split.us.new

._crit_edge73.us.loopexit:                        ; preds = %.lr.ph78.split.us.new
  br label %._crit_edge73.us

._crit_edge73.us:                                 ; preds = %._crit_edge73.us.loopexit, %.prol.loopexit158.._crit_edge73.us_crit_edge
  %36 = phi double [ %.pre183, %.prol.loopexit158.._crit_edge73.us_crit_edge ], [ %35, %._crit_edge73.us.loopexit ]
  %37 = fdiv double %36, %2
  store double %37, double* %18, align 8
  %indvars.iv.next148 = add nsw i64 %indvars.iv147, 1
  %38 = icmp slt i64 %indvars.iv.next148, %10
  br i1 %38, label %.lr.ph78.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge73.us
  br label %._crit_edge

._crit_edge.loopexit187.unr-lcssa:                ; preds = %.lr.ph78.split
  br label %._crit_edge.loopexit187

._crit_edge.loopexit187:                          ; preds = %.lr.ph78.split.prol.loopexit, %._crit_edge.loopexit187.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit187, %._crit_edge.loopexit
  br i1 true, label %.lr.ph65, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph65:                                         ; preds = %._crit_edge
  br i1 %9, label %.lr.ph65.split.us.preheader, label %.lr.ph65.split.preheader

.lr.ph65.split.preheader:                         ; preds = %.lr.ph65
  br label %.lr.ph65.split

.lr.ph65.split.us.preheader:                      ; preds = %.lr.ph65
  %39 = sext i32 %1 to i64
  %xtraiter = and i64 %39, 1
  %lcmp.mod193 = icmp eq i64 %xtraiter, 0
  %40 = icmp eq i32 %1, 1
  br label %.lr.ph65.split.us

.lr.ph65.split.us:                                ; preds = %.lr.ph65.split.us.preheader, %._crit_edge61.us
  %indvars.iv137 = phi i64 [ 0, %.lr.ph65.split.us.preheader ], [ %indvars.iv.next138, %._crit_edge61.us ]
  %storemerge164.us = phi i64 [ 0, %.lr.ph65.split.us.preheader ], [ %indvars.iv.next138, %._crit_edge61.us ]
  %sext163 = shl i64 %storemerge164.us, 32
  %41 = ashr exact i64 %sext163, 32
  %42 = getelementptr inbounds double, double* %6, i64 %41
  store double 0.000000e+00, double* %42, align 8
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv137
  %44 = getelementptr inbounds double, double* %6, i64 %indvars.iv137
  %.pre184 = load double, double* %44, align 8
  br i1 %lcmp.mod193, label %.prol.loopexit192.unr-lcssa, label %.prol.preheader191

.prol.preheader191:                               ; preds = %.lr.ph65.split.us
  br label %45

; <label>:45:                                     ; preds = %.prol.preheader191
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv137
  %47 = load double, double* %46, align 8
  %48 = load double, double* %43, align 8
  %49 = fsub double %47, %48
  %50 = fmul double %49, %49
  %51 = fadd double %.pre184, %50
  store double %51, double* %44, align 8
  br label %.prol.loopexit192.unr-lcssa

.prol.loopexit192.unr-lcssa:                      ; preds = %.lr.ph65.split.us, %45
  %.unr.ph = phi double [ %51, %45 ], [ %.pre184, %.lr.ph65.split.us ]
  %indvars.iv134.unr.ph = phi i64 [ 1, %45 ], [ 0, %.lr.ph65.split.us ]
  %.lcssa189.unr.ph = phi double [ %51, %45 ], [ undef, %.lr.ph65.split.us ]
  br label %.prol.loopexit192

.prol.loopexit192:                                ; preds = %.prol.loopexit192.unr-lcssa
  br i1 %40, label %._crit_edge61.us, label %.lr.ph65.split.us.new

.lr.ph65.split.us.new:                            ; preds = %.prol.loopexit192
  br label %52

; <label>:52:                                     ; preds = %52, %.lr.ph65.split.us.new
  %53 = phi double [ %.unr.ph, %.lr.ph65.split.us.new ], [ %65, %52 ]
  %indvars.iv134 = phi i64 [ %indvars.iv134.unr.ph, %.lr.ph65.split.us.new ], [ %indvars.iv.next135.1, %52 ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv134, i64 %indvars.iv137
  %55 = load double, double* %54, align 8
  %56 = load double, double* %43, align 8
  %57 = fsub double %55, %56
  %58 = fmul double %57, %57
  %59 = fadd double %53, %58
  store double %59, double* %44, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next135, i64 %indvars.iv137
  %61 = load double, double* %60, align 8
  %62 = load double, double* %43, align 8
  %63 = fsub double %61, %62
  %64 = fmul double %63, %63
  %65 = fadd double %59, %64
  store double %65, double* %44, align 8
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %66 = icmp slt i64 %indvars.iv.next135.1, %39
  br i1 %66, label %52, label %._crit_edge61.us.unr-lcssa

._crit_edge61.us.unr-lcssa:                       ; preds = %52
  br label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %.prol.loopexit192, %._crit_edge61.us.unr-lcssa
  %.lcssa189 = phi double [ %.lcssa189.unr.ph, %.prol.loopexit192 ], [ %65, %._crit_edge61.us.unr-lcssa ]
  %67 = fdiv double %.lcssa189, %2
  store double %67, double* %44, align 8
  %68 = tail call double @sqrt(double %67) #4
  %69 = fcmp ole double %68, 1.000000e-01
  %70 = select i1 %69, double 1.000000e+00, double %68
  store double %70, double* %44, align 8
  %indvars.iv.next138 = add nsw i64 %indvars.iv137, 1
  %71 = icmp slt i64 %indvars.iv.next138, %10
  br i1 %71, label %.lr.ph65.split.us, label %.._crit_edge9_crit_edge.loopexit

.lr.ph78.split:                                   ; preds = %.lr.ph78.split, %.lr.ph78.split.preheader.new
  %indvars.iv150 = phi i64 [ %indvars.iv150.unr, %.lr.ph78.split.preheader.new ], [ %indvars.iv.next151.1, %.lr.ph78.split ]
  %storemerge76 = phi i64 [ %storemerge76.unr, %.lr.ph78.split.preheader.new ], [ %indvars.iv.next151.1, %.lr.ph78.split ]
  %sext164 = shl i64 %storemerge76, 32
  %72 = ashr exact i64 %sext164, 32
  %73 = getelementptr inbounds double, double* %5, i64 %72
  store double 0.000000e+00, double* %73, align 8
  %74 = getelementptr inbounds double, double* %5, i64 %indvars.iv150
  %75 = load double, double* %74, align 8
  %76 = fdiv double %75, %2
  store double %76, double* %74, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %sext164.1 = shl i64 %indvars.iv.next151, 32
  %77 = ashr exact i64 %sext164.1, 32
  %78 = getelementptr inbounds double, double* %5, i64 %77
  store double 0.000000e+00, double* %78, align 8
  %79 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next151
  %80 = load double, double* %79, align 8
  %81 = fdiv double %80, %2
  store double %81, double* %79, align 8
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, 2
  %82 = icmp slt i64 %indvars.iv.next151.1, %10
  br i1 %82, label %.lr.ph78.split, label %._crit_edge.loopexit187.unr-lcssa

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge61.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit186:              ; preds = %.lr.ph65.split
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit186, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %83 = icmp sgt i32 %1, 0
  br i1 %83, label %._crit_edge10.lr.ph, label %._crit_edge11

._crit_edge10.lr.ph:                              ; preds = %._crit_edge9
  br i1 %8, label %._crit_edge10.us.preheader, label %.._crit_edge11_crit_edge.loopexit84

._crit_edge10.us.preheader:                       ; preds = %._crit_edge10.lr.ph
  %84 = sext i32 %0 to i64
  %85 = sext i32 %1 to i64
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.preheader, %._crit_edge51.us
  %indvars.iv132 = phi i64 [ 0, %._crit_edge10.us.preheader ], [ %indvars.iv.next133, %._crit_edge51.us ]
  br label %86

; <label>:86:                                     ; preds = %._crit_edge10.us, %86
  %indvars.iv130 = phi i64 [ 0, %._crit_edge10.us ], [ %indvars.iv.next131, %86 ]
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv130
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132, i64 %indvars.iv130
  %90 = load double, double* %89, align 8
  %91 = fsub double %90, %88
  store double %91, double* %89, align 8
  %92 = tail call double @sqrt(double %2) #4
  %93 = getelementptr inbounds double, double* %6, i64 %indvars.iv130
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = load double, double* %89, align 8
  %97 = fdiv double %96, %95
  store double %97, double* %89, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %98 = icmp slt i64 %indvars.iv.next131, %84
  br i1 %98, label %86, label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %86
  %indvars.iv.next133 = add nsw i64 %indvars.iv132, 1
  %99 = icmp slt i64 %indvars.iv.next133, %85
  br i1 %99, label %._crit_edge10.us, label %.._crit_edge11_crit_edge.loopexit

.lr.ph65.split:                                   ; preds = %.lr.ph65.split.preheader, %.lr.ph65.split
  %indvars.iv140 = phi i64 [ 0, %.lr.ph65.split.preheader ], [ %indvars.iv.next141, %.lr.ph65.split ]
  %storemerge164 = phi i64 [ 0, %.lr.ph65.split.preheader ], [ %indvars.iv.next141, %.lr.ph65.split ]
  %sext162 = shl i64 %storemerge164, 32
  %100 = ashr exact i64 %sext162, 32
  %101 = getelementptr inbounds double, double* %6, i64 %100
  store double 0.000000e+00, double* %101, align 8
  %102 = getelementptr inbounds double, double* %6, i64 %indvars.iv140
  %103 = load double, double* %102, align 8
  %104 = fdiv double %103, %2
  store double %104, double* %102, align 8
  %105 = tail call double @sqrt(double %104) #4
  %106 = fcmp ole double %105, 1.000000e-01
  %107 = select i1 %106, double 1.000000e+00, double %105
  store double %107, double* %102, align 8
  %indvars.iv.next141 = add nsw i64 %indvars.iv140, 1
  %108 = icmp slt i64 %indvars.iv.next141, %10
  br i1 %108, label %.lr.ph65.split, label %.._crit_edge9_crit_edge.loopexit186

.._crit_edge11_crit_edge.loopexit:                ; preds = %._crit_edge51.us
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge.loopexit84:              ; preds = %._crit_edge10.lr.ph
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %.._crit_edge11_crit_edge.loopexit84, %.._crit_edge11_crit_edge.loopexit
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %._crit_edge9
  %109 = add nsw i32 %0, -1
  %110 = icmp sgt i32 %0, 1
  br i1 %110, label %.lr.ph28, label %165

.lr.ph28:                                         ; preds = %._crit_edge11
  %111 = add i32 %0, -2
  br i1 %83, label %.lr.ph28.split.us.preheader, label %.lr.ph28.split.preheader

.lr.ph28.split.preheader:                         ; preds = %.lr.ph28
  %112 = sext i32 %109 to i64
  %113 = sext i32 %0 to i64
  %114 = add i32 %0, 1
  br label %.lr.ph28.split

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph28
  %115 = sext i32 %0 to i64
  %116 = sext i32 %109 to i64
  %117 = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %117, 0
  %118 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %.lr.ph28.split.us.preheader, %._crit_edge22.us-lcssa.us.us
  %indvars.iv111 = phi i64 [ 0, %.lr.ph28.split.us.preheader ], [ %indvars.iv.next112, %._crit_edge22.us-lcssa.us.us ]
  %indvars.iv105.in = phi i64 [ 1, %.lr.ph28.split.us.preheader ], [ %indvars.iv105, %._crit_edge22.us-lcssa.us.us ]
  %storemerge327.us = phi i64 [ 0, %.lr.ph28.split.us.preheader ], [ %indvars.iv.next112, %._crit_edge22.us-lcssa.us.us ]
  %indvars.iv105 = add nsw i64 %indvars.iv105.in, 1
  %sext161 = shl i64 %storemerge327.us, 32
  %119 = ashr exact i64 %sext161, 32
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %119, i64 %119
  store double 1.000000e+00, double* %120, align 8
  %indvars.iv.next112 = add nsw i64 %indvars.iv111, 1
  %121 = icmp slt i64 %indvars.iv.next112, %115
  br i1 %121, label %.lr.ph.us.us.preheader, label %._crit_edge22.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph28.split.us
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv111
  br label %.lr.ph.us.us

._crit_edge22.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge16.us.us
  br label %._crit_edge22.us-lcssa.us.us

._crit_edge22.us-lcssa.us.us:                     ; preds = %._crit_edge22.us-lcssa.us.us.loopexit, %.lr.ph28.split.us
  %123 = icmp slt i64 %indvars.iv.next112, %116
  br i1 %123, label %.lr.ph28.split.us, label %._crit_edge29.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge16.us.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge16.us.us ], [ %indvars.iv105.in, %.lr.ph.us.us.preheader ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv103
  store double 0.000000e+00, double* %124, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %125 = load double, double* %122, align 8
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv103
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fadd double %128, 0.000000e+00
  store double %129, double* %124, align 8
  %130 = bitcast double %129 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %131 = phi i64 [ %130, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %132 = phi double [ %129, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %118, label %._crit_edge16.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge16.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %133 = bitcast double %149 to i64
  br label %._crit_edge16.us.us

._crit_edge16.us.us:                              ; preds = %._crit_edge16.us.us.loopexit, %.prol.loopexit
  %134 = phi i64 [ %131, %.prol.loopexit ], [ %133, %._crit_edge16.us.us.loopexit ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103, i64 %indvars.iv111
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next104 = add nsw i64 %indvars.iv103, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next104 to i32
  %exitcond109 = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond109, label %._crit_edge22.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %137 = phi double [ %149, %.lr.ph.us.us.new ], [ %132, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv111
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv103
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fadd double %142, %137
  store double %143, double* %124, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv111
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv103
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fadd double %148, %143
  store double %149, double* %124, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge16.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph28.split:                                   ; preds = %.lr.ph28.split.preheader, %._crit_edge22
  %indvar = phi i32 [ 0, %.lr.ph28.split.preheader ], [ %indvar.next, %._crit_edge22 ]
  %indvars.iv126 = phi i64 [ 0, %.lr.ph28.split.preheader ], [ %indvars.iv.next127, %._crit_edge22 ]
  %indvars.iv119.in = phi i64 [ 1, %.lr.ph28.split.preheader ], [ %indvars.iv119, %._crit_edge22 ]
  %storemerge327 = phi i64 [ 0, %.lr.ph28.split.preheader ], [ %indvars.iv.next127, %._crit_edge22 ]
  %indvars.iv119 = add nsw i64 %indvars.iv119.in, 1
  %sext = shl i64 %storemerge327, 32
  %150 = ashr exact i64 %sext, 32
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %150, i64 %150
  store double 1.000000e+00, double* %151, align 8
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %152 = icmp slt i64 %indvars.iv.next127, %113
  br i1 %152, label %.lr.ph21, label %._crit_edge22

.lr.ph21:                                         ; preds = %.lr.ph28.split
  %153 = sub i32 %114, %indvar
  %xtraiter155 = and i32 %153, 1
  %lcmp.mod156 = icmp eq i32 %xtraiter155, 0
  br i1 %lcmp.mod156, label %.prol.loopexit154, label %.prol.preheader153

.prol.preheader153:                               ; preds = %.lr.ph21
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv126, i64 %indvars.iv119.in
  store double 0.000000e+00, double* %154, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv119.in, i64 %indvars.iv126
  %156 = bitcast double* %155 to i64*
  store i64 0, i64* %156, align 8
  br label %.prol.loopexit154

.prol.loopexit154:                                ; preds = %.prol.preheader153, %.lr.ph21
  %indvars.iv117.unr.ph = phi i64 [ %indvars.iv119, %.prol.preheader153 ], [ %indvars.iv119.in, %.lr.ph21 ]
  %157 = icmp eq i32 %111, %indvar
  br i1 %157, label %._crit_edge22, label %.lr.ph21.new.preheader

.lr.ph21.new.preheader:                           ; preds = %.prol.loopexit154
  br label %.lr.ph21.new

.lr.ph21.new:                                     ; preds = %.lr.ph21.new.preheader, %.lr.ph21.new
  %indvars.iv117 = phi i64 [ %indvars.iv.next118.1, %.lr.ph21.new ], [ %indvars.iv117.unr.ph, %.lr.ph21.new.preheader ]
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv126, i64 %indvars.iv117
  store double 0.000000e+00, double* %158, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv117, i64 %indvars.iv126
  %160 = bitcast double* %159 to i64*
  store i64 0, i64* %160, align 8
  %indvars.iv.next118 = add nsw i64 %indvars.iv117, 1
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv126, i64 %indvars.iv.next118
  store double 0.000000e+00, double* %161, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next118, i64 %indvars.iv126
  %163 = bitcast double* %162 to i64*
  store i64 0, i64* %163, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %lftr.wideiv123.1 = trunc i64 %indvars.iv.next118.1 to i32
  %exitcond124.1 = icmp eq i32 %lftr.wideiv123.1, %0
  br i1 %exitcond124.1, label %._crit_edge22.loopexit, label %.lr.ph21.new

._crit_edge22.loopexit:                           ; preds = %.lr.ph21.new
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.prol.loopexit154, %.lr.ph28.split
  %164 = icmp slt i64 %indvars.iv.next127, %112
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %164, label %.lr.ph28.split, label %._crit_edge29.loopexit185

._crit_edge29.loopexit:                           ; preds = %._crit_edge22.us-lcssa.us.us
  br label %._crit_edge29

._crit_edge29.loopexit185:                        ; preds = %._crit_edge22
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit185, %._crit_edge29.loopexit
  br label %165

; <label>:165:                                    ; preds = %._crit_edge29, %._crit_edge11
  %166 = sext i32 %109 to i64
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %166
  store double 1.000000e+00, double* %167, align 8
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
