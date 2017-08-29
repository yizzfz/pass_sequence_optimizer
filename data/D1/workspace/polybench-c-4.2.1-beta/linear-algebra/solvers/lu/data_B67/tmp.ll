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
.preheader15.lr.ph:
  %1 = alloca [2000 x double]*, align 8
  %2 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %.lr.ph54

.lr.ph54:                                         ; preds = %._crit_edge61, %.preheader15.lr.ph
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge61 ], [ 0, %.preheader15.lr.ph ]
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge61 ], [ 1, %.preheader15.lr.ph ]
  %sext = shl i64 %indvars.iv121, 32
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph54
  %indvars.iv116 = phi i64 [ 0, %.lr.ph54 ], [ %indvars.iv.next117, %3 ]
  %4 = sub nsw i64 0, %indvars.iv116
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 2000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fadd double %8, 1.000000e+00
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %indvars.iv116
  store double %9, double* %10, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond120 = icmp eq i64 %indvars.iv116, %indvars.iv126
  br i1 %exitcond120, label %._crit_edge55, label %3

._crit_edge55:                                    ; preds = %3
  %11 = ashr exact i64 %sext, 32
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %12 = icmp slt i64 %indvars.iv.next127, 2000
  br i1 %12, label %.lr.ph60.preheader, label %.preheader14.us.preheader

.lr.ph60.preheader:                               ; preds = %._crit_edge55
  %13 = sub nsw i64 2000, %11
  %min.iters.check = icmp ult i64 %13, 4
  br i1 %min.iters.check, label %.lr.ph60.preheader30, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph60.preheader
  %n.vec = and i64 %13, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %11, %n.vec
  br i1 %cmp.zero, label %.lr.ph60.preheader30, label %vector.body.preheader

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
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %17
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
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next = add i64 %index, 4
  %28 = add i64 %11, %index.next
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %index.next.1 = add i64 %index, 8
  %33 = add i64 %11, %index.next.1
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %index.next.2 = add i64 %index, 12
  %38 = add i64 %11, %index.next.2
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %38
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
  br i1 %cmp.n, label %._crit_edge61, label %.lr.ph60.preheader30

.lr.ph60.preheader30:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph60.preheader
  %indvars.iv123.ph = phi i64 [ %11, %min.iters.checked ], [ %11, %.lr.ph60.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph60

.lr.ph60:                                         ; preds = %.lr.ph60.preheader30, %.lr.ph60
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %.lr.ph60 ], [ %indvars.iv123.ph, %.lr.ph60.preheader30 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %indvars.iv123
  store double 0.000000e+00, double* %44, align 8
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  %exitcond125 = icmp eq i64 %indvars.iv123, 1999
  br i1 %exitcond125, label %._crit_edge61.loopexit, label %.lr.ph60, !llvm.loop !6

._crit_edge61.loopexit:                           ; preds = %.lr.ph60
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %middle.block
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %indvars.iv126
  store double 1.000000e+00, double* %45, align 8
  %indvars.iv.next122 = add nsw i64 %11, 1
  br label %.lr.ph54

.preheader14.us.preheader:                        ; preds = %._crit_edge55
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %indvars.iv126
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
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %._crit_edge47.us, %.preheader14.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader14.us.preheader ], [ %indvars.iv.next114.7, %._crit_edge47.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv113, i64 0
  %scevgep112 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114 = or i64 %indvars.iv113, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv.next114, i64 0
  %scevgep112.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.1 = or i64 %indvars.iv113, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv.next114.1, i64 0
  %scevgep112.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.2 = or i64 %indvars.iv113, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next114.2, i64 0
  %scevgep112.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.3 = or i64 %indvars.iv113, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv.next114.3, i64 0
  %scevgep112.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.4 = or i64 %indvars.iv113, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv.next114.4, i64 0
  %scevgep112.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.5 = or i64 %indvars.iv113, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv.next114.5, i64 0
  %scevgep112.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.6 = or i64 %indvars.iv113, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv.next114.6, i64 0
  %scevgep112.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.7 = add nsw i64 %indvars.iv113, 8
  %exitcond34.7 = icmp eq i64 %indvars.iv.next114.7, 2000
  br i1 %exitcond34.7, label %.preheader11.us.us.preheader.preheader, label %._crit_edge47.us

.preheader11.us.us.preheader.preheader:           ; preds = %._crit_edge47.us
  %57 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %58 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %.preheader11.us.us.preheader

.preheader11.us.us.preheader:                     ; preds = %._crit_edge27.us, %.preheader11.us.us.preheader.preheader
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge27.us ], [ 0, %.preheader11.us.us.preheader.preheader ]
  br label %.preheader11.us.us

._crit_edge27.us:                                 ; preds = %._crit_edge25.us.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next107, 2000
  br i1 %exitcond33, label %.preheader.us.preheader, label %.preheader11.us.us.preheader

.preheader11.us.us:                               ; preds = %._crit_edge25.us.us, %.preheader11.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader11.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge25.us.us ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv106
  br label %60

._crit_edge25.us.us:                              ; preds = %60
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond32, label %._crit_edge27.us, label %.preheader11.us.us

