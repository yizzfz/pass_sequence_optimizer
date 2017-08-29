; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %2, %.preheader18._crit_edge..preheader19_crit_edge
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %.preheader18._crit_edge..preheader19_crit_edge ], [ 0, %2 ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %.preheader18._crit_edge..preheader19_crit_edge ], [ 1, %2 ]
  %3 = mul nuw nsw i64 %indvars.iv73, 2001
  %4 = add nuw nsw i64 %3, 1
  %5 = sub i64 1998, %indvars.iv73
  %6 = shl i64 %5, 3
  br label %._crit_edge32

.preheader18:                                     ; preds = %._crit_edge32
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %7 = and i64 %6, 34359738360
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %8 = icmp slt i64 %indvars.iv.next74, 2000
  br i1 %8, label %.preheader18._crit_edge.thread, label %.preheader18._crit_edge

._crit_edge32:                                    ; preds = %._crit_edge32, %.lr.ph
  %indvars.iv56 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next57, %._crit_edge32 ]
  %9 = sub nsw i64 0, %indvars.iv56
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv73, i64 %indvars.iv56
  store double %14, double* %15, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next57, %indvars.iv71
  br i1 %exitcond64, label %.preheader18, label %._crit_edge32

.preheader18._crit_edge.thread:                   ; preds = %.preheader18
  %16 = add nuw nsw i64 %7, 8
  %17 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %17, i8 0, i64 %16, i32 8, i1 false)
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv73, i64 %indvars.iv73
  store double 1.000000e+00, double* %18, align 8
  br label %.preheader18._crit_edge..preheader19_crit_edge

.preheader18._crit_edge:                          ; preds = %.preheader18
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv73, i64 %indvars.iv73
  store double 1.000000e+00, double* %19, align 8
  %exitcond75 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond75, label %.preheader15.preheader, label %.preheader18._crit_edge..preheader19_crit_edge

.preheader18._crit_edge..preheader19_crit_edge:   ; preds = %.preheader18._crit_edge.thread, %.preheader18._crit_edge
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  br label %.lr.ph

.preheader15.preheader:                           ; preds = %.preheader18._crit_edge
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %21 = bitcast i8* %20 to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 32000000, i32 8, i1 false)
  %22 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader15

.preheader15:                                     ; preds = %39, %.preheader15.preheader
  %indvars.iv47 = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next48, %39 ]
  br label %.preheader14

.preheader14:                                     ; preds = %38, %.preheader15
  %indvars.iv44 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next45, %38 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv47
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35, %.preheader14
  %indvars.iv41 = phi i64 [ 0, %.preheader14 ], [ %indvars.iv.next42.1, %._crit_edge35 ]
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv47
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv44, i64 %indvars.iv41
  %29 = load double, double* %28, align 8
  %30 = fadd double %29, %27
  store double %30, double* %28, align 8
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  %31 = load double, double* %23, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next42, i64 %indvars.iv47
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next42
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %35, align 8
  %indvars.iv.next42.1 = add nuw nsw i64 %indvars.iv41, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next42.1, 2000
  br i1 %exitcond43.1, label %38, label %._crit_edge35

; <label>:38:                                     ; preds = %._crit_edge35
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond46, label %39, label %.preheader14

; <label>:39:                                     ; preds = %38
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond49, label %.preheader.preheader, label %.preheader15

.preheader.preheader:                             ; preds = %39
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %middle.block ], [ 0, %.preheader.preheader ]
  %scevgep77 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 0
  %40 = add nuw nsw i64 %indvars.iv38, 1
  %scevgep79 = getelementptr [2000 x double], [2000 x double]* %1, i64 %40, i64 0
  %scevgep81 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 0
  %scevgep83 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %40, i64 0
  %bound0 = icmp ult double* %scevgep77, %scevgep83
  %bound1 = icmp ult double* %scevgep81, %scevgep79
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge36.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

