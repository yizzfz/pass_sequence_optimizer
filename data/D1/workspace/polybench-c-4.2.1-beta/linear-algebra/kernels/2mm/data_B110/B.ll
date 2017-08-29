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
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader62.lr.ph, label %.preheader61

.preheader62.lr.ph:                               ; preds = %10
  %12 = icmp sgt i32 %2, 0
  %13 = sitofp i32 %0 to double
  br i1 %12, label %.preheader62.us.preheader, label %.preheader59

.preheader62.us.preheader:                        ; preds = %.preheader62.lr.ph
  %14 = zext i32 %2 to i64
  %15 = zext i32 %0 to i64
  br label %.preheader62.us

.preheader62.us:                                  ; preds = %._crit_edge79.us, %.preheader62.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader62.us.preheader ], [ %indvars.iv.next114, %._crit_edge79.us ]
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader62.us
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %16 ], [ 0, %.preheader62.us ]
  %17 = mul nuw nsw i64 %indvars.iv109, %indvars.iv113
  %18 = add nuw nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv109
  store double %22, double* %23, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next110, %14
  br i1 %exitcond123, label %._crit_edge79.us, label %16

._crit_edge79.us:                                 ; preds = %16
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next114, %15
  br i1 %exitcond124, label %.preheader61.loopexit, label %.preheader62.us

.preheader61.loopexit:                            ; preds = %._crit_edge79.us
  br label %.preheader61

.preheader61:                                     ; preds = %.preheader61.loopexit, %10
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %.preheader60.lr.ph, label %.preheader59

.preheader60.lr.ph:                               ; preds = %.preheader61
  %25 = icmp sgt i32 %1, 0
  %26 = sitofp i32 %1 to double
  br i1 %25, label %.preheader60.us.preheader, label %.preheader57

.preheader60.us.preheader:                        ; preds = %.preheader60.lr.ph
  %27 = zext i32 %1 to i64
  %28 = zext i32 %2 to i64
  %xtraiter = and i64 %27, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %29 = icmp eq i32 %1, 1
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %._crit_edge74.us, %.preheader60.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next105, %._crit_edge74.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader60.us
  %30 = trunc i64 %indvars.iv104 to i32
  %31 = srem i32 %30, %1
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %26
  %34 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv104, i64 0
  store double %33, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader60.us
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader60.us ]
  br i1 %29, label %._crit_edge74.us, label %.preheader60.us.new.preheader

.preheader60.us.new.preheader:                    ; preds = %.prol.loopexit
  br label %.preheader60.us.new

.preheader60.us.new:                              ; preds = %.preheader60.us.new.preheader, %.preheader60.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.preheader60.us.new ], [ %indvars.iv100.unr.ph, %.preheader60.us.new.preheader ]
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %35 = mul nuw nsw i64 %indvars.iv.next101, %indvars.iv104
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %1
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %26
  %40 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv104, i64 %indvars.iv100
  store double %39, double* %40, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %41 = mul nuw nsw i64 %indvars.iv.next101.1, %indvars.iv104
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %1
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, %26
  %46 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv104, i64 %indvars.iv.next101
  store double %45, double* %46, align 8
  %exitcond121.1 = icmp eq i64 %indvars.iv.next101.1, %27
  br i1 %exitcond121.1, label %._crit_edge74.us.loopexit, label %.preheader60.us.new

._crit_edge74.us.loopexit:                        ; preds = %.preheader60.us.new
  br label %._crit_edge74.us

._crit_edge74.us:                                 ; preds = %._crit_edge74.us.loopexit, %.prol.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next105, %28
  br i1 %exitcond122, label %.preheader59.loopexit, label %.preheader60.us

.preheader59.loopexit:                            ; preds = %._crit_edge74.us
  br label %.preheader59

.preheader59:                                     ; preds = %.preheader59.loopexit, %.preheader62.lr.ph, %.preheader61
  %47 = icmp sgt i32 %1, 0
  br i1 %47, label %.preheader58.lr.ph, label %.preheader57

.preheader58.lr.ph:                               ; preds = %.preheader59
  %48 = icmp sgt i32 %3, 0
  %49 = sitofp i32 %3 to double
  br i1 %48, label %.preheader58.us.preheader, label %.preheader57

