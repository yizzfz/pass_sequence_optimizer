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
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.lr.ph22:
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %._crit_edge20, %.lr.ph22
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge20 ], [ 0, %.lr.ph22 ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge20 ], [ 1, %.lr.ph22 ]
  br label %1

; <label>:1:                                      ; preds = %1, %.lr.ph16
  %indvars.iv109 = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next110, %1 ]
  %2 = sub nsw i64 0, %indvars.iv109
  %3 = trunc i64 %2 to i32
  %4 = srem i32 %3, 2000
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.000000e+03
  %7 = fadd double %6, 1.000000e+00
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv109
  store double %7, double* %8, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond113 = icmp eq i64 %indvars.iv109, %indvars.iv119
  br i1 %exitcond113, label %._crit_edge17, label %1

._crit_edge17:                                    ; preds = %1
  %sext = shl i64 %indvars.iv114, 32
  %9 = ashr exact i64 %sext, 32
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %10 = icmp slt i64 %indvars.iv.next120, 2000
  br i1 %10, label %.lr.ph19.preheader, label %.lr.ph13.split.us.preheader

.lr.ph19.preheader:                               ; preds = %._crit_edge17
  %11 = sub nsw i64 2000, %9
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph19.preheader30, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph19.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %9, %n.vec
  br i1 %cmp.zero, label %.lr.ph19.preheader30, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %12 = add nsw i64 %n.vec, -4
  %13 = lshr exact i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %xtraiter = and i64 %14, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %15 = add i64 %9, %index.prol
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %20 = icmp ult i64 %12, 12
  br i1 %20, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %21 = add i64 %9, %index
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %21
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %index.next = add i64 %index, 4
  %26 = add i64 %9, %index.next
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %index.next.1 = add i64 %index, 8
  %31 = add i64 %9, %index.next.1
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %index.next.2 = add i64 %index, 12
  %36 = add i64 %9, %index.next.2
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %38, align 8
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %40, align 8
  %index.next.3 = add i64 %index, 16
  %41 = icmp eq i64 %index.next.3, %n.vec
  br i1 %41, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge20, label %.lr.ph19.preheader30

