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
.preheader15.preheader.lr.ph:
  %1 = alloca [2000 x double]*, align 8
  %2 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %._crit_edge, %.preheader15.preheader.lr.ph
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge ], [ 0, %.preheader15.preheader.lr.ph ]
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %._crit_edge ], [ 1, %.preheader15.preheader.lr.ph ]
  %sext = shl i64 %indvars.iv113, 32
  br label %.preheader15

.preheader15:                                     ; preds = %.preheader15, %.lr.ph52
  %indvars.iv108 = phi i64 [ 0, %.lr.ph52 ], [ %indvars.iv.next109, %.preheader15 ]
  %3 = sub nsw i64 0, %indvars.iv108
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 2000
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 2.000000e+03
  %8 = fadd double %7, 1.000000e+00
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv108
  store double %8, double* %9, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond112 = icmp eq i64 %indvars.iv108, %indvars.iv118
  br i1 %exitcond112, label %.preheader15._crit_edge, label %.preheader15

.preheader15._crit_edge:                          ; preds = %.preheader15
  %10 = ashr exact i64 %sext, 32
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %11 = icmp slt i64 %indvars.iv.next119, 2000
  br i1 %11, label %.lr.ph56.preheader, label %.preheader14.preheader.us.preheader

.lr.ph56.preheader:                               ; preds = %.preheader15._crit_edge
  %12 = sub nsw i64 2000, %10
  %min.iters.check = icmp ult i64 %12, 4
  br i1 %min.iters.check, label %.lr.ph56.preheader30, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph56.preheader
  %n.vec = and i64 %12, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %10, %n.vec
  br i1 %cmp.zero, label %.lr.ph56.preheader30, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %13 = add nsw i64 %n.vec, -4
  %14 = lshr exact i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %xtraiter = and i64 %15, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %16 = add i64 %10, %index.prol
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %21 = icmp ult i64 %13, 12
  br i1 %21, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %22 = add i64 %10, %index
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %22
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8
  %index.next = add i64 %index, 4
  %27 = add i64 %10, %index.next
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %index.next.1 = add i64 %index, 8
  %32 = add i64 %10, %index.next.1
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %36, align 8
  %index.next.2 = add i64 %index, 12
  %37 = add i64 %10, %index.next.2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next.3 = add i64 %index, 16
  %42 = icmp eq i64 %index.next.3, %n.vec
  br i1 %42, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph56.preheader30

.lr.ph56.preheader30:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph56.preheader
  %indvars.iv115.ph = phi i64 [ %10, %min.iters.checked ], [ %10, %.lr.ph56.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph56

.lr.ph56:                                         ; preds = %.lr.ph56.preheader30, %.lr.ph56
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %.lr.ph56 ], [ %indvars.iv115.ph, %.lr.ph56.preheader30 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv115
  store double 0.000000e+00, double* %43, align 8
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %exitcond117 = icmp eq i64 %indvars.iv115, 1999
  br i1 %exitcond117, label %._crit_edge.loopexit, label %.lr.ph56, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph56
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv118
  store double 1.000000e+00, double* %44, align 8
  %indvars.iv.next114 = add nsw i64 %10, 1
  br label %.lr.ph52

.preheader14.preheader.us.preheader:              ; preds = %.preheader15._crit_edge
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv118
  store double 1.000000e+00, double* %45, align 8
  %46 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %47 = bitcast [2000 x [2000 x double]]** %2 to i8**
  store i8* %46, i8** %47, align 8
  %48 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %53 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %54 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %55 = bitcast i8* %46 to [2000 x [2000 x double]]*
  br label %.preheader14._crit_edge.us

.preheader14._crit_edge.us:                       ; preds = %.preheader14._crit_edge.us, %.preheader14.preheader.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.preheader14.preheader.us.preheader ], [ %indvars.iv.next106.7, %.preheader14._crit_edge.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv105, i64 0
  %scevgep104 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv.next106, i64 0
  %scevgep104.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.1 = or i64 %indvars.iv105, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv.next106.1, i64 0
  %scevgep104.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.2 = or i64 %indvars.iv105, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv.next106.2, i64 0
  %scevgep104.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.3 = or i64 %indvars.iv105, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next106.3, i64 0
  %scevgep104.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.4 = or i64 %indvars.iv105, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv.next106.4, i64 0
  %scevgep104.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.5 = or i64 %indvars.iv105, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv.next106.5, i64 0
  %scevgep104.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.6 = or i64 %indvars.iv105, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv.next106.6, i64 0
  %scevgep104.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep104.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.7 = add nsw i64 %indvars.iv105, 8
  %exitcond34.7 = icmp eq i64 %indvars.iv.next106.7, 2000
  br i1 %exitcond34.7, label %.preheader11.preheader.us.us.preheader.preheader, label %.preheader14._crit_edge.us

.preheader11.preheader.us.us.preheader.preheader: ; preds = %.preheader14._crit_edge.us
  %56 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %57 = bitcast i8* %46 to [2000 x [2000 x double]]*
  br label %.preheader11.preheader.us.us.preheader

.preheader11.preheader.us.us.preheader:           ; preds = %.preheader12._crit_edge.us, %.preheader11.preheader.us.us.preheader.preheader
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %.preheader12._crit_edge.us ], [ 0, %.preheader11.preheader.us.us.preheader.preheader ]
  br label %.preheader11.preheader.us.us

