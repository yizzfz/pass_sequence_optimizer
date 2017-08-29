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
.lr.ph24:
  %1 = alloca [2000 x double]*, align 8
  %2 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %3

; <label>:3:                                      ; preds = %._crit_edge22._crit_edge, %.lr.ph24
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %._crit_edge22._crit_edge ], [ 0, %.lr.ph24 ]
  %4 = phi [2000 x double]* [ %17, %._crit_edge22._crit_edge ], [ %0, %.lr.ph24 ]
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge22._crit_edge ], [ 0, %.lr.ph24 ]
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %._crit_edge22._crit_edge ], [ 1, %.lr.ph24 ]
  %5 = and i64 %indvars.iv125, 4294967295
  %sext = shl i64 %indvars.iv111, 32
  %6 = ashr exact i64 %sext, 32
  %7 = icmp sgt i64 %indvars.iv117, -1
  br i1 %7, label %.lr.ph18.preheader, label %._crit_edge19

.lr.ph18.preheader:                               ; preds = %3
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %.lr.ph18.preheader, %.lr.ph18
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %.lr.ph18 ], [ 0, %.lr.ph18.preheader ]
  %8 = sub nsw i64 0, %indvars.iv105
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv117, i64 %indvars.iv105
  store double %13, double* %14, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond127 = icmp eq i64 %indvars.iv105, %5
  br i1 %exitcond127, label %._crit_edge19.loopexit, label %.lr.ph18

._crit_edge19.loopexit:                           ; preds = %.lr.ph18
  %.pre = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %3, %._crit_edge19.loopexit
  %15 = phi [2000 x double]* [ %.pre, %._crit_edge19.loopexit ], [ %4, %3 ]
  %indvars.iv.next118 = add i64 %indvars.iv117, 1
  %16 = icmp slt i64 %indvars.iv.next118, 2000
  br i1 %16, label %.lr.ph21, label %.lr.ph15.split.us.preheader

.lr.ph21:                                         ; preds = %._crit_edge19
  %17 = load [2000 x double]*, [2000 x double]** %1, align 8
  %18 = sub nsw i64 1999, %6
  %19 = sub nsw i64 0, %6
  %xtraiter = and i64 %19, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph21
  br label %20