.lr.ph19.preheader30:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph19.preheader
  %indvars.iv116.ph = phi i64 [ %9, %min.iters.checked ], [ %9, %.lr.ph19.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19.preheader30, %.lr.ph19
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %.lr.ph19 ], [ %indvars.iv116.ph, %.lr.ph19.preheader30 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv116
  store double 0.000000e+00, double* %42, align 8
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  %exitcond118 = icmp eq i64 %indvars.iv116, 1999
  br i1 %exitcond118, label %._crit_edge20.loopexit, label %.lr.ph19, !llvm.loop !6

._crit_edge20.loopexit:                           ; preds = %.lr.ph19
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %middle.block
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %43, align 8
  %indvars.iv.next115 = add nsw i64 %9, 1
  br label %.lr.ph16

.lr.ph13.split.us.preheader:                      ; preds = %._crit_edge17
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %44, align 8
  %45 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %46 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %53 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %54 = bitcast i8* %45 to [2000 x [2000 x double]]*
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %.lr.ph13.split.us.preheader
  %indvars.iv106 = phi i64 [ 0, %.lr.ph13.split.us.preheader ], [ %indvars.iv.next107.7, %._crit_edge11.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv106, i64 0
  %scevgep105 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv.next107, i64 0
  %scevgep105.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.1 = or i64 %indvars.iv106, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv.next107.1, i64 0
  %scevgep105.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.2 = or i64 %indvars.iv106, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv.next107.2, i64 0
  %scevgep105.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.3 = or i64 %indvars.iv106, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv.next107.3, i64 0
  %scevgep105.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.4 = or i64 %indvars.iv106, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next107.4, i64 0
  %scevgep105.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.5 = or i64 %indvars.iv106, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv.next107.5, i64 0
  %scevgep105.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.6 = or i64 %indvars.iv106, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv.next107.6, i64 0
  %scevgep105.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.7 = add nsw i64 %indvars.iv106, 8
  %exitcond124.7 = icmp eq i64 %indvars.iv.next107.7, 2000
  br i1 %exitcond124.7, label %.lr.ph7.us.preheader, label %._crit_edge11.us

.lr.ph7.us.preheader:                             ; preds = %._crit_edge11.us
  br label %.lr.ph7.us

.lr.ph7.us:                                       ; preds = %.lr.ph7.us.preheader, %._crit_edge8.us-lcssa.us.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge8.us-lcssa.us.us ], [ 0, %.lr.ph7.us.preheader ]
  br label %.lr.ph5.us.us

._crit_edge8.us-lcssa.us.us:                      ; preds = %._crit_edge6.us.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond123, label %.lr.ph2.split.us.preheader, label %.lr.ph7.us

.lr.ph5.us.us:                                    ; preds = %._crit_edge6.us.us, %.lr.ph7.us
  %indvars.iv97 = phi i64 [ 0, %.lr.ph7.us ], [ %indvars.iv.next98, %._crit_edge6.us.us ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv99
  br label %56

._crit_edge6.us.us:                               ; preds = %56
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond122, label %._crit_edge8.us-lcssa.us.us, label %.lr.ph5.us.us

; <label>:56:                                     ; preds = %56, %.lr.ph5.us.us
  %indvars.iv94 = phi i64 [ 0, %.lr.ph5.us.us ], [ %indvars.iv.next95.1, %56 ]
  %57 = load double, double* %55, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv94, i64 %indvars.iv99
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv97, i64 %indvars.iv94
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  store double %63, double* %61, align 8
  %indvars.iv.next95 = or i64 %indvars.iv94, 1
  %64 = load double, double* %55, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next95, i64 %indvars.iv99
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next95
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  store double %70, double* %68, align 8
  %indvars.iv.next95.1 = add nsw i64 %indvars.iv94, 2
  %exitcond96.1 = icmp eq i64 %indvars.iv.next95, 1999
  br i1 %exitcond96.1, label %._crit_edge6.us.us, label %56

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge8.us-lcssa.us.us
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv91 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %71, %._crit_edge.us ]
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 0
  %71 = add nuw nsw i64 %indvars.iv91, 1
  %scevgep13 = getelementptr [2000 x double], [2000 x double]* %0, i64 %71, i64 0
  %scevgep15 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 0
  %scevgep17 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %71, i64 0
  %bound0 = icmp ult double* %scevgep11, %scevgep17
  %bound1 = icmp ult double* %scevgep15, %scevgep13
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph8.preheader, label %vector.body6.preheader

vector.body6.preheader:                           ; preds = %.lr.ph2.split.us
  br label %vector.body6

scalar.ph8.preheader:                             ; preds = %.lr.ph2.split.us
  br label %scalar.ph8

vector.body6:                                     ; preds = %vector.body6, %vector.body6.preheader
  %index20 = phi i64 [ 0, %vector.body6.preheader ], [ %index.next21.1, %vector.body6 ]
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 %index20
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !8
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  %wide.load28 = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %index20
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %77, align 8, !alias.scope !11, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  store <2 x i64> %wide.load28, <2 x i64>* %79, align 8, !alias.scope !11, !noalias !8
  %index.next21 = or i64 %index20, 4
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 %index.next21
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !8
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load28.1 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %index.next21
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %85, align 8, !alias.scope !11, !noalias !8
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load28.1, <2 x i64>* %87, align 8, !alias.scope !11, !noalias !8
  %index.next21.1 = add nsw i64 %index20, 8
  %88 = icmp eq i64 %index.next21.1, 2000
  br i1 %88, label %._crit_edge.us.loopexit31, label %vector.body6, !llvm.loop !13

scalar.ph8:                                       ; preds = %scalar.ph8, %scalar.ph8.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph8.preheader ], [ %indvars.iv.next.4, %scalar.ph8 ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.3
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next.3
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph8, !llvm.loop !14

._crit_edge.us.loopexit:                          ; preds = %scalar.ph8
  br label %._crit_edge.us

._crit_edge.us.loopexit31:                        ; preds = %vector.body6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit31, %._crit_edge.us.loopexit
  %exitcond121 = icmp eq i64 %71, 2000
  br i1 %exitcond121, label %114, label %.lr.ph2.split.us

; <label>:114:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %45) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
.lr.ph11:
  %1 = alloca [2000 x double]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %2

; <label>:2:                                      ; preds = %._crit_edge9, %.lr.ph11
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge9 ], [ 0, %.lr.ph11 ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge9 ], [ 4294967295, %.lr.ph11 ]
  %3 = phi [2000 x double]* [ %64, %._crit_edge9 ], [ %0, %.lr.ph11 ]
  %4 = and i64 %indvars.iv64, 4294967295
  %5 = icmp sgt i64 %indvars.iv1, 0
  br i1 %5, label %.lr.ph2.preheader, label %._crit_edge9