.preheader12._crit_edge.us:                       ; preds = %.preheader11._crit_edge.us.us
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next99, 2000
  br i1 %exitcond33, label %.preheader.preheader.us.preheader, label %.preheader11.preheader.us.us.preheader

.preheader11.preheader.us.us:                     ; preds = %.preheader11._crit_edge.us.us, %.preheader11.preheader.us.us.preheader
  %indvars.iv96 = phi i64 [ 0, %.preheader11.preheader.us.us.preheader ], [ %indvars.iv.next97, %.preheader11._crit_edge.us.us ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv96, i64 %indvars.iv98
  br label %.preheader11.us.us

.preheader11._crit_edge.us.us:                    ; preds = %.preheader11.us.us
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next97, 2000
  br i1 %exitcond32, label %.preheader12._crit_edge.us, label %.preheader11.preheader.us.us

.preheader11.us.us:                               ; preds = %.preheader11.us.us, %.preheader11.preheader.us.us
  %indvars.iv93 = phi i64 [ 0, %.preheader11.preheader.us.us ], [ %indvars.iv.next94.1, %.preheader11.us.us ]
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv98
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv96, i64 %indvars.iv93
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  store double %65, double* %63, align 8
  %indvars.iv.next94 = or i64 %indvars.iv93, 1
  %66 = load double, double* %58, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next94, i64 %indvars.iv98
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next94
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  store double %72, double* %70, align 8
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93, 2
  %exitcond95.1 = icmp eq i64 %indvars.iv.next94, 1999
  br i1 %exitcond95.1, label %.preheader11._crit_edge.us.us, label %.preheader11.us.us

.preheader.preheader.us.preheader:                ; preds = %.preheader12._crit_edge.us
  %73 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %74 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv89 = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next90, %.preheader._crit_edge.us ]
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 0
  %75 = add nuw nsw i64 %indvars.iv89, 1
  %scevgep13 = getelementptr [2000 x double], [2000 x double]* %74, i64 %75, i64 0
  %scevgep15 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 0
  %scevgep17 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %75, i64 0
  %bound0 = icmp ult double* %scevgep11, %scevgep17
  %bound1 = icmp ult double* %scevgep15, %scevgep13
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader.us.preheader, label %vector.body6.preheader

vector.body6.preheader:                           ; preds = %.preheader.preheader.us
  br label %vector.body6

.preheader.us.preheader:                          ; preds = %.preheader.preheader.us
  br label %.preheader.us

vector.body6:                                     ; preds = %vector.body6, %vector.body6.preheader
  %index20 = phi i64 [ 0, %vector.body6.preheader ], [ %index.next21.1, %vector.body6 ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %index20
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load28 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 %index20
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %81, align 8, !alias.scope !11, !noalias !8
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load28, <2 x i64>* %83, align 8, !alias.scope !11, !noalias !8
  %index.next21 = or i64 %index20, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %index.next21
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !8
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load28.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 %index.next21
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %89, align 8, !alias.scope !11, !noalias !8
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load28.1, <2 x i64>* %91, align 8, !alias.scope !11, !noalias !8
  %index.next21.1 = add nsw i64 %index20, 8
  %92 = icmp eq i64 %index.next21.1, 2000
  br i1 %92, label %.preheader._crit_edge.us.loopexit35, label %vector.body6, !llvm.loop !13

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next.4, %.preheader.us ]
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %indvars.iv
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 %indvars.iv
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 %indvars.iv.next
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.1
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.2
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 %indvars.iv.next.2
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.3
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv89, i64 %indvars.iv.next.3
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !14

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us.loopexit35:              ; preds = %vector.body6
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit35, %.preheader._crit_edge.us.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond31, label %118, label %.preheader.preheader.us

; <label>:118:                                    ; preds = %.preheader._crit_edge.us
  %119 = bitcast [2000 x [2000 x double]]* %73 to i8*
  tail call void @free(i8* %119) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader6.preheader.lr.ph:
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %._crit_edge, %.preheader6.preheader.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge ], [ 0, %.preheader6.preheader.lr.ph ]
  %indvars.iv45 = phi i32 [ %indvars.iv.next46, %._crit_edge ], [ -1, %.preheader6.preheader.lr.ph ]
  %1 = add i64 %indvars.iv1, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv1, 0
  br i1 %3, label %.preheader5.preheader.preheader, label %._crit_edge

