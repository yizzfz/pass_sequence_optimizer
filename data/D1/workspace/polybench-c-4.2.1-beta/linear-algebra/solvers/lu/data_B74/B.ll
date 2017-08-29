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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.lr.ph56:
  %1 = alloca [2000 x double]*, align 8
  %2 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %.lr.ph46

.lr.ph46:                                         ; preds = %._crit_edge52, %.lr.ph56
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge52 ], [ 0, %.lr.ph56 ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge52 ], [ 1, %.lr.ph56 ]
  %sext = shl i64 %indvars.iv114, 32
  br label %3

; <label>:3:                                      ; preds = %._crit_edge, %.lr.ph46
  %indvars.iv109 = phi i64 [ 0, %.lr.ph46 ], [ %indvars.iv.next110, %._crit_edge ]
  %4 = sub nsw i64 0, %indvars.iv109
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 2000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fadd double %8, 1.000000e+00
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv109
  store double %9, double* %10, align 8
  %exitcond113 = icmp eq i64 %indvars.iv109, %indvars.iv119
  br i1 %exitcond113, label %._crit_edge47, label %._crit_edge

._crit_edge:                                      ; preds = %3
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  br label %3

._crit_edge47:                                    ; preds = %3
  %11 = ashr exact i64 %sext, 32
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %12 = icmp slt i64 %indvars.iv.next120, 2000
  br i1 %12, label %.lr.ph51.preheader, label %.lr.ph39.split.us.preheader

.lr.ph51.preheader:                               ; preds = %._crit_edge47
  %13 = sub nsw i64 2000, %11
  %min.iters.check = icmp ult i64 %13, 4
  br i1 %min.iters.check, label %.lr.ph51.preheader..lr.ph51.preheader30_crit_edge, label %min.iters.checked

.lr.ph51.preheader..lr.ph51.preheader30_crit_edge: ; preds = %.lr.ph51.preheader
  br label %.lr.ph51.preheader30

min.iters.checked:                                ; preds = %.lr.ph51.preheader
  %n.vec = and i64 %13, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %11, %n.vec
  br i1 %cmp.zero, label %min.iters.checked..lr.ph51.preheader30_crit_edge, label %vector.body.preheader

min.iters.checked..lr.ph51.preheader30_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph51.preheader30

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %14 = add i64 %11, %index
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %index.next = add i64 %index, 4
  %19 = icmp eq i64 %index.next, %n.vec
  br i1 %19, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %13, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge52_crit_edge, label %middle.block..lr.ph51.preheader30_crit_edge

middle.block..lr.ph51.preheader30_crit_edge:      ; preds = %middle.block
  br label %.lr.ph51.preheader30

middle.block.._crit_edge52_crit_edge:             ; preds = %middle.block
  br label %._crit_edge52

.lr.ph51.preheader30:                             ; preds = %middle.block..lr.ph51.preheader30_crit_edge, %min.iters.checked..lr.ph51.preheader30_crit_edge, %.lr.ph51.preheader..lr.ph51.preheader30_crit_edge
  %indvars.iv116.ph = phi i64 [ %11, %min.iters.checked..lr.ph51.preheader30_crit_edge ], [ %11, %.lr.ph51.preheader..lr.ph51.preheader30_crit_edge ], [ %ind.end, %middle.block..lr.ph51.preheader30_crit_edge ]
  br label %.lr.ph51