._crit_edge36.preheader:                          ; preds = %.preheader
  br label %._crit_edge36

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 %index
  %42 = bitcast double* %41 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %42, align 8, !alias.scope !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load86 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %index
  %46 = bitcast double* %45 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %46, align 8, !alias.scope !4, !noalias !1
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load86, <2 x i64>* %48, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 %index.next
  %50 = bitcast double* %49 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !1
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load86.1 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !1
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %index.next
  %54 = bitcast double* %53 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %54, align 8, !alias.scope !4, !noalias !1
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load86.1, <2 x i64>* %56, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nuw nsw i64 %index, 8
  %57 = icmp eq i64 %index.next.1, 2000
  br i1 %57, label %middle.block.loopexit87, label %vector.body, !llvm.loop !6

._crit_edge36:                                    ; preds = %._crit_edge36, %._crit_edge36.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge36.preheader ], [ %indvars.iv.next.4, %._crit_edge36 ]
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 %indvars.iv
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 %indvars.iv.next
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv38, i64 %indvars.iv.next.3
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next.3
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block.loopexit, label %._crit_edge36, !llvm.loop !9

middle.block.loopexit:                            ; preds = %._crit_edge36
  br label %middle.block

middle.block.loopexit87:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit87, %middle.block.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 2000
  br i1 %exitcond40, label %83, label %.preheader

; <label>:83:                                     ; preds = %middle.block
  tail call void @free(i8* nonnull %20) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader4._crit_edge, %2
  %indvars.iv47 = phi i2 [ %indvars.iv.next48, %.preheader4._crit_edge ], [ 0, %2 ]
  %indvars.iv38 = phi i64 [ 0, %2 ], [ %indvars.iv.next39, %.preheader4._crit_edge ]
  %3 = zext i2 %indvars.iv47 to i64
  %4 = add nsw i64 %indvars.iv38, -1
  %5 = icmp sgt i64 %indvars.iv38, 0
  br i1 %5, label %.preheader.preheader, label %.preheader4._crit_edge

.preheader.preheader:                             ; preds = %.preheader5
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 0
  br label %.preheader

.lr.ph10:                                         ; preds = %.preheader._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv38
  %.pre41 = load double, double* %7, align 8
  %xtraiter42 = and i64 %indvars.iv38, 3
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %._crit_edge15.prol.loopexit, label %._crit_edge15.prol.preheader

._crit_edge15.prol.preheader:                     ; preds = %.lr.ph10
  br label %._crit_edge15.prol

