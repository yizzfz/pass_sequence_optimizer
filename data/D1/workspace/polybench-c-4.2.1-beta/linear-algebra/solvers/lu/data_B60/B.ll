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
  br label %..preheader7_crit_edge

..preheader7_crit_edge:                           ; preds = %.loopexit, %1
  %indvars.iv7120 = phi i64 [ 1, %1 ], [ %indvars.iv.next72, %.loopexit ]
  %indvars.iv7319 = phi i64 [ 0, %1 ], [ %indvars.iv.next74, %.loopexit ]
  %2 = sub i64 1999, %indvars.iv7319
  %3 = add i64 %2, -4
  %4 = lshr i64 %3, 2
  %5 = add nuw nsw i64 %4, 1
  br label %.preheader7

.preheader7..preheader6_crit_edge:                ; preds = %.preheader7
  %6 = sub nuw nsw i64 1999, %indvars.iv7319
  %indvars.iv.next6416 = add nuw nsw i64 %indvars.iv7319, 1
  %exitcond7817 = icmp eq i64 %indvars.iv7319, 1999
  br i1 %exitcond7817, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader7..preheader6_crit_edge
  %min.iters.check = icmp ult i64 %6, 4
  br i1 %min.iters.check, label %.preheader6.preheader, label %min.iters.checked