.lr.ph51:                                         ; preds = %.lr.ph51..lr.ph51_crit_edge, %.lr.ph51.preheader30
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %.lr.ph51..lr.ph51_crit_edge ], [ %indvars.iv116.ph, %.lr.ph51.preheader30 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv116
  store double 0.000000e+00, double* %20, align 8
  %exitcond118 = icmp eq i64 %indvars.iv116, 1999
  br i1 %exitcond118, label %._crit_edge52.loopexit, label %.lr.ph51..lr.ph51_crit_edge, !llvm.loop !4

.lr.ph51..lr.ph51_crit_edge:                      ; preds = %.lr.ph51
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  br label %.lr.ph51

._crit_edge52.loopexit:                           ; preds = %.lr.ph51
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %middle.block.._crit_edge52_crit_edge, %._crit_edge52.loopexit
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %21, align 8
  %indvars.iv.next115 = add nsw i64 %11, 1
  br label %.lr.ph46

.lr.ph39.split.us.preheader:                      ; preds = %._crit_edge47
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %22, align 8
  %23 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %24 = bitcast [2000 x [2000 x double]]** %2 to i8**
  store i8* %23, i8** %24, align 8
  %25 = bitcast i8* %23 to [2000 x [2000 x double]]*
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us.._crit_edge35.us_crit_edge, %.lr.ph39.split.us.preheader
  %indvars.iv106 = phi i64 [ 0, %.lr.ph39.split.us.preheader ], [ %indvars.iv.next107, %._crit_edge35.us.._crit_edge35.us_crit_edge ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 0
  %scevgep105 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next107, 2000
  br i1 %exitcond34, label %.lr.ph13.us.preheader, label %._crit_edge35.us.._crit_edge35.us_crit_edge

._crit_edge35.us.._crit_edge35.us_crit_edge:      ; preds = %._crit_edge35.us
  br label %._crit_edge35.us

.lr.ph13.us.preheader:                            ; preds = %._crit_edge35.us
  %26 = bitcast i8* %23 to [2000 x [2000 x double]]*
  br label %.lr.ph13.us

._crit_edge14.us-lcssa.us.us:                     ; preds = %._crit_edge11.us.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond33, label %.lr.ph3.split.us.preheader, label %._crit_edge14.us-lcssa.us.us..lr.ph13.us_crit_edge

._crit_edge14.us-lcssa.us.us..lr.ph13.us_crit_edge: ; preds = %._crit_edge14.us-lcssa.us.us
  br label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge14.us-lcssa.us.us..lr.ph13.us_crit_edge, %.lr.ph13.us.preheader
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge14.us-lcssa.us.us..lr.ph13.us_crit_edge ], [ 0, %.lr.ph13.us.preheader ]
  br label %.lr.ph10.us.us

.lr.ph10.us.us:                                   ; preds = %._crit_edge11.us.us..lr.ph10.us.us_crit_edge, %.lr.ph13.us
  %indvars.iv97 = phi i64 [ 0, %.lr.ph13.us ], [ %indvars.iv.next98, %._crit_edge11.us.us..lr.ph10.us.us_crit_edge ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv99
  br label %28

._crit_edge11.us.us:                              ; preds = %28
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond32, label %._crit_edge14.us-lcssa.us.us, label %._crit_edge11.us.us..lr.ph10.us.us_crit_edge

._crit_edge11.us.us..lr.ph10.us.us_crit_edge:     ; preds = %._crit_edge11.us.us
  br label %.lr.ph10.us.us

; <label>:28:                                     ; preds = %._crit_edge36, %.lr.ph10.us.us
  %indvars.iv94 = phi i64 [ 0, %.lr.ph10.us.us ], [ %indvars.iv.next95, %._crit_edge36 ]
  %29 = load double, double* %27, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv94, i64 %indvars.iv99
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv97, i64 %indvars.iv94
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  store double %35, double* %33, align 8
  %exitcond96 = icmp eq i64 %indvars.iv94, 1999
  br i1 %exitcond96, label %._crit_edge11.us.us, label %._crit_edge36

._crit_edge36:                                    ; preds = %28
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  br label %28

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge14.us-lcssa.us.us
  %36 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %37 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us..lr.ph3.split.us_crit_edge, %.lr.ph3.split.us.preheader
  %indvars.iv91 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next92, %._crit_edge.us..lr.ph3.split.us_crit_edge ]
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %37, i64 %indvars.iv91, i64 0
  %38 = add nuw nsw i64 %indvars.iv91, 1
  %scevgep13 = getelementptr [2000 x double], [2000 x double]* %37, i64 %38, i64 0
  %scevgep15 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv91, i64 0
  %scevgep17 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %38, i64 0
  %bound0 = icmp ult double* %scevgep11, %scevgep17
  %bound1 = icmp ult double* %scevgep15, %scevgep13
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph8.preheader, label %vector.body6.preheader

vector.body6.preheader:                           ; preds = %.lr.ph3.split.us
  br label %vector.body6

scalar.ph8.preheader:                             ; preds = %.lr.ph3.split.us
  br label %scalar.ph8

vector.body6:                                     ; preds = %vector.body6.vector.body6_crit_edge, %vector.body6.preheader
  %index20 = phi i64 [ %index.next21, %vector.body6.vector.body6_crit_edge ], [ 0, %vector.body6.preheader ]
  %39 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv91, i64 %index20
  %40 = bitcast double* %39 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %40, align 8, !alias.scope !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  %wide.load28 = load <2 x i64>, <2 x i64>* %42, align 8, !alias.scope !6
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %37, i64 %indvars.iv91, i64 %index20
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %44, align 8, !alias.scope !9, !noalias !6
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  store <2 x i64> %wide.load28, <2 x i64>* %46, align 8, !alias.scope !9, !noalias !6
  %index.next21 = add nuw nsw i64 %index20, 4
  %47 = icmp eq i64 %index.next21, 2000
  br i1 %47, label %._crit_edge.us.loopexit35, label %vector.body6.vector.body6_crit_edge, !llvm.loop !11

vector.body6.vector.body6_crit_edge:              ; preds = %vector.body6
  br label %vector.body6

scalar.ph8:                                       ; preds = %scalar.ph8.scalar.ph8_crit_edge, %scalar.ph8.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph8.scalar.ph8_crit_edge ], [ 0, %scalar.ph8.preheader ]
  %48 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %49 = bitcast double* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %37, i64 %indvars.iv91, i64 %indvars.iv
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph8.scalar.ph8_crit_edge, !llvm.loop !12