.preheader58.us.preheader:                        ; preds = %.preheader58.lr.ph
  %50 = zext i32 %3 to i64
  %51 = zext i32 %1 to i64
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %._crit_edge69.us, %.preheader58.us.preheader
  %indvars.iv95 = phi i64 [ 0, %.preheader58.us.preheader ], [ %indvars.iv.next96, %._crit_edge69.us ]
  br label %52

; <label>:52:                                     ; preds = %52, %.preheader58.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %52 ], [ 0, %.preheader58.us ]
  %53 = add nuw nsw i64 %indvars.iv91, 3
  %54 = mul nuw nsw i64 %53, %indvars.iv95
  %55 = add nuw nsw i64 %54, 1
  %56 = trunc i64 %55 to i32
  %57 = srem i32 %56, %3
  %58 = sitofp i32 %57 to double
  %59 = fdiv double %58, %49
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv95, i64 %indvars.iv91
  store double %59, double* %60, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next92, %50
  br i1 %exitcond119, label %._crit_edge69.us, label %52

._crit_edge69.us:                                 ; preds = %52
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next96, %51
  br i1 %exitcond120, label %.preheader57.loopexit, label %.preheader58.us

.preheader57.loopexit:                            ; preds = %._crit_edge69.us
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.preheader60.lr.ph, %.preheader58.lr.ph, %.preheader59
  %61 = icmp sgt i32 %0, 0
  br i1 %61, label %.preheader.lr.ph, label %._crit_edge66

.preheader.lr.ph:                                 ; preds = %.preheader57
  %62 = icmp sgt i32 %3, 0
  %63 = sitofp i32 %2 to double
  br i1 %62, label %.preheader.us.preheader, label %._crit_edge66

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %64 = zext i32 %3 to i64
  %65 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv86 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next87, %._crit_edge.us ]
  br label %66

; <label>:66:                                     ; preds = %66, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %66 ], [ 0, %.preheader.us ]
  %67 = add nuw nsw i64 %indvars.iv, 2
  %68 = mul nuw nsw i64 %67, %indvars.iv86
  %69 = trunc i64 %68 to i32
  %70 = srem i32 %69, %2
  %71 = sitofp i32 %70 to double
  %72 = fdiv double %71, %63
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv86, i64 %indvars.iv
  store double %72, double* %73, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next, %64
  br i1 %exitcond118, label %._crit_edge.us, label %66

._crit_edge.us:                                   ; preds = %66
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond = icmp eq i64 %indvars.iv.next87, %65
  br i1 %exitcond, label %._crit_edge66.loopexit, label %.preheader.us

._crit_edge66.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.loopexit, %.preheader.lr.ph, %.preheader57
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader48.lr.ph, label %._crit_edge54

.preheader48.lr.ph:                               ; preds = %11
  %13 = icmp sgt i32 %1, 0
  %14 = icmp sgt i32 %2, 0
  br i1 %13, label %.preheader48.us.preheader, label %.preheader.lr.ph

.preheader48.us.preheader:                        ; preds = %.preheader48.lr.ph
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = zext i32 %2 to i64
  %18 = zext i32 %1 to i64
  %19 = zext i32 %0 to i64
  %xtraiter118 = and i64 %17, 1
  %lcmp.mod119 = icmp eq i64 %xtraiter118, 0
  %20 = icmp eq i32 %2, 1
  br label %.preheader48.us

.preheader48.us:                                  ; preds = %._crit_edge61.us, %.preheader48.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader48.us.preheader ], [ %indvars.iv.next105, %._crit_edge61.us ]
  br i1 %14, label %.lr.ph57.us.us.preheader, label %._crit_edge61.us.loopexit77

.lr.ph57.us.us.preheader:                         ; preds = %.preheader48.us
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv104, i64 0
  br label %.lr.ph57.us.us

._crit_edge61.us.loopexit77:                      ; preds = %.preheader48.us
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvars.iv104, i64 0
  %scevgep114 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep114, i8 0, i64 %16, i32 8, i1 false)
  br label %._crit_edge61.us

._crit_edge61.us.loopexit:                        ; preds = %._crit_edge58.us.us
  br label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %._crit_edge61.us.loopexit, %._crit_edge61.us.loopexit77
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next105, %19
  br i1 %exitcond124, label %.preheader47, label %.preheader48.us