.preheader6.preheader:                            ; preds = %middle.block, %min.iters.checked, %.lr.ph
  %indvars.iv.next6418.ph = phi i64 [ %indvars.iv.next6416, %.lr.ph ], [ %indvars.iv.next6416, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %.preheader6

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %6, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv.next6416, %n.vec
  br i1 %cmp.zero, label %.preheader6.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %5, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %7 = add i64 %indvars.iv.next6416, %index.prol
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %12 = icmp ult i64 %3, 12
  br i1 %12, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %13 = add i64 %indvars.iv.next6416, %index
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %index.next = add i64 %index, 4
  %18 = add i64 %indvars.iv.next6416, %index.next
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %index.next.1 = add i64 %index, 8
  %23 = add i64 %indvars.iv.next6416, %index.next.1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next.2 = add i64 %index, 12
  %28 = add i64 %indvars.iv.next6416, %index.next.2
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %index.next.3 = add i64 %index, 16
  %33 = icmp eq i64 %index.next.3, %n.vec
  br i1 %33, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %.loopexit, label %.preheader6.preheader

.preheader7:                                      ; preds = %.preheader7, %..preheader7_crit_edge
  %indvars.iv5515 = phi i64 [ 0, %..preheader7_crit_edge ], [ %indvars.iv.next56, %.preheader7 ]
  %34 = sub nsw i64 0, %indvars.iv5515
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 2.000000e+03
  %39 = fadd double %38, 1.000000e+00
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %indvars.iv5515
  store double %39, double* %40, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv5515, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next56, %indvars.iv7120
  br i1 %exitcond60, label %.preheader7..preheader6_crit_edge, label %.preheader7

.preheader6:                                      ; preds = %.preheader6, %.preheader6.preheader
  %indvars.iv.next6418 = phi i64 [ %indvars.iv.next6418.ph, %.preheader6.preheader ], [ %indvars.iv.next64, %.preheader6 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %indvars.iv.next6418
  store double 0.000000e+00, double* %41, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv.next6418, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next6418, 1999
  br i1 %exitcond78, label %.loopexit.loopexit, label %.preheader6, !llvm.loop !6

.loopexit.loopexit:                               ; preds = %.preheader6
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.preheader7..preheader6_crit_edge
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7319, i64 %indvars.iv7319
  store double 1.000000e+00, double* %42, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv7319, 1
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv7120, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond79, label %43, label %..preheader7_crit_edge

; <label>:43:                                     ; preds = %.loopexit
  %44 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %45 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %44 to [2000 x [2000 x double]]*
  br label %..preheader5_crit_edge

..preheader5_crit_edge:                           ; preds = %middle.block23, %43
  %indvars.iv5314 = phi i64 [ 0, %43 ], [ %indvars.iv.next54, %middle.block23 ]
  br label %vector.body22

vector.body22:                                    ; preds = %vector.body22, %..preheader5_crit_edge
  %index27 = phi i64 [ 0, %..preheader5_crit_edge ], [ %index.next28.4, %vector.body22 ]
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv5314, i64 %index27
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %51, align 8
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %53, align 8
  %index.next28 = add nuw nsw i64 %index27, 4
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv5314, i64 %index.next28
  %55 = bitcast double* %54 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %55, align 8
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %57, align 8
  %index.next28.1 = add nsw i64 %index27, 8
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv5314, i64 %index.next28.1
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %61, align 8
  %index.next28.2 = add nsw i64 %index27, 12
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv5314, i64 %index.next28.2
  %63 = bitcast double* %62 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %63, align 8
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %65, align 8
  %index.next28.3 = add nsw i64 %index27, 16
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv5314, i64 %index.next28.3
  %67 = bitcast double* %66 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %67, align 8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %69, align 8
  %index.next28.4 = add nsw i64 %index27, 20
  %70 = icmp eq i64 %index.next28.4, 2000
  br i1 %70, label %middle.block23, label %vector.body22, !llvm.loop !8

middle.block23:                                   ; preds = %vector.body22
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv5314, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond3, label %..preheader1_crit_edge.preheader, label %..preheader5_crit_edge

..preheader1_crit_edge.preheader:                 ; preds = %middle.block23
  %71 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %72 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %73 = bitcast i8* %44 to [2000 x [2000 x double]]*
  br label %..preheader1_crit_edge

..preheader1_crit_edge:                           ; preds = %125, %..preheader1_crit_edge.preheader
  %indvars.iv4712 = phi i64 [ 0, %..preheader1_crit_edge.preheader ], [ %indvars.iv.next48, %125 ]
  %scevgep41 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv4712
  %74 = add nuw nsw i64 %indvars.iv4712, 1
  %scevgep43 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %74
  %75 = bitcast double* %scevgep43 to i8*
  %76 = bitcast double* %scevgep41 to i8*
  br label %min.iters.checked38

min.iters.checked38:                              ; preds = %.preheader1, %..preheader1_crit_edge
  %indvars.iv4311 = phi i64 [ 0, %..preheader1_crit_edge ], [ %indvars.iv.next44, %.preheader1 ]
  %77 = mul nuw nsw i64 %indvars.iv4311, 16000
  %scevgep = getelementptr i8, i8* %44, i64 %77
  %78 = add nuw nsw i64 %77, 16000
  %scevgep40 = getelementptr i8, i8* %44, i64 %78
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4311, i64 %indvars.iv4712
  %bound0 = icmp ult i8* %scevgep, %75
  %bound1 = icmp ult i8* %76, %scevgep40
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %79 to i8*
  %bc45 = bitcast double* %79 to i8*
  %bound046 = icmp ult i8* %scevgep, %bc45
  %bound147 = icmp ult i8* %bc, %scevgep40
  %found.conflict48 = and i1 %bound046, %bound147
  %conflict.rdx = or i1 %found.conflict, %found.conflict48
  br i1 %conflict.rdx, label %scalar.ph37.preheader, label %vector.body35.preheader

vector.body35.preheader:                          ; preds = %min.iters.checked38
  br label %vector.body35

scalar.ph37.preheader:                            ; preds = %min.iters.checked38
  br label %scalar.ph37

vector.body35:                                    ; preds = %vector.body35, %vector.body35.preheader
  %index50 = phi i64 [ 0, %vector.body35.preheader ], [ %index.next51, %vector.body35 ]
  %80 = or i64 %index50, 1
  %81 = or i64 %index50, 2
  %82 = or i64 %index50, 3
  %83 = load double, double* %79, align 8, !alias.scope !9
  %84 = insertelement <2 x double> undef, double %83, i32 0
  %85 = shufflevector <2 x double> %84, <2 x double> undef, <2 x i32> zeroinitializer
  %86 = insertelement <2 x double> undef, double %83, i32 0
  %87 = shufflevector <2 x double> %86, <2 x double> undef, <2 x i32> zeroinitializer
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index50, i64 %indvars.iv4712
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %80, i64 %indvars.iv4712
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %81, i64 %indvars.iv4712
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %82, i64 %indvars.iv4712
  %92 = load double, double* %88, align 8, !alias.scope !12
  %93 = load double, double* %89, align 8, !alias.scope !12
  %94 = load double, double* %90, align 8, !alias.scope !12
  %95 = load double, double* %91, align 8, !alias.scope !12
  %96 = insertelement <2 x double> undef, double %92, i32 0
  %97 = insertelement <2 x double> %96, double %93, i32 1
  %98 = insertelement <2 x double> undef, double %94, i32 0
  %99 = insertelement <2 x double> %98, double %95, i32 1
  %100 = fmul <2 x double> %85, %97
  %101 = fmul <2 x double> %87, %99
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv4311, i64 %index50
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !14, !noalias !16
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !14, !noalias !16
  %106 = fadd <2 x double> %100, %wide.load
  %107 = fadd <2 x double> %101, %wide.load58
  %108 = bitcast double* %102 to <2 x double>*
  store <2 x double> %106, <2 x double>* %108, align 8, !alias.scope !14, !noalias !16
  %109 = bitcast double* %104 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !alias.scope !14, !noalias !16
  %index.next51 = add nuw nsw i64 %index50, 4
  %110 = icmp eq i64 %index.next51, 2000
  br i1 %110, label %.preheader1.loopexit90, label %vector.body35, !llvm.loop !17

scalar.ph37:                                      ; preds = %scalar.ph37, %scalar.ph37.preheader
  %indvars.iv3910 = phi i64 [ 0, %scalar.ph37.preheader ], [ %indvars.iv.next40.1, %scalar.ph37 ]
  %111 = load double, double* %79, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3910, i64 %indvars.iv4712
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv4311, i64 %indvars.iv3910
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  store double %117, double* %115, align 8
  %indvars.iv.next40 = or i64 %indvars.iv3910, 1
  %118 = load double, double* %79, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next40, i64 %indvars.iv4712
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv4311, i64 %indvars.iv.next40
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  store double %124, double* %122, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv3910, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next40.1, 2000
  br i1 %exitcond.1, label %.preheader1.loopexit, label %scalar.ph37, !llvm.loop !18

.preheader1.loopexit:                             ; preds = %scalar.ph37
  br label %.preheader1

.preheader1.loopexit90:                           ; preds = %vector.body35
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit90, %.preheader1.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4311, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond76, label %125, label %min.iters.checked38

; <label>:125:                                    ; preds = %.preheader1
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4712, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond2, label %.preheader..preheader4_crit_edge.preheader, label %..preheader1_crit_edge

.preheader..preheader4_crit_edge.preheader:       ; preds = %125
  %126 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %127 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %128 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %129 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %130 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %131 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %132 = bitcast i8* %44 to [2000 x [2000 x double]]*
  br label %.preheader..preheader4_crit_edge

.preheader..preheader4_crit_edge:                 ; preds = %.preheader, %.preheader..preheader4_crit_edge.preheader
  %indvars.iv379 = phi i64 [ 0, %.preheader..preheader4_crit_edge.preheader ], [ %indvars.iv.next38, %.preheader ]
  %scevgep64 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 0
  %scevgep6465 = bitcast double* %scevgep64 to i8*
  %133 = add nuw nsw i64 %indvars.iv379, 1
  %scevgep66 = getelementptr [2000 x double], [2000 x double]* %0, i64 %133, i64 0
  %scevgep6667 = bitcast double* %scevgep66 to i8*
  %134 = mul nuw nsw i64 %indvars.iv379, 16000
  %scevgep68 = getelementptr i8, i8* %44, i64 %134
  %135 = add nuw nsw i64 %134, 16000
  %scevgep69 = getelementptr i8, i8* %44, i64 %135
  %bound070 = icmp ult i8* %scevgep6465, %scevgep69
  %bound171 = icmp ult i8* %scevgep68, %scevgep6667
  %memcheck.conflict73 = and i1 %bound070, %bound171
  br i1 %memcheck.conflict73, label %.preheader4.preheader, label %vector.body59.preheader

vector.body59.preheader:                          ; preds = %.preheader..preheader4_crit_edge
  br label %vector.body59

.preheader4.preheader:                            ; preds = %.preheader..preheader4_crit_edge
  br label %.preheader4

vector.body59:                                    ; preds = %vector.body59, %vector.body59.preheader
  %index76 = phi i64 [ 0, %vector.body59.preheader ], [ %index.next77.1, %vector.body59 ]
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv379, i64 %index76
  %137 = bitcast double* %136 to <2 x i64>*
  %wide.load84 = load <2 x i64>, <2 x i64>* %137, align 8, !alias.scope !19
  %138 = getelementptr double, double* %136, i64 2
  %139 = bitcast double* %138 to <2 x i64>*
  %wide.load85 = load <2 x i64>, <2 x i64>* %139, align 8, !alias.scope !19
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 %index76
  %141 = bitcast double* %140 to <2 x i64>*
  store <2 x i64> %wide.load84, <2 x i64>* %141, align 8, !alias.scope !22, !noalias !19
  %142 = getelementptr double, double* %140, i64 2
  %143 = bitcast double* %142 to <2 x i64>*
  store <2 x i64> %wide.load85, <2 x i64>* %143, align 8, !alias.scope !22, !noalias !19
  %index.next77 = or i64 %index76, 4
  %144 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %132, i64 0, i64 %indvars.iv379, i64 %index.next77
  %145 = bitcast double* %144 to <2 x i64>*
  %wide.load84.1 = load <2 x i64>, <2 x i64>* %145, align 8, !alias.scope !19
  %146 = getelementptr double, double* %144, i64 2
  %147 = bitcast double* %146 to <2 x i64>*
  %wide.load85.1 = load <2 x i64>, <2 x i64>* %147, align 8, !alias.scope !19
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 %index.next77
  %149 = bitcast double* %148 to <2 x i64>*
  store <2 x i64> %wide.load84.1, <2 x i64>* %149, align 8, !alias.scope !22, !noalias !19
  %150 = getelementptr double, double* %148, i64 2
  %151 = bitcast double* %150 to <2 x i64>*
  store <2 x i64> %wide.load85.1, <2 x i64>* %151, align 8, !alias.scope !22, !noalias !19
  %index.next77.1 = add nsw i64 %index76, 8
  %152 = icmp eq i64 %index.next77.1, 2000
  br i1 %152, label %.preheader.loopexit89, label %vector.body59, !llvm.loop !24

.preheader4:                                      ; preds = %.preheader4, %.preheader4.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next.4, %.preheader4 ]
  %153 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %126, i64 0, i64 %indvars.iv379, i64 %indvars.iv8
  %154 = bitcast double* %153 to i64*
  %155 = load i64, i64* %154, align 8
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 %indvars.iv8
  %157 = bitcast double* %156 to i64*
  store i64 %155, i64* %157, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %158 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvars.iv379, i64 %indvars.iv.next
  %159 = bitcast double* %158 to i64*
  %160 = load i64, i64* %159, align 8
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 %indvars.iv.next
  %162 = bitcast double* %161 to i64*
  store i64 %160, i64* %162, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv8, 2
  %163 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %128, i64 0, i64 %indvars.iv379, i64 %indvars.iv.next.1
  %164 = bitcast double* %163 to i64*
  %165 = load i64, i64* %164, align 8
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 %indvars.iv.next.1
  %167 = bitcast double* %166 to i64*
  store i64 %165, i64* %167, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv8, 3
  %168 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv379, i64 %indvars.iv.next.2
  %169 = bitcast double* %168 to i64*
  %170 = load i64, i64* %169, align 8
  %171 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 %indvars.iv.next.2
  %172 = bitcast double* %171 to i64*
  store i64 %170, i64* %172, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv8, 4
  %173 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv379, i64 %indvars.iv.next.3
  %174 = bitcast double* %173 to i64*
  %175 = load i64, i64* %174, align 8
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv379, i64 %indvars.iv.next.3
  %177 = bitcast double* %176 to i64*
  store i64 %175, i64* %177, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv8, 5
  %exitcond75.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond75.4, label %.preheader.loopexit, label %.preheader4, !llvm.loop !25

.preheader.loopexit:                              ; preds = %.preheader4
  br label %.preheader

.preheader.loopexit89:                            ; preds = %vector.body59
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit89, %.preheader.loopexit
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv379, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond1, label %178, label %.preheader..preheader4_crit_edge

; <label>:178:                                    ; preds = %.preheader
  call void @free(i8* %44) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
..preheader41_crit_edge.lr.ph:
  br label %..preheader41_crit_edge

..preheader41_crit_edge:                          ; preds = %.loopexit, %..preheader41_crit_edge.lr.ph
  %indvars.iv3857 = phi i64 [ 0, %..preheader41_crit_edge.lr.ph ], [ %indvars.iv.next39, %.loopexit ]
  %cond = icmp eq i64 %indvars.iv3857, 0
  br i1 %cond, label %.lr.ph56.preheader, label %.lr.ph47.preheader

.lr.ph47.preheader:                               ; preds = %..preheader41_crit_edge
  %1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 0
  br label %.lr.ph47

.lr.ph56.preheader.loopexit:                      ; preds = %.preheader41
  br label %.lr.ph56.preheader

.lr.ph56.preheader:                               ; preds = %.lr.ph56.preheader.loopexit, %..preheader41_crit_edge
  %exitcond3148 = icmp eq i64 %indvars.iv3857, 0
  %xtraiter3 = and i64 %indvars.iv3857, 1
  %lcmp.mod4 = icmp eq i64 %xtraiter3, 0
  %2 = icmp eq i64 %indvars.iv3857, 1
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 0
  br label %.lr.ph56

.lr.ph47:                                         ; preds = %.preheader41, %.lr.ph47.preheader
  %indvars.iv2145 = phi i64 [ 0, %.lr.ph47.preheader ], [ %indvars.iv.next22, %.preheader41 ]
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 %indvars.iv2145
  %exitcond42 = icmp eq i64 %indvars.iv2145, 0
  br i1 %exitcond42, label %.preheader41, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph47
  %xtraiter = and i64 %indvars.iv2145, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %5 = load double, double* %1, align 8
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv2145
  %7 = load double, double* %6, align 8
  %8 = fmul double %5, %7
  %9 = load double, double* %4, align 8
  %10 = fsub double %9, %8
  store double %10, double* %4, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv43.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %11 = icmp eq i64 %indvars.iv2145, 1
  br i1 %11, label %.preheader41, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 %indvars.iv43
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv2145
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = load double, double* %4, align 8
  %18 = fsub double %17, %16
  store double %18, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv43, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 %indvars.iv.next
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv2145
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = load double, double* %4, align 8
  %25 = fsub double %24, %23
  store double %25, double* %4, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv43, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv2145
  br i1 %exitcond.1, label %.preheader41.loopexit, label %.lr.ph

.preheader41.loopexit:                            ; preds = %.lr.ph
  br label %.preheader41

.preheader41:                                     ; preds = %.preheader41.loopexit, %.lr.ph.prol.loopexit, %.lr.ph47
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2145, i64 %indvars.iv2145
  %27 = load double, double* %26, align 8
  %28 = load double, double* %4, align 8
  %29 = fdiv double %28, %27
  store double %29, double* %4, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2145, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv3857
  br i1 %exitcond26, label %.lr.ph56.preheader.loopexit, label %.lr.ph47

.lr.ph56:                                         ; preds = %.preheader, %.lr.ph56.preheader
  %indvars.iv3454 = phi i64 [ %indvars.iv3857, %.lr.ph56.preheader ], [ %indvars.iv.next35, %.preheader ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 %indvars.iv3454
  br i1 %exitcond3148, label %.preheader, label %.lr.ph51.preheader

.lr.ph51.preheader:                               ; preds = %.lr.ph56
  br i1 %lcmp.mod4, label %.lr.ph51.prol.loopexit, label %.lr.ph51.prol

.lr.ph51.prol:                                    ; preds = %.lr.ph51.preheader
  %31 = load double, double* %3, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv3454
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %30, align 8
  %36 = fsub double %35, %34
  store double %36, double* %30, align 8
  br label %.lr.ph51.prol.loopexit

.lr.ph51.prol.loopexit:                           ; preds = %.lr.ph51.prol, %.lr.ph51.preheader
  %indvars.iv2749.unr.ph = phi i64 [ 1, %.lr.ph51.prol ], [ 0, %.lr.ph51.preheader ]
  br i1 %2, label %.preheader, label %.lr.ph51.preheader.new

.lr.ph51.preheader.new:                           ; preds = %.lr.ph51.prol.loopexit
  br label %.lr.ph51

.lr.ph51:                                         ; preds = %.lr.ph51, %.lr.ph51.preheader.new
  %indvars.iv2749 = phi i64 [ %indvars.iv2749.unr.ph, %.lr.ph51.preheader.new ], [ %indvars.iv.next28.1, %.lr.ph51 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 %indvars.iv2749
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2749, i64 %indvars.iv3454
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = load double, double* %30, align 8
  %43 = fsub double %42, %41
  store double %43, double* %30, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2749, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3857, i64 %indvars.iv.next28
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next28, i64 %indvars.iv3454
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %30, align 8
  %50 = fsub double %49, %48
  store double %50, double* %30, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv2749, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv3857
  br i1 %exitcond31.1, label %.preheader.loopexit, label %.lr.ph51

.preheader.loopexit:                              ; preds = %.lr.ph51
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph51.prol.loopexit, %.lr.ph56
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3454, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond40, label %.loopexit, label %.lr.ph56

.loopexit:                                        ; preds = %.preheader
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3857, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next39, 2000
  br i1 %exitcond2, label %.loopexit1, label %..preheader41_crit_edge

.loopexit1:                                       ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph15:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit, %.lr.ph15
  %indvars.iv512 = phi i64 [ 0, %.lr.ph15 ], [ %indvars.iv.next6, %.loopexit ]
  %5 = mul nuw nsw i64 %indvars.iv512, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv9 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv9
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv512, i64 %indvars.iv9
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond7, label %.loopexit, label %6

.loopexit:                                        ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv512, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond, label %.loopexit1, label %.lr.ph

.loopexit1:                                       ; preds = %.loopexit
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

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
