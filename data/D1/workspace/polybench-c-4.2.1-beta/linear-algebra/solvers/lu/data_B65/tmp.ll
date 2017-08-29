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
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.preheader13.lr.ph:
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %.preheader13.lr.ph, %._crit_edge59
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge59 ], [ 0, %.preheader13.lr.ph ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge59 ], [ 1, %.preheader13.lr.ph ]
  %sext = shl i64 %indvars.iv114, 32
  br label %1

; <label>:1:                                      ; preds = %1, %.lr.ph52
  %indvars.iv109 = phi i64 [ 0, %.lr.ph52 ], [ %indvars.iv.next110, %1 ]
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
  br i1 %exitcond113, label %._crit_edge53, label %1

._crit_edge53:                                    ; preds = %1
  %9 = ashr exact i64 %sext, 32
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %10 = icmp slt i64 %indvars.iv.next120, 2000
  br i1 %10, label %.lr.ph58.preheader, label %._crit_edge59.thread

.lr.ph58.preheader:                               ; preds = %._crit_edge53
  %11 = sub nsw i64 2000, %9
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph58.preheader31, label %min.iters.checked

.lr.ph58.preheader31:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph58.preheader
  %indvars.iv116.ph = phi i64 [ %9, %min.iters.checked ], [ %9, %.lr.ph58.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph58

min.iters.checked:                                ; preds = %.lr.ph58.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %9, %n.vec
  br i1 %cmp.zero, label %.lr.ph58.preheader31, label %vector.body.preheader

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
  br i1 %cmp.n, label %._crit_edge59, label %.lr.ph58.preheader31

._crit_edge59.thread:                             ; preds = %._crit_edge53
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %42, align 8
  %43 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %44 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %45 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %43 to [2000 x [2000 x double]]*
  br label %._crit_edge45.us

.lr.ph58:                                         ; preds = %.lr.ph58.preheader31, %.lr.ph58
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %.lr.ph58 ], [ %indvars.iv116.ph, %.lr.ph58.preheader31 ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv116
  store double 0.000000e+00, double* %52, align 8
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  %exitcond118 = icmp eq i64 %indvars.iv116, 1999
  br i1 %exitcond118, label %._crit_edge59.loopexit, label %.lr.ph58, !llvm.loop !6

._crit_edge59.loopexit:                           ; preds = %.lr.ph58
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %middle.block
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %53, align 8
  %indvars.iv.next115 = add nsw i64 %9, 1
  br label %.lr.ph52

._crit_edge45.us:                                 ; preds = %._crit_edge45.us, %._crit_edge59.thread
  %indvars.iv106 = phi i64 [ 0, %._crit_edge59.thread ], [ %indvars.iv.next107.7, %._crit_edge45.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv106, i64 0
  %scevgep105 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv.next107, i64 0
  %scevgep105.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.1 = or i64 %indvars.iv106, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv.next107.1, i64 0
  %scevgep105.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.2 = or i64 %indvars.iv106, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv.next107.2, i64 0
  %scevgep105.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.3 = or i64 %indvars.iv106, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv.next107.3, i64 0
  %scevgep105.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.4 = or i64 %indvars.iv106, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv.next107.4, i64 0
  %scevgep105.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.5 = or i64 %indvars.iv106, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv.next107.5, i64 0
  %scevgep105.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.6 = or i64 %indvars.iv106, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv.next107.6, i64 0
  %scevgep105.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.7 = add nsw i64 %indvars.iv106, 8
  %exitcond35.7 = icmp eq i64 %indvars.iv.next107.7, 2000
  br i1 %exitcond35.7, label %.preheader9.lr.ph.us.preheader, label %._crit_edge45.us

.preheader9.lr.ph.us.preheader:                   ; preds = %._crit_edge45.us
  %54 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %55 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %56 = bitcast i8* %43 to [2000 x [2000 x double]]*
  br label %.preheader9.lr.ph.us

._crit_edge24.us-lcssa.us.us:                     ; preds = %._crit_edge22.us.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond34, label %.preheader.us.preheader, label %.preheader9.lr.ph.us

.preheader.us.preheader:                          ; preds = %._crit_edge24.us-lcssa.us.us
  %57 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %58 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %59 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %60 = bitcast i8* %43 to [2000 x [2000 x double]]*
  %61 = bitcast i8* %43 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader9.lr.ph.us:                             ; preds = %._crit_edge24.us-lcssa.us.us, %.preheader9.lr.ph.us.preheader
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge24.us-lcssa.us.us ], [ 0, %.preheader9.lr.ph.us.preheader ]
  %scevgep12 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv99
  %62 = add nuw nsw i64 %indvars.iv99, 1
  %scevgep14 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %62
  %63 = bitcast double* %scevgep14 to i8*
  %64 = bitcast double* %scevgep12 to i8*
  br label %.preheader9.us.us

.preheader9.us.us:                                ; preds = %._crit_edge22.us.us, %.preheader9.lr.ph.us
  %indvars.iv97 = phi i64 [ 0, %.preheader9.lr.ph.us ], [ %indvars.iv.next98, %._crit_edge22.us.us ]
  %65 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep10 = getelementptr i8, i8* %43, i64 %65
  %66 = add nuw nsw i64 %65, 16000
  %scevgep11 = getelementptr i8, i8* %43, i64 %66
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv99
  %bound0 = icmp ult i8* %scevgep10, %63
  %bound1 = icmp ult i8* %64, %scevgep11
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %67 to i8*
  %bc16 = bitcast double* %67 to i8*
  %bound017 = icmp ult i8* %scevgep10, %bc16
  %bound118 = icmp ult i8* %bc, %scevgep11
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx = or i1 %found.conflict, %found.conflict19
  br i1 %conflict.rdx, label %scalar.ph7.preheader, label %vector.body5.preheader

vector.body5.preheader:                           ; preds = %.preheader9.us.us
  br label %vector.body5

scalar.ph7.preheader:                             ; preds = %.preheader9.us.us
  br label %scalar.ph7

vector.body5:                                     ; preds = %vector.body5.preheader, %vector.body5
  %index21 = phi i64 [ %index.next22, %vector.body5 ], [ 0, %vector.body5.preheader ]
  %68 = or i64 %index21, 1
  %69 = or i64 %index21, 2
  %70 = or i64 %index21, 3
  %71 = load double, double* %67, align 8, !alias.scope !8
  %72 = insertelement <2 x double> undef, double %71, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> undef, <2 x i32> zeroinitializer
  %74 = insertelement <2 x double> undef, double %71, i32 0
  %75 = shufflevector <2 x double> %74, <2 x double> undef, <2 x i32> zeroinitializer
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index21, i64 %indvars.iv99
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %68, i64 %indvars.iv99
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %69, i64 %indvars.iv99
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %70, i64 %indvars.iv99
  %80 = load double, double* %76, align 8, !alias.scope !11
  %81 = load double, double* %77, align 8, !alias.scope !11
  %82 = load double, double* %78, align 8, !alias.scope !11
  %83 = load double, double* %79, align 8, !alias.scope !11
  %84 = insertelement <2 x double> undef, double %80, i32 0
  %85 = insertelement <2 x double> %84, double %81, i32 1
  %86 = insertelement <2 x double> undef, double %82, i32 0
  %87 = insertelement <2 x double> %86, double %83, i32 1
  %88 = fmul <2 x double> %73, %85
  %89 = fmul <2 x double> %75, %87
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv97, i64 %index21
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !13, !noalias !15
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !13, !noalias !15
  %94 = fadd <2 x double> %88, %wide.load
  %95 = fadd <2 x double> %89, %wide.load29
  %96 = bitcast double* %90 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8, !alias.scope !13, !noalias !15
  %97 = bitcast double* %92 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !alias.scope !13, !noalias !15
  %index.next22 = add nuw nsw i64 %index21, 4
  %98 = icmp eq i64 %index.next22, 2000
  br i1 %98, label %._crit_edge22.us.us.loopexit36, label %vector.body5, !llvm.loop !16

._crit_edge22.us.us.loopexit:                     ; preds = %scalar.ph7
  br label %._crit_edge22.us.us

._crit_edge22.us.us.loopexit36:                   ; preds = %vector.body5
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit36, %._crit_edge22.us.us.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond33, label %._crit_edge24.us-lcssa.us.us, label %.preheader9.us.us

scalar.ph7:                                       ; preds = %scalar.ph7, %scalar.ph7.preheader
  %indvars.iv94 = phi i64 [ 0, %scalar.ph7.preheader ], [ %indvars.iv.next95.1, %scalar.ph7 ]
  %99 = load double, double* %67, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv94, i64 %indvars.iv99
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv97, i64 %indvars.iv94
  %104 = load double, double* %103, align 8
  %105 = fadd double %102, %104
  store double %105, double* %103, align 8
  %indvars.iv.next95 = or i64 %indvars.iv94, 1
  %106 = load double, double* %67, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next95, i64 %indvars.iv99
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next95
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  store double %112, double* %110, align 8
  %indvars.iv.next95.1 = add nsw i64 %indvars.iv94, 2
  %exitcond96.1 = icmp eq i64 %indvars.iv.next95, 1999
  br i1 %exitcond96.1, label %._crit_edge22.us.us.loopexit, label %scalar.ph7, !llvm.loop !17

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %113

; <label>:113:                                    ; preds = %113, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.4, %113 ]
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %61, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.3
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv.next.3
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us, label %113