._crit_edge15.prol:                               ; preds = %._crit_edge15.prol, %._crit_edge15.prol.preheader
  %8 = phi double [ %.pre41, %._crit_edge15.prol.preheader ], [ %12, %._crit_edge15.prol ]
  %indvars.iv30.prol = phi i64 [ 0, %._crit_edge15.prol.preheader ], [ %indvars.iv.next31.prol, %._crit_edge15.prol ]
  %prol.iter = phi i64 [ %xtraiter42, %._crit_edge15.prol.preheader ], [ %prol.iter.sub, %._crit_edge15.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv30.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next31.prol = add nuw nsw i64 %indvars.iv30.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge15.prol.loopexit.unr-lcssa, label %._crit_edge15.prol, !llvm.loop !10

._crit_edge15.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge15.prol
  br label %._crit_edge15.prol.loopexit

._crit_edge15.prol.loopexit:                      ; preds = %.lr.ph10, %._crit_edge15.prol.loopexit.unr-lcssa
  %.unr44 = phi double [ %.pre41, %.lr.ph10 ], [ %12, %._crit_edge15.prol.loopexit.unr-lcssa ]
  %indvars.iv30.unr = phi i64 [ 0, %.lr.ph10 ], [ %3, %._crit_edge15.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %.preheader4._crit_edge.loopexit, label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %._crit_edge15.prol.loopexit
  br label %._crit_edge15

.preheader:                                       ; preds = %.preheader.preheader, %.preheader._crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %.preheader._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv22, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv22
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge14.preheader, label %.preheader._crit_edge

._crit_edge14.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv22, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge14.prol.loopexit.unr-lcssa, label %._crit_edge14.prol.preheader

._crit_edge14.prol.preheader:                     ; preds = %._crit_edge14.preheader
  br label %._crit_edge14.prol

._crit_edge14.prol:                               ; preds = %._crit_edge14.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge14.prol.loopexit.unr-lcssa

._crit_edge14.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge14.preheader, %._crit_edge14.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge14.prol ], [ undef, %._crit_edge14.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge14.prol ], [ %.pre, %._crit_edge14.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge14.prol ], [ 0, %._crit_edge14.preheader ]
  br label %._crit_edge14.prol.loopexit

._crit_edge14.prol.loopexit:                      ; preds = %._crit_edge14.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv22, 1
  br i1 %21, label %.preheader._crit_edge.loopexit, label %._crit_edge14.preheader.new

._crit_edge14.preheader.new:                      ; preds = %._crit_edge14.prol.loopexit
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14, %._crit_edge14.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge14.preheader.new ], [ %34, %._crit_edge14 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge14.preheader.new ], [ %indvars.iv.next.1, %._crit_edge14 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond21.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv22
  br i1 %exitcond21.1, label %.preheader._crit_edge.loopexit.unr-lcssa, label %._crit_edge14

.preheader._crit_edge.loopexit.unr-lcssa:         ; preds = %._crit_edge14
  br label %.preheader._crit_edge.loopexit

.preheader._crit_edge.loopexit:                   ; preds = %._crit_edge14.prol.loopexit, %.preheader._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge14.prol.loopexit ], [ %34, %.preheader._crit_edge.loopexit.unr-lcssa ]
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %.preheader._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv22
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next23, %indvars.iv38
  br i1 %exitcond29, label %.lr.ph10, label %.preheader

._crit_edge15:                                    ; preds = %._crit_edge15, %.lr.ph10.new
  %39 = phi double [ %.unr44, %.lr.ph10.new ], [ %55, %._crit_edge15 ]
  %indvars.iv30 = phi i64 [ %indvars.iv30.unr, %.lr.ph10.new ], [ %indvars.iv.next31.3, %._crit_edge15 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv30
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next31
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next31.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next31.2 = add nsw i64 %indvars.iv30, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next31.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next31.3 = add nsw i64 %indvars.iv30, 4
  %exitcond37.3 = icmp eq i64 %indvars.iv.next31.3, %indvars.iv38
  br i1 %exitcond37.3, label %.preheader4._crit_edge.loopexit.unr-lcssa, label %._crit_edge15

.preheader4._crit_edge.loopexit.unr-lcssa:        ; preds = %._crit_edge15
  br label %.preheader4._crit_edge.loopexit

.preheader4._crit_edge.loopexit:                  ; preds = %._crit_edge15.prol.loopexit, %.preheader4._crit_edge.loopexit.unr-lcssa
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4._crit_edge.loopexit, %.preheader5
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv38
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 2000
  %indvars.iv.next48 = add i2 %indvars.iv47, 1
  br i1 %exitcond, label %59, label %.preheader5

; <label>:59:                                     ; preds = %.preheader4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader._crit_edge, %2
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.preheader._crit_edge ], [ 0, %2 ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %.preheader._crit_edge ], [ 1, %2 ]
  %7 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge5, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge5 ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge5

; <label>:12:                                     ; preds = %._crit_edge6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge6, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, %indvars.iv13
  br i1 %exitcond12, label %.preheader._crit_edge, label %._crit_edge6

.preheader._crit_edge:                            ; preds = %._crit_edge5
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 2000
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  br i1 %exitcond, label %18, label %.lr.ph

; <label>:18:                                     ; preds = %.preheader._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
