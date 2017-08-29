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
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
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
  %wide.trip.count111 = zext i32 %2 to i64
  %wide.trip.count115 = zext i32 %0 to i64
  br label %.preheader62.us

.preheader62.us:                                  ; preds = %._crit_edge79.us, %.preheader62.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader62.us.preheader ], [ %indvars.iv.next114, %._crit_edge79.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader62.us
  %indvars.iv109 = phi i64 [ 0, %.preheader62.us ], [ %indvars.iv.next110, %._crit_edge ]
  %14 = mul nuw nsw i64 %indvars.iv109, %indvars.iv113
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv109
  store double %19, double* %20, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next110, %wide.trip.count111
  br i1 %exitcond112, label %._crit_edge79.us, label %._crit_edge

._crit_edge79.us:                                 ; preds = %._crit_edge
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, %wide.trip.count115
  br i1 %exitcond116, label %.preheader61.loopexit, label %.preheader62.us

.preheader61.loopexit:                            ; preds = %._crit_edge79.us
  br label %.preheader61

.preheader61:                                     ; preds = %.preheader61.loopexit, %10
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader60.lr.ph, label %.preheader59

.preheader60.lr.ph:                               ; preds = %.preheader61
  %22 = icmp sgt i32 %1, 0
  %23 = sitofp i32 %1 to double
  br i1 %22, label %.preheader60.us.preheader, label %.preheader57

.preheader60.us.preheader:                        ; preds = %.preheader60.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %24 = icmp eq i32 %1, 1
  %wide.trip.count106 = zext i32 %2 to i64
  %wide.trip.count102.1 = zext i32 %1 to i64
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %._crit_edge74.us, %.preheader60.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next105, %._crit_edge74.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader60.us
  %25 = trunc i64 %indvars.iv104 to i32
  %26 = srem i32 %25, %1
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %23
  %29 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv104, i64 0
  store double %28, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader60.us, %.prol.preheader
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader60.us ]
  br i1 %24, label %._crit_edge74.us, label %.preheader60.us.new.preheader

.preheader60.us.new.preheader:                    ; preds = %.prol.loopexit
  br label %.preheader60.us.new

.preheader60.us.new:                              ; preds = %.preheader60.us.new.preheader, %.preheader60.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.preheader60.us.new ], [ %indvars.iv100.unr.ph, %.preheader60.us.new.preheader ]
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %30 = mul nuw nsw i64 %indvars.iv.next101, %indvars.iv104
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %1
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %23
  %35 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv104, i64 %indvars.iv100
  store double %34, double* %35, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %36 = mul nuw nsw i64 %indvars.iv.next101.1, %indvars.iv104
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %1
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %23
  %41 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv104, i64 %indvars.iv.next101
  store double %40, double* %41, align 8
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count102.1
  br i1 %exitcond103.1, label %._crit_edge74.us.loopexit, label %.preheader60.us.new

._crit_edge74.us.loopexit:                        ; preds = %.preheader60.us.new
  br label %._crit_edge74.us

._crit_edge74.us:                                 ; preds = %._crit_edge74.us.loopexit, %.prol.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, %wide.trip.count106
  br i1 %exitcond107, label %.preheader59.loopexit, label %.preheader60.us

.preheader59.loopexit:                            ; preds = %._crit_edge74.us
  br label %.preheader59

.preheader59:                                     ; preds = %.preheader59.loopexit, %.preheader61, %.preheader62.lr.ph
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.preheader58.lr.ph, label %.preheader57

.preheader58.lr.ph:                               ; preds = %.preheader59
  %43 = icmp sgt i32 %3, 0
  %44 = sitofp i32 %3 to double
  br i1 %43, label %.preheader58.us.preheader, label %.preheader57

.preheader58.us.preheader:                        ; preds = %.preheader58.lr.ph
  %wide.trip.count93 = zext i32 %3 to i64
  %wide.trip.count97 = zext i32 %1 to i64
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %._crit_edge69.us, %.preheader58.us.preheader
  %indvars.iv95 = phi i64 [ 0, %.preheader58.us.preheader ], [ %indvars.iv.next96, %._crit_edge69.us ]
  br label %._crit_edge118

