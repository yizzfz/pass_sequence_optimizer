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
  br i1 true, label %.preheader64.lr.ph, label %._crit_edge132.thread

._crit_edge132.thread:                            ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge70

.preheader64.lr.ph:                               ; preds = %2
  br label %.preheader64

.preheader64:                                     ; preds = %._crit_edge125, %.preheader64.lr.ph
  %indvars.iv126131 = phi i64 [ 1, %.preheader64.lr.ph ], [ %indvars.iv.next127, %._crit_edge125 ]
  %indvars.iv128130 = phi i64 [ 0, %.preheader64.lr.ph ], [ %indvars.iv.next129, %._crit_edge125 ]
  %4 = mul nuw nsw i64 %indvars.iv128130, 2001
  %5 = add nuw nsw i64 %4, 1
  %scevgep140 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  br label %._crit_edge

.preheader63:                                     ; preds = %._crit_edge
  %6 = mul nsw i64 %indvars.iv128130, -8
  %scevgep140141 = bitcast double* %scevgep140 to i8*
  %7 = add nsw i64 15992, %6
  %exitcond120122 = icmp eq i64 %indvars.iv128130, 1999
  br i1 %exitcond120122, label %._crit_edge125, label %._crit_edge125.loopexit

._crit_edge:                                      ; preds = %._crit_edge, %.preheader64
  %indvars.iv115 = phi i64 [ 0, %.preheader64 ], [ %indvars.iv.next110, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv115
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128130, i64 %indvars.iv115
  store double %13, double* %14, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next110, %indvars.iv126131
  br i1 %exitcond114, label %.preheader63, label %._crit_edge

._crit_edge125.loopexit:                          ; preds = %.preheader63
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep140141, i8 0, i64 %7, i32 8, i1 false)
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %.preheader63, %._crit_edge125.loopexit
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128130, i64 %indvars.iv128130
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128130, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next129, 2000
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126131, 1
  br i1 %exitcond142, label %._crit_edge132, label %.preheader64

._crit_edge132:                                   ; preds = %._crit_edge125
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge106.us.prol.loopexit, label %._crit_edge106.us.prol.preheader

._crit_edge106.us.prol.preheader:                 ; preds = %._crit_edge132
  br label %._crit_edge106.us.prol

._crit_edge106.us.prol:                           ; preds = %._crit_edge106.us.prol, %._crit_edge106.us.prol.preheader
  %indvars.iv108.us.prol = phi i64 [ 0, %._crit_edge106.us.prol.preheader ], [ %indvars.iv.next107.us.prol, %._crit_edge106.us.prol ]
  %prol.iter195 = phi i64 [ 0, %._crit_edge106.us.prol.preheader ], [ %prol.iter195.sub, %._crit_edge106.us.prol ]
  %18 = mul nuw nsw i64 %indvars.iv108.us.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.us.prol = add nuw nsw i64 %indvars.iv108.us.prol, 1
  %prol.iter195.sub = add nsw i64 %prol.iter195, -1
  %prol.iter195.cmp = icmp eq i64 %prol.iter195.sub, 0
  br i1 %prol.iter195.cmp, label %._crit_edge106.us.prol.loopexit.unr-lcssa, label %._crit_edge106.us.prol, !llvm.loop !1

._crit_edge106.us.prol.loopexit.unr-lcssa:        ; preds = %._crit_edge106.us.prol
  br label %._crit_edge106.us.prol.loopexit

._crit_edge106.us.prol.loopexit:                  ; preds = %._crit_edge132, %._crit_edge106.us.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge106.us.prol.loopexit..preheader60.us.preheader_crit_edge, label %._crit_edge132.new

._crit_edge106.us.prol.loopexit..preheader60.us.preheader_crit_edge: ; preds = %._crit_edge106.us.prol.loopexit
  br label %.preheader60.us.preheader

._crit_edge132.new:                               ; preds = %._crit_edge106.us.prol.loopexit
  br label %._crit_edge106.us