; <label>:20:                                     ; preds = %20, %.prol.preheader
  %indvars.iv113.prol = phi i64 [ %6, %.prol.preheader ], [ %indvars.iv.next114.prol, %20 ]
  %21 = phi [2000 x double]* [ %15, %.prol.preheader ], [ %17, %20 ]
  %prol.iter = phi i64 [ %xtraiter, %.prol.preheader ], [ %prol.iter.sub, %20 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %21, i64 %indvars.iv117, i64 %indvars.iv113.prol
  store double 0.000000e+00, double* %22, align 8
  %indvars.iv.next114.prol = add nsw i64 %indvars.iv113.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %20, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %20
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph21, %.prol.loopexit.unr-lcssa
  %indvars.iv113.unr = phi i64 [ %6, %.lr.ph21 ], [ %indvars.iv.next114.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi [2000 x double]* [ %15, %.lr.ph21 ], [ %17, %.prol.loopexit.unr-lcssa ]
  %23 = icmp ult i64 %18, 7
  br i1 %23, label %._crit_edge22._crit_edge, label %.lr.ph21.new

.lr.ph21.new:                                     ; preds = %.prol.loopexit
  br label %24

; <label>:24:                                     ; preds = %24, %.lr.ph21.new
  %indvars.iv113 = phi i64 [ %indvars.iv113.unr, %.lr.ph21.new ], [ %indvars.iv.next114.7, %24 ]
  %25 = phi [2000 x double]* [ %.unr, %.lr.ph21.new ], [ %17, %24 ]
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i64 %indvars.iv117, i64 %indvars.iv113
  store double 0.000000e+00, double* %26, align 8
  %indvars.iv.next114 = add nsw i64 %indvars.iv113, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv.next114
  store double 0.000000e+00, double* %27, align 8
  %indvars.iv.next114.1 = add nsw i64 %indvars.iv113, 2
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv.next114.1
  store double 0.000000e+00, double* %28, align 8
  %indvars.iv.next114.2 = add nsw i64 %indvars.iv113, 3
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv.next114.2
  store double 0.000000e+00, double* %29, align 8
  %indvars.iv.next114.3 = add nsw i64 %indvars.iv113, 4
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv.next114.3
  store double 0.000000e+00, double* %30, align 8
  %indvars.iv.next114.4 = add nsw i64 %indvars.iv113, 5
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv.next114.4
  store double 0.000000e+00, double* %31, align 8
  %indvars.iv.next114.5 = add nsw i64 %indvars.iv113, 6
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv.next114.5
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next114.6 = add nsw i64 %indvars.iv113, 7
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv.next114.6
  store double 0.000000e+00, double* %33, align 8
  %indvars.iv.next114.7 = add nsw i64 %indvars.iv113, 8
  %exitcond116.7 = icmp eq i64 %indvars.iv.next114.6, 1999
  br i1 %exitcond116.7, label %._crit_edge22._crit_edge.unr-lcssa, label %24

._crit_edge22._crit_edge.unr-lcssa:               ; preds = %24
  br label %._crit_edge22._crit_edge

._crit_edge22._crit_edge:                         ; preds = %.prol.loopexit, %._crit_edge22._crit_edge.unr-lcssa
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv117, i64 %indvars.iv117
  store double 1.000000e+00, double* %34, align 8
  %indvars.iv.next126 = add nuw nsw i64 %5, 1
  %indvars.iv.next112 = add nsw i64 %6, 1
  br label %3

.lr.ph15.split.us.preheader:                      ; preds = %._crit_edge19
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv117, i64 %indvars.iv117
  store double 1.000000e+00, double* %35, align 8
  %36 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %37 = bitcast [2000 x [2000 x double]]** %2 to i8**
  store i8* %36, i8** %37, align 8
  %38 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %40 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %41 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %42 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %43 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %44 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %45 = bitcast i8* %36 to [2000 x [2000 x double]]*
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us, %.lr.ph15.split.us.preheader
  %indvars.iv102 = phi i64 [ 0, %.lr.ph15.split.us.preheader ], [ %indvars.iv.next103.7, %._crit_edge13.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv102, i64 0
  %scevgep123 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103 = or i64 %indvars.iv102, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv.next103, i64 0
  %scevgep123.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.1 = or i64 %indvars.iv102, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv.next103.1, i64 0
  %scevgep123.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.2 = or i64 %indvars.iv102, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv.next103.2, i64 0
  %scevgep123.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.3 = or i64 %indvars.iv102, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv.next103.3, i64 0
  %scevgep123.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.4 = or i64 %indvars.iv102, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv.next103.4, i64 0
  %scevgep123.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.5 = or i64 %indvars.iv102, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv.next103.5, i64 0
  %scevgep123.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.6 = or i64 %indvars.iv102, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv.next103.6, i64 0
  %scevgep123.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.7 = add nsw i64 %indvars.iv102, 8
  %exitcond21.7 = icmp eq i64 %indvars.iv.next103.7, 2000
  br i1 %exitcond21.7, label %._crit_edge.us.preheader, label %._crit_edge13.us

._crit_edge.us.preheader:                         ; preds = %._crit_edge13.us
  %46 = load [2000 x double]*, [2000 x double]** %1, align 8
  %47 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %36 to [2000 x [2000 x double]]*
  br label %.lr.ph9.us

._crit_edge10.us-lcssa.us.us:                     ; preds = %._crit_edge8.us.us
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond20, label %.lr.ph4.split.us.preheader, label %.lr.ph9.us

.lr.ph9.us:                                       ; preds = %._crit_edge10.us-lcssa.us.us, %._crit_edge.us.preheader
  %indvars.iv95 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next96, %._crit_edge10.us-lcssa.us.us ]
  br label %.lr.ph7.us.us

.lr.ph7.us.us:                                    ; preds = %._crit_edge8.us.us, %.lr.ph9.us
  %indvars.iv93 = phi i64 [ 0, %.lr.ph9.us ], [ %indvars.iv.next94, %._crit_edge8.us.us ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv93, i64 %indvars.iv95
  br label %50

._crit_edge8.us.us:                               ; preds = %50
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond19, label %._crit_edge10.us-lcssa.us.us, label %.lr.ph7.us.us

; <label>:50:                                     ; preds = %50, %.lr.ph7.us.us
  %indvars.iv89 = phi i64 [ 0, %.lr.ph7.us.us ], [ %indvars.iv.next90.1, %50 ]
  %51 = load double, double* %49, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv89, i64 %indvars.iv95
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv93, i64 %indvars.iv89
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %58 = load double, double* %49, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv.next90, i64 %indvars.iv95
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next90
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %62, align 8
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  %exitcond92.1 = icmp eq i64 %indvars.iv.next90, 1999
  br i1 %exitcond92.1, label %._crit_edge8.us.us, label %50

.lr.ph4.split.us.preheader:                       ; preds = %._crit_edge10.us-lcssa.us.us
  %65 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %66 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph4.split.us.preheader
  %indvars.iv87 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %67, %._crit_edge3.us ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 0
  %67 = add nuw nsw i64 %indvars.iv87, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %66, i64 %67, i64 0
  %scevgep11 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 0
  %scevgep13 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %67, i64 0
  %bound0 = icmp ult double* %scevgep7, %scevgep13
  %bound1 = icmp ult double* %scevgep11, %scevgep9
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph4.split.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph4.split.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 %index
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !3
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load16 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !3
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 %index
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %73, align 8, !alias.scope !6, !noalias !3
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load16, <2 x i64>* %75, align 8, !alias.scope !6, !noalias !3
  %index.next = or i64 %index, 4
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 %index.next
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !3
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load16.1 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !3
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 %index.next
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %81, align 8, !alias.scope !6, !noalias !3
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load16.1, <2 x i64>* %83, align 8, !alias.scope !6, !noalias !3
  %index.next.1 = add nsw i64 %index, 8
  %84 = icmp eq i64 %index.next.1, 2000
  br i1 %84, label %._crit_edge3.us.loopexit22, label %vector.body, !llvm.loop !8

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next.4, %scalar.ph ]
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 %indvars.iv
  %86 = bitcast double* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 %indvars.iv.next
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %101 = bitcast double* %100 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.3
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 %indvars.iv87, i64 %indvars.iv.next.3
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge3.us.loopexit, label %scalar.ph, !llvm.loop !11

._crit_edge3.us.loopexit:                         ; preds = %scalar.ph
  br label %._crit_edge3.us

._crit_edge3.us.loopexit22:                       ; preds = %vector.body
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit22, %._crit_edge3.us.loopexit
  %exitcond18 = icmp eq i64 %67, 2000
  br i1 %exitcond18, label %110, label %.lr.ph4.split.us

; <label>:110:                                    ; preds = %._crit_edge3.us
  %111 = bitcast [2000 x [2000 x double]]* %65 to i8*
  call void @free(i8* %111) #4
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
  %3 = phi [2000 x double]* [ %64, %._crit_edge9 ], [ %0, %.lr.ph11 ]
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge9 ], [ 4294967295, %.lr.ph11 ]
  %4 = and i64 %indvars.iv45, 4294967295
  %5 = icmp sgt i64 %indvars.iv1, 0
  br i1 %5, label %.lr.ph2.preheader, label %._crit_edge9

.lr.ph2.preheader:                                ; preds = %2
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %6 = phi [2000 x double]* [ %33, %._crit_edge ], [ %3, %.lr.ph2.preheader ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge ], [ 4294967295, %.lr.ph2.preheader ]
  %7 = and i64 %indvars.iv38, 4294967295
  %8 = icmp sgt i64 %indvars.iv40, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph2
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv40
  %.pre = load double, double* %9, align 8
  %10 = and i64 %indvars.iv38, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %11

; <label>:11:                                     ; preds = %.prol.preheader
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 0
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 0, i64 %indvars.iv40
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %.pre, %16
  store double %17, double* %9, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %11
  %.unr.ph = phi double [ %17, %11 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %11 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %7, 0
  br i1 %18, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph.new
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %19 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %19 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv, i64 %indvars.iv40
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv.next, i64 %indvars.iv40
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
  %.pre55 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph2, %._crit_edge.loopexit
  %33 = phi [2000 x double]* [ %.pre55, %._crit_edge.loopexit ], [ %6, %.lr.ph2 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv40, i64 %indvars.iv40
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv1, i64 %indvars.iv40
  %37 = load double, double* %36, align 8
  %38 = fdiv double %37, %35
  store double %38, double* %36, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %indvars.iv.next39 = add nuw nsw i64 %7, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next41, %indvars.iv1
  br i1 %exitcond3, label %.lr.ph8.split.us.preheader, label %.lr.ph2

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge
  %39 = load [2000 x double]*, [2000 x double]** %1, align 8
  %40 = and i64 %indvars.iv45, 1
  %lcmp.mod9 = icmp eq i64 %40, 0
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 0
  %42 = icmp eq i64 %4, 0
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge6.us ], [ %indvars.iv1, %.lr.ph8.split.us.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv51
  %.pre56 = load double, double* %43, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.lr.ph8.split.us
  br label %44

; <label>:44:                                     ; preds = %.prol.preheader6
  %45 = load double, double* %41, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 0, i64 %indvars.iv51
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %.pre56, %48
  store double %49, double* %43, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.lr.ph8.split.us, %44
  %.unr10.ph = phi double [ %49, %44 ], [ %.pre56, %.lr.ph8.split.us ]
  %indvars.iv43.unr.ph = phi i64 [ 1, %44 ], [ 0, %.lr.ph8.split.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %42, label %._crit_edge6.us, label %.lr.ph8.split.us.new

.lr.ph8.split.us.new:                             ; preds = %.prol.loopexit7
  br label %50

; <label>:50:                                     ; preds = %50, %.lr.ph8.split.us.new
  %51 = phi double [ %.unr10.ph, %.lr.ph8.split.us.new ], [ %63, %50 ]
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.lr.ph8.split.us.new ], [ %indvars.iv.next44.1, %50 ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv43
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv43, i64 %indvars.iv51
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fsub double %51, %56
  store double %57, double* %43, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv1, i64 %indvars.iv.next44
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv.next44, i64 %indvars.iv51
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fsub double %57, %62
  store double %63, double* %43, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next44, %4
  br i1 %exitcond48.1, label %._crit_edge6.us.unr-lcssa, label %50

._crit_edge6.us.unr-lcssa:                        ; preds = %50
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %.prol.loopexit7, %._crit_edge6.us.unr-lcssa
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond4, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %2
  %64 = phi [2000 x double]* [ %3, %2 ], [ %39, %._crit_edge9.loopexit ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next46 = add nuw nsw i64 %4, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %65, label %2

; <label>:65:                                     ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph4.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge2.us, %.lr.ph4.split.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next13, %._crit_edge2.us ]
  %5 = mul nuw nsw i64 %indvars.iv12, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
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
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2.us, label %6

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond1, label %17, label %.lr.ph4.split.us

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
