; ModuleID = 'B.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_cholesky(i32 2000, [2000 x double]* %4)
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
  tail call void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %6, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*) #0 {
.preheader14.lr.ph:
  %2 = alloca [2000 x double]*, align 8
  %3 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %2, align 8
  br label %.preheader14

.preheader14:                                     ; preds = %.loopexit39..preheader14_crit_edge, %.preheader14.lr.ph
  %4 = phi [2000 x double]* [ %10, %.loopexit39..preheader14_crit_edge ], [ %1, %.preheader14.lr.ph ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %.loopexit39..preheader14_crit_edge ], [ 0, %.preheader14.lr.ph ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %.loopexit39..preheader14_crit_edge ], [ 1, %.preheader14.lr.ph ]
  %indvars.iv119 = phi i32 [ %indvars.iv.next120, %.loopexit39..preheader14_crit_edge ], [ 0, %.preheader14.lr.ph ]
  %sext = shl i64 %indvars.iv123, 32
  %5 = ashr exact i64 %sext, 32
  %6 = icmp slt i64 %indvars.iv129, 0
  br i1 %6, label %.preheader13, label %.lr.ph27.preheader

.lr.ph27.preheader:                               ; preds = %.preheader14
  %wide.trip.count121 = zext i32 %indvars.iv119 to i64
  br label %.lr.ph27

.preheader13:                                     ; preds = %..preheader13_crit_edge, %.preheader14
  %7 = phi [2000 x double]* [ %.pre, %..preheader13_crit_edge ], [ %4, %.preheader14 ]
  %indvars.iv.next130 = add i64 %indvars.iv129, 1
  %8 = icmp slt i64 %indvars.iv.next130, 2000
  br i1 %8, label %.lr.ph30, label %.loopexit39.thread

.loopexit39.thread:                               ; preds = %.preheader13
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %9, align 8
  br label %._crit_edge

.lr.ph30:                                         ; preds = %.preheader13
  %10 = load [2000 x double]*, [2000 x double]** %2, align 8
  %11 = sub nsw i64 1999, %5
  %12 = sub nsw i64 0, %5
  %xtraiter = and i64 %12, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph30
  br label %13

