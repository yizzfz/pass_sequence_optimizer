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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader62.preheader.lr.ph, label %._crit_edge136.thread

._crit_edge136.thread:                            ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge

.preheader62.preheader.lr.ph:                     ; preds = %2
  br label %.preheader62.preheader

.preheader62.preheader:                           ; preds = %.preheader61._crit_edge..preheader62.preheader_crit_edge, %.preheader62.preheader.lr.ph
  %indvars.iv93135 = phi i64 [ 1, %.preheader62.preheader.lr.ph ], [ %indvars.iv.next94, %.preheader61._crit_edge..preheader62.preheader_crit_edge ]
  %indvars.iv95134 = phi i64 [ 0, %.preheader62.preheader.lr.ph ], [ %indvars.iv.next96, %.preheader61._crit_edge..preheader62.preheader_crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv95134, 2001
  %5 = add nuw nsw i64 %4, 1
  br label %.preheader62

.preheader61.preheader:                           ; preds = %.preheader62
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %6 = mul nsw i64 %indvars.iv95134, -8
  %exitcond92131 = icmp eq i64 %indvars.iv95134, 1999
  br i1 %exitcond92131, label %.preheader61._crit_edge, label %.preheader61._crit_edge.loopexit

.preheader62:                                     ; preds = %.preheader62, %.preheader62.preheader
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

.preheader61._crit_edge.loopexit:                 ; preds = %.preheader61.preheader
  %14 = add nsw i64 15992, %6
  %scevgep145146 = bitcast double* %scevgep145 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145146, i8 0, i64 %14, i32 8, i1 false)
  br label %.preheader61._crit_edge

.preheader61._crit_edge:                          ; preds = %.preheader61.preheader, %.preheader61._crit_edge.loopexit
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95134, i64 %indvars.iv95134
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95134, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond147, label %._crit_edge136, label %.preheader61._crit_edge..preheader62.preheader_crit_edge

.preheader61._crit_edge..preheader62.preheader_crit_edge: ; preds = %.preheader61._crit_edge
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93135, 1
  br label %.preheader62.preheader

._crit_edge136:                                   ; preds = %.preheader61._crit_edge
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader60._crit_edge.us

.preheader60._crit_edge.us:                       ; preds = %.preheader60._crit_edge.us, %._crit_edge136
  %indvars.iv79127.us = phi i64 [ 0, %._crit_edge136 ], [ %indvars.iv.next80.us, %.preheader60._crit_edge.us ]
  %17 = mul nuw nsw i64 %indvars.iv79127.us, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next80.us = add nuw nsw i64 %indvars.iv79127.us, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next80.us, 2000
  br i1 %exitcond144, label %.preheader58.preheader.us.preheader, label %.preheader60._crit_edge.us

.preheader58.preheader.us.preheader:              ; preds = %.preheader60._crit_edge.us
  %18 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %19 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader57.preheader.us.us.preheader

.preheader57.preheader.us.us.preheader:           ; preds = %.preheader58._crit_edge.us, %.preheader58.preheader.us.preheader
  %indvars.iv73107.us = phi i64 [ 0, %.preheader58.preheader.us.preheader ], [ %indvars.iv.next74.us, %.preheader58._crit_edge.us ]
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv73107.us
  %20 = add nsw i64 %indvars.iv73107.us, -1999
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %20
  %21 = bitcast double* %scevgep155 to i8*
  %22 = bitcast double* %scevgep153 to i8*
  br label %.preheader57.preheader.us.us

.preheader58._crit_edge.us:                       ; preds = %.preheader57._crit_edge.us.us
  %indvars.iv.next74.us = add nuw nsw i64 %indvars.iv73107.us, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next74.us, 2000
  br i1 %exitcond143, label %.preheader.preheader.us.preheader, label %.preheader57.preheader.us.us.preheader