._crit_edge106.us:                                ; preds = %._crit_edge106.us, %._crit_edge132.new
  %indvars.iv108.us = phi i64 [ 0, %._crit_edge132.new ], [ %indvars.iv.next107.us.7, %._crit_edge106.us ]
  %19 = mul i64 %indvars.iv108.us, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %20 = add i64 %19, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %21 = add i64 %19, 32000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %22 = add i64 %19, 48000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %23 = add i64 %19, 64000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %24 = add i64 %19, 80000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %25 = add i64 %19, 96000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %26 = add i64 %19, 112000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.us.7 = add nsw i64 %indvars.iv108.us, 8
  %exitcond134.7 = icmp eq i64 %indvars.iv.next107.us.7, 2000
  br i1 %exitcond134.7, label %.preheader60.us.preheader.unr-lcssa, label %._crit_edge106.us

.preheader60.us.preheader.unr-lcssa:              ; preds = %._crit_edge106.us
  br label %.preheader60.us.preheader

.preheader60.us.preheader:                        ; preds = %._crit_edge106.us.prol.loopexit..preheader60.us.preheader_crit_edge, %.preheader60.us.preheader.unr-lcssa
  br label %.preheader59.us.us.preheader

.preheader59.us.us.preheader:                     ; preds = %._crit_edge84.us, %.preheader60.us.preheader
  %indvars.iv86.us = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next85.us, %._crit_edge84.us ]
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv86.us
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  %27 = add nsw i64 %indvars.iv86.us, -1999
  %scevgep152 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %27
  %scevgep152153 = bitcast double* %scevgep152 to i8*
  br label %.preheader59.us.us

._crit_edge84.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next85.us = add nuw nsw i64 %indvars.iv86.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next85.us, 2000
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader59.us.us.preheader

.preheader59.us.us:                               ; preds = %._crit_edge77.us.us, %.preheader59.us.us.preheader
  %indvars.iv82.us.us = phi i64 [ 0, %.preheader59.us.us.preheader ], [ %indvars.iv.next78.us.us, %._crit_edge77.us.us ]
  %28 = mul nuw nsw i64 %indvars.iv82.us.us, 16000
  %scevgep148 = getelementptr i8, i8* %16, i64 %28
  %29 = add i64 16000, %28
  %scevgep149 = getelementptr i8, i8* %16, i64 %29
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82.us.us, i64 %indvars.iv86.us
  br i1 false, label %.preheader59.us.us.._crit_edge143.preheader_crit_edge, label %min.iters.checked

.preheader59.us.us.._crit_edge143.preheader_crit_edge: ; preds = %.preheader59.us.us
  br label %._crit_edge143.preheader

._crit_edge143.preheader:                         ; preds = %middle.block.._crit_edge143.preheader_crit_edge, %min.iters.checked.._crit_edge143.preheader_crit_edge, %.preheader59.us.us.._crit_edge143.preheader_crit_edge, %vector.memcheck
  br i1 true, label %._crit_edge143.prol.loopexit.unr-lcssa, label %._crit_edge143.prol.preheader

._crit_edge143.prol.preheader:                    ; preds = %._crit_edge143.preheader
  %31 = load double, double* %30, align 8
  %32 = load double, double* %scevgep150, align 8
  %33 = fmul double %31, %32
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv82.us.us, i64 0
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  br label %._crit_edge143.prol.loopexit.unr-lcssa

._crit_edge143.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge143.preheader, %._crit_edge143.prol.preheader
  br i1 false, label %._crit_edge143.prol.loopexit.unr-lcssa.._crit_edge77.us.us.loopexit_crit_edge, label %._crit_edge143.preheader.new

._crit_edge143.prol.loopexit.unr-lcssa.._crit_edge77.us.us.loopexit_crit_edge: ; preds = %._crit_edge143.prol.loopexit.unr-lcssa
  br label %._crit_edge77.us.us.loopexit

._crit_edge143.preheader.new:                     ; preds = %._crit_edge143.prol.loopexit.unr-lcssa
  br label %._crit_edge143

