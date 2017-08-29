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
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.lr.ph58:
  %1 = alloca [2000 x double]*, align 8
  %2 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %.lr.ph48

.lr.ph48:                                         ; preds = %._crit_edge54, %.lr.ph58
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge54 ], [ 0, %.lr.ph58 ]
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge54 ], [ 1, %.lr.ph58 ]
  %sext = shl i64 %indvars.iv117, 32
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph48
  %indvars.iv112 = phi i64 [ 0, %.lr.ph48 ], [ %indvars.iv.next113, %3 ]
  %4 = sub nsw i64 0, %indvars.iv112
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 2000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fadd double %8, 1.000000e+00
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv112
  store double %9, double* %10, align 8
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond116 = icmp eq i64 %indvars.iv112, %indvars.iv122
  br i1 %exitcond116, label %._crit_edge49, label %3

._crit_edge49:                                    ; preds = %3
  %11 = ashr exact i64 %sext, 32
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %12 = icmp slt i64 %indvars.iv.next123, 2000
  br i1 %12, label %.lr.ph53.preheader, label %.lr.ph41.split.us.preheader

.lr.ph53.preheader:                               ; preds = %._crit_edge49
  %13 = sub nsw i64 2000, %11
  %min.iters.check = icmp ult i64 %13, 4
  br i1 %min.iters.check, label %.lr.ph53.preheader62, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph53.preheader
  %n.vec = and i64 %13, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %11, %n.vec
  br i1 %cmp.zero, label %.lr.ph53.preheader62, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = add nsw i64 %n.vec, -4
  %15 = lshr exact i64 %14, 2
  %16 = add nuw nsw i64 %15, 1
  %xtraiter = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %17 = add i64 %11, %index.prol
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %22 = icmp ult i64 %14, 12
  br i1 %22, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %23 = add i64 %11, %index
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next = add i64 %index, 4
  %28 = add i64 %11, %index.next
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %index.next.1 = add i64 %index, 8
  %33 = add i64 %11, %index.next.1
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %index.next.2 = add i64 %index, 12
  %38 = add i64 %11, %index.next.2
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %42, align 8
  %index.next.3 = add i64 %index, 16
  %43 = icmp eq i64 %index.next.3, %n.vec
  br i1 %43, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %13, %n.vec
  br i1 %cmp.n, label %._crit_edge54, label %.lr.ph53.preheader62

