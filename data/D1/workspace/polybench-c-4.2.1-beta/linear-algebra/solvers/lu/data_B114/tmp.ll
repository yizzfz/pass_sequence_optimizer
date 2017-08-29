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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #4
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
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge52 ], [ 0, %.lr.ph56 ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge52 ], [ 1, %.lr.ph56 ]
  %sext = shl i64 %indvars.iv105, 32
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph46
  %indvars.iv100 = phi i64 [ 0, %.lr.ph46 ], [ %indvars.iv.next101, %3 ]
  %4 = sub nsw i64 0, %indvars.iv100
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 2000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fadd double %8, 1.000000e+00
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv100
  store double %9, double* %10, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond104 = icmp eq i64 %indvars.iv100, %indvars.iv110
  br i1 %exitcond104, label %._crit_edge47, label %3

._crit_edge47:                                    ; preds = %3
  %11 = ashr exact i64 %sext, 32
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %12 = icmp slt i64 %indvars.iv.next111, 2000
  br i1 %12, label %.lr.ph51.preheader, label %.lr.ph39.split.us.preheader

.lr.ph51.preheader:                               ; preds = %._crit_edge47
  %13 = sub nsw i64 2000, %11
  %min.iters.check = icmp ult i64 %13, 4
  br i1 %min.iters.check, label %.lr.ph51.preheader30, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph51.preheader
  %n.vec = and i64 %13, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %11, %n.vec
  br i1 %cmp.zero, label %.lr.ph51.preheader30, label %vector.body.preheader

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
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %17
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
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next = add i64 %index, 4
  %28 = add i64 %11, %index.next
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %index.next.1 = add i64 %index, 8
  %33 = add i64 %11, %index.next.1
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %index.next.2 = add i64 %index, 12
  %38 = add i64 %11, %index.next.2
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %38
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
  br i1 %cmp.n, label %._crit_edge52, label %.lr.ph51.preheader30