._crit_edge118:                                   ; preds = %._crit_edge118, %.preheader58.us
  %indvars.iv91 = phi i64 [ 0, %.preheader58.us ], [ %indvars.iv.next92, %._crit_edge118 ]
  %45 = add nuw nsw i64 %indvars.iv91, 3
  %46 = mul nuw nsw i64 %45, %indvars.iv95
  %47 = add nuw nsw i64 %46, 1
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, %3
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %44
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv95, i64 %indvars.iv91
  store double %51, double* %52, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %._crit_edge69.us, label %._crit_edge118

._crit_edge69.us:                                 ; preds = %._crit_edge118
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98, label %.preheader57.loopexit, label %.preheader58.us

.preheader57.loopexit:                            ; preds = %._crit_edge69.us
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.preheader58.lr.ph, %.preheader59, %.preheader60.lr.ph
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge66

.preheader.lr.ph:                                 ; preds = %.preheader57
  %53 = icmp sgt i32 %3, 0
  %54 = sitofp i32 %2 to double
  br i1 %53, label %.preheader.us.preheader, label %._crit_edge66

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count88 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv86 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next87, %._crit_edge.us ]
  br label %._crit_edge119

._crit_edge119:                                   ; preds = %._crit_edge119, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge119 ]
  %55 = add nuw nsw i64 %indvars.iv, 2
  %56 = mul nuw nsw i64 %55, %indvars.iv86
  %57 = trunc i64 %56 to i32
  %58 = srem i32 %57, %2
  %59 = sitofp i32 %58 to double
  %60 = fdiv double %59, %54
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv86, i64 %indvars.iv
  store double %60, double* %61, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge119

._crit_edge.us:                                   ; preds = %._crit_edge119
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond89, label %._crit_edge66.loopexit, label %.preheader.us

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
  %15 = add i32 %1, -1
  %16 = zext i32 %15 to i64
  %17 = shl nuw nsw i64 %16, 3
  %18 = add nuw nsw i64 %17, 8
  %xtraiter104 = and i32 %2, 1
  %lcmp.mod105 = icmp eq i32 %xtraiter104, 0
  %19 = icmp eq i32 %2, 1
  %wide.trip.count108 = zext i32 %1 to i64
  %wide.trip.count100.1 = zext i32 %2 to i64
  %wide.trip.count114 = zext i32 %0 to i64
  br label %.preheader48.us

.preheader48.us:                                  ; preds = %._crit_edge67.us, %.preheader48.us.preheader
  %indvars.iv112 = phi i64 [ 0, %.preheader48.us.preheader ], [ %indvars.iv.next113, %._crit_edge67.us ]
  br i1 %14, label %.lr.ph63.us.us.preheader, label %._crit_edge67.us.loopexit77

.lr.ph63.us.us.preheader:                         ; preds = %.preheader48.us
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv112, i64 0
  br label %.lr.ph63.us.us

._crit_edge67.us.loopexit77:                      ; preds = %.preheader48.us
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvars.iv112, i64 0
  %scevgep97 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97, i8 0, i64 %18, i32 8, i1 false)
  br label %._crit_edge67.us

._crit_edge67.us.loopexit:                        ; preds = %._crit_edge64.us.us
  br label %._crit_edge67.us

._crit_edge67.us:                                 ; preds = %._crit_edge67.us.loopexit, %._crit_edge67.us.loopexit77
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, %wide.trip.count114
  br i1 %exitcond115, label %.preheader.lr.ph.loopexit, label %.preheader48.us

.lr.ph63.us.us:                                   ; preds = %._crit_edge64.us.us, %.lr.ph63.us.us.preheader
  %indvars.iv106 = phi i64 [ 0, %.lr.ph63.us.us.preheader ], [ %indvars.iv.next107, %._crit_edge64.us.us ]
  %21 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv112, i64 %indvars.iv106
  store double 0.000000e+00, double* %21, align 8
  br i1 %lcmp.mod105, label %.prol.loopexit103, label %.prol.preheader102

.prol.preheader102:                               ; preds = %.lr.ph63.us.us
  %22 = load double, double* %20, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 0, i64 %indvars.iv106
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %26, 0.000000e+00
  store double %27, double* %21, align 8
  br label %.prol.loopexit103