.preheader5.preheader.preheader:                  ; preds = %.preheader6.preheader
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader6, %.preheader5.preheader.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %.preheader6 ], [ 0, %.preheader5.preheader.preheader ]
  %indvars.iv38 = phi i32 [ %indvars.iv.next39, %.preheader6 ], [ -1, %.preheader5.preheader.preheader ]
  %5 = add i64 %indvars.iv40, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = icmp sgt i64 %indvars.iv40, 0
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv40
  %.pre = load double, double* %8, align 8
  br i1 %7, label %.lr.ph, label %.preheader6

.lr.ph:                                           ; preds = %.preheader5.preheader
  %wide.trip.count = zext i32 %indvars.iv38 to i64
  %9 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %.preheader5.prol.preheader, label %.preheader5.prol.loopexit.unr-lcssa

.preheader5.prol.preheader:                       ; preds = %.lr.ph
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol.preheader
  %10 = load double, double* %4, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv40
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre, %13
  store double %14, double* %8, align 8
  br label %.preheader5.prol.loopexit.unr-lcssa

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph, %.preheader5.prol
  %.lcssa.unr.ph = phi double [ %14, %.preheader5.prol ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.preheader5.prol ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %14, %.preheader5.prol ], [ %.pre, %.lr.ph ]
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %6, 0
  br i1 %15, label %.preheader6.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %.preheader5 ]
  %16 = phi double [ %.unr.ph, %.lr.ph.new ], [ %28, %.preheader5 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv40
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv40
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %.preheader6.loopexit.unr-lcssa, label %.preheader5

.preheader6.loopexit.unr-lcssa:                   ; preds = %.preheader5
  br label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %.preheader5.prol.loopexit, %.preheader6.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader5.prol.loopexit ], [ %28, %.preheader6.loopexit.unr-lcssa ]
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader5.preheader
  %29 = phi double [ %.pre, %.preheader5.preheader ], [ %.lcssa, %.preheader6.loopexit ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv40
  %31 = load double, double* %30, align 8
  %32 = fdiv double %29, %31
  store double %32, double* %8, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %indvars.iv.next39 = add nsw i32 %indvars.iv38, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next41, %indvars.iv1
  br i1 %exitcond3, label %.preheader.preheader.us.preheader, label %.preheader5.preheader

.preheader.preheader.us.preheader:                ; preds = %.preheader6
  %wide.trip.count47 = zext i32 %indvars.iv45 to i64
  %33 = and i64 %1, 1
  %lcmp.mod7 = icmp eq i64 %33, 0
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %35 = icmp eq i64 %2, 0
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.preheader._crit_edge.us ], [ %indvars.iv1, %.preheader.preheader.us.preheader ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv51
  %.pre31 = load double, double* %36, align 8
  br i1 %lcmp.mod7, label %.preheader.us.prol.preheader, label %.preheader.us.prol.loopexit.unr-lcssa

.preheader.us.prol.preheader:                     ; preds = %.preheader.preheader.us
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader
  %37 = load double, double* %34, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv51
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %.pre31, %40
  store double %41, double* %36, align 8
  br label %.preheader.us.prol.loopexit.unr-lcssa

.preheader.us.prol.loopexit.unr-lcssa:            ; preds = %.preheader.preheader.us, %.preheader.us.prol
  %indvars.iv43.unr.ph = phi i64 [ 1, %.preheader.us.prol ], [ 0, %.preheader.preheader.us ]
  %.unr8.ph = phi double [ %41, %.preheader.us.prol ], [ %.pre31, %.preheader.preheader.us ]
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.unr-lcssa
  br i1 %35, label %.preheader._crit_edge.us, label %.preheader.preheader.us.new

.preheader.preheader.us.new:                      ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.preheader.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.preheader.preheader.us.new ], [ %indvars.iv.next44.1, %.preheader.us ]
  %42 = phi double [ %.unr8.ph, %.preheader.preheader.us.new ], [ %54, %.preheader.us ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv43
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv51
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %36, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next44
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next44, i64 %indvars.iv51
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %36, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next44, %wide.trip.count47
  br i1 %exitcond48.1, label %.preheader._crit_edge.us.unr-lcssa, label %.preheader.us

.preheader._crit_edge.us.unr-lcssa:               ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us.prol.loopexit, %.preheader._crit_edge.us.unr-lcssa
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond4, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader6.preheader
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next46 = add nsw i32 %indvars.iv45, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %55, label %.preheader6.preheader

; <label>:55:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next9, %.preheader._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.preheader.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %.preheader._crit_edge.us, label %6

.preheader._crit_edge.us:                         ; preds = %._crit_edge.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond1, label %17, label %.preheader.preheader.us

; <label>:17:                                     ; preds = %.preheader._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