.lr.ph57.us.us:                                   ; preds = %.lr.ph57.us.us.preheader, %._crit_edge58.us.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge58.us.us ], [ 0, %.lr.ph57.us.us.preheader ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv104, i64 %indvars.iv100
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod119, label %.prol.loopexit117, label %.prol.preheader116

.prol.preheader116:                               ; preds = %.lr.ph57.us.us
  %23 = load double, double* %21, align 8
  %24 = fmul double %23, %4
  %25 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 0, i64 %indvars.iv100
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %27, 0.000000e+00
  store double %28, double* %22, align 8
  br label %.prol.loopexit117

.prol.loopexit117:                                ; preds = %.prol.preheader116, %.lr.ph57.us.us
  %indvars.iv96.unr.ph = phi i64 [ 1, %.prol.preheader116 ], [ 0, %.lr.ph57.us.us ]
  %.unr120.ph = phi double [ %28, %.prol.preheader116 ], [ 0.000000e+00, %.lr.ph57.us.us ]
  br i1 %20, label %._crit_edge58.us.us, label %.lr.ph57.us.us.new.preheader

.lr.ph57.us.us.new.preheader:                     ; preds = %.prol.loopexit117
  br label %.lr.ph57.us.us.new

._crit_edge58.us.us.loopexit:                     ; preds = %.lr.ph57.us.us.new
  br label %._crit_edge58.us.us

._crit_edge58.us.us:                              ; preds = %._crit_edge58.us.us.loopexit, %.prol.loopexit117
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next101, %18
  br i1 %exitcond121, label %._crit_edge61.us.loopexit, label %.lr.ph57.us.us

.lr.ph57.us.us.new:                               ; preds = %.lr.ph57.us.us.new.preheader, %.lr.ph57.us.us.new
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.lr.ph57.us.us.new ], [ %indvars.iv96.unr.ph, %.lr.ph57.us.us.new.preheader ]
  %29 = phi double [ %43, %.lr.ph57.us.us.new ], [ %.unr120.ph, %.lr.ph57.us.us.new.preheader ]
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv104, i64 %indvars.iv96
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %4
  %33 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv96, i64 %indvars.iv100
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %29, %35
  store double %36, double* %22, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv104, i64 %indvars.iv.next97
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %4
  %40 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next97, i64 %indvars.iv100
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %36, %42
  store double %43, double* %22, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond115.1 = icmp eq i64 %indvars.iv.next97.1, %17
  br i1 %exitcond115.1, label %._crit_edge58.us.us.loopexit, label %.lr.ph57.us.us.new

.preheader47:                                     ; preds = %._crit_edge61.us
  %44 = icmp sgt i32 %0, 0
  br i1 %44, label %.preheader.lr.ph, label %._crit_edge54

.preheader.lr.ph:                                 ; preds = %.preheader48.lr.ph, %.preheader47
  %45 = icmp sgt i32 %3, 0
  %46 = icmp sgt i32 %1, 0
  br i1 %45, label %.preheader.us.preheader, label %._crit_edge54

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %47 = zext i32 %3 to i64
  %48 = add nsw i64 %47, -1
  %49 = zext i32 %1 to i64
  %50 = zext i32 %0 to i64
  %xtraiter110 = and i64 %49, 1
  %lcmp.mod111 = icmp eq i64 %xtraiter110, 0
  %51 = icmp eq i32 %1, 1
  %xtraiter = and i64 %47, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %52 = icmp ult i64 %48, 3
  %53 = add nsw i64 %47, -4
  %broadcast.splatinsert133 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat134 = shufflevector <2 x double> %broadcast.splatinsert133, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge52.us, %.preheader.us.preheader
  %indvars.iv87 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next88, %._crit_edge52.us ]
  br i1 %46, label %.lr.ph.us.us.preheader, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %54 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv87, i64 0
  br label %.lr.ph.us.us

.lr.ph51..lr.ph51.split_crit_edge.us.preheader:   ; preds = %.preheader.us
  br i1 %lcmp.mod, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader

.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol

.lr.ph51..lr.ph51.split_crit_edge.us.prol:        ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader, %.lr.ph51..lr.ph51.split_crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph51..lr.ph51.split_crit_edge.us.prol ], [ 0, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph51..lr.ph51.split_crit_edge.us.prol ], [ %xtraiter, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %indvars.iv.prol
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %5
  store double %57, double* %55, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol, !llvm.loop !1

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader ], [ %xtraiter, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit ]
  br i1 %52, label %._crit_edge52.us, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader128

