; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader62.preheader.lr.ph:
  br label %.preheader62.preheader

.preheader62.preheader:                           ; preds = %.preheader61._crit_edge, %.preheader62.preheader.lr.ph
  %indvars.iv93135 = phi i64 [ 1, %.preheader62.preheader.lr.ph ], [ %indvars.iv.next94, %.preheader61._crit_edge ]
  %indvars.iv95134 = phi i64 [ 0, %.preheader62.preheader.lr.ph ], [ %indvars.iv.next96, %.preheader61._crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv95134, 2001
  %3 = add nuw nsw i64 %2, 1
  %4 = mul nsw i64 %indvars.iv95134, -8
  br label %.preheader62

.preheader61.preheader:                           ; preds = %.preheader62
  %exitcond92131 = icmp eq i64 %indvars.iv95134, 1999
  br i1 %exitcond92131, label %.preheader61._crit_edge, label %.preheader61.preheader141

.preheader61.preheader141:                        ; preds = %.preheader61.preheader
  %5 = add nsw i64 %4, 15992
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %6 = bitcast double* %scevgep150 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %5, i32 8, i1 false)
  br label %.preheader61._crit_edge

.preheader62:                                     ; preds = %.preheader62.preheader, %.preheader62
  %indvars.iv81129 = phi i64 [ 0, %.preheader62.preheader ], [ %indvars.iv.next82, %.preheader62 ]
  %7 = sub nsw i64 0, %indvars.iv81129
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95134, i64 %indvars.iv81129
  store double %12, double* %13, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81129, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next82, %indvars.iv93135
  br i1 %exitcond86, label %.preheader61.preheader, label %.preheader62

.preheader61._crit_edge:                          ; preds = %.preheader61.preheader141, %.preheader61.preheader
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95134, i64 %indvars.iv95134
  store double 1.000000e+00, double* %14, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95134, 1
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93135, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond152, label %.preheader60.preheader.preheader, label %.preheader62.preheader

.preheader60.preheader.preheader:                 ; preds = %.preheader61._crit_edge
  %15 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.preheader60._crit_edge.3

.preheader57.preheader.preheader:                 ; preds = %.preheader57.preheader.preheader.preheader, %.preheader58._crit_edge
  %indvars.iv73107 = phi i64 [ %indvars.iv.next74, %.preheader58._crit_edge ], [ 0, %.preheader57.preheader.preheader.preheader ]
  br label %.preheader57.preheader