scalar.ph8.scalar.ph8_crit_edge:                  ; preds = %scalar.ph8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph8

._crit_edge.us.loopexit:                          ; preds = %scalar.ph8
  br label %._crit_edge.us

._crit_edge.us.loopexit35:                        ; preds = %vector.body6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit35, %._crit_edge.us.loopexit
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond31, label %53, label %._crit_edge.us..lr.ph3.split.us_crit_edge

._crit_edge.us..lr.ph3.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph3.split.us

; <label>:53:                                     ; preds = %._crit_edge.us
  %54 = bitcast [2000 x [2000 x double]]* %36 to i8*
  tail call void @free(i8* %54) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
.lr.ph21:
  %1 = alloca [2000 x double]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %2

; <label>:2:                                      ; preds = %._crit_edge15._crit_edge, %.lr.ph21
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge15._crit_edge ], [ 0, %.lr.ph21 ]
  %indvars.iv51 = phi i32 [ %indvars.iv.next52, %._crit_edge15._crit_edge ], [ -1, %.lr.ph21 ]
  %3 = phi [2000 x double]* [ %32, %._crit_edge15._crit_edge ], [ %0, %.lr.ph21 ]
  %4 = icmp sgt i64 %indvars.iv1, 0
  br i1 %4, label %.lr.ph3.preheader, label %.._crit_edge15_crit_edge

.._crit_edge15_crit_edge:                         ; preds = %2
  br label %._crit_edge15

.lr.ph3.preheader:                                ; preds = %2
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %._crit_edge..lr.ph3_crit_edge, %.lr.ph3.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge..lr.ph3_crit_edge ], [ 0, %.lr.ph3.preheader ]
  %indvars.iv44 = phi i32 [ %indvars.iv.next45, %._crit_edge..lr.ph3_crit_edge ], [ -1, %.lr.ph3.preheader ]
  %5 = phi [2000 x double]* [ %16, %._crit_edge..lr.ph3_crit_edge ], [ %3, %.lr.ph3.preheader ]
  %6 = icmp sgt i64 %indvars.iv46, 0
  br i1 %6, label %.lr.ph, label %.lr.ph3.._crit_edge_crit_edge