.lr.ph2.preheader:                                ; preds = %2
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge ], [ 4294967295, %.lr.ph2.preheader ]
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  %6 = phi [2000 x double]* [ %33, %._crit_edge ], [ %3, %.lr.ph2.preheader ]
  %7 = and i64 %indvars.iv61, 4294967295
  %8 = icmp sgt i64 %indvars.iv46, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph2
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv46
  %.pre = load double, double* %9, align 8
  %10 = and i64 %indvars.iv61, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %11

; <label>:11:                                     ; preds = %.prol.preheader
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 0
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 0, i64 %indvars.iv46
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %.pre, %16
  store double %17, double* %9, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %11
  %indvars.iv.unr.ph = phi i64 [ 1, %11 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %17, %11 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %7, 0
  br i1 %18, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %19 ]
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %19 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv, i64 %indvars.iv46
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv.next, i64 %indvars.iv46
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond63.1, label %._crit_edge.loopexit.unr-lcssa, label %19

._crit_edge.loopexit.unr-lcssa:                   ; preds = %19
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.pre36 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph2, %._crit_edge.loopexit
  %33 = phi [2000 x double]* [ %.pre36, %._crit_edge.loopexit ], [ %6, %.lr.ph2 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv46
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv1, i64 %indvars.iv46
  %37 = load double, double* %36, align 8
  %38 = fdiv double %37, %35
  store double %38, double* %36, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %indvars.iv.next62 = add nuw nsw i64 %7, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next47, %indvars.iv1
  br i1 %exitcond3, label %.lr.ph8.split.us.preheader, label %.lr.ph2

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge
  %39 = load [2000 x double]*, [2000 x double]** %1, align 8
  %40 = and i64 %indvars.iv64, 1
  %lcmp.mod8 = icmp eq i64 %40, 0
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 0
  %42 = icmp eq i64 %4, 0
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %.lr.ph8.split.us.preheader, %._crit_edge6.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge6.us ], [ %indvars.iv1, %.lr.ph8.split.us.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv57
  %.pre37 = load double, double* %43, align 8
  br i1 %lcmp.mod8, label %.prol.preheader5, label %.prol.loopexit6.unr-lcssa

.prol.preheader5:                                 ; preds = %.lr.ph8.split.us
  br label %44

; <label>:44:                                     ; preds = %.prol.preheader5
  %45 = load double, double* %41, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 0, i64 %indvars.iv57
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %.pre37, %48
  store double %49, double* %43, align 8
  br label %.prol.loopexit6.unr-lcssa

.prol.loopexit6.unr-lcssa:                        ; preds = %.lr.ph8.split.us, %44
  %indvars.iv49.unr.ph = phi i64 [ 1, %44 ], [ 0, %.lr.ph8.split.us ]
  %.unr9.ph = phi double [ %49, %44 ], [ %.pre37, %.lr.ph8.split.us ]
  br label %.prol.loopexit6

.prol.loopexit6:                                  ; preds = %.prol.loopexit6.unr-lcssa
  br i1 %42, label %._crit_edge6.us, label %.lr.ph8.split.us.new

.lr.ph8.split.us.new:                             ; preds = %.prol.loopexit6
  br label %50

; <label>:50:                                     ; preds = %50, %.lr.ph8.split.us.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %.lr.ph8.split.us.new ], [ %indvars.iv.next50.1, %50 ]
  %51 = phi double [ %.unr9.ph, %.lr.ph8.split.us.new ], [ %63, %50 ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv49
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv49, i64 %indvars.iv57
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fsub double %51, %56
  store double %57, double* %43, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv.next50
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv.next50, i64 %indvars.iv57
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fsub double %57, %62
  store double %63, double* %43, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50, %4
  br i1 %exitcond.1, label %._crit_edge6.us.unr-lcssa, label %50

._crit_edge6.us.unr-lcssa:                        ; preds = %50
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %.prol.loopexit6, %._crit_edge6.us.unr-lcssa
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond66, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %2
  %64 = phi [2000 x double]* [ %3, %2 ], [ %39, %._crit_edge9.loopexit ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next65 = add nuw nsw i64 %4, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond4, label %65, label %2

; <label>:65:                                     ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph2.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv11, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond13, label %18, label %.lr.ph2.split.us

; <label>:18:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