.preheader57.preheader.us.us:                     ; preds = %.preheader57._crit_edge.us.us, %.preheader57.preheader.us.us.preheader
  %indvars.iv69105.us.us = phi i64 [ 0, %.preheader57.preheader.us.us.preheader ], [ %indvars.iv.next70.us.us, %.preheader57._crit_edge.us.us ]
  %23 = mul nuw nsw i64 %indvars.iv69105.us.us, 16000
  %scevgep151 = getelementptr i8, i8* %16, i64 %23
  %24 = add i64 16000, %23
  %scevgep152 = getelementptr i8, i8* %16, i64 %24
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69105.us.us, i64 %indvars.iv73107.us
  br i1 false, label %.preheader57.us.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader57.preheader.us.us
  br i1 false, label %.preheader57.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep151, %21
  %bound1 = icmp ult i8* %22, %scevgep152
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %25 to i8*
  %bc157 = bitcast double* %25 to i8*
  %bound0158 = icmp ult i8* %scevgep151, %bc157
  %bound1159 = icmp ult i8* %bc, %scevgep152
  %found.conflict160 = and i1 %bound0158, %bound1159
  %conflict.rdx = or i1 %found.conflict, %found.conflict160
  br i1 %conflict.rdx, label %.preheader57.us.us.preheader, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ 0, %vector.memcheck.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %26 = or i64 %index, 1
  %27 = or i64 %index, 2
  %28 = or i64 %index, 3
  %29 = load double, double* %25, align 8, !alias.scope !1
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = insertelement <2 x double> undef, double %29, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv73107.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %26, i64 %indvars.iv73107.us
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %27, i64 %indvars.iv73107.us
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %28, i64 %indvars.iv73107.us
  %38 = load double, double* %34, align 8, !alias.scope !4
  %39 = load double, double* %35, align 8, !alias.scope !4
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = insertelement <2 x double> undef, double %38, i32 0
  %43 = insertelement <2 x double> %42, double %39, i32 1
  %44 = insertelement <2 x double> undef, double %40, i32 0
  %45 = insertelement <2 x double> %44, double %41, i32 1
  %46 = fmul <2 x double> %31, %43
  %47 = fmul <2 x double> %33, %45
  %48 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv69105.us.us, i64 %index
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !6, !noalias !8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %52 = fadd <2 x double> %wide.load, %46
  %53 = fadd <2 x double> %wide.load162, %47
  %54 = bitcast double* %48 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %55 = bitcast double* %50 to <2 x double>*
  store <2 x double> %53, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %56 = icmp eq i64 %index.next, 2000
  br i1 %56, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br i1 true, label %.preheader57._crit_edge.us.us, label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader57.preheader.us.us
  %indvars.iv65102.us.us.ph = phi i64 [ 0, %.preheader57.preheader.us.us ], [ 0, %min.iters.checked ], [ 0, %vector.memcheck ], [ 2000, %middle.block ]
  br label %.preheader57.us.us

.preheader57._crit_edge.us.us.loopexit:           ; preds = %.preheader57.us.us
  br label %.preheader57._crit_edge.us.us

.preheader57._crit_edge.us.us:                    ; preds = %.preheader57._crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next70.us.us = add nuw nsw i64 %indvars.iv69105.us.us, 1
  %exitcond72.us.us = icmp eq i64 %indvars.iv.next70.us.us, 2000
  br i1 %exitcond72.us.us, label %.preheader58._crit_edge.us, label %.preheader57.preheader.us.us

.preheader57.us.us:                               ; preds = %.preheader57.us.us, %.preheader57.us.us.preheader
  %indvars.iv65102.us.us = phi i64 [ %indvars.iv65102.us.us.ph, %.preheader57.us.us.preheader ], [ %indvars.iv.next66.us.us, %.preheader57.us.us ]
  %57 = load double, double* %25, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65102.us.us, i64 %indvars.iv73107.us
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv69105.us.us, i64 %indvars.iv65102.us.us
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  %indvars.iv.next66.us.us = add nuw nsw i64 %indvars.iv65102.us.us, 1
  %exitcond68.us.us = icmp eq i64 %indvars.iv.next66.us.us, 2000
  br i1 %exitcond68.us.us, label %.preheader57._crit_edge.us.us.loopexit, label %.preheader57.us.us, !llvm.loop !12