.lr.ph53.preheader62:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph53.preheader
  %indvars.iv119.ph = phi i64 [ %11, %min.iters.checked ], [ %11, %.lr.ph53.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph53

.lr.ph53:                                         ; preds = %.lr.ph53.preheader62, %.lr.ph53
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %.lr.ph53 ], [ %indvars.iv119.ph, %.lr.ph53.preheader62 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv119
  store double 0.000000e+00, double* %44, align 8
  %indvars.iv.next120 = add nsw i64 %indvars.iv119, 1
  %exitcond121 = icmp eq i64 %indvars.iv119, 1999
  br i1 %exitcond121, label %._crit_edge54.loopexit, label %.lr.ph53, !llvm.loop !6

._crit_edge54.loopexit:                           ; preds = %.lr.ph53
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %middle.block
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv122
  store double 1.000000e+00, double* %45, align 8
  %indvars.iv.next118 = add nsw i64 %11, 1
  br label %.lr.ph48

.lr.ph41.split.us.preheader:                      ; preds = %._crit_edge49
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv122
  store double 1.000000e+00, double* %46, align 8
  %47 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %48 = bitcast [2000 x [2000 x double]]** %2 to i8**
  store i8* %47, i8** %48, align 8
  %49 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %53 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %54 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %55 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %56 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %._crit_edge37.us

._crit_edge37.us:                                 ; preds = %._crit_edge37.us, %.lr.ph41.split.us.preheader
  %indvars.iv109 = phi i64 [ 0, %.lr.ph41.split.us.preheader ], [ %indvars.iv.next110.7, %._crit_edge37.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv109, i64 0
  %scevgep108 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv.next110, i64 0
  %scevgep108.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.1 = or i64 %indvars.iv109, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv.next110.1, i64 0
  %scevgep108.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.2 = or i64 %indvars.iv109, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next110.2, i64 0
  %scevgep108.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.3 = or i64 %indvars.iv109, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv.next110.3, i64 0
  %scevgep108.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.4 = or i64 %indvars.iv109, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv.next110.4, i64 0
  %scevgep108.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.5 = or i64 %indvars.iv109, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv.next110.5, i64 0
  %scevgep108.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.6 = or i64 %indvars.iv109, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv.next110.6, i64 0
  %scevgep108.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.7 = add nsw i64 %indvars.iv109, 8
  %exitcond66.7 = icmp eq i64 %indvars.iv.next110.7, 2000
  br i1 %exitcond66.7, label %.lr.ph15.us.preheader, label %._crit_edge37.us

.lr.ph15.us.preheader:                            ; preds = %._crit_edge37.us
  %57 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %58 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %59 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %.lr.ph15.us

._crit_edge16.us-lcssa.us.us:                     ; preds = %._crit_edge13.us.us
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next103, 2000
  br i1 %exitcond65, label %.lr.ph5.split.us.preheader, label %.lr.ph15.us

.lr.ph15.us:                                      ; preds = %._crit_edge16.us-lcssa.us.us, %.lr.ph15.us.preheader
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge16.us-lcssa.us.us ], [ 0, %.lr.ph15.us.preheader ]
  %scevgep13 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv102
  %60 = add nuw nsw i64 %indvars.iv102, 1
  %scevgep15 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %60
  %61 = bitcast double* %scevgep15 to i8*
  %62 = bitcast double* %scevgep13 to i8*
  br label %.lr.ph12.us.us

.lr.ph12.us.us:                                   ; preds = %._crit_edge13.us.us, %.lr.ph15.us
  %indvars.iv100 = phi i64 [ 0, %.lr.ph15.us ], [ %indvars.iv.next101, %._crit_edge13.us.us ]
  %63 = mul nuw nsw i64 %indvars.iv100, 16000
  %scevgep11 = getelementptr i8, i8* %47, i64 %63
  %64 = add nuw nsw i64 %63, 16000
  %scevgep12 = getelementptr i8, i8* %47, i64 %64
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv100, i64 %indvars.iv102
  %bound0 = icmp ult i8* %scevgep11, %61
  %bound1 = icmp ult i8* %62, %scevgep12
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %65 to i8*
  %bc17 = bitcast double* %65 to i8*
  %bound018 = icmp ult i8* %scevgep11, %bc17
  %bound119 = icmp ult i8* %bc, %scevgep12
  %found.conflict20 = and i1 %bound018, %bound119
  %conflict.rdx = or i1 %found.conflict, %found.conflict20
  br i1 %conflict.rdx, label %scalar.ph8.preheader, label %vector.body6.preheader

vector.body6.preheader:                           ; preds = %.lr.ph12.us.us
  br label %vector.body6

scalar.ph8.preheader:                             ; preds = %.lr.ph12.us.us
  br label %scalar.ph8

vector.body6:                                     ; preds = %vector.body6.preheader, %vector.body6
  %index22 = phi i64 [ %index.next23, %vector.body6 ], [ 0, %vector.body6.preheader ]
  %66 = or i64 %index22, 1
  %67 = or i64 %index22, 2
  %68 = or i64 %index22, 3
  %69 = load double, double* %65, align 8, !alias.scope !8
  %70 = insertelement <2 x double> undef, double %69, i32 0
  %71 = shufflevector <2 x double> %70, <2 x double> undef, <2 x i32> zeroinitializer
  %72 = insertelement <2 x double> undef, double %69, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> undef, <2 x i32> zeroinitializer
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index22, i64 %indvars.iv102
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %66, i64 %indvars.iv102
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %67, i64 %indvars.iv102
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %68, i64 %indvars.iv102
  %78 = load double, double* %74, align 8, !alias.scope !11
  %79 = load double, double* %75, align 8, !alias.scope !11
  %80 = load double, double* %76, align 8, !alias.scope !11
  %81 = load double, double* %77, align 8, !alias.scope !11
  %82 = insertelement <2 x double> undef, double %78, i32 0
  %83 = insertelement <2 x double> %82, double %79, i32 1
  %84 = insertelement <2 x double> undef, double %80, i32 0
  %85 = insertelement <2 x double> %84, double %81, i32 1
  %86 = fmul <2 x double> %71, %83
  %87 = fmul <2 x double> %73, %85
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv100, i64 %index22
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !13, !noalias !15
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !13, !noalias !15
  %92 = fadd <2 x double> %wide.load, %86
  %93 = fadd <2 x double> %wide.load30, %87
  %94 = bitcast double* %88 to <2 x double>*
  store <2 x double> %92, <2 x double>* %94, align 8, !alias.scope !13, !noalias !15
  %95 = bitcast double* %90 to <2 x double>*
  store <2 x double> %93, <2 x double>* %95, align 8, !alias.scope !13, !noalias !15
  %index.next23 = add nuw nsw i64 %index22, 4
  %96 = icmp eq i64 %index.next23, 2000
  br i1 %96, label %._crit_edge13.us.us.loopexit68, label %vector.body6, !llvm.loop !16

._crit_edge13.us.us.loopexit:                     ; preds = %scalar.ph8
  br label %._crit_edge13.us.us

._crit_edge13.us.us.loopexit68:                   ; preds = %vector.body6
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.loopexit68, %._crit_edge13.us.us.loopexit
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next101, 2000
  br i1 %exitcond64, label %._crit_edge16.us-lcssa.us.us, label %.lr.ph12.us.us

scalar.ph8:                                       ; preds = %scalar.ph8, %scalar.ph8.preheader
  %indvars.iv97 = phi i64 [ 0, %scalar.ph8.preheader ], [ %indvars.iv.next98.1, %scalar.ph8 ]
  %97 = load double, double* %65, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv102
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv100, i64 %indvars.iv97
  %102 = load double, double* %101, align 8
  %103 = fadd double %102, %100
  store double %103, double* %101, align 8
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %104 = load double, double* %65, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next98, i64 %indvars.iv102
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next98
  %109 = load double, double* %108, align 8
  %110 = fadd double %109, %107
  store double %110, double* %108, align 8
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next98, 1999
  br i1 %exitcond99.1, label %._crit_edge13.us.us.loopexit, label %scalar.ph8, !llvm.loop !17

.lr.ph5.split.us.preheader:                       ; preds = %._crit_edge16.us-lcssa.us.us
  %111 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %112 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph5.split.us.preheader
  %indvars.iv94 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next95, %._crit_edge3.us ]
  %scevgep36 = getelementptr [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 0
  %113 = add nuw nsw i64 %indvars.iv94, 1
  %scevgep38 = getelementptr [2000 x double], [2000 x double]* %112, i64 %113, i64 0
  %scevgep40 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 0
  %scevgep42 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %113, i64 0
  %bound044 = icmp ult double* %scevgep36, %scevgep42
  %bound145 = icmp ult double* %scevgep40, %scevgep38
  %memcheck.conflict47 = and i1 %bound044, %bound145
  br i1 %memcheck.conflict47, label %scalar.ph33.preheader, label %vector.body31.preheader

vector.body31.preheader:                          ; preds = %.lr.ph5.split.us
  br label %vector.body31

scalar.ph33.preheader:                            ; preds = %.lr.ph5.split.us
  br label %scalar.ph33

vector.body31:                                    ; preds = %vector.body31, %vector.body31.preheader
  %index50 = phi i64 [ 0, %vector.body31.preheader ], [ %index.next51.1, %vector.body31 ]
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 %index50
  %115 = bitcast double* %114 to <2 x i64>*
  %wide.load58 = load <2 x i64>, <2 x i64>* %115, align 8, !alias.scope !18
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load59 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !18
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 %index50
  %119 = bitcast double* %118 to <2 x i64>*
  store <2 x i64> %wide.load58, <2 x i64>* %119, align 8, !alias.scope !21, !noalias !18
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load59, <2 x i64>* %121, align 8, !alias.scope !21, !noalias !18
  %index.next51 = or i64 %index50, 4
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 %index.next51
  %123 = bitcast double* %122 to <2 x i64>*
  %wide.load58.1 = load <2 x i64>, <2 x i64>* %123, align 8, !alias.scope !18
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  %wide.load59.1 = load <2 x i64>, <2 x i64>* %125, align 8, !alias.scope !18
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 %index.next51
  %127 = bitcast double* %126 to <2 x i64>*
  store <2 x i64> %wide.load58.1, <2 x i64>* %127, align 8, !alias.scope !21, !noalias !18
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x i64>*
  store <2 x i64> %wide.load59.1, <2 x i64>* %129, align 8, !alias.scope !21, !noalias !18
  %index.next51.1 = add nsw i64 %index50, 8
  %130 = icmp eq i64 %index.next51.1, 2000
  br i1 %130, label %._crit_edge3.us.loopexit67, label %vector.body31, !llvm.loop !23

scalar.ph33:                                      ; preds = %scalar.ph33, %scalar.ph33.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph33.preheader ], [ %indvars.iv.next.4, %scalar.ph33 ]
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 %indvars.iv
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 %indvars.iv
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 %indvars.iv.next
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next.1
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 %indvars.iv.next.1
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next.2
  %147 = bitcast double* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 %indvars.iv.next.2
  %150 = bitcast double* %149 to i64*
  store i64 %148, i64* %150, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %151 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %111, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next.3
  %152 = bitcast double* %151 to i64*
  %153 = load i64, i64* %152, align 8
  %154 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 %indvars.iv94, i64 %indvars.iv.next.3
  %155 = bitcast double* %154 to i64*
  store i64 %153, i64* %155, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge3.us.loopexit, label %scalar.ph33, !llvm.loop !24