min.iters.checked:                                ; preds = %.preheader59.us.us
  br i1 false, label %min.iters.checked.._crit_edge143.preheader_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge143.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge143.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep148, %scevgep152153
  %bound1 = icmp ult i8* %scevgep150151, %scevgep149
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %30 to i8*
  %bound0155 = icmp ult i8* %scevgep148, %bc
  %bound1156 = icmp ult i8* %bc, %scevgep149
  %found.conflict157 = and i1 %bound0155, %bound1156
  %conflict.rdx = or i1 %found.conflict, %found.conflict157
  br i1 %conflict.rdx, label %._crit_edge143.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %37 = load double, double* %30, align 8, !alias.scope !3
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %40 = or i64 %index, 1
  %41 = or i64 %index, 2
  %42 = or i64 %index, 3
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv86.us
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %40, i64 %indvars.iv86.us
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %41, i64 %indvars.iv86.us
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %42, i64 %indvars.iv86.us
  %47 = load double, double* %43, align 8, !alias.scope !6
  %48 = load double, double* %44, align 8, !alias.scope !6
  %49 = load double, double* %45, align 8, !alias.scope !6
  %50 = load double, double* %46, align 8, !alias.scope !6
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %48, i32 1
  %53 = insertelement <2 x double> undef, double %49, i32 0
  %54 = insertelement <2 x double> %53, double %50, i32 1
  %55 = fmul <2 x double> %39, %52
  %56 = fmul <2 x double> %39, %54
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv82.us.us, i64 %index
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !8, !noalias !10
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !8, !noalias !10
  %61 = fadd <2 x double> %wide.load, %55
  %62 = fadd <2 x double> %wide.load159, %56
  store <2 x double> %61, <2 x double>* %58, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %62, <2 x double>* %60, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %63 = icmp eq i64 %index.next, 2000
  br i1 %63, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge77.us.us, label %middle.block.._crit_edge143.preheader_crit_edge

middle.block.._crit_edge143.preheader_crit_edge:  ; preds = %middle.block
  br label %._crit_edge143.preheader

._crit_edge77.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge143
  br label %._crit_edge77.us.us.loopexit

._crit_edge77.us.us.loopexit:                     ; preds = %._crit_edge143.prol.loopexit.unr-lcssa.._crit_edge77.us.us.loopexit_crit_edge, %._crit_edge77.us.us.loopexit.unr-lcssa
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %._crit_edge77.us.us.loopexit, %middle.block
  %indvars.iv.next78.us.us = add nuw nsw i64 %indvars.iv82.us.us, 1
  %exitcond80.us.us = icmp eq i64 %indvars.iv.next78.us.us, 2000
  br i1 %exitcond80.us.us, label %._crit_edge84.us, label %.preheader59.us.us

._crit_edge143:                                   ; preds = %._crit_edge143, %._crit_edge143.preheader.new
  %indvars.iv75.us.us = phi i64 [ 0, %._crit_edge143.preheader.new ], [ %indvars.iv.next71.us.us.1, %._crit_edge143 ]
  %64 = load double, double* %30, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv75.us.us, i64 %indvars.iv86.us
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv82.us.us, i64 %indvars.iv75.us.us
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next71.us.us = add nuw nsw i64 %indvars.iv75.us.us, 1
  %71 = load double, double* %30, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next71.us.us, i64 %indvars.iv86.us
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv82.us.us, i64 %indvars.iv.next71.us.us
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %indvars.iv.next71.us.us.1 = add nsw i64 %indvars.iv75.us.us, 2
  %exitcond73.us.us.1 = icmp eq i64 %indvars.iv.next71.us.us.1, 2000
  br i1 %exitcond73.us.us.1, label %._crit_edge77.us.us.loopexit.unr-lcssa, label %._crit_edge143, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge84.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv68.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next67.us, %._crit_edge.us ]
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 0
  %scevgep169170 = bitcast double* %scevgep169 to i8*
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 2000
  %scevgep171172 = bitcast double* %scevgep171 to i8*
  %78 = mul nuw nsw i64 %indvars.iv68.us, 16000
  %scevgep173 = getelementptr i8, i8* %16, i64 %78
  %79 = add i64 16000, %78
  %scevgep174 = getelementptr i8, i8* %16, i64 %79
  br i1 false, label %.preheader.us.._crit_edge144.preheader_crit_edge, label %min.iters.checked164

.preheader.us.._crit_edge144.preheader_crit_edge: ; preds = %.preheader.us
  br label %._crit_edge144.preheader

min.iters.checked164:                             ; preds = %.preheader.us
  br i1 false, label %min.iters.checked164.._crit_edge144.preheader_crit_edge, label %vector.memcheck179

