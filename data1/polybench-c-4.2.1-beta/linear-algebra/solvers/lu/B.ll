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
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge42._crit_edge, %1
  %2 = phi i64 [ 1, %1 ], [ %43, %._crit_edge42._crit_edge ]
  %indvars.iv3417 = phi i64 [ 1, %1 ], [ %indvars.iv.next35, %._crit_edge42._crit_edge ]
  %indvars.iv3616 = phi i64 [ 0, %1 ], [ %indvars.iv.next37, %._crit_edge42._crit_edge ]
  br label %._crit_edge

._crit_edge.._crit_edge42_crit_edge:              ; preds = %._crit_edge
  %exitcond4114 = icmp eq i64 %2, 2000
  br i1 %exitcond4114, label %._crit_edge42._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge.._crit_edge42_crit_edge
  %3 = sub nsw i64 2000, %2
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %._crit_edge42.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %2, %n.vec
  br i1 %cmp.zero, label %._crit_edge42.preheader, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  %4 = add nsw i64 %n.vec, -4
  %5 = lshr exact i64 %4, 2
  %6 = add nuw nsw i64 %5, 1
  %xtraiter = and i64 %6, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %min.iters.checked.vector.body_crit_edge
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %7 = add i64 %2, %index.prol
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %min.iters.checked.vector.body_crit_edge, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %min.iters.checked.vector.body_crit_edge ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %4, 12
  br i1 %12, label %middle.block, label %min.iters.checked.vector.body_crit_edge.new

min.iters.checked.vector.body_crit_edge.new:      ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %min.iters.checked.vector.body_crit_edge.new
  %index = phi i64 [ %index.unr, %min.iters.checked.vector.body_crit_edge.new ], [ %index.next.3, %vector.body ]
  %13 = add i64 %2, %index
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %index.next = add i64 %index, 4
  %18 = add i64 %2, %index.next
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %index.next.1 = add i64 %index, 8
  %23 = add i64 %2, %index.next.1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next.2 = add i64 %index, 12
  %28 = add i64 %2, %index.next.2
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %index.next.3 = add i64 %index, 16
  %33 = icmp eq i64 %index.next.3, %n.vec
  br i1 %33, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %._crit_edge42._crit_edge, label %._crit_edge42.preheader

._crit_edge42.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph
  %indvars.iv2815.ph = phi i64 [ %2, %.lr.ph ], [ %2, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %._crit_edge42

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv2013 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next21, %._crit_edge ]
  %34 = sub nsw i64 0, %indvars.iv2013
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 2.000000e+03
  %39 = fadd double %38, 1.000000e+00
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %indvars.iv2013
  store double %39, double* %40, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2013, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, %indvars.iv3417
  br i1 %exitcond25, label %._crit_edge.._crit_edge42_crit_edge, label %._crit_edge