._crit_edge.us:                                   ; preds = %113
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond32, label %139, label %.preheader.us

; <label>:139:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %43) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
.preheader6.lr.ph:
  %1 = alloca [2000 x double]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16, %.preheader6.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge16 ], [ 0, %.preheader6.lr.ph ]
  %indvars.iv50 = phi i32 [ %indvars.iv.next51, %._crit_edge16 ], [ -1, %.preheader6.lr.ph ]
  %2 = phi [2000 x double]* [ %65, %._crit_edge16 ], [ %0, %.preheader6.lr.ph ]
  %3 = add i64 %indvars.iv1, 4294967295
  %4 = and i64 %3, 4294967295
  %5 = icmp sgt i64 %indvars.iv1, 0
  br i1 %5, label %.preheader5.preheader, label %._crit_edge16

.preheader5.preheader:                            ; preds = %.preheader6
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge, %.preheader5.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv43 = phi i32 [ %indvars.iv.next44, %._crit_edge ], [ -1, %.preheader5.preheader ]
  %6 = phi [2000 x double]* [ %34, %._crit_edge ], [ %2, %.preheader5.preheader ]
  %7 = add i64 %indvars.iv45, 4294967295
  %8 = and i64 %7, 4294967295
  %9 = icmp sgt i64 %indvars.iv45, 0
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv45
  %.pre = load double, double* %10, align 8
  %wide.trip.count = zext i32 %indvars.iv43 to i64
  %11 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %11, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %12

