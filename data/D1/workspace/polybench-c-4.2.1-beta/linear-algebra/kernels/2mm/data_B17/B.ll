; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %22)
  br label %23

; <label>:23:                                     ; preds = %18, %21, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br i1 true, label %.preheader62.lr.ph, label %.preheader61

.preheader62.lr.ph:                               ; preds = %10
  br i1 true, label %.preheader62.us.preheader, label %.preheader59

.preheader62.us.preheader:                        ; preds = %.preheader62.lr.ph
  br label %.preheader62.us

.preheader62.us:                                  ; preds = %.preheader62.us.preheader, %._crit_edge79.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge79.us ], [ 0, %.preheader62.us.preheader ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader62.us
  %indvars.iv90.us = phi i64 [ 0, %.preheader62.us ], [ %indvars.iv.next91.us, %11 ]
  %12 = mul nsw i64 %indvars.iv90.us, %indvars.iv110
  %13 = add nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 800
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 8.000000e+02
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv110, i64 %indvars.iv90.us
  store double %17, double* %18, align 8
  %indvars.iv.next91.us = add nuw nsw i64 %indvars.iv90.us, 1
  %exitcond93.us = icmp eq i64 %indvars.iv.next91.us, 1100
  br i1 %exitcond93.us, label %._crit_edge79.us, label %11

._crit_edge79.us:                                 ; preds = %11
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, 800
  br i1 %exitcond113, label %.preheader61.loopexit, label %.preheader62.us

.preheader61.loopexit:                            ; preds = %._crit_edge79.us
  br label %.preheader61

.preheader61:                                     ; preds = %.preheader61.loopexit, %10
  br i1 true, label %.preheader60.lr.ph, label %.preheader59

.preheader60.lr.ph:                               ; preds = %.preheader61
  br i1 true, label %.preheader60.us.preheader, label %.preheader57

.preheader60.us.preheader:                        ; preds = %.preheader60.lr.ph
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %.preheader60.us.preheader, %._crit_edge74.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge74.us ], [ 0, %.preheader60.us.preheader ]
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader60.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader60.us
  %indvars.iv86.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader60.us ]
  br i1 false, label %._crit_edge74.us, label %.preheader60.us.new.preheader

.preheader60.us.new.preheader:                    ; preds = %.prol.loopexit
  br label %.preheader60.us.new

.preheader60.us.new:                              ; preds = %.preheader60.us.new.preheader, %.preheader60.us.new
  %indvars.iv86.us = phi i64 [ %indvars.iv.next87.us.1, %.preheader60.us.new ], [ %indvars.iv86.us.unr.ph, %.preheader60.us.new.preheader ]
  %indvars.iv.next87.us = add nuw nsw i64 %indvars.iv86.us, 1
  %19 = mul nsw i64 %indvars.iv.next87.us, %indvars.iv105
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv105, i64 %indvars.iv86.us
  %indvars.iv.next87.us.1 = add nuw nsw i64 %indvars.iv86.us, 2
  %24 = mul nsw i64 %indvars.iv.next87.us.1, %indvars.iv105
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 900
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 9.000000e+02, double 9.000000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %exitcond89.us.1 = icmp eq i64 %indvars.iv.next87.us.1, 900
  br i1 %exitcond89.us.1, label %._crit_edge74.us.loopexit, label %.preheader60.us.new

._crit_edge74.us.loopexit:                        ; preds = %.preheader60.us.new
  br label %._crit_edge74.us

._crit_edge74.us:                                 ; preds = %._crit_edge74.us.loopexit, %.prol.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 1100
  br i1 %exitcond108, label %.preheader59.loopexit, label %.preheader60.us

.preheader59.loopexit:                            ; preds = %._crit_edge74.us
  br label %.preheader59

.preheader59:                                     ; preds = %.preheader59.loopexit, %.preheader62.lr.ph, %.preheader61
  br i1 true, label %.preheader58.lr.ph, label %.preheader57

.preheader58.lr.ph:                               ; preds = %.preheader59
  br i1 true, label %.preheader58.us.preheader, label %.preheader57

.preheader58.us.preheader:                        ; preds = %.preheader58.lr.ph
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %.preheader58.us.preheader, %._crit_edge69.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge69.us ], [ 0, %.preheader58.us.preheader ]
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader58.us
  %indvars.iv82.us = phi i64 [ 0, %.preheader58.us ], [ %indvars.iv.next83.us, %32 ]
  %33 = add nuw nsw i64 %indvars.iv82.us, 3
  %34 = mul nsw i64 %33, %indvars.iv100
  %35 = add nsw i64 %34, 1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1200
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.200000e+03
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv100, i64 %indvars.iv82.us
  store double %39, double* %40, align 8
  %indvars.iv.next83.us = add nuw nsw i64 %indvars.iv82.us, 1
  %exitcond85.us = icmp eq i64 %indvars.iv.next83.us, 1200
  br i1 %exitcond85.us, label %._crit_edge69.us, label %32