min.iters.checked164.._crit_edge144.preheader_crit_edge: ; preds = %min.iters.checked164
  br label %._crit_edge144.preheader

vector.memcheck179:                               ; preds = %min.iters.checked164
  %bound0175 = icmp ult i8* %scevgep169170, %scevgep174
  %bound1176 = icmp ult i8* %scevgep173, %scevgep171172
  %memcheck.conflict178 = and i1 %bound0175, %bound1176
  br i1 %memcheck.conflict178, label %._crit_edge144.preheader, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %vector.memcheck179
  br label %vector.body160

vector.body160:                                   ; preds = %vector.body160.preheader, %vector.body160
  %index181 = phi i64 [ %index.next182, %vector.body160 ], [ 0, %vector.body160.preheader ]
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv68.us, i64 %index181
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load189 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !15
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !15
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 %index181
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load189, <2 x i64>* %85, align 8, !alias.scope !18, !noalias !15
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %87, align 8, !alias.scope !18, !noalias !15
  %index.next182 = add i64 %index181, 4
  %88 = icmp eq i64 %index.next182, 2000
  br i1 %88, label %middle.block161, label %vector.body160, !llvm.loop !20

middle.block161:                                  ; preds = %vector.body160
  br i1 true, label %._crit_edge.us, label %middle.block161.._crit_edge144.preheader_crit_edge

middle.block161.._crit_edge144.preheader_crit_edge: ; preds = %middle.block161
  br label %._crit_edge144.preheader

._crit_edge144.preheader:                         ; preds = %middle.block161.._crit_edge144.preheader_crit_edge, %min.iters.checked164.._crit_edge144.preheader_crit_edge, %.preheader.us.._crit_edge144.preheader_crit_edge, %vector.memcheck179
  br i1 true, label %._crit_edge144.prol.loopexit, label %._crit_edge144.prol.preheader

._crit_edge144.prol.preheader:                    ; preds = %._crit_edge144.preheader
  br label %._crit_edge144.prol