; <label>:13:                                     ; preds = %13, %.prol.preheader
  %indvars.iv125.prol = phi i64 [ %indvars.iv.next126.prol, %13 ], [ %5, %.prol.preheader ]
  %14 = phi [2000 x double]* [ %10, %13 ], [ %7, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %13 ], [ %xtraiter, %.prol.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv129, i64 %indvars.iv125.prol
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next126.prol = add nsw i64 %indvars.iv125.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %13, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %13
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa, %.lr.ph30
  %indvars.iv125.unr = phi i64 [ %5, %.lr.ph30 ], [ %indvars.iv.next126.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi [2000 x double]* [ %7, %.lr.ph30 ], [ %10, %.prol.loopexit.unr-lcssa ]
  %16 = icmp ult i64 %11, 7
  br i1 %16, label %.loopexit39, label %.lr.ph30.new

.lr.ph30.new:                                     ; preds = %.prol.loopexit
  br label %24

.lr.ph27:                                         ; preds = %.lr.ph27, %.lr.ph27.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %.lr.ph27 ], [ 0, %.lr.ph27.preheader ]
  %17 = sub nsw i64 0, %indvars.iv117
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 2000
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 2.000000e+03
  %22 = fadd double %21, 1.000000e+00
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv129, i64 %indvars.iv117
  store double %22, double* %23, align 8
  %exitcond122 = icmp eq i64 %indvars.iv117, %wide.trip.count121
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  br i1 %exitcond122, label %..preheader13_crit_edge, label %.lr.ph27

..preheader13_crit_edge:                          ; preds = %.lr.ph27
  %.pre = load [2000 x double]*, [2000 x double]** %2, align 8
  br label %.preheader13

; <label>:24:                                     ; preds = %24, %.lr.ph30.new
  %indvars.iv125 = phi i64 [ %indvars.iv125.unr, %.lr.ph30.new ], [ %indvars.iv.next126.7, %24 ]
  %25 = phi [2000 x double]* [ %.unr, %.lr.ph30.new ], [ %10, %24 ]
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i64 %indvars.iv129, i64 %indvars.iv125
  store double 0.000000e+00, double* %26, align 8
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv.next126
  store double 0.000000e+00, double* %27, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv.next126.1
  store double 0.000000e+00, double* %28, align 8
  %indvars.iv.next126.2 = add nsw i64 %indvars.iv125, 3
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv.next126.2
  store double 0.000000e+00, double* %29, align 8
  %indvars.iv.next126.3 = add nsw i64 %indvars.iv125, 4
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv.next126.3
  store double 0.000000e+00, double* %30, align 8
  %indvars.iv.next126.4 = add nsw i64 %indvars.iv125, 5
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv.next126.4
  store double 0.000000e+00, double* %31, align 8
  %indvars.iv.next126.5 = add nsw i64 %indvars.iv125, 6
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv.next126.5
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next126.6 = add nsw i64 %indvars.iv125, 7
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv.next126.6
  store double 0.000000e+00, double* %33, align 8
  %exitcond128.7 = icmp eq i64 %indvars.iv.next126.6, 1999
  %indvars.iv.next126.7 = add nsw i64 %indvars.iv125, 8
  br i1 %exitcond128.7, label %.loopexit39.unr-lcssa, label %24

.loopexit39.unr-lcssa:                            ; preds = %24
  br label %.loopexit39

.loopexit39:                                      ; preds = %.loopexit39.unr-lcssa, %.prol.loopexit
  %34 = icmp slt i64 %indvars.iv.next130, 2000
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %35, align 8
  br i1 %34, label %.loopexit39..preheader14_crit_edge, label %._crit_edge.loopexit

.loopexit39..preheader14_crit_edge:               ; preds = %.loopexit39
  %indvars.iv.next120 = add i32 %indvars.iv119, 1
  %indvars.iv.next124 = add nsw i64 %5, 1
  br label %.preheader14

._crit_edge.loopexit:                             ; preds = %.loopexit39
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.loopexit39.thread
  %36 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %37 = bitcast [2000 x [2000 x double]]** %3 to i8**
  store i8* %36, i8** %37, align 8
  %38 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %40 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %41 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %42 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %43 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %44 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %45 = bitcast i8* %36 to [2000 x [2000 x double]]*
  br label %.loopexit38.us

.loopexit38.us:                                   ; preds = %.loopexit38.us, %._crit_edge
  %indvars.iv114 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next115.7, %.loopexit38.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv114, i64 0
  %scevgep134 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv.next115, i64 0
  %scevgep134.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.1 = or i64 %indvars.iv114, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv.next115.1, i64 0
  %scevgep134.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.2 = or i64 %indvars.iv114, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv.next115.2, i64 0
  %scevgep134.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.3 = or i64 %indvars.iv114, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv.next115.3, i64 0
  %scevgep134.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.4 = or i64 %indvars.iv114, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv.next115.4, i64 0
  %scevgep134.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.5 = or i64 %indvars.iv114, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv.next115.5, i64 0
  %scevgep134.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.6 = or i64 %indvars.iv114, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv.next115.6, i64 0
  %scevgep134.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.7 = add nsw i64 %indvars.iv114, 8
  %exitcond143.7 = icmp eq i64 %indvars.iv.next115.7, 2000
  br i1 %exitcond143.7, label %.preheader10.lr.ph..preheader10.us_crit_edge, label %.loopexit38.us

.preheader10.lr.ph..preheader10.us_crit_edge:     ; preds = %.loopexit38.us
  %46 = load [2000 x double]*, [2000 x double]** %2, align 8
  %47 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %3, align 8
  br label %.preheader9.lr.ph.us

.preheader9.lr.ph.us:                             ; preds = %.loopexit37.us-lcssa.us.us, %.preheader10.lr.ph..preheader10.us_crit_edge
  %indvars.iv107 = phi i64 [ 0, %.preheader10.lr.ph..preheader10.us_crit_edge ], [ %indvars.iv.next108, %.loopexit37.us-lcssa.us.us ]
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %46, i64 0, i64 %indvars.iv107
  %48 = add nuw nsw i64 %indvars.iv107, 1
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %46, i64 1999, i64 %48
  br label %.preheader9.us.us

.loopexit37.us-lcssa.us.us:                       ; preds = %.loopexit36.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond142, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader9.lr.ph.us

.preheader9.us.us:                                ; preds = %.loopexit36.us.us, %.preheader9.lr.ph.us
  %indvars.iv105 = phi i64 [ 0, %.preheader9.lr.ph.us ], [ %indvars.iv.next106, %.loopexit36.us.us ]
  %scevgep149 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv105, i64 0
  %49 = add nuw nsw i64 %indvars.iv105, 1
  %scevgep151 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %49, i64 0
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv105, i64 %indvars.iv107
  %bound0 = icmp ult double* %scevgep149, %scevgep155
  %bound1 = icmp ult double* %scevgep153, %scevgep151
  %found.conflict = and i1 %bound0, %bound1
  %bound0158 = icmp ult double* %scevgep149, %50
  %bound1159 = icmp ult double* %50, %scevgep151
  %found.conflict160 = and i1 %bound0158, %bound1159
  %conflict.rdx = or i1 %found.conflict, %found.conflict160
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9.us.us
  %51 = load double, double* %50, align 8, !alias.scope !3
  %52 = insertelement <2 x double> undef, double %51, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = insertelement <2 x double> undef, double %51, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader9.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = or i64 %index, 1
  %57 = or i64 %index, 2
  %58 = or i64 %index, 3
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %index, i64 %indvars.iv107
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %56, i64 %indvars.iv107
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %57, i64 %indvars.iv107
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %58, i64 %indvars.iv107
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = load double, double* %62, align 8, !alias.scope !6
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = fmul <2 x double> %53, %68
  %72 = fmul <2 x double> %55, %70
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv105, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !8, !noalias !10
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %77 = fadd <2 x double> %71, %wide.load
  %78 = fadd <2 x double> %72, %wide.load162
  %79 = bitcast double* %73 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8, !alias.scope !8, !noalias !10
  %80 = bitcast double* %75 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %81 = icmp eq i64 %index.next, 2000
  br i1 %81, label %.loopexit36.us.us.loopexit193, label %vector.body, !llvm.loop !11

.loopexit36.us.us.loopexit:                       ; preds = %scalar.ph
  br label %.loopexit36.us.us

.loopexit36.us.us.loopexit193:                    ; preds = %vector.body
  br label %.loopexit36.us.us

.loopexit36.us.us:                                ; preds = %.loopexit36.us.us.loopexit193, %.loopexit36.us.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond141, label %.loopexit37.us-lcssa.us.us, label %.preheader9.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv101 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next102.1, %scalar.ph ]
  %82 = load double, double* %50, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv101, i64 %indvars.iv107
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv105, i64 %indvars.iv101
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  store double %88, double* %86, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %89 = load double, double* %50, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv.next102, i64 %indvars.iv107
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next102
  %94 = load double, double* %93, align 8
  %95 = fadd double %92, %94
  store double %95, double* %93, align 8
  %exitcond104.1 = icmp eq i64 %indvars.iv.next102, 1999
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  br i1 %exitcond104.1, label %.loopexit36.us.us.loopexit, label %scalar.ph, !llvm.loop !14

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.loopexit37.us-lcssa.us.us
  %96 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %3, align 8
  %97 = load [2000 x double]*, [2000 x double]** %2, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv99 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next100, %.loopexit.us ]
  %scevgep168 = getelementptr [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 0
  %98 = add nuw nsw i64 %indvars.iv99, 1
  %scevgep170 = getelementptr [2000 x double], [2000 x double]* %97, i64 %98, i64 0
  %scevgep172 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 0
  %scevgep174 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %98, i64 0
  %bound0176 = icmp ult double* %scevgep168, %scevgep174
  %bound1177 = icmp ult double* %scevgep172, %scevgep170
  %memcheck.conflict179 = and i1 %bound0176, %bound1177
  br i1 %memcheck.conflict179, label %scalar.ph165.preheader, label %vector.body163.preheader

vector.body163.preheader:                         ; preds = %.preheader.us
  br label %vector.body163

scalar.ph165.preheader:                           ; preds = %.preheader.us
  br label %scalar.ph165

vector.body163:                                   ; preds = %vector.body163, %vector.body163.preheader
  %index182 = phi i64 [ 0, %vector.body163.preheader ], [ %index.next183.1, %vector.body163 ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 %index182
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !15
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !15
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %index182
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %104, align 8, !alias.scope !18, !noalias !15
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %106, align 8, !alias.scope !18, !noalias !15
  %index.next183 = or i64 %index182, 4
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 %index.next183
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load190.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !15
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !15
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %index.next183
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load190.1, <2 x i64>* %112, align 8, !alias.scope !18, !noalias !15
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load191.1, <2 x i64>* %114, align 8, !alias.scope !18, !noalias !15
  %index.next183.1 = add nsw i64 %index182, 8
  %115 = icmp eq i64 %index.next183.1, 2000
  br i1 %115, label %.loopexit.us.loopexit192, label %vector.body163, !llvm.loop !20

scalar.ph165:                                     ; preds = %scalar.ph165, %scalar.ph165.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph165.preheader ], [ %indvars.iv.next.4, %scalar.ph165 ]
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 %indvars.iv
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %indvars.iv
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.1
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.2
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.3
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %.loopexit.us.loopexit, label %scalar.ph165, !llvm.loop !21

.loopexit.us.loopexit:                            ; preds = %scalar.ph165
  br label %.loopexit.us

.loopexit.us.loopexit192:                         ; preds = %vector.body163
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit192, %.loopexit.us.loopexit
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond140, label %.loopexit35.loopexit, label %.preheader.us

.loopexit35.loopexit:                             ; preds = %.loopexit.us
  %141 = bitcast [2000 x [2000 x double]]* %96 to i8*
  tail call void @free(i8* %141) #3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky(i32, [2000 x double]*) #0 {
.preheader3.lr.ph:
  br label %.preheader3

.preheader3:                                      ; preds = %.loopexit13, %.preheader3.lr.ph
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %.loopexit13 ], [ 0, %.preheader3.lr.ph ]
  %indvars.iv41 = phi i32 [ %indvars.iv.next42, %.loopexit13 ], [ -1, %.preheader3.lr.ph ]
  %2 = add i64 %indvars.iv58, 4294967295
  %3 = and i64 %2, 4294967295
  %4 = icmp sgt i64 %indvars.iv58, 0
  br i1 %4, label %.preheader.preheader, label %.preheader2..loopexit13_crit_edge