._crit_edge69.us:                                 ; preds = %32
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next101, 900
  br i1 %exitcond103, label %.preheader57.loopexit, label %.preheader58.us

.preheader57.loopexit:                            ; preds = %._crit_edge69.us
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.preheader60.lr.ph, %.preheader58.lr.ph, %.preheader59
  br i1 true, label %.preheader.lr.ph, label %._crit_edge66

.preheader.lr.ph:                                 ; preds = %.preheader57
  br i1 true, label %.preheader.us.preheader, label %._crit_edge66

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %41

; <label>:41:                                     ; preds = %41, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %41 ]
  %42 = add nuw nsw i64 %indvars.iv.us, 2
  %43 = mul nsw i64 %42, %indvars.iv
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 1100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 1.100000e+03
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv, i64 %indvars.iv.us
  store double %47, double* %48, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %41

._crit_edge.us:                                   ; preds = %41
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 800
  br i1 %exitcond, label %._crit_edge66.loopexit, label %.preheader.us

._crit_edge66.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.loopexit, %.preheader.lr.ph, %.preheader57
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader48.lr.ph, label %._crit_edge54

.preheader48.lr.ph:                               ; preds = %11
  br i1 true, label %.preheader48.us.preheader, label %.preheader.lr.ph

.preheader48.us.preheader:                        ; preds = %.preheader48.lr.ph
  br label %.preheader48.us

.preheader48.us:                                  ; preds = %.preheader48.us.preheader, %._crit_edge61.us
  %indvars.iv79.us = phi i64 [ %indvars.iv.next80.us, %._crit_edge61.us ], [ 0, %.preheader48.us.preheader ]
  br i1 true, label %.lr.ph57.us.us.preheader, label %._crit_edge61.us.loopexit105

.lr.ph57.us.us.preheader:                         ; preds = %.preheader48.us
  br label %.lr.ph57.us.us

._crit_edge61.us.loopexit105:                     ; preds = %.preheader48.us
  br label %._crit_edge61.us

._crit_edge61.us.loopexit:                        ; preds = %._crit_edge58.us.us
  br label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %._crit_edge61.us.loopexit, %._crit_edge61.us.loopexit105
  %indvars.iv.next80.us = add nuw nsw i64 %indvars.iv79.us, 1
  %exitcond82.us = icmp eq i64 %indvars.iv.next80.us, 800
  br i1 %exitcond82.us, label %.preheader47, label %.preheader48.us