._crit_edge144.prol:                              ; preds = %._crit_edge144.prol, %._crit_edge144.prol.preheader
  %indvars.iv66.us.prol = phi i64 [ %indvars.iv.next.us.prol, %._crit_edge144.prol ], [ 0, %._crit_edge144.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge144.prol ], [ 0, %._crit_edge144.prol.preheader ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv68.us, i64 %indvars.iv66.us.prol
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 %indvars.iv66.us.prol
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv66.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge144.prol.loopexit.unr-lcssa, label %._crit_edge144.prol, !llvm.loop !21

._crit_edge144.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge144.prol
  br label %._crit_edge144.prol.loopexit

._crit_edge144.prol.loopexit:                     ; preds = %._crit_edge144.preheader, %._crit_edge144.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge144.prol.loopexit.._crit_edge.us.loopexit_crit_edge, label %._crit_edge144.preheader.new

._crit_edge144.prol.loopexit.._crit_edge.us.loopexit_crit_edge: ; preds = %._crit_edge144.prol.loopexit
  br label %._crit_edge.us.loopexit

._crit_edge144.preheader.new:                     ; preds = %._crit_edge144.prol.loopexit
  br label %._crit_edge144

._crit_edge144:                                   ; preds = %._crit_edge144, %._crit_edge144.preheader.new
  %indvars.iv66.us = phi i64 [ 0, %._crit_edge144.preheader.new ], [ %indvars.iv.next.us.3, %._crit_edge144 ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv68.us, i64 %indvars.iv66.us
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 %indvars.iv66.us
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv66.us, 1
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv68.us, i64 %indvars.iv.next.us
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 %indvars.iv.next.us
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv66.us, 2
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv68.us, i64 %indvars.iv.next.us.1
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 %indvars.iv.next.us.1
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv66.us, 3
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv68.us, i64 %indvars.iv.next.us.2
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68.us, i64 %indvars.iv.next.us.2
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv66.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, 2000
  br i1 %exitcond.us.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge144, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge144
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge144.prol.loopexit.._crit_edge.us.loopexit_crit_edge, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block161
  %indvars.iv.next67.us = add nuw nsw i64 %indvars.iv68.us, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next67.us, 2000
  br i1 %exitcond133, label %._crit_edge70.loopexit, label %.preheader.us

._crit_edge70.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %._crit_edge132.thread
  %114 = phi i8* [ undef, %._crit_edge132.thread ], [ %16, %._crit_edge70.loopexit ]
  tail call void @free(i8* %114) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader36.preheader, label %.._crit_edge59_crit_edge

.._crit_edge59_crit_edge:                         ; preds = %2
  br label %._crit_edge59

.preheader36.preheader:                           ; preds = %2
  br label %.preheader36

.preheader36:                                     ; preds = %.preheader36.preheader, %._crit_edge56
  %indvars.iv = phi i2 [ 0, %.preheader36.preheader ], [ %indvars.iv.next72, %._crit_edge56 ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next57, %._crit_edge56 ], [ 0, %.preheader36.preheader ]
  %3 = zext i2 %indvars.iv to i64
  %4 = add nsw i64 %indvars.iv58, -1
  %exitcond4546 = icmp eq i64 %indvars.iv58, 0
  br i1 %exitcond4546, label %.preheader36.._crit_edge56_crit_edge, label %.preheader.preheader

.preheader36.._crit_edge56_crit_edge:             ; preds = %.preheader36
  %.phi.trans.insert73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 0
  %.pre74 = load double, double* %.phi.trans.insert73, align 8
  %.pre75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 0
  br label %._crit_edge56

.preheader.preheader:                             ; preds = %.preheader36
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 0
  br label %.preheader

.lr.ph55:                                         ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv58
  %.pre65 = load double, double* %5, align 8
  %xtraiter67 = and i64 %indvars.iv58, 3
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  br i1 %lcmp.mod68, label %._crit_edge62.prol.loopexit, label %._crit_edge62.prol.preheader

._crit_edge62.prol.preheader:                     ; preds = %.lr.ph55
  br label %._crit_edge62.prol

._crit_edge62.prol:                               ; preds = %._crit_edge62.prol, %._crit_edge62.prol.preheader
  %6 = phi double [ %.pre65, %._crit_edge62.prol.preheader ], [ %10, %._crit_edge62.prol ]
  %indvars.iv54.prol = phi i64 [ 0, %._crit_edge62.prol.preheader ], [ %indvars.iv.next49.prol, %._crit_edge62.prol ]
  %prol.iter = phi i64 [ %xtraiter67, %._crit_edge62.prol.preheader ], [ %prol.iter.sub, %._crit_edge62.prol ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv54.prol
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fsub double %6, %9
  store double %10, double* %5, align 8
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge62.prol.loopexit.unr-lcssa, label %._crit_edge62.prol, !llvm.loop !23

._crit_edge62.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge62.prol
  br label %._crit_edge62.prol.loopexit

._crit_edge62.prol.loopexit:                      ; preds = %.lr.ph55, %._crit_edge62.prol.loopexit.unr-lcssa
  %.unr69 = phi double [ %.pre65, %.lr.ph55 ], [ %10, %._crit_edge62.prol.loopexit.unr-lcssa ]
  %indvars.iv54.unr = phi i64 [ 0, %.lr.ph55 ], [ %3, %._crit_edge62.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %4, 3
  br i1 %11, label %._crit_edge56.loopexit, label %.lr.ph55.new

.lr.ph55.new:                                     ; preds = %._crit_edge62.prol.loopexit
  br label %._crit_edge62

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next41, %._crit_edge ], [ 0, %.preheader.preheader ]
  %exitcond39 = icmp eq i64 %indvars.iv47, 0
  br i1 %exitcond39, label %.preheader.._crit_edge_crit_edge, label %.lr.ph

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %.pre64 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv47
  %.pre = load double, double* %12, align 8
  %xtraiter = and i64 %indvars.iv47, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge61.prol.loopexit.unr-lcssa, label %._crit_edge61.prol.preheader

._crit_edge61.prol.preheader:                     ; preds = %.lr.ph
  %13 = load double, double* %.phi.trans.insert, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 0
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %.pre, %16
  store double %17, double* %12, align 8
  br label %._crit_edge61.prol.loopexit.unr-lcssa

._crit_edge61.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge61.prol.preheader
  %.lcssa.unr.ph = phi double [ %17, %._crit_edge61.prol.preheader ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %17, %._crit_edge61.prol.preheader ], [ %.pre, %.lr.ph ]
  %indvars.iv40.unr.ph = phi i64 [ 1, %._crit_edge61.prol.preheader ], [ 0, %.lr.ph ]
  %18 = icmp eq i64 %indvars.iv47, 1
  br i1 %18, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge61.prol.loopexit.unr-lcssa
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61, %.lr.ph.new
  %19 = phi double [ %.unr.ph, %.lr.ph.new ], [ %31, %._crit_edge61 ]
  %indvars.iv40 = phi i64 [ %indvars.iv40.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge61 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv40
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv40
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv40, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv40, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv47
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge61

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge61
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge61.prol.loopexit.unr-lcssa, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge61.prol.loopexit.unr-lcssa ], [ %31, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader.._crit_edge_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader.._crit_edge_crit_edge ], [ %12, %._crit_edge.loopexit ]
  %32 = phi double [ %.pre64, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv47
  %34 = load double, double* %33, align 8
  %35 = fdiv double %32, %34
  store double %35, double* %.pre-phi, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next41, %indvars.iv58
  br i1 %exitcond45, label %.lr.ph55, label %.preheader

._crit_edge62:                                    ; preds = %._crit_edge62, %.lr.ph55.new
  %36 = phi double [ %.unr69, %.lr.ph55.new ], [ %52, %._crit_edge62 ]
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %.lr.ph55.new ], [ %indvars.iv.next49.3, %._crit_edge62 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv54
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fsub double %36, %39
  store double %40, double* %5, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv54, 1
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next49
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %42
  %44 = fsub double %40, %43
  store double %44, double* %5, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv54, 2
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next49.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fsub double %44, %47
  store double %48, double* %5, align 8
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv54, 3
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next49.2
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %50
  %52 = fsub double %48, %51
  store double %52, double* %5, align 8
  %indvars.iv.next49.3 = add nuw nsw i64 %indvars.iv54, 4
  %exitcond52.3 = icmp eq i64 %indvars.iv.next49.3, %indvars.iv58
  br i1 %exitcond52.3, label %._crit_edge56.loopexit.unr-lcssa, label %._crit_edge62

._crit_edge56.loopexit.unr-lcssa:                 ; preds = %._crit_edge62
  br label %._crit_edge56.loopexit

._crit_edge56.loopexit:                           ; preds = %._crit_edge62.prol.loopexit, %._crit_edge56.loopexit.unr-lcssa
  %53 = phi double [ %.unr69, %._crit_edge62.prol.loopexit ], [ %52, %._crit_edge56.loopexit.unr-lcssa ]
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %.preheader36.._crit_edge56_crit_edge, %._crit_edge56.loopexit
  %.pre-phi76 = phi double* [ %.pre75, %.preheader36.._crit_edge56_crit_edge ], [ %5, %._crit_edge56.loopexit ]
  %54 = phi double [ %.pre74, %.preheader36.._crit_edge56_crit_edge ], [ %53, %._crit_edge56.loopexit ]
  %55 = tail call double @sqrt(double %54) #3
  store double %55, double* %.pre-phi76, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next57, 2000
  %indvars.iv.next72 = add i2 %indvars.iv, 1
  br i1 %exitcond60, label %._crit_edge59.loopexit, label %.preheader36

._crit_edge59.loopexit:                           ; preds = %._crit_edge56
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %.._crit_edge59_crit_edge, %._crit_edge59.loopexit
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
  br i1 true, label %.preheader.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %18
  %indvars.iv17 = phi i64 [ %indvars.iv.next13, %18 ], [ 1, %.preheader.preheader ]
  %indvars.iv1416 = phi i64 [ %indvars.iv.next15, %18 ], [ 0, %.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv1416, 2000
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge19, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge19 ]
  %8 = add nsw i64 %indvars.iv12, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge19

; <label>:12:                                     ; preds = %._crit_edge20
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge20, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1416, i64 %indvars.iv12
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv17
  br i1 %exitcond, label %18, label %._crit_edge20

; <label>:18:                                     ; preds = %._crit_edge19
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1416, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 2000
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv17, 1
  br i1 %exitcond18, label %._crit_edge.loopexit, label %.preheader

._crit_edge.loopexit:                             ; preds = %18
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