._crit_edge42:                                    ; preds = %._crit_edge42, %._crit_edge42.preheader
  %indvars.iv2815 = phi i64 [ %indvars.iv2815.ph, %._crit_edge42.preheader ], [ %indvars.iv.next29, %._crit_edge42 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %indvars.iv2815
  store double 0.000000e+00, double* %41, align 8
  %indvars.iv.next29 = add nsw i64 %indvars.iv2815, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond41, label %._crit_edge42._crit_edge.loopexit, label %._crit_edge42, !llvm.loop !6

._crit_edge42._crit_edge.loopexit:                ; preds = %._crit_edge42
  br label %._crit_edge42._crit_edge

._crit_edge42._crit_edge:                         ; preds = %._crit_edge42._crit_edge.loopexit, %middle.block, %._crit_edge.._crit_edge42_crit_edge
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv3616, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %indvars.iv3616
  store double 1.000000e+00, double* %42, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3417, 1
  %indvars.iv.next27 = shl nsw i64 %2, 32
  %sext = add i64 %indvars.iv.next27, 4294967296
  %43 = ashr exact i64 %sext, 32
  %exitcond4 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond4, label %44, label %.._crit_edge_crit_edge

; <label>:44:                                     ; preds = %._crit_edge42._crit_edge
  %45 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %46 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %45 to [2000 x [2000 x double]]*
  br label %.._crit_edge43_crit_edge

.._crit_edge43_crit_edge:                         ; preds = %middle.block20, %44
  %indvars.iv1812 = phi i64 [ 0, %44 ], [ %indvars.iv.next19, %middle.block20 ]
  br label %vector.body19

vector.body19:                                    ; preds = %vector.body19, %.._crit_edge43_crit_edge
  %index24 = phi i64 [ 0, %.._crit_edge43_crit_edge ], [ %index.next25.4, %vector.body19 ]
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv1812, i64 %index24
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %52, align 8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %54, align 8
  %index.next25 = add nuw nsw i64 %index24, 4
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv1812, i64 %index.next25
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %58, align 8
  %index.next25.1 = add nsw i64 %index24, 8
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv1812, i64 %index.next25.1
  %60 = bitcast double* %59 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %60, align 8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %62, align 8
  %index.next25.2 = add nsw i64 %index24, 12
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv1812, i64 %index.next25.2
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %64, align 8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %66, align 8
  %index.next25.3 = add nsw i64 %index24, 16
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv1812, i64 %index.next25.3
  %68 = bitcast double* %67 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %68, align 8
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %70, align 8
  %index.next25.4 = add nsw i64 %index24, 20
  %71 = icmp eq i64 %index.next25.4, 2000
  br i1 %71, label %middle.block20, label %vector.body19, !llvm.loop !8

middle.block20:                                   ; preds = %vector.body19
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1812, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond3, label %middle.block20...preheader1_crit_edge_crit_edge, label %.._crit_edge43_crit_edge

middle.block20...preheader1_crit_edge_crit_edge:  ; preds = %middle.block20
  %72 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %73 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %74 = bitcast i8* %45 to [2000 x [2000 x double]]*
  br label %..preheader1_crit_edge

..preheader1_crit_edge:                           ; preds = %126, %middle.block20...preheader1_crit_edge_crit_edge
  %indvars.iv1210 = phi i64 [ 0, %middle.block20...preheader1_crit_edge_crit_edge ], [ %indvars.iv.next13, %126 ]
  %scevgep38 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv1210
  %75 = add nuw i64 %indvars.iv1210, 1
  %scevgep40 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %75
  %76 = bitcast double* %scevgep40 to i8*
  %77 = bitcast double* %scevgep38 to i8*
  br label %.preheader1._crit_edge

.preheader1._crit_edge:                           ; preds = %.preheader1, %..preheader1_crit_edge
  %indvars.iv89 = phi i64 [ 0, %..preheader1_crit_edge ], [ %indvars.iv.next9, %.preheader1 ]
  %78 = mul nuw nsw i64 %indvars.iv89, 16000
  %scevgep = getelementptr i8, i8* %45, i64 %78
  %79 = add nuw i64 %78, 16000
  %scevgep37 = getelementptr i8, i8* %45, i64 %79
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv1210
  %bound0 = icmp ult i8* %scevgep, %76
  %bound1 = icmp ult i8* %77, %scevgep37
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %80 to i8*
  %bc42 = bitcast double* %80 to i8*
  %bound043 = icmp ult i8* %scevgep, %bc42
  %bound144 = icmp ult i8* %bc, %scevgep37
  %found.conflict45 = and i1 %bound043, %bound144
  %conflict.rdx = or i1 %found.conflict, %found.conflict45
  br i1 %conflict.rdx, label %.preheader1._crit_edge.scalar.ph34_crit_edge, label %.preheader1._crit_edge.vector.body32_crit_edge

.preheader1._crit_edge.vector.body32_crit_edge:   ; preds = %.preheader1._crit_edge
  br label %vector.body32

.preheader1._crit_edge.scalar.ph34_crit_edge:     ; preds = %.preheader1._crit_edge
  br label %scalar.ph34

vector.body32:                                    ; preds = %vector.body32, %.preheader1._crit_edge.vector.body32_crit_edge
  %index47 = phi i64 [ 0, %.preheader1._crit_edge.vector.body32_crit_edge ], [ %index.next48, %vector.body32 ]
  %81 = or i64 %index47, 1
  %82 = or i64 %index47, 2
  %83 = or i64 %index47, 3
  %84 = load double, double* %80, align 8, !alias.scope !9
  %85 = insertelement <2 x double> undef, double %84, i32 0
  %86 = shufflevector <2 x double> %85, <2 x double> undef, <2 x i32> zeroinitializer
  %87 = insertelement <2 x double> undef, double %84, i32 0
  %88 = shufflevector <2 x double> %87, <2 x double> undef, <2 x i32> zeroinitializer
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index47, i64 %indvars.iv1210
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %81, i64 %indvars.iv1210
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %82, i64 %indvars.iv1210
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %83, i64 %indvars.iv1210
  %93 = load double, double* %89, align 8, !alias.scope !12
  %94 = load double, double* %90, align 8, !alias.scope !12
  %95 = load double, double* %91, align 8, !alias.scope !12
  %96 = load double, double* %92, align 8, !alias.scope !12
  %97 = insertelement <2 x double> undef, double %93, i32 0
  %98 = insertelement <2 x double> %97, double %94, i32 1
  %99 = insertelement <2 x double> undef, double %95, i32 0
  %100 = insertelement <2 x double> %99, double %96, i32 1
  %101 = fmul <2 x double> %86, %98
  %102 = fmul <2 x double> %88, %100
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv89, i64 %index47
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !14, !noalias !16
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !14, !noalias !16
  %107 = fadd <2 x double> %wide.load, %101
  %108 = fadd <2 x double> %wide.load55, %102
  %109 = bitcast double* %103 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !alias.scope !14, !noalias !16
  %110 = bitcast double* %105 to <2 x double>*
  store <2 x double> %108, <2 x double>* %110, align 8, !alias.scope !14, !noalias !16
  %index.next48 = add nuw nsw i64 %index47, 4
  %111 = icmp eq i64 %index.next48, 2000
  br i1 %111, label %.preheader1.loopexit85, label %vector.body32, !llvm.loop !17

scalar.ph34:                                      ; preds = %scalar.ph34, %.preheader1._crit_edge.scalar.ph34_crit_edge
  %indvars.iv48 = phi i64 [ 0, %.preheader1._crit_edge.scalar.ph34_crit_edge ], [ %indvars.iv.next5.1, %scalar.ph34 ]
  %112 = load double, double* %80, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv1210
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv89, i64 %indvars.iv48
  %117 = load double, double* %116, align 8
  %118 = fadd double %117, %115
  store double %118, double* %116, align 8
  %indvars.iv.next5 = or i64 %indvars.iv48, 1
  %119 = load double, double* %80, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv1210
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next5
  %124 = load double, double* %123, align 8
  %125 = fadd double %124, %122
  store double %125, double* %123, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv48, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond.1, label %.preheader1.loopexit, label %scalar.ph34, !llvm.loop !18

.preheader1.loopexit:                             ; preds = %scalar.ph34
  br label %.preheader1

.preheader1.loopexit85:                           ; preds = %vector.body32
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit85, %.preheader1.loopexit
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond39, label %126, label %.preheader1._crit_edge

; <label>:126:                                    ; preds = %.preheader1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1210, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond2, label %..._crit_edge44_crit_edge_crit_edge, label %..preheader1_crit_edge

..._crit_edge44_crit_edge_crit_edge:              ; preds = %126
  %127 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %128 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %129 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %130 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %131 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %132 = bitcast i8* %45 to [2000 x [2000 x double]]*
  %133 = bitcast i8* %45 to [2000 x [2000 x double]]*
  br label %.._crit_edge44_crit_edge

.._crit_edge44_crit_edge:                         ; preds = %middle.block57, %..._crit_edge44_crit_edge_crit_edge
  %indvars.iv27 = phi i64 [ 0, %..._crit_edge44_crit_edge_crit_edge ], [ %indvars.iv.next3, %middle.block57 ]
  %scevgep61 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 0
  %scevgep6162 = bitcast double* %scevgep61 to i8*
  %134 = add nuw i64 %indvars.iv27, 1
  %scevgep63 = getelementptr [2000 x double], [2000 x double]* %0, i64 %134, i64 0
  %scevgep6364 = bitcast double* %scevgep63 to i8*
  %135 = mul nuw nsw i64 %indvars.iv27, 16000
  %scevgep65 = getelementptr i8, i8* %45, i64 %135
  %136 = add nuw i64 %135, 16000
  %scevgep66 = getelementptr i8, i8* %45, i64 %136
  %bound067 = icmp ult i8* %scevgep6162, %scevgep66
  %bound168 = icmp ult i8* %scevgep65, %scevgep6364
  %memcheck.conflict70 = and i1 %bound067, %bound168
  br i1 %memcheck.conflict70, label %.._crit_edge44_crit_edge.._crit_edge44_crit_edge, label %.._crit_edge44_crit_edge.vector.body56_crit_edge

.._crit_edge44_crit_edge.vector.body56_crit_edge: ; preds = %.._crit_edge44_crit_edge
  br label %vector.body56

.._crit_edge44_crit_edge.._crit_edge44_crit_edge: ; preds = %.._crit_edge44_crit_edge
  br label %._crit_edge44

vector.body56:                                    ; preds = %vector.body56, %.._crit_edge44_crit_edge.vector.body56_crit_edge
  %index73 = phi i64 [ 0, %.._crit_edge44_crit_edge.vector.body56_crit_edge ], [ %index.next74.1, %vector.body56 ]
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %132, i64 0, i64 %indvars.iv27, i64 %index73
  %138 = bitcast double* %137 to <2 x i64>*
  %wide.load81 = load <2 x i64>, <2 x i64>* %138, align 8, !alias.scope !19
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x i64>*
  %wide.load82 = load <2 x i64>, <2 x i64>* %140, align 8, !alias.scope !19
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index73
  %142 = bitcast double* %141 to <2 x i64>*
  store <2 x i64> %wide.load81, <2 x i64>* %142, align 8, !alias.scope !22, !noalias !19
  %143 = getelementptr double, double* %141, i64 2
  %144 = bitcast double* %143 to <2 x i64>*
  store <2 x i64> %wide.load82, <2 x i64>* %144, align 8, !alias.scope !22, !noalias !19
  %index.next74 = or i64 %index73, 4
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %133, i64 0, i64 %indvars.iv27, i64 %index.next74
  %146 = bitcast double* %145 to <2 x i64>*
  %wide.load81.1 = load <2 x i64>, <2 x i64>* %146, align 8, !alias.scope !19
  %147 = getelementptr double, double* %145, i64 2
  %148 = bitcast double* %147 to <2 x i64>*
  %wide.load82.1 = load <2 x i64>, <2 x i64>* %148, align 8, !alias.scope !19
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index.next74
  %150 = bitcast double* %149 to <2 x i64>*
  store <2 x i64> %wide.load81.1, <2 x i64>* %150, align 8, !alias.scope !22, !noalias !19
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x i64>*
  store <2 x i64> %wide.load82.1, <2 x i64>* %152, align 8, !alias.scope !22, !noalias !19
  %index.next74.1 = add nsw i64 %index73, 8
  %153 = icmp eq i64 %index.next74.1, 2000
  br i1 %153, label %middle.block57.loopexit84, label %vector.body56, !llvm.loop !24

._crit_edge44:                                    ; preds = %._crit_edge44, %.._crit_edge44_crit_edge.._crit_edge44_crit_edge
  %indvars.iv5 = phi i64 [ 0, %.._crit_edge44_crit_edge.._crit_edge44_crit_edge ], [ %indvars.iv.next.4, %._crit_edge44 ]
  %154 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvars.iv27, i64 %indvars.iv5
  %155 = bitcast double* %154 to i64*
  %156 = load i64, i64* %155, align 8
  %157 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv5
  %158 = bitcast double* %157 to i64*
  store i64 %156, i64* %158, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %159 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %128, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next
  %160 = bitcast double* %159 to i64*
  %161 = load i64, i64* %160, align 8
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next
  %163 = bitcast double* %162 to i64*
  store i64 %161, i64* %163, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %164 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %165 = bitcast double* %164 to i64*
  %166 = load i64, i64* %165, align 8
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %168 = bitcast double* %167 to i64*
  store i64 %166, i64* %168, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv5, 3
  %169 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %170 = bitcast double* %169 to i64*
  %171 = load i64, i64* %170, align 8
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %173 = bitcast double* %172 to i64*
  store i64 %171, i64* %173, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv5, 4
  %174 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %175 = bitcast double* %174 to i64*
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %178 = bitcast double* %177 to i64*
  store i64 %176, i64* %178, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv5, 5
  %exitcond38.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond38.4, label %middle.block57.loopexit, label %._crit_edge44, !llvm.loop !25

middle.block57.loopexit:                          ; preds = %._crit_edge44
  br label %middle.block57

middle.block57.loopexit84:                        ; preds = %vector.body56
  br label %middle.block57

middle.block57:                                   ; preds = %middle.block57.loopexit84, %middle.block57.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond1, label %179, label %.._crit_edge44_crit_edge

; <label>:179:                                    ; preds = %middle.block57
  call void @free(i8* %45) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge23._crit_edge, %1
  %indvars.iv2015 = phi i64 [ 0, %1 ], [ %indvars.iv.next21, %._crit_edge23._crit_edge ]
  %cond = icmp eq i64 %indvars.iv2015, 0
  br i1 %cond, label %._crit_edge25.preheader, label %.._crit_edge_crit_edge.._crit_edge24_crit_edge

.._crit_edge_crit_edge.._crit_edge24_crit_edge:   ; preds = %.._crit_edge_crit_edge
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 0
  br label %._crit_edge24

._crit_edge.._crit_edge23_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge25.preheader

._crit_edge25.preheader:                          ; preds = %._crit_edge.._crit_edge23_crit_edge, %.._crit_edge_crit_edge
  %exitcond138 = icmp eq i64 %indvars.iv2015, 0
  %xtraiter17 = and i64 %indvars.iv2015, 1
  %lcmp.mod18 = icmp eq i64 %xtraiter17, 0
  %3 = icmp eq i64 %indvars.iv2015, 1
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 0
  br label %._crit_edge25

._crit_edge24:                                    ; preds = %._crit_edge, %.._crit_edge_crit_edge.._crit_edge24_crit_edge
  %indvars.iv37 = phi i64 [ 0, %.._crit_edge_crit_edge.._crit_edge24_crit_edge ], [ %indvars.iv.next4, %._crit_edge ]
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 %indvars.iv37
  %exitcond2 = icmp eq i64 %indvars.iv37, 0
  br i1 %exitcond2, label %._crit_edge, label %._crit_edge24..lr.ph_crit_edge

._crit_edge24..lr.ph_crit_edge:                   ; preds = %._crit_edge24
  %xtraiter = and i64 %indvars.iv37, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %._crit_edge24..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %6 = load double, double* %2, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv37
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = load double, double* %5, align 8
  %11 = fsub double %10, %9
  store double %11, double* %5, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %._crit_edge24..lr.ph_crit_edge, %.lr.ph.prol
  %indvars.iv4.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %._crit_edge24..lr.ph_crit_edge ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %12 = icmp eq i64 %indvars.iv37, 1
  br i1 %12, label %._crit_edge.loopexit, label %._crit_edge24..lr.ph_crit_edge.new

._crit_edge24..lr.ph_crit_edge.new:               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %._crit_edge24..lr.ph_crit_edge.new
  %indvars.iv4 = phi i64 [ %indvars.iv4.unr.ph, %._crit_edge24..lr.ph_crit_edge.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 %indvars.iv4
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv37
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = load double, double* %5, align 8
  %19 = fsub double %18, %17
  store double %19, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv37
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = load double, double* %5, align 8
  %26 = fsub double %25, %24
  store double %26, double* %5, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv37
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge24
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv37
  %28 = load double, double* %27, align 8
  %29 = load double, double* %5, align 8
  %30 = fdiv double %29, %28
  store double %30, double* %5, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, %indvars.iv2015
  br i1 %exitcond8, label %._crit_edge.._crit_edge23_crit_edge, label %._crit_edge24

._crit_edge25:                                    ; preds = %._crit_edge23, %._crit_edge25.preheader
  %indvars.iv1613 = phi i64 [ %indvars.iv2015, %._crit_edge25.preheader ], [ %indvars.iv.next17, %._crit_edge23 ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 %indvars.iv1613
  br i1 %exitcond138, label %._crit_edge23, label %._crit_edge25..lr.ph10_crit_edge

._crit_edge25..lr.ph10_crit_edge:                 ; preds = %._crit_edge25
  br i1 %lcmp.mod18, label %.lr.ph10.prol.loopexit.unr-lcssa, label %.lr.ph10.prol.preheader

.lr.ph10.prol.preheader:                          ; preds = %._crit_edge25..lr.ph10_crit_edge
  br label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.prol.preheader
  %32 = load double, double* %4, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv1613
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %31, align 8
  %37 = fsub double %36, %35
  store double %37, double* %31, align 8
  br label %.lr.ph10.prol.loopexit.unr-lcssa

.lr.ph10.prol.loopexit.unr-lcssa:                 ; preds = %._crit_edge25..lr.ph10_crit_edge, %.lr.ph10.prol
  %indvars.iv99.unr.ph = phi i64 [ 1, %.lr.ph10.prol ], [ 0, %._crit_edge25..lr.ph10_crit_edge ]
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol.loopexit.unr-lcssa
  br i1 %3, label %._crit_edge23.loopexit, label %._crit_edge25..lr.ph10_crit_edge.new

._crit_edge25..lr.ph10_crit_edge.new:             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10, %._crit_edge25..lr.ph10_crit_edge.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr.ph, %._crit_edge25..lr.ph10_crit_edge.new ], [ %indvars.iv.next10.1, %.lr.ph10 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 %indvars.iv99
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv1613
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %31, align 8
  %44 = fsub double %43, %42
  store double %44, double* %31, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv99, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2015, i64 %indvars.iv.next10
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next10, i64 %indvars.iv1613
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %31, align 8
  %51 = fsub double %50, %49
  store double %51, double* %31, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv99, 2
  %exitcond13.1 = icmp eq i64 %indvars.iv.next10.1, %indvars.iv2015
  br i1 %exitcond13.1, label %._crit_edge23.loopexit.unr-lcssa, label %.lr.ph10

._crit_edge23.loopexit.unr-lcssa:                 ; preds = %.lr.ph10
  br label %._crit_edge23.loopexit

._crit_edge23.loopexit:                           ; preds = %.lr.ph10.prol.loopexit, %._crit_edge23.loopexit.unr-lcssa
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %._crit_edge25
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1613, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond22, label %._crit_edge23._crit_edge, label %._crit_edge25

._crit_edge23._crit_edge:                         ; preds = %._crit_edge23
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2015, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next21, 2000
  br i1 %exitcond1, label %52, label %.._crit_edge_crit_edge

; <label>:52:                                     ; preds = %._crit_edge23._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge5, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge5 ]
  %8 = add nuw nsw i64 %6, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge5

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond3, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!13, !10}
!17 = distinct !{!17, !4, !5}
!18 = distinct !{!18, !4, !5}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !4, !5}
!25 = distinct !{!25, !4, !5}