.lr.ph51..lr.ph51.split_crit_edge.us.preheader128: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit
  %58 = sub nsw i64 %53, %indvars.iv.unr
  %59 = lshr i64 %58, 2
  %60 = add nuw nsw i64 %59, 1
  %min.iters.check = icmp ult i64 %60, 2
  br i1 %min.iters.check, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader135, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader128
  %n.mod.vf = and i64 %60, 1
  %n.vec = sub nsw i64 %60, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %61 = or i64 %indvars.iv.unr, 4
  %62 = shl nuw i64 %59, 2
  %63 = add i64 %61, %62
  %64 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %63, %64
  br i1 %cmp.zero, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader135, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %65 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv.unr, %65
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %offset.idx
  %67 = bitcast double* %66 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %67, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec130 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec131 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec132 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %68 = fmul <2 x double> %strided.vec, %broadcast.splat134
  %69 = fmul <2 x double> %strided.vec130, %broadcast.splat134
  %70 = fmul <2 x double> %strided.vec131, %broadcast.splat134
  %71 = add nsw i64 %offset.idx, 3
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %71
  %73 = fmul <2 x double> %strided.vec132, %broadcast.splat134
  %74 = getelementptr double, double* %72, i64 -3
  %75 = bitcast double* %74 to <8 x double>*
  %76 = shufflevector <2 x double> %68, <2 x double> %69, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %77 = shufflevector <2 x double> %70, <2 x double> %73, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %76, <4 x double> %77, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %75, align 8
  %index.next = add i64 %index, 2
  %78 = icmp eq i64 %index.next, %n.vec
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge52.us, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader135

.lr.ph51..lr.ph51.split_crit_edge.us.preheader135: ; preds = %middle.block, %min.iters.checked, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader128
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader128 ], [ %ind.end, %middle.block ]
  br label %.lr.ph51..lr.ph51.split_crit_edge.us

.lr.ph51..lr.ph51.split_crit_edge.us:             ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader135, %.lr.ph51..lr.ph51.split_crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph51..lr.ph51.split_crit_edge.us ], [ %indvars.iv.ph, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader135 ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %5
  store double %81, double* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %indvars.iv.next
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %5
  store double %84, double* %82, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %5
  store double %87, double* %85, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %89 = load double, double* %88, align 8
  %90 = fmul double %89, %5
  store double %90, double* %88, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond109.3 = icmp eq i64 %indvars.iv.next.3, %47
  br i1 %exitcond109.3, label %._crit_edge52.us.loopexit136, label %.lr.ph51..lr.ph51.split_crit_edge.us, !llvm.loop !6

._crit_edge52.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge52.us

._crit_edge52.us.loopexit136:                     ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit136, %._crit_edge52.us.loopexit, %middle.block, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next88, %50
  br i1 %exitcond112, label %._crit_edge54.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv87, i64 %indvars.iv83
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, %5
  store double %93, double* %91, align 8
  br i1 %lcmp.mod111, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %94 = load double, double* %54, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 0, i64 %indvars.iv83
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fadd double %93, %97
  store double %98, double* %91, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv79.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %98, %.prol.preheader ], [ %93, %.lr.ph.us.us ]
  br i1 %51, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond = icmp eq i64 %indvars.iv.next84, %47
  br i1 %exitcond, label %._crit_edge52.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %.lr.ph.us.us.new ], [ %indvars.iv79.unr.ph, %.lr.ph.us.us.new.preheader ]
  %99 = phi double [ %111, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %100 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv87, i64 %indvars.iv79
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv79, i64 %indvars.iv83
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = fadd double %99, %104
  store double %105, double* %91, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %106 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv87, i64 %indvars.iv.next80
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next80, i64 %indvars.iv83
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fadd double %105, %110
  store double %111, double* %91, align 8
  %indvars.iv.next80.1 = add nuw nsw i64 %indvars.iv79, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next80.1, %49
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge54.loopexit:                           ; preds = %._crit_edge52.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %11, %.preheader.lr.ph, %.preheader47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next18, %._crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv17, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %21 ], [ 0, %.preheader.us ]
  %15 = add nsw i64 %indvars.iv, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond22, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, %12
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %3
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