.prol.loopexit103:                                ; preds = %.lr.ph63.us.us, %.prol.preheader102
  %28 = phi double [ %27, %.prol.preheader102 ], [ 0.000000e+00, %.lr.ph63.us.us ]
  %indvars.iv98.unr.ph = phi i64 [ 1, %.prol.preheader102 ], [ 0, %.lr.ph63.us.us ]
  br i1 %19, label %._crit_edge64.us.us, label %.lr.ph63.us.us.new.preheader

.lr.ph63.us.us.new.preheader:                     ; preds = %.prol.loopexit103
  br label %.lr.ph63.us.us.new

._crit_edge64.us.us.loopexit:                     ; preds = %.lr.ph63.us.us.new
  br label %._crit_edge64.us.us

._crit_edge64.us.us:                              ; preds = %._crit_edge64.us.us.loopexit, %.prol.loopexit103
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, %wide.trip.count108
  br i1 %exitcond109, label %._crit_edge67.us.loopexit, label %.lr.ph63.us.us

.lr.ph63.us.us.new:                               ; preds = %.lr.ph63.us.us.new.preheader, %.lr.ph63.us.us.new
  %29 = phi double [ %43, %.lr.ph63.us.us.new ], [ %28, %.lr.ph63.us.us.new.preheader ]
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %.lr.ph63.us.us.new ], [ %indvars.iv98.unr.ph, %.lr.ph63.us.us.new.preheader ]
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv112, i64 %indvars.iv98
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %4
  %33 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv98, i64 %indvars.iv106
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %29, %35
  store double %36, double* %21, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv112, i64 %indvars.iv.next99
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %4
  %40 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next99, i64 %indvars.iv106
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %36, %42
  store double %43, double* %21, align 8
  %indvars.iv.next99.1 = add nuw nsw i64 %indvars.iv98, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99.1, %wide.trip.count100.1
  br i1 %exitcond101.1, label %._crit_edge64.us.us.loopexit, label %.lr.ph63.us.us.new

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge67.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader48.lr.ph
  %44 = icmp sgt i32 %3, 0
  br i1 %44, label %.preheader.us.preheader, label %._crit_edge54

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %45 = add i32 %3, -1
  %xtraiter82 = and i32 %1, 1
  %lcmp.mod83 = icmp eq i32 %xtraiter82, 0
  %46 = icmp eq i32 %1, 1
  %wide.trip.count87 = zext i32 %3 to i64
  %wide.trip.count81.1 = zext i32 %1 to i64
  %wide.trip.count90 = zext i32 %0 to i64
  %xtraiter = and i32 %3, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %47 = icmp ult i32 %45, 3
  %48 = add nsw i32 %xtraiter, -1
  %49 = zext i32 %48 to i64
  %50 = add nuw nsw i64 %49, 1
  %51 = add nsw i64 %wide.trip.count87, -4
  %broadcast.splatinsert125 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat126 = shufflevector <2 x double> %broadcast.splatinsert125, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge52.us, %.preheader.us.preheader
  %indvars.iv88 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next89, %._crit_edge52.us ]
  br i1 %13, label %.lr.ph.us.us.preheader, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %52 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv88, i64 0
  br label %.lr.ph.us.us

.lr.ph51..lr.ph51.split_crit_edge.us.preheader:   ; preds = %.preheader.us
  br i1 %lcmp.mod, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader

.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol

.lr.ph51..lr.ph51.split_crit_edge.us.prol:        ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader, %.lr.ph51..lr.ph51.split_crit_edge.us.prol..lr.ph51..lr.ph51.split_crit_edge.us.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph51..lr.ph51.split_crit_edge.us.prol..lr.ph51..lr.ph51.split_crit_edge.us.prol_crit_edge ], [ 0, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph51..lr.ph51.split_crit_edge.us.prol..lr.ph51..lr.ph51.split_crit_edge.us.prol_crit_edge ], [ %xtraiter, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.preheader ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %indvars.iv.prol
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %5
  store double %55, double* %53, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph51..lr.ph51.split_crit_edge.us.prol..lr.ph51..lr.ph51.split_crit_edge.us.prol_crit_edge, !llvm.loop !1

.lr.ph51..lr.ph51.split_crit_edge.us.prol..lr.ph51..lr.ph51.split_crit_edge.us.prol_crit_edge: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol
  br label %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit

.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader ], [ %50, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit.loopexit ]
  br i1 %47, label %._crit_edge52.us, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader120