._crit_edge3.us.loopexit:                         ; preds = %scalar.ph33
  br label %._crit_edge3.us

._crit_edge3.us.loopexit67:                       ; preds = %vector.body31
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit67, %._crit_edge3.us.loopexit
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next95, 2000
  br i1 %exitcond63, label %156, label %.lr.ph5.split.us

; <label>:156:                                    ; preds = %._crit_edge3.us
  %157 = bitcast [2000 x [2000 x double]]* %111 to i8*
  tail call void @free(i8* %157) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
.lr.ph21:
  %1 = alloca [2000 x double]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %2

; <label>:2:                                      ; preds = %._crit_edge15, %.lr.ph21
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge15 ], [ 0, %.lr.ph21 ]
  %indvars.iv51 = phi i32 [ %indvars.iv.next52, %._crit_edge15 ], [ -1, %.lr.ph21 ]
  %3 = phi [2000 x double]* [ %66, %._crit_edge15 ], [ %0, %.lr.ph21 ]
  %4 = add i64 %indvars.iv1, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = icmp sgt i64 %indvars.iv1, 0
  br i1 %6, label %.lr.ph3.preheader, label %._crit_edge15

.lr.ph3.preheader:                                ; preds = %2
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %._crit_edge, %.lr.ph3.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.lr.ph3.preheader ]
  %indvars.iv44 = phi i32 [ %indvars.iv.next45, %._crit_edge ], [ -1, %.lr.ph3.preheader ]
  %7 = phi [2000 x double]* [ %35, %._crit_edge ], [ %3, %.lr.ph3.preheader ]
  %8 = add i64 %indvars.iv46, 4294967295
  %9 = and i64 %8, 4294967295
  %10 = icmp sgt i64 %indvars.iv46, 0
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv1, i64 %indvars.iv46
  %.pre = load double, double* %11, align 8
  %wide.trip.count = zext i32 %indvars.iv44 to i64
  %12 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %12, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %13