; <label>:12:                                     ; preds = %.prol.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 0
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 0, i64 %indvars.iv45
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %10, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %12
  %indvars.iv.unr.ph = phi i64 [ 1, %12 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %18, %12 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %8, 0
  br i1 %19, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %20 ]
  %21 = phi double [ %.unr.ph, %.lr.ph.new ], [ %33, %20 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv, i64 %indvars.iv45
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv.next, i64 %indvars.iv45
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %20

._crit_edge.loopexit.unr-lcssa:                   ; preds = %20
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.pre35 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader5, %._crit_edge.loopexit
  %34 = phi [2000 x double]* [ %.pre35, %._crit_edge.loopexit ], [ %6, %.preheader5 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv45
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i64 %indvars.iv1, i64 %indvars.iv45
  %38 = load double, double* %37, align 8
  %39 = fdiv double %38, %36
  store double %39, double* %37, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %indvars.iv.next44 = add nsw i32 %indvars.iv43, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next46, %indvars.iv1
  br i1 %exitcond3, label %.preheader.lr.ph, label %.preheader5

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %40 = load [2000 x double]*, [2000 x double]** %1, align 8
  %wide.trip.count52 = zext i32 %indvars.iv50 to i64
  %41 = and i64 %3, 1
  %lcmp.mod9 = icmp eq i64 %41, 0
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv1, i64 0
  %43 = icmp eq i64 %4, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us, %.preheader.lr.ph
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge13.us ], [ %indvars.iv1, %.preheader.lr.ph ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv1, i64 %indvars.iv56
  %.pre36 = load double, double* %44, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.preheader.us
  br label %45

; <label>:45:                                     ; preds = %.prol.preheader6
  %46 = load double, double* %42, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 0, i64 %indvars.iv56
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %.pre36, %49
  store double %50, double* %44, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.preheader.us, %45
  %indvars.iv48.unr.ph = phi i64 [ 1, %45 ], [ 0, %.preheader.us ]
  %.unr10.ph = phi double [ %50, %45 ], [ %.pre36, %.preheader.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %43, label %._crit_edge13.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit7
  br label %51

; <label>:51:                                     ; preds = %51, %.preheader.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %.preheader.us.new ], [ %indvars.iv.next49.1, %51 ]
  %52 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %64, %51 ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv1, i64 %indvars.iv48
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv48, i64 %indvars.iv56
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  store double %58, double* %44, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv1, i64 %indvars.iv.next49
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv.next49, i64 %indvars.iv56
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fsub double %58, %63
  store double %64, double* %44, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next49, %wide.trip.count52
  br i1 %exitcond53.1, label %._crit_edge13.us.unr-lcssa, label %51

._crit_edge13.us.unr-lcssa:                       ; preds = %51
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %.prol.loopexit7, %._crit_edge13.us.unr-lcssa
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next57, 2000
  br i1 %exitcond4, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader6
  %65 = phi [2000 x double]* [ %2, %.preheader6 ], [ %40, %._crit_edge16.loopexit ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next51 = add nsw i32 %indvars.iv50, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %66, label %.preheader6

; <label>:66:                                     ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond1, label %18, label %.preheader.us

; <label>:18:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!12, !9}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