.preheader57.preheader:                           ; preds = %.preheader57.preheader.preheader, %.preheader58
  %indvars.iv69105 = phi i64 [ %indvars.iv.next70, %.preheader58 ], [ 0, %.preheader57.preheader.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69105, i64 %indvars.iv73107
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.preheader, %.preheader57
  %indvars.iv65102 = phi i64 [ %indvars.iv.next66.1, %.preheader57 ], [ 0, %.preheader57.preheader ]
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65102, i64 %indvars.iv73107
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv69105, i64 %indvars.iv65102
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %21, align 8
  %indvars.iv.next66 = or i64 %indvars.iv65102, 1
  %24 = load double, double* %16, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next66, i64 %indvars.iv73107
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv69105, i64 %indvars.iv.next66
  %29 = load double, double* %28, align 8
  %30 = fadd double %29, %27
  store double %30, double* %28, align 8
  %indvars.iv.next66.1 = add nuw nsw i64 %indvars.iv65102, 2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next66.1, 2000
  br i1 %exitcond68.1, label %.preheader58, label %.preheader57

.preheader58:                                     ; preds = %.preheader57
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69105, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 2000
  br i1 %exitcond72, label %.preheader58._crit_edge, label %.preheader57.preheader

.preheader58._crit_edge:                          ; preds = %.preheader58
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73107, 1
  %exitcond145 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond145, label %.preheader.preheader.preheader, label %.preheader57.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader58._crit_edge
  %31 = bitcast i8* %15 to [2000 x [2000 x double]]*
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader._crit_edge
  %indvars.iv6399 = phi i64 [ %indvars.iv.next64, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv98 = phi i64 [ %indvars.iv.next.3, %.preheader ], [ 0, %.preheader.preheader ]
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv6399, i64 %indvars.iv98
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399, i64 %indvars.iv98
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next = or i64 %indvars.iv98, 1
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv6399, i64 %indvars.iv.next
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv98, 2
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv6399, i64 %indvars.iv.next.1
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv98, 3
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv6399, i64 %indvars.iv.next.2
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv98, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %.preheader._crit_edge, label %.preheader

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv6399, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  tail call void @free(i8* %15) #4
  ret void

.preheader60._crit_edge.3:                        ; preds = %.preheader60._crit_edge.3, %.preheader60.preheader.preheader
  %indvars.iv79127 = phi i64 [ 0, %.preheader60.preheader.preheader ], [ %indvars.iv.next80.3.1, %.preheader60._crit_edge.3 ]
  %52 = mul nuw nsw i64 %indvars.iv79127, 16000
  %scevgep = getelementptr i8, i8* %15, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %53 = add nuw nsw i64 %52, 16000
  %scevgep.1 = getelementptr i8, i8* %15, i64 %53
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %54 = add nuw nsw i64 %52, 32000
  %scevgep.2 = getelementptr i8, i8* %15, i64 %54
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %55 = add nuw nsw i64 %52, 48000
  %scevgep.3 = getelementptr i8, i8* %15, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next80.3 = or i64 %indvars.iv79127, 4
  %56 = mul nuw nsw i64 %indvars.iv.next80.3, 16000
  %scevgep.1171 = getelementptr i8, i8* %15, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1171, i8 0, i64 16000, i32 8, i1 false)
  %57 = add nuw nsw i64 %56, 16000
  %scevgep.1.1 = getelementptr i8, i8* %15, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %58 = add nuw nsw i64 %56, 32000
  %scevgep.2.1 = getelementptr i8, i8* %15, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %59 = add nuw nsw i64 %56, 48000
  %scevgep.3.1 = getelementptr i8, i8* %15, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next80.3.1 = add nsw i64 %indvars.iv79127, 8
  %exitcond146.3.1 = icmp eq i64 %indvars.iv.next80.3.1, 2000
  br i1 %exitcond146.3.1, label %.preheader57.preheader.preheader.preheader, label %.preheader60._crit_edge.3

.preheader57.preheader.preheader.preheader:       ; preds = %.preheader60._crit_edge.3
  %60 = bitcast i8* %15 to [2000 x [2000 x double]]*
  br label %.preheader57.preheader.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
.preheader35.preheader.lr.ph:
  br label %.preheader35.preheader

.preheader35.preheader:                           ; preds = %.preheader34._crit_edge, %.preheader35.preheader.lr.ph
  %indvars.iv5567 = phi i64 [ 0, %.preheader35.preheader.lr.ph ], [ %indvars.iv.next56, %.preheader34._crit_edge ]
  %cond = icmp eq i64 %indvars.iv5567, 0
  br i1 %cond, label %.preheader34._crit_edge, label %.preheader33.preheader.preheader

.preheader33.preheader.preheader:                 ; preds = %.preheader35.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 0
  br label %.preheader33.preheader

.preheader34.preheader:                           ; preds = %.preheader35
  switch i64 %indvars.iv5567, label %.preheader.preheader.preheader [
    i64 2000, label %.preheader34._crit_edge
    i64 0, label %.preheader34._crit_edge
  ]

.preheader.preheader.preheader:                   ; preds = %.preheader34.preheader
  %xtraiter74 = and i64 %indvars.iv5567, 1
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 0
  %3 = icmp eq i64 %xtraiter74, 0
  %4 = icmp eq i64 %indvars.iv5567, 1
  br label %.preheader.preheader

.preheader33.preheader:                           ; preds = %.preheader33.preheader.preheader, %.preheader35
  %indvars.iv3860 = phi i64 [ %indvars.iv.next39, %.preheader35 ], [ 0, %.preheader33.preheader.preheader ]
  %exitcond57 = icmp eq i64 %indvars.iv3860, 0
  br i1 %exitcond57, label %.preheader33.preheader..preheader35_crit_edge, label %.lr.ph

.preheader33.preheader..preheader35_crit_edge:    ; preds = %.preheader33.preheader
  %.pre71 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader35

.lr.ph:                                           ; preds = %.preheader33.preheader
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 %indvars.iv3860
  %.pre = load double, double* %5, align 8
  %xtraiter = and i64 %indvars.iv3860, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader33.prol.loopexit, label %.preheader33.prol

.preheader33.prol:                                ; preds = %.lr.ph
  %6 = load double, double* %.phi.trans.insert, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv3860
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = fsub double %.pre, %9
  store double %10, double* %5, align 8
  br label %.preheader33.prol.loopexit

.preheader33.prol.loopexit:                       ; preds = %.lr.ph, %.preheader33.prol
  %.lcssa.unr.ph = phi double [ %10, %.preheader33.prol ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %10, %.preheader33.prol ], [ %.pre, %.lr.ph ]
  %indvars.iv58.unr.ph = phi i64 [ 1, %.preheader33.prol ], [ 0, %.lr.ph ]
  %11 = icmp eq i64 %indvars.iv3860, 1
  br i1 %11, label %.preheader35, label %.preheader33.preheader82

.preheader33.preheader82:                         ; preds = %.preheader33.prol.loopexit
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.preheader82, %.preheader33
  %12 = phi double [ %24, %.preheader33 ], [ %.unr.ph, %.preheader33.preheader82 ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next.1, %.preheader33 ], [ %indvars.iv58.unr.ph, %.preheader33.preheader82 ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 %indvars.iv58
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv3860
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %12, %17
  store double %18, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv58, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 %indvars.iv.next
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv3860
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %5, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv58, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3860
  br i1 %exitcond.1, label %.preheader35.loopexit, label %.preheader33

.preheader35.loopexit:                            ; preds = %.preheader33
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.loopexit, %.preheader33.prol.loopexit, %.preheader33.preheader..preheader35_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader33.preheader..preheader35_crit_edge ], [ %5, %.preheader33.prol.loopexit ], [ %5, %.preheader35.loopexit ]
  %25 = phi double [ %.pre71, %.preheader33.preheader..preheader35_crit_edge ], [ %.lcssa.unr.ph, %.preheader33.prol.loopexit ], [ %24, %.preheader35.loopexit ]
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3860, i64 %indvars.iv3860
  %27 = load double, double* %26, align 8
  %28 = fdiv double %25, %27
  store double %28, double* %.pre-phi, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3860, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next39, %indvars.iv5567
  br i1 %exitcond43, label %.preheader34.preheader, label %.preheader33.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader34
  %indvars.iv5165 = phi i64 [ %indvars.iv.next52, %.preheader34 ], [ %indvars.iv5567, %.preheader.preheader.preheader ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 %indvars.iv5165
  %.pre72 = load double, double* %29, align 8
  br i1 %3, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %30 = load double, double* %2, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv5165
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %.pre72, %33
  store double %34, double* %29, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %.preheader.prol
  %.unr76.ph = phi double [ %34, %.preheader.prol ], [ %.pre72, %.preheader.preheader ]
  %indvars.iv4462.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 %4, label %.preheader34, label %.preheader.preheader81

.preheader.preheader81:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader81, %.preheader
  %35 = phi double [ %47, %.preheader ], [ %.unr76.ph, %.preheader.preheader81 ]
  %indvars.iv4462 = phi i64 [ %indvars.iv.next45.1, %.preheader ], [ %indvars.iv4462.unr.ph, %.preheader.preheader81 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 %indvars.iv4462
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4462, i64 %indvars.iv5165
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  store double %41, double* %29, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv4462, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5567, i64 %indvars.iv.next45
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next45, i64 %indvars.iv5165
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %29, align 8
  %indvars.iv.next45.1 = add nuw nsw i64 %indvars.iv4462, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next45.1, %indvars.iv5567
  br i1 %exitcond48.1, label %.preheader34.loopexit, label %.preheader

.preheader34.loopexit:                            ; preds = %.preheader
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv5165, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond54, label %.preheader34._crit_edge.loopexit, label %.preheader.preheader

.preheader34._crit_edge.loopexit:                 ; preds = %.preheader34
  br label %.preheader34._crit_edge

.preheader34._crit_edge:                          ; preds = %.preheader34._crit_edge.loopexit, %.preheader35.preheader, %.preheader34.preheader, %.preheader34.preheader
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv5567, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond, label %._crit_edge, label %.preheader35.preheader

._crit_edge:                                      ; preds = %.preheader34._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv913 = phi i64 [ %indvars.iv.next10, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv913, 2000
  br label %7

; <label>:7:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nuw nsw i64 %indvars.iv12, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %.preheader

.preheader:                                       ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv913, i64 %indvars.iv12
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %.preheader._crit_edge, label %7

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv913, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond16, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