; <label>:13:                                     ; preds = %.prol.preheader
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv1, i64 0
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 0, i64 %indvars.iv46
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %11, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %13
  %indvars.iv.unr.ph = phi i64 [ 1, %13 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %19, %13 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %9, 0
  br i1 %20, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %21 ]
  %22 = phi double [ %.unr.ph, %.lr.ph.new ], [ %34, %21 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv1, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv, i64 %indvars.iv46
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %11, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv1, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv.next, i64 %indvars.iv46
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %21

._crit_edge.loopexit.unr-lcssa:                   ; preds = %21
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.pre36 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph3, %._crit_edge.loopexit
  %35 = phi [2000 x double]* [ %.pre36, %._crit_edge.loopexit ], [ %7, %.lr.ph3 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv46
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %35, i64 %indvars.iv1, i64 %indvars.iv46
  %39 = load double, double* %38, align 8
  %40 = fdiv double %39, %37
  store double %40, double* %38, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %indvars.iv.next45 = add nsw i32 %indvars.iv44, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next47, %indvars.iv1
  br i1 %exitcond3, label %.lr.ph14.split.us.preheader, label %.lr.ph3

.lr.ph14.split.us.preheader:                      ; preds = %._crit_edge
  %41 = load [2000 x double]*, [2000 x double]** %1, align 8
  %wide.trip.count53 = zext i32 %indvars.iv51 to i64
  %42 = and i64 %4, 1
  %lcmp.mod9 = icmp eq i64 %42, 0
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv1, i64 0
  %44 = icmp eq i64 %5, 0
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge10.us, %.lr.ph14.split.us.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge10.us ], [ %indvars.iv1, %.lr.ph14.split.us.preheader ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv1, i64 %indvars.iv57
  %.pre37 = load double, double* %45, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.lr.ph14.split.us
  br label %46

; <label>:46:                                     ; preds = %.prol.preheader6
  %47 = load double, double* %43, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 0, i64 %indvars.iv57
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %.pre37, %50
  store double %51, double* %45, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.lr.ph14.split.us, %46
  %indvars.iv49.unr.ph = phi i64 [ 1, %46 ], [ 0, %.lr.ph14.split.us ]
  %.unr10.ph = phi double [ %51, %46 ], [ %.pre37, %.lr.ph14.split.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %44, label %._crit_edge10.us, label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %.prol.loopexit7
  br label %52

; <label>:52:                                     ; preds = %52, %.lr.ph14.split.us.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %.lr.ph14.split.us.new ], [ %indvars.iv.next50.1, %52 ]
  %53 = phi double [ %.unr10.ph, %.lr.ph14.split.us.new ], [ %65, %52 ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv1, i64 %indvars.iv49
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv49, i64 %indvars.iv57
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fsub double %53, %58
  store double %59, double* %45, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv1, i64 %indvars.iv.next50
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv.next50, i64 %indvars.iv57
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %59, %64
  store double %65, double* %45, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next50, %wide.trip.count53
  br i1 %exitcond54.1, label %._crit_edge10.us.unr-lcssa, label %52

._crit_edge10.us.unr-lcssa:                       ; preds = %52
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %.prol.loopexit7, %._crit_edge10.us.unr-lcssa
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond4, label %._crit_edge15.loopexit, label %.lr.ph14.split.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %66 = phi [2000 x double]* [ %3, %2 ], [ %41, %._crit_edge15.loopexit ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next52 = add nsw i32 %indvars.iv51, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %67, label %2

; <label>:67:                                     ; preds = %._crit_edge15
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
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge2.us, %.lr.ph5.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge2.us ]
  %5 = mul nuw nsw i64 %indvars.iv11, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2.us, label %6

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond1, label %17, label %.lr.ph5.split.us

; <label>:17:                                     ; preds = %._crit_edge2.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!12, !9}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !4, !5}