; <label>:60:                                     ; preds = %60, %.preheader11.us.us
  %indvars.iv101 = phi i64 [ 0, %.preheader11.us.us ], [ %indvars.iv.next102.1, %60 ]
  %61 = load double, double* %59, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv106
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv104, i64 %indvars.iv101
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  store double %67, double* %65, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %68 = load double, double* %59, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next102, i64 %indvars.iv106
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next102
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  store double %74, double* %72, align 8
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next102, 1999
  br i1 %exitcond103.1, label %._crit_edge25.us.us, label %60

.preheader.us.preheader:                          ; preds = %._crit_edge27.us
  %75 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %76 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv97 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next98, %._crit_edge.us ]
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 0
  %77 = add nuw nsw i64 %indvars.iv97, 1
  %scevgep13 = getelementptr [2000 x double], [2000 x double]* %76, i64 %77, i64 0
  %scevgep15 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 0
  %scevgep17 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %77, i64 0
  %bound0 = icmp ult double* %scevgep11, %scevgep17
  %bound1 = icmp ult double* %scevgep15, %scevgep13
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph8.preheader, label %vector.body6.preheader

vector.body6.preheader:                           ; preds = %.preheader.us
  br label %vector.body6

scalar.ph8.preheader:                             ; preds = %.preheader.us
  br label %scalar.ph8

vector.body6:                                     ; preds = %vector.body6, %vector.body6.preheader
  %index20 = phi i64 [ 0, %vector.body6.preheader ], [ %index.next21.1, %vector.body6 ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 %index20
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !8
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load28 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 %index20
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %83, align 8, !alias.scope !11, !noalias !8
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load28, <2 x i64>* %85, align 8, !alias.scope !11, !noalias !8
  %index.next21 = or i64 %index20, 4
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 %index.next21
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !8
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load28.1 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 %index.next21
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
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 %indvars.iv
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 %indvars.iv
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next
  %101 = bitcast double* %100 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 %indvars.iv.next
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.3
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv97, i64 %indvars.iv.next.3
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
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond31, label %120, label %.preheader.us

; <label>:120:                                    ; preds = %._crit_edge.us
  %121 = bitcast [2000 x [2000 x double]]* %75 to i8*
  tail call void @free(i8* %121) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16, %.preheader6.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge16 ], [ 0, %.preheader6.lr.ph ]
  %indvars.iv50 = phi i32 [ %indvars.iv.next51, %._crit_edge16 ], [ -1, %.preheader6.lr.ph ]
  %1 = add i64 %indvars.iv1, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv1, 0
  br i1 %3, label %.preheader5.preheader, label %._crit_edge16

.preheader5.preheader:                            ; preds = %.preheader6
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge, %.preheader5.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv43 = phi i32 [ %indvars.iv.next44, %._crit_edge ], [ -1, %.preheader5.preheader ]
  %5 = add i64 %indvars.iv45, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = icmp sgt i64 %indvars.iv45, 0
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv45
  %.pre = load double, double* %8, align 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv43 to i64
  %9 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %10

; <label>:10:                                     ; preds = %.prol.preheader
  %11 = load double, double* %4, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv45
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre, %14
  store double %15, double* %8, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %10
  %.lcssa.unr.ph = phi double [ %15, %10 ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %10 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %15, %10 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %16 = icmp eq i64 %6, 0
  br i1 %16, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %17 ]
  %18 = phi double [ %.unr.ph, %.lr.ph.new ], [ %30, %17 ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv45
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv45
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %17

._crit_edge.loopexit.unr-lcssa:                   ; preds = %17
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %30, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader5
  %31 = phi double [ %.pre, %.preheader5 ], [ %.lcssa, %._crit_edge.loopexit ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv45
  %33 = load double, double* %32, align 8
  %34 = fdiv double %31, %33
  store double %34, double* %8, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %indvars.iv.next44 = add nsw i32 %indvars.iv43, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next46, %indvars.iv1
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader5

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count52 = zext i32 %indvars.iv50 to i64
  %35 = and i64 %1, 1
  %lcmp.mod9 = icmp eq i64 %35, 0
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %37 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us, %.preheader.us.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge13.us ], [ %indvars.iv1, %.preheader.us.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv56
  %.pre36 = load double, double* %38, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.preheader.us
  br label %39

; <label>:39:                                     ; preds = %.prol.preheader6
  %40 = load double, double* %36, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv56
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %.pre36, %43
  store double %44, double* %38, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.preheader.us, %39
  %indvars.iv48.unr.ph = phi i64 [ 1, %39 ], [ 0, %.preheader.us ]
  %.unr10.ph = phi double [ %44, %39 ], [ %.pre36, %.preheader.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %37, label %._crit_edge13.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit7
  br label %45

; <label>:45:                                     ; preds = %45, %.preheader.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %.preheader.us.new ], [ %indvars.iv.next49.1, %45 ]
  %46 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %58, %45 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv48
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv56
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %38, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next49
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next49, i64 %indvars.iv56
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  store double %58, double* %38, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next49, %wide.trip.count52
  br i1 %exitcond53.1, label %._crit_edge13.us.unr-lcssa, label %45

._crit_edge13.us.unr-lcssa:                       ; preds = %45
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %.prol.loopexit7, %._crit_edge13.us.unr-lcssa
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next57, 2000
  br i1 %exitcond4, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader6
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next51 = add nsw i32 %indvars.iv50, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %59, label %.preheader6

; <label>:59:                                     ; preds = %._crit_edge16
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
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