.preheader.preheader.us.preheader:                ; preds = %.preheader58._crit_edge.us
  %64 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %65 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv6399.us = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next64.us, %.preheader._crit_edge.us ]
  %scevgep172 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399.us, i64 0
  %scevgep174 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399.us, i64 2000
  %66 = mul nuw nsw i64 %indvars.iv6399.us, 16000
  %scevgep176 = getelementptr i8, i8* %16, i64 %66
  %67 = add i64 16000, %66
  %scevgep177 = getelementptr i8, i8* %16, i64 %67
  br i1 false, label %.preheader.us.preheader, label %min.iters.checked167

min.iters.checked167:                             ; preds = %.preheader.preheader.us
  br i1 false, label %.preheader.us.preheader, label %vector.memcheck182

vector.memcheck182:                               ; preds = %min.iters.checked167
  %68 = bitcast double* %scevgep174 to i8*
  %69 = bitcast double* %scevgep172 to i8*
  %bound0178 = icmp ult i8* %69, %scevgep177
  %bound1179 = icmp ult i8* %scevgep176, %68
  %memcheck.conflict181 = and i1 %bound0178, %bound1179
  br i1 %memcheck.conflict181, label %.preheader.us.preheader, label %vector.memcheck182.vector.body163_crit_edge

vector.memcheck182.vector.body163_crit_edge:      ; preds = %vector.memcheck182
  br label %vector.body163

vector.body163:                                   ; preds = %vector.body163, %vector.memcheck182.vector.body163_crit_edge
  %index184 = phi i64 [ 0, %vector.memcheck182.vector.body163_crit_edge ], [ %index.next185, %vector.body163 ]
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv6399.us, i64 %index184
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !13
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load193 = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !13
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399.us, i64 %index184
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load192, <2 x i64>* %75, align 8, !alias.scope !16, !noalias !13
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load193, <2 x i64>* %77, align 8, !alias.scope !16, !noalias !13
  %index.next185 = add i64 %index184, 4
  %78 = icmp eq i64 %index.next185, 2000
  br i1 %78, label %middle.block164, label %vector.body163, !llvm.loop !18

middle.block164:                                  ; preds = %vector.body163
  br i1 true, label %.preheader._crit_edge.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %middle.block164, %vector.memcheck182, %min.iters.checked167, %.preheader.preheader.us
  %indvars.iv98.us.ph = phi i64 [ 0, %.preheader.preheader.us ], [ 0, %min.iters.checked167 ], [ 0, %vector.memcheck182 ], [ 2000, %middle.block164 ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.us.preheader
  %indvars.iv98.us = phi i64 [ %indvars.iv98.us.ph, %.preheader.us.preheader ], [ %indvars.iv.next.us, %.preheader.us ]
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv6399.us, i64 %indvars.iv98.us
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6399.us, i64 %indvars.iv98.us
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv98.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2000
  br i1 %exitcond.us, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !19

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block164
  %indvars.iv.next64.us = add nuw nsw i64 %indvars.iv6399.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next64.us, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge136.thread
  %84 = phi i8* [ %3, %._crit_edge136.thread ], [ %16, %._crit_edge.loopexit ]
  tail call void @free(i8* %84) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %..preheader33.preheader_crit_edge, label %._crit_edge

..preheader33.preheader_crit_edge:                ; preds = %2
  br label %.preheader33.preheader

.preheader33.preheader:                           ; preds = %.preheader32._crit_edge, %..preheader33.preheader_crit_edge
  %indvars.iv4757 = phi i64 [ 0, %..preheader33.preheader_crit_edge ], [ %indvars.iv.next48, %.preheader32._crit_edge ]
  %exitcond4151 = icmp eq i64 %indvars.iv4757, 0
  br i1 %exitcond4151, label %.preheader32._crit_edge, label %.preheader33.preheader..preheader.preheader_crit_edge

.preheader33.preheader..preheader.preheader_crit_edge: ; preds = %.preheader33.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 0
  %.pre62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 0
  br label %.preheader.preheader

.lr.ph56:                                         ; preds = %.preheader33
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv4757
  %.pre61 = load double, double* %3, align 8
  br label %.preheader32

.preheader.preheader:                             ; preds = %.preheader33, %.preheader33.preheader..preheader.preheader_crit_edge
  %indvars.iv3652 = phi i64 [ 0, %.preheader33.preheader..preheader.preheader_crit_edge ], [ %indvars.iv.next37, %.preheader33 ]
  %exitcond49 = icmp eq i64 %indvars.iv3652, 0
  br i1 %exitcond49, label %.preheader.preheader..preheader33_crit_edge, label %.lr.ph

.preheader.preheader..preheader33_crit_edge:      ; preds = %.preheader.preheader
  %.pre60 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader33

.lr.ph:                                           ; preds = %.preheader.preheader
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv3652
  %.pre = load double, double* %4, align 8
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.lr.ph
  %5 = phi double [ %.pre, %.lr.ph ], [ %11, %.preheader ]
  %indvars.iv50 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %.preheader ]
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv50
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3652, i64 %indvars.iv50
  %9 = load double, double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fsub double %5, %10
  store double %11, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv3652
  br i1 %exitcond, label %.preheader33.loopexit, label %.preheader