.lr.ph57.us.us:                                   ; preds = %.lr.ph57.us.us.preheader, %._crit_edge58.us.us
  %indvars.iv75.us.us = phi i64 [ %indvars.iv.next76.us.us, %._crit_edge58.us.us ], [ 0, %.lr.ph57.us.us.preheader ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv79.us, i64 %indvars.iv75.us.us
  store double 0.000000e+00, double* %12, align 8
  br i1 true, label %.prol.loopexit111, label %.prol.preheader110

.prol.preheader110:                               ; preds = %.lr.ph57.us.us
  br label %.prol.loopexit111

.prol.loopexit111:                                ; preds = %.prol.preheader110, %.lr.ph57.us.us
  %indvars.iv71.us.us.unr.ph = phi i64 [ 1, %.prol.preheader110 ], [ 0, %.lr.ph57.us.us ]
  br i1 false, label %._crit_edge58.us.us, label %.lr.ph57.us.us.new.preheader

.lr.ph57.us.us.new.preheader:                     ; preds = %.prol.loopexit111
  br label %.lr.ph57.us.us.new

._crit_edge58.us.us.loopexit:                     ; preds = %.lr.ph57.us.us.new
  br label %._crit_edge58.us.us

._crit_edge58.us.us:                              ; preds = %._crit_edge58.us.us.loopexit, %.prol.loopexit111
  %indvars.iv.next76.us.us = add nuw nsw i64 %indvars.iv75.us.us, 1
  %exitcond78.us.us = icmp eq i64 %indvars.iv.next76.us.us, 900
  br i1 %exitcond78.us.us, label %._crit_edge61.us.loopexit, label %.lr.ph57.us.us

.lr.ph57.us.us.new:                               ; preds = %.lr.ph57.us.us.new.preheader, %.lr.ph57.us.us.new
  %13 = phi double [ %27, %.lr.ph57.us.us.new ], [ 0.000000e+00, %.lr.ph57.us.us.new.preheader ]
  %indvars.iv71.us.us = phi i64 [ %indvars.iv.next72.us.us.1, %.lr.ph57.us.us.new ], [ %indvars.iv71.us.us.unr.ph, %.lr.ph57.us.us.new.preheader ]
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv79.us, i64 %indvars.iv71.us.us
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %4
  %17 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv71.us.us, i64 %indvars.iv75.us.us
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %13, %19
  store double %20, double* %12, align 8
  %indvars.iv.next72.us.us = add nuw nsw i64 %indvars.iv71.us.us, 1
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv79.us, i64 %indvars.iv.next72.us.us
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next72.us.us, i64 %indvars.iv75.us.us
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %20, %26
  store double %27, double* %12, align 8
  %indvars.iv.next72.us.us.1 = add nuw nsw i64 %indvars.iv71.us.us, 2
  %exitcond74.us.us.1 = icmp eq i64 %indvars.iv.next72.us.us.1, 1100
  br i1 %exitcond74.us.us.1, label %._crit_edge58.us.us.loopexit, label %.lr.ph57.us.us.new

.preheader47:                                     ; preds = %._crit_edge61.us
  br i1 true, label %.preheader.lr.ph, label %._crit_edge54

.preheader.lr.ph:                                 ; preds = %.preheader48.lr.ph, %.preheader47
  br i1 true, label %.preheader.us.preheader, label %._crit_edge54

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge52.us
  %indvars.iv67.us = phi i64 [ %indvars.iv.next68.us, %._crit_edge52.us ], [ 0, %.preheader.us.preheader ]
  br i1 true, label %.lr.ph.us.us.preheader, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  br label %.lr.ph.us.us

.lr.ph51..lr.ph51.split_crit_edge.us.preheader:   ; preds = %.preheader.us
  br i1 undef, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader

.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol

.lr.ph51..lr.ph51.split_crit_edge.us.prol:        ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader, %.lr.ph51..lr.ph51.split_crit_edge.us.prol
  br i1 true, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol, !llvm.loop !1

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader
  br i1 undef, label %._crit_edge52.us, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader121

.lr.ph51..lr.ph51.split_crit_edge.us.preheader121: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit
  br i1 undef, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader124, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125.unr-lcssa

.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader124: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader121
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol127

.lr.ph51..lr.ph51.split_crit_edge.us.prol127:     ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader124
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125.unr-lcssa

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125.unr-lcssa: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader121, %.lr.ph51..lr.ph51.split_crit_edge.us.prol127
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125.unr-lcssa
  br i1 undef, label %._crit_edge52.us.loopexit123, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader121.new

.lr.ph51..lr.ph51.split_crit_edge.us.preheader121.new: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125
  br label %.lr.ph51..lr.ph51.split_crit_edge.us

.lr.ph51..lr.ph51.split_crit_edge.us:             ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader121.new
  br i1 true, label %._crit_edge52.us.loopexit123.unr-lcssa, label %.lr.ph51..lr.ph51.split_crit_edge.us

._crit_edge52.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge52.us

._crit_edge52.us.loopexit123.unr-lcssa:           ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us
  br label %._crit_edge52.us.loopexit123

._crit_edge52.us.loopexit123:                     ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit125, %._crit_edge52.us.loopexit123.unr-lcssa
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit123, %._crit_edge52.us.loopexit, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit
  %indvars.iv.next68.us = add nuw nsw i64 %indvars.iv67.us, 1
  %exitcond70.us = icmp eq i64 %indvars.iv.next68.us, 800
  br i1 %exitcond70.us, label %._crit_edge54.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv63.us.us = phi i64 [ %indvars.iv.next64.us.us, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv67.us, i64 %indvars.iv63.us.us
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %5
  store double %30, double* %28, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.us.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next64.us.us = add nuw nsw i64 %indvars.iv63.us.us, 1
  %exitcond66.us.us = icmp eq i64 %indvars.iv.next64.us.us, 1200
  br i1 %exitcond66.us.us, label %._crit_edge52.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %31 = phi double [ %43, %.lr.ph.us.us.new ], [ %30, %.lr.ph.us.us.new.preheader ]
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ %indvars.iv.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %32 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv67.us, i64 %indvars.iv.us.us
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.us.us, i64 %indvars.iv63.us.us
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %28, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %38 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv67.us, i64 %indvars.iv.next.us.us
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next.us.us, i64 %indvars.iv63.us.us
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %28, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, 900
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge54.loopexit:                           ; preds = %._crit_edge52.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %.preheader.lr.ph, %11, %.preheader47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %8 = mul i64 %indvars.iv, 800
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %16 ]
  %10 = add i64 %indvars.iv.us, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 800
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %3
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