.preheader.preheader:                             ; preds = %.preheader3
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 0
  br label %.preheader

.preheader2:                                      ; preds = %.loopexit
  %6 = icmp sgt i64 %indvars.iv58, 0
  br i1 %6, label %.lr.ph8, label %.preheader2..loopexit13_crit_edge

.preheader2..loopexit13_crit_edge:                ; preds = %.preheader2, %.preheader3
  %.phi.trans.insert51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv58
  %.pre52 = load double, double* %.phi.trans.insert51, align 8
  br label %.loopexit13

.lr.ph8:                                          ; preds = %.preheader2
  %.phi.trans.insert49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv58
  %.pre50 = load double, double* %.phi.trans.insert49, align 8
  %wide.trip.count43 = zext i32 %indvars.iv41 to i64
  %xtraiter66 = and i64 %indvars.iv58, 3
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  br i1 %lcmp.mod67, label %.prol.loopexit65, label %.prol.preheader64

.prol.preheader64:                                ; preds = %.lr.ph8
  br label %7

; <label>:7:                                      ; preds = %7, %.prol.preheader64
  %8 = phi double [ %12, %7 ], [ %.pre50, %.prol.preheader64 ]
  %indvars.iv39.prol = phi i64 [ %indvars.iv.next40.prol, %7 ], [ 0, %.prol.preheader64 ]
  %prol.iter = phi i64 [ %prol.iter.sub, %7 ], [ %xtraiter66, %.prol.preheader64 ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv39.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %.phi.trans.insert49, align 8
  %indvars.iv.next40.prol = add nuw nsw i64 %indvars.iv39.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit65.unr-lcssa, label %7, !llvm.loop !22

.prol.loopexit65.unr-lcssa:                       ; preds = %7
  br label %.prol.loopexit65

.prol.loopexit65:                                 ; preds = %.prol.loopexit65.unr-lcssa, %.lr.ph8
  %.lcssa63.unr = phi double [ undef, %.lr.ph8 ], [ %12, %.prol.loopexit65.unr-lcssa ]
  %.unr68 = phi double [ %.pre50, %.lr.ph8 ], [ %12, %.prol.loopexit65.unr-lcssa ]
  %indvars.iv39.unr = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next40.prol, %.prol.loopexit65.unr-lcssa ]
  %13 = icmp ult i64 %3, 3
  br i1 %13, label %.loopexit13.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %.prol.loopexit65
  br label %43