.lr.ph51.preheader30:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph51.preheader
  %indvars.iv107.ph = phi i64 [ %11, %min.iters.checked ], [ %11, %.lr.ph51.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph51

.lr.ph51:                                         ; preds = %.lr.ph51.preheader30, %.lr.ph51
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %.lr.ph51 ], [ %indvars.iv107.ph, %.lr.ph51.preheader30 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv107
  store double 0.000000e+00, double* %44, align 8
  %indvars.iv.next108 = add nsw i64 %indvars.iv107, 1
  %exitcond109 = icmp eq i64 %indvars.iv107, 1999
  br i1 %exitcond109, label %._crit_edge52.loopexit, label %.lr.ph51, !llvm.loop !6

._crit_edge52.loopexit:                           ; preds = %.lr.ph51
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge52.loopexit, %middle.block
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv110
  store double 1.000000e+00, double* %45, align 8
  %indvars.iv.next106 = add nsw i64 %11, 1
  br label %.lr.ph46

.lr.ph39.split.us.preheader:                      ; preds = %._crit_edge47
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv110
  store double 1.000000e+00, double* %46, align 8
  %47 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us, %.lr.ph39.split.us.preheader
  %indvars.iv97 = phi i64 [ 0, %.lr.ph39.split.us.preheader ], [ %indvars.iv.next98.7, %._crit_edge35.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv97, i64 0
  %scevgep113 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv.next98, i64 0
  %scevgep113.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1 = or i64 %indvars.iv97, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv.next98.1, i64 0
  %scevgep113.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2 = or i64 %indvars.iv97, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next98.2, i64 0
  %scevgep113.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3 = or i64 %indvars.iv97, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv.next98.3, i64 0
  %scevgep113.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.4 = or i64 %indvars.iv97, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv.next98.4, i64 0
  %scevgep113.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.5 = or i64 %indvars.iv97, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv.next98.5, i64 0
  %scevgep113.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.6 = or i64 %indvars.iv97, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv.next98.6, i64 0
  %scevgep113.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.7 = add nsw i64 %indvars.iv97, 8
  %exitcond34.7 = icmp eq i64 %indvars.iv.next98.7, 2000
  br i1 %exitcond34.7, label %.lr.ph13.us.preheader, label %._crit_edge35.us

.lr.ph13.us.preheader:                            ; preds = %._crit_edge35.us
  %57 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %58 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %.lr.ph13.us

._crit_edge14.us-lcssa.us.us:                     ; preds = %._crit_edge11.us.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond33, label %.lr.ph3.split.us.preheader, label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge14.us-lcssa.us.us, %.lr.ph13.us.preheader
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge14.us-lcssa.us.us ], [ 0, %.lr.ph13.us.preheader ]
  br label %.lr.ph10.us.us

.lr.ph10.us.us:                                   ; preds = %._crit_edge11.us.us, %.lr.ph13.us
  %indvars.iv89 = phi i64 [ 0, %.lr.ph13.us ], [ %indvars.iv.next90, %._crit_edge11.us.us ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv91
  br label %60

._crit_edge11.us.us:                              ; preds = %60
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond32, label %._crit_edge14.us-lcssa.us.us, label %.lr.ph10.us.us

; <label>:60:                                     ; preds = %60, %.lr.ph10.us.us
  %indvars.iv86 = phi i64 [ 0, %.lr.ph10.us.us ], [ %indvars.iv.next87.1, %60 ]
  %61 = load double, double* %59, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv86, i64 %indvars.iv91
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv89, i64 %indvars.iv86
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  store double %67, double* %65, align 8
  %indvars.iv.next87 = or i64 %indvars.iv86, 1
  %68 = load double, double* %59, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next87, i64 %indvars.iv91
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  store double %74, double* %72, align 8
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next87, 1999
  br i1 %exitcond88.1, label %._crit_edge11.us.us, label %60

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge14.us-lcssa.us.us
  %75 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %76 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv83 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next84, %._crit_edge.us ]
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 0
  %77 = add nuw nsw i64 %indvars.iv83, 1
  %scevgep13 = getelementptr [2000 x double], [2000 x double]* %76, i64 %77, i64 0
  %scevgep15 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 0
  %scevgep17 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %77, i64 0
  %bound0 = icmp ult double* %scevgep11, %scevgep17
  %bound1 = icmp ult double* %scevgep15, %scevgep13
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph8.preheader, label %vector.body6.preheader

vector.body6.preheader:                           ; preds = %.lr.ph3.split.us
  br label %vector.body6

scalar.ph8.preheader:                             ; preds = %.lr.ph3.split.us
  br label %scalar.ph8

vector.body6:                                     ; preds = %vector.body6, %vector.body6.preheader
  %index20 = phi i64 [ 0, %vector.body6.preheader ], [ %index.next21.1, %vector.body6 ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 %index20
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !8
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load28 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 %index20
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %83, align 8, !alias.scope !11, !noalias !8
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load28, <2 x i64>* %85, align 8, !alias.scope !11, !noalias !8
  %index.next21 = or i64 %index20, 4
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 %index.next21
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !8
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load28.1 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 %index.next21
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %91, align 8, !alias.scope !11, !noalias !8
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load28.1, <2 x i64>* %93, align 8, !alias.scope !11, !noalias !8
  %index.next21.1 = add nsw i64 %index20, 8
  %94 = icmp eq i64 %index.next21.1, 2000
  br i1 %94, label %._crit_edge.us.loopexit35, label %vector.body6, !llvm.loop !13

scalar.ph8:                                       ; preds = %scalar.ph8, %scalar.ph8.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph8.preheader ], [ %indvars.iv.next.4, %scalar.ph8 ]
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 %indvars.iv
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 %indvars.iv
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next
  %101 = bitcast double* %100 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 %indvars.iv.next
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.1
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 %indvars.iv.next.1
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.2
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 %indvars.iv.next.2
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.3
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv83, i64 %indvars.iv.next.3
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph8, !llvm.loop !14

._crit_edge.us.loopexit:                          ; preds = %scalar.ph8
  br label %._crit_edge.us

._crit_edge.us.loopexit35:                        ; preds = %vector.body6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit35, %._crit_edge.us.loopexit
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond31, label %120, label %.lr.ph3.split.us

; <label>:120:                                    ; preds = %._crit_edge.us
  %121 = bitcast [2000 x [2000 x double]]* %75 to i8*
  call void @free(i8* %121) #4
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
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge15 ], [ 4294967295, %.lr.ph21 ]
  %3 = phi [2000 x double]* [ %64, %._crit_edge15 ], [ %0, %.lr.ph21 ]
  %4 = and i64 %indvars.iv48, 4294967295
  %5 = icmp sgt i64 %indvars.iv1, 0
  br i1 %5, label %.lr.ph3.preheader, label %._crit_edge15