.preheader33.loopexit:                            ; preds = %.preheader
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.loopexit, %.preheader.preheader..preheader33_crit_edge
  %.pre-phi = phi double* [ %.pre62, %.preheader.preheader..preheader33_crit_edge ], [ %4, %.preheader33.loopexit ]
  %12 = phi double [ %.pre60, %.preheader.preheader..preheader33_crit_edge ], [ %11, %.preheader33.loopexit ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3652, i64 %indvars.iv3652
  %14 = load double, double* %13, align 8
  %15 = fdiv double %12, %14
  store double %15, double* %.pre-phi, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv3652, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %indvars.iv4757
  br i1 %exitcond41, label %.lr.ph56, label %.preheader.preheader

.preheader32:                                     ; preds = %.preheader32, %.lr.ph56
  %16 = phi double [ %.pre61, %.lr.ph56 ], [ %20, %.preheader32 ]
  %indvars.iv4255 = phi i64 [ 0, %.lr.ph56 ], [ %indvars.iv.next43, %.preheader32 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv4255
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fsub double %16, %19
  store double %20, double* %3, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv4255, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next43, %indvars.iv4757
  br i1 %exitcond46, label %.preheader32._crit_edge.loopexit, label %.preheader32

.preheader32._crit_edge.loopexit:                 ; preds = %.preheader32
  br label %.preheader32._crit_edge

.preheader32._crit_edge:                          ; preds = %.preheader32._crit_edge.loopexit, %.preheader33.preheader
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv4757
  %22 = load double, double* %21, align 8
  %23 = tail call double @sqrt(double %22) #3
  store double %23, double* %21, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4757, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond58, label %._crit_edge.loopexit, label %.preheader33.preheader

._crit_edge.loopexit:                             ; preds = %.preheader32._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
  br i1 true, label %..preheader.preheader_crit_edge, label %._crit_edge

..preheader.preheader_crit_edge:                  ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %..preheader.preheader_crit_edge20, %..preheader.preheader_crit_edge
  %indvars.iv1117 = phi i64 [ %indvars.iv.next12, %..preheader.preheader_crit_edge20 ], [ 1, %..preheader.preheader_crit_edge ]
  %indvars.iv1316 = phi i64 [ %indvars.iv.next14, %..preheader.preheader_crit_edge20 ], [ 0, %..preheader.preheader_crit_edge ]
  %7 = mul nsw i64 %indvars.iv1316, 2000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader, %.preheader.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nsw i64 %indvars.iv15, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader

; <label>:12:                                     ; preds = %.preheader._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1316, i64 %indvars.iv15
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv1117
  br i1 %exitcond, label %18, label %.preheader._crit_edge

; <label>:18:                                     ; preds = %.preheader
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1316, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond18, label %._crit_edge.loopexit, label %..preheader.preheader_crit_edge20

..preheader.preheader_crit_edge20:                ; preds = %18
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1117, 1
  br label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %18
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