.preheader:                                       ; preds = %.loopexit, %.preheader.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.loopexit ], [ 0, %.preheader.preheader ]
  %indvars.iv35 = phi i32 [ %indvars.iv.next36, %.loopexit ], [ -1, %.preheader.preheader ]
  %14 = add i64 %indvars.iv37, 4294967295
  %15 = and i64 %14, 4294967295
  %16 = icmp sgt i64 %indvars.iv37, 0
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv37
  %.pre = load double, double* %.phi.trans.insert, align 8
  br i1 %16, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  %wide.trip.count = zext i32 %indvars.iv35 to i64
  %17 = and i64 %14, 1
  %lcmp.mod = icmp eq i64 %17, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %18

; <label>:18:                                     ; preds = %.prol.preheader
  %19 = load double, double* %5, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv37, i64 0
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %.pre, %22
  store double %23, double* %.phi.trans.insert, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %18, %.lr.ph
  %.lcssa.unr.ph = phi double [ %23, %18 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %23, %18 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %18 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %24 = icmp eq i64 %15, 0
  br i1 %24, label %.loopexit.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %25

; <label>:25:                                     ; preds = %25, %.lr.ph.new
  %26 = phi double [ %.unr.ph, %.lr.ph.new ], [ %38, %25 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %25 ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  store double %38, double* %.phi.trans.insert, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.loopexit.unr-lcssa, label %25

.loopexit.loopexit.unr-lcssa:                     ; preds = %25
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.unr-lcssa, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %38, %.loopexit.loopexit.unr-lcssa ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %39 = phi double [ %.pre, %.preheader ], [ %.lcssa, %.loopexit.loopexit ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv37
  %41 = load double, double* %40, align 8
  %42 = fdiv double %39, %41
  store double %42, double* %.phi.trans.insert, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %indvars.iv.next36 = add nsw i32 %indvars.iv35, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next38, %indvars.iv58
  br i1 %exitcond60, label %.preheader2, label %.preheader

; <label>:43:                                     ; preds = %43, %.lr.ph8.new
  %44 = phi double [ %.unr68, %.lr.ph8.new ], [ %60, %43 ]
  %indvars.iv39 = phi i64 [ %indvars.iv39.unr, %.lr.ph8.new ], [ %indvars.iv.next40.3, %43 ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv39
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fsub double %44, %47
  store double %48, double* %.phi.trans.insert49, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next40
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %50
  %52 = fsub double %48, %51
  store double %52, double* %.phi.trans.insert49, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next40.1
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %54
  %56 = fsub double %52, %55
  store double %56, double* %.phi.trans.insert49, align 8
  %indvars.iv.next40.2 = add nsw i64 %indvars.iv39, 3
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next40.2
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %58
  %60 = fsub double %56, %59
  store double %60, double* %.phi.trans.insert49, align 8
  %exitcond44.3 = icmp eq i64 %indvars.iv.next40.2, %wide.trip.count43
  %indvars.iv.next40.3 = add nsw i64 %indvars.iv39, 4
  br i1 %exitcond44.3, label %.loopexit13.loopexit.unr-lcssa, label %43

.loopexit13.loopexit.unr-lcssa:                   ; preds = %43
  br label %.loopexit13.loopexit

.loopexit13.loopexit:                             ; preds = %.loopexit13.loopexit.unr-lcssa, %.prol.loopexit65
  %.lcssa63 = phi double [ %.lcssa63.unr, %.prol.loopexit65 ], [ %60, %.loopexit13.loopexit.unr-lcssa ]
  br label %.loopexit13

.loopexit13:                                      ; preds = %.loopexit13.loopexit, %.preheader2..loopexit13_crit_edge
  %.pre-phi53 = phi double* [ %.phi.trans.insert51, %.preheader2..loopexit13_crit_edge ], [ %.phi.trans.insert49, %.loopexit13.loopexit ]
  %61 = phi double [ %.pre52, %.preheader2..loopexit13_crit_edge ], [ %.lcssa63, %.loopexit13.loopexit ]
  %62 = tail call double @sqrt(double %61) #3
  store double %62, double* %.pre-phi53, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %indvars.iv.next42 = add nsw i32 %indvars.iv41, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond61, label %._crit_edge, label %.preheader3

._crit_edge:                                      ; preds = %.loopexit13
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]*) #0 {
.preheader.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next16, %.loopexit ]
  %indvars.iv13 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next14, %.loopexit ]
  %6 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge11, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge11 ], [ 0, %.lr.ph.preheader ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %11, %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, %indvars.iv15
  br i1 %exitcond17, label %.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %._crit_edge11
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  br i1 %exitcond, label %._crit_edge, label %.lr.ph.preheader

._crit_edge:                                      ; preds = %.loopexit
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

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
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !2}