.lr.ph3.preheader:                                ; preds = %2
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %._crit_edge, %.lr.ph3.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge ], [ 0, %.lr.ph3.preheader ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge ], [ 4294967295, %.lr.ph3.preheader ]
  %6 = phi [2000 x double]* [ %33, %._crit_edge ], [ %3, %.lr.ph3.preheader ]
  %7 = and i64 %indvars.iv41, 4294967295
  %8 = icmp sgt i64 %indvars.iv43, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv43
  %.pre = load double, double* %9, align 8
  %10 = and i64 %indvars.iv41, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %11

; <label>:11:                                     ; preds = %.prol.preheader
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 0
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 0, i64 %indvars.iv43
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
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv, i64 %indvars.iv43
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv.next, i64 %indvars.iv43
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %19

._crit_edge.loopexit.unr-lcssa:                   ; preds = %19
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.pre36 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph3, %._crit_edge.loopexit
  %33 = phi [2000 x double]* [ %.pre36, %._crit_edge.loopexit ], [ %6, %.lr.ph3 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv43
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv1, i64 %indvars.iv43
  %37 = load double, double* %36, align 8
  %38 = fdiv double %37, %35
  store double %38, double* %36, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %indvars.iv.next42 = add nuw nsw i64 %7, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next44, %indvars.iv1
  br i1 %exitcond3, label %.lr.ph14.split.us.preheader, label %.lr.ph3

.lr.ph14.split.us.preheader:                      ; preds = %._crit_edge
  %39 = load [2000 x double]*, [2000 x double]** %1, align 8
  %40 = and i64 %indvars.iv48, 1
  %lcmp.mod9 = icmp eq i64 %40, 0
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 0
  %42 = icmp eq i64 %4, 0
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge10.us, %.lr.ph14.split.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge10.us ], [ %indvars.iv1, %.lr.ph14.split.us.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv54
  %.pre37 = load double, double* %43, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.lr.ph14.split.us
  br label %44

; <label>:44:                                     ; preds = %.prol.preheader6
  %45 = load double, double* %41, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 0, i64 %indvars.iv54
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %.pre37, %48
  store double %49, double* %43, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.lr.ph14.split.us, %44
  %indvars.iv46.unr.ph = phi i64 [ 1, %44 ], [ 0, %.lr.ph14.split.us ]
  %.unr10.ph = phi double [ %49, %44 ], [ %.pre37, %.lr.ph14.split.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %42, label %._crit_edge10.us, label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %.prol.loopexit7
  br label %50

; <label>:50:                                     ; preds = %50, %.lr.ph14.split.us.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr.ph, %.lr.ph14.split.us.new ], [ %indvars.iv.next47.1, %50 ]
  %51 = phi double [ %.unr10.ph, %.lr.ph14.split.us.new ], [ %63, %50 ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv46
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv46, i64 %indvars.iv54
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fsub double %51, %56
  store double %57, double* %43, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv.next47
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv.next47, i64 %indvars.iv54
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fsub double %57, %62
  store double %63, double* %43, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next47, %4
  br i1 %exitcond51.1, label %._crit_edge10.us.unr-lcssa, label %50

._crit_edge10.us.unr-lcssa:                       ; preds = %50
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %.prol.loopexit7, %._crit_edge10.us.unr-lcssa
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next55, 2000
  br i1 %exitcond4, label %._crit_edge15.loopexit, label %.lr.ph14.split.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %64 = phi [2000 x double]* [ %3, %2 ], [ %39, %._crit_edge15.loopexit ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next49 = add nuw nsw i64 %4, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %65, label %2

; <label>:65:                                     ; preds = %._crit_edge15
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
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2.us, label %6

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond1, label %17, label %.lr.ph5.split.us

; <label>:17:                                     ; preds = %._crit_edge2.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