.lr.ph3.._crit_edge_crit_edge:                    ; preds = %.lr.ph3
  br label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv46
  %.pre = load double, double* %7, align 8
  %wide.trip.count = zext i32 %indvars.iv44 to i64
  br label %8

; <label>:8:                                      ; preds = %._crit_edge6, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge6 ]
  %9 = phi double [ %.pre, %.lr.ph ], [ %15, %._crit_edge6 ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv46
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %9, %14
  store double %15, double* %7, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge6

._crit_edge6:                                     ; preds = %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %8

._crit_edge.loopexit:                             ; preds = %8
  %.pre36 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph3.._crit_edge_crit_edge, %._crit_edge.loopexit
  %16 = phi [2000 x double]* [ %.pre36, %._crit_edge.loopexit ], [ %5, %.lr.ph3.._crit_edge_crit_edge ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv46, i64 %indvars.iv46
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv1, i64 %indvars.iv46
  %20 = load double, double* %19, align 8
  %21 = fdiv double %20, %18
  store double %21, double* %19, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next47, %indvars.iv1
  br i1 %exitcond3, label %.lr.ph14.split.us.preheader, label %._crit_edge..lr.ph3_crit_edge

._crit_edge..lr.ph3_crit_edge:                    ; preds = %._crit_edge
  %indvars.iv.next45 = add nsw i32 %indvars.iv44, 1
  br label %.lr.ph3

.lr.ph14.split.us.preheader:                      ; preds = %._crit_edge
  %22 = load [2000 x double]*, [2000 x double]** %1, align 8
  %wide.trip.count53 = zext i32 %indvars.iv51 to i64
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge10.us..lr.ph14.split.us_crit_edge, %.lr.ph14.split.us.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge10.us..lr.ph14.split.us_crit_edge ], [ %indvars.iv1, %.lr.ph14.split.us.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i64 %indvars.iv1, i64 %indvars.iv57
  %.pre37 = load double, double* %23, align 8
  br label %24

; <label>:24:                                     ; preds = %._crit_edge7, %.lr.ph14.split.us
  %indvars.iv49 = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next50, %._crit_edge7 ]
  %25 = phi double [ %.pre37, %.lr.ph14.split.us ], [ %31, %._crit_edge7 ]
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i64 %indvars.iv1, i64 %indvars.iv49
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i64 %indvars.iv49, i64 %indvars.iv57
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %23, align 8
  %exitcond54 = icmp eq i64 %indvars.iv49, %wide.trip.count53
  br i1 %exitcond54, label %._crit_edge10.us, label %._crit_edge7

._crit_edge7:                                     ; preds = %24
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  br label %24

._crit_edge10.us:                                 ; preds = %24
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond4, label %._crit_edge15.loopexit, label %._crit_edge10.us..lr.ph14.split.us_crit_edge

._crit_edge10.us..lr.ph14.split.us_crit_edge:     ; preds = %._crit_edge10.us
  br label %.lr.ph14.split.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.._crit_edge15_crit_edge, %._crit_edge15.loopexit
  %32 = phi [2000 x double]* [ %3, %.._crit_edge15_crit_edge ], [ %22, %._crit_edge15.loopexit ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %33, label %._crit_edge15._crit_edge

._crit_edge15._crit_edge:                         ; preds = %._crit_edge15
  %indvars.iv.next52 = add nsw i32 %indvars.iv51, 1
  br label %2

; <label>:33:                                     ; preds = %._crit_edge15
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge2.us..lr.ph5.split.us_crit_edge, %.lr.ph5.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge2.us..lr.ph5.split.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv11, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us._crit_edge, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %6
  br label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %6

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond1, label %17, label %._crit_edge2.us..lr.ph5.split.us_crit_edge

._crit_edge2.us..lr.ph5.split.us_crit_edge:       ; preds = %._crit_edge2.us
  br label %.lr.ph5.split.us

; <label>:17:                                     ; preds = %._crit_edge2.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !2, !3}
!12 = distinct !{!12, !2, !3}