.lr.ph51..lr.ph51.split_crit_edge.us.preheader120: ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit
  %56 = sub nsw i64 %51, %indvars.iv.unr
  %57 = lshr i64 %56, 2
  %58 = add nuw nsw i64 %57, 1
  %min.iters.check = icmp ult i64 %58, 2
  br i1 %min.iters.check, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader127, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader120
  %n.mod.vf = and i64 %58, 1
  %n.vec = sub nsw i64 %58, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %59 = add nsw i64 %indvars.iv.unr, 4
  %60 = shl nuw i64 %57, 2
  %61 = add i64 %59, %60
  %62 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %61, %62
  br i1 %cmp.zero, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader127, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %63 = shl i64 %index, 2
  %64 = add i64 %indvars.iv.unr, %63
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %64
  %66 = bitcast double* %65 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %66, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec122 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec123 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec124 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %67 = fmul <2 x double> %strided.vec, %broadcast.splat126
  %68 = fmul <2 x double> %strided.vec122, %broadcast.splat126
  %69 = fmul <2 x double> %strided.vec123, %broadcast.splat126
  %70 = add nsw i64 %64, 3
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %70
  %72 = fmul <2 x double> %strided.vec124, %broadcast.splat126
  %73 = getelementptr double, double* %71, i64 -3
  %74 = bitcast double* %73 to <8 x double>*
  %75 = shufflevector <2 x double> %67, <2 x double> %68, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %76 = shufflevector <2 x double> %69, <2 x double> %72, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %75, <4 x double> %76, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %74, align 8
  %index.next = add i64 %index, 2
  %77 = icmp eq i64 %index.next, %n.vec
  br i1 %77, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge52.us, label %.lr.ph51..lr.ph51.split_crit_edge.us.preheader127

.lr.ph51..lr.ph51.split_crit_edge.us.preheader127: ; preds = %middle.block, %min.iters.checked, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader120
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader120 ]
  br label %.lr.ph51..lr.ph51.split_crit_edge.us

.lr.ph51..lr.ph51.split_crit_edge.us:             ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us.preheader127, %.lr.ph51..lr.ph51.split_crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph51..lr.ph51.split_crit_edge.us ], [ %indvars.iv.ph, %.lr.ph51..lr.ph51.split_crit_edge.us.preheader127 ]
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %5
  store double %80, double* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %indvars.iv.next
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, %5
  store double %83, double* %81, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %indvars.iv.next.1
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %5
  store double %86, double* %84, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %indvars.iv.next.2
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %5
  store double %89, double* %87, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count87
  br i1 %exitcond.3, label %._crit_edge52.us.loopexit128, label %.lr.ph51..lr.ph51.split_crit_edge.us, !llvm.loop !6

._crit_edge52.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge52.us

._crit_edge52.us.loopexit128:                     ; preds = %.lr.ph51..lr.ph51.split_crit_edge.us
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit128, %._crit_edge52.us.loopexit, %middle.block, %.lr.ph51..lr.ph51.split_crit_edge.us.prol.loopexit
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %._crit_edge54.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv85 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next86, %._crit_edge.us.us ]
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv88, i64 %indvars.iv85
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, %5
  store double %92, double* %90, align 8
  br i1 %lcmp.mod83, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %93 = load double, double* %52, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 0, i64 %indvars.iv85
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fadd double %92, %96
  store double %97, double* %90, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %98 = phi double [ %97, %.prol.preheader ], [ %92, %.lr.ph.us.us ]
  %indvars.iv79.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %46, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond, label %._crit_edge52.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %99 = phi double [ %111, %.lr.ph.us.us.new ], [ %98, %.lr.ph.us.us.new.preheader ]
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %.lr.ph.us.us.new ], [ %indvars.iv79.unr.ph, %.lr.ph.us.us.new.preheader ]
  %100 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv88, i64 %indvars.iv79
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv79, i64 %indvars.iv85
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = fadd double %99, %104
  store double %105, double* %90, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %106 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv88, i64 %indvars.iv.next80
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next80, i64 %indvars.iv85
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fadd double %105, %110
  store double %111, double* %90, align 8
  %indvars.iv.next80.1 = add nuw nsw i64 %indvars.iv79, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next80.1, %wide.trip.count81.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge54.loopexit:                           ; preds = %._crit_edge52.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %.preheader.lr.ph, %11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
