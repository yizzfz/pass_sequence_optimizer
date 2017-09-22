; ModuleID = 'B.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %12, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv3818 = phi i64 [ 0, %4 ], [ %indvars.iv.next39.1, %5 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv3818
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv3818
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next39 = or i64 %indvars.iv3818, 1
  %8 = trunc i64 %indvars.iv.next39 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv3818
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next39
  store double 0.000000e+00, double* %14, align 8
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next39
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv3818, 2
  %16 = trunc i64 %indvars.iv.next39.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = fadd double %19, 4.000000e+00
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next39
  store double %20, double* %21, align 8
  %exitcond5.1 = icmp eq i64 %indvars.iv.next39.1, 2000
  br i1 %exitcond5.1, label %..._crit_edge_crit_edge_crit_edge, label %5

..._crit_edge_crit_edge_crit_edge:                ; preds = %5
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge44._crit_edge, %..._crit_edge_crit_edge_crit_edge
  %22 = phi i64 [ 1, %..._crit_edge_crit_edge_crit_edge ], [ %63, %._crit_edge44._crit_edge ]
  %indvars.iv3417 = phi i64 [ 1, %..._crit_edge_crit_edge_crit_edge ], [ %indvars.iv.next35, %._crit_edge44._crit_edge ]
  %indvars.iv3616 = phi i64 [ 0, %..._crit_edge_crit_edge_crit_edge ], [ %indvars.iv.next37, %._crit_edge44._crit_edge ]
  br label %._crit_edge

._crit_edge.._crit_edge44_crit_edge:              ; preds = %._crit_edge
  %exitcond4314 = icmp eq i64 %22, 2000
  br i1 %exitcond4314, label %._crit_edge44._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge.._crit_edge44_crit_edge
  %23 = sub nsw i64 2000, %22
  %min.iters.check = icmp ult i64 %23, 4
  br i1 %min.iters.check, label %._crit_edge44.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %23, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %22, %n.vec
  br i1 %cmp.zero, label %._crit_edge44.preheader, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  %24 = add nsw i64 %n.vec, -4
  %25 = lshr exact i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %xtraiter = and i64 %26, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %min.iters.checked.vector.body_crit_edge
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %27 = add i64 %22, %index.prol
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %min.iters.checked.vector.body_crit_edge
  %index.unr = phi i64 [ 0, %min.iters.checked.vector.body_crit_edge ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %32 = icmp ult i64 %24, 12
  br i1 %32, label %middle.block, label %min.iters.checked.vector.body_crit_edge.new

min.iters.checked.vector.body_crit_edge.new:      ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %min.iters.checked.vector.body_crit_edge.new
  %index = phi i64 [ %index.unr, %min.iters.checked.vector.body_crit_edge.new ], [ %index.next.3, %vector.body ]
  %33 = add i64 %22, %index
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %index.next = add i64 %index, 4
  %38 = add i64 %22, %index.next
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %42, align 8
  %index.next.1 = add i64 %index, 8
  %43 = add i64 %22, %index.next.1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %43
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %45, align 8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %47, align 8
  %index.next.2 = add i64 %index, 12
  %48 = add i64 %22, %index.next.2
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %48
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %50, align 8
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %52, align 8
  %index.next.3 = add i64 %index, 16
  %53 = icmp eq i64 %index.next.3, %n.vec
  br i1 %53, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %23, %n.vec
  br i1 %cmp.n, label %._crit_edge44._crit_edge, label %._crit_edge44.preheader

._crit_edge44.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph
  %indvars.iv2815.ph = phi i64 [ %22, %.lr.ph ], [ %22, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %._crit_edge44

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv2013 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next21, %._crit_edge ]
  %54 = sub nsw i64 0, %indvars.iv2013
  %55 = trunc i64 %54 to i32
  %56 = srem i32 %55, 2000
  %57 = sitofp i32 %56 to double
  %58 = fdiv double %57, 2.000000e+03
  %59 = fadd double %58, 1.000000e+00
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %indvars.iv2013
  store double %59, double* %60, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2013, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, %indvars.iv3417
  br i1 %exitcond25, label %._crit_edge.._crit_edge44_crit_edge, label %._crit_edge

._crit_edge44:                                    ; preds = %._crit_edge44, %._crit_edge44.preheader
  %indvars.iv2815 = phi i64 [ %indvars.iv2815.ph, %._crit_edge44.preheader ], [ %indvars.iv.next29, %._crit_edge44 ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %indvars.iv2815
  store double 0.000000e+00, double* %61, align 8
  %indvars.iv.next29 = add nsw i64 %indvars.iv2815, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond43, label %._crit_edge44._crit_edge.loopexit, label %._crit_edge44, !llvm.loop !6

._crit_edge44._crit_edge.loopexit:                ; preds = %._crit_edge44
  br label %._crit_edge44._crit_edge

._crit_edge44._crit_edge:                         ; preds = %._crit_edge44._crit_edge.loopexit, %middle.block, %._crit_edge.._crit_edge44_crit_edge
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv3616, 1
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3616, i64 %indvars.iv3616
  store double 1.000000e+00, double* %62, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3417, 1
  %indvars.iv.next27 = shl nsw i64 %22, 32
  %sext = add i64 %indvars.iv.next27, 4294967296
  %63 = ashr exact i64 %sext, 32
  %exitcond4 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond4, label %64, label %.._crit_edge_crit_edge

; <label>:64:                                     ; preds = %._crit_edge44._crit_edge
  %65 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %66 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %67 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %68 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %69 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %70 = bitcast i8* %65 to [2000 x [2000 x double]]*
  br label %.._crit_edge45_crit_edge

.._crit_edge45_crit_edge:                         ; preds = %middle.block21, %64
  %indvars.iv1812 = phi i64 [ 0, %64 ], [ %indvars.iv.next19, %middle.block21 ]
  br label %vector.body20

vector.body20:                                    ; preds = %vector.body20, %.._crit_edge45_crit_edge
  %index25 = phi i64 [ 0, %.._crit_edge45_crit_edge ], [ %index.next26.4, %vector.body20 ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv1812, i64 %index25
  %72 = bitcast double* %71 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %72, align 8
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %74, align 8
  %index.next26 = add nuw nsw i64 %index25, 4
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv1812, i64 %index.next26
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %76, align 8
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %78, align 8
  %index.next26.1 = add nsw i64 %index25, 8
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv1812, i64 %index.next26.1
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %80, align 8
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %82, align 8
  %index.next26.2 = add nsw i64 %index25, 12
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv1812, i64 %index.next26.2
  %84 = bitcast double* %83 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %84, align 8
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %86, align 8
  %index.next26.3 = add nsw i64 %index25, 16
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv1812, i64 %index.next26.3
  %88 = bitcast double* %87 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %88, align 8
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %90, align 8
  %index.next26.4 = add nsw i64 %index25, 20
  %91 = icmp eq i64 %index.next26.4, 2000
  br i1 %91, label %middle.block21, label %vector.body20, !llvm.loop !8

middle.block21:                                   ; preds = %vector.body20
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1812, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond3, label %middle.block21...preheader1_crit_edge_crit_edge, label %.._crit_edge45_crit_edge

middle.block21...preheader1_crit_edge_crit_edge:  ; preds = %middle.block21
  %92 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %93 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %94 = bitcast i8* %65 to [2000 x [2000 x double]]*
  br label %..preheader1_crit_edge

..preheader1_crit_edge:                           ; preds = %146, %middle.block21...preheader1_crit_edge_crit_edge
  %indvars.iv1210 = phi i64 [ 0, %middle.block21...preheader1_crit_edge_crit_edge ], [ %indvars.iv.next13, %146 ]
  %scevgep39 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv1210
  %95 = add nuw i64 %indvars.iv1210, 1
  %scevgep41 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %95
  %96 = bitcast double* %scevgep41 to i8*
  %97 = bitcast double* %scevgep39 to i8*
  br label %.preheader1._crit_edge

.preheader1._crit_edge:                           ; preds = %.preheader1, %..preheader1_crit_edge
  %indvars.iv89 = phi i64 [ 0, %..preheader1_crit_edge ], [ %indvars.iv.next9, %.preheader1 ]
  %98 = mul nuw nsw i64 %indvars.iv89, 16000
  %scevgep = getelementptr i8, i8* %65, i64 %98
  %99 = add nuw i64 %98, 16000
  %scevgep38 = getelementptr i8, i8* %65, i64 %99
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv1210
  %bound0 = icmp ult i8* %scevgep, %96
  %bound1 = icmp ult i8* %97, %scevgep38
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %100 to i8*
  %bc43 = bitcast double* %100 to i8*
  %bound044 = icmp ult i8* %scevgep, %bc43
  %bound145 = icmp ult i8* %bc, %scevgep38
  %found.conflict46 = and i1 %bound044, %bound145
  %conflict.rdx = or i1 %found.conflict, %found.conflict46
  br i1 %conflict.rdx, label %.preheader1._crit_edge.scalar.ph35_crit_edge, label %.preheader1._crit_edge.vector.body33_crit_edge

.preheader1._crit_edge.vector.body33_crit_edge:   ; preds = %.preheader1._crit_edge
  br label %vector.body33

.preheader1._crit_edge.scalar.ph35_crit_edge:     ; preds = %.preheader1._crit_edge
  br label %scalar.ph35

vector.body33:                                    ; preds = %vector.body33, %.preheader1._crit_edge.vector.body33_crit_edge
  %index48 = phi i64 [ 0, %.preheader1._crit_edge.vector.body33_crit_edge ], [ %index.next49, %vector.body33 ]
  %101 = or i64 %index48, 1
  %102 = or i64 %index48, 2
  %103 = or i64 %index48, 3
  %104 = load double, double* %100, align 8, !alias.scope !9
  %105 = insertelement <2 x double> undef, double %104, i32 0
  %106 = shufflevector <2 x double> %105, <2 x double> undef, <2 x i32> zeroinitializer
  %107 = insertelement <2 x double> undef, double %104, i32 0
  %108 = shufflevector <2 x double> %107, <2 x double> undef, <2 x i32> zeroinitializer
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index48, i64 %indvars.iv1210
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %101, i64 %indvars.iv1210
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %102, i64 %indvars.iv1210
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv1210
  %113 = load double, double* %109, align 8, !alias.scope !12
  %114 = load double, double* %110, align 8, !alias.scope !12
  %115 = load double, double* %111, align 8, !alias.scope !12
  %116 = load double, double* %112, align 8, !alias.scope !12
  %117 = insertelement <2 x double> undef, double %113, i32 0
  %118 = insertelement <2 x double> %117, double %114, i32 1
  %119 = insertelement <2 x double> undef, double %115, i32 0
  %120 = insertelement <2 x double> %119, double %116, i32 1
  %121 = fmul <2 x double> %106, %118
  %122 = fmul <2 x double> %108, %120
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv89, i64 %index48
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !14, !noalias !16
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !14, !noalias !16
  %127 = fadd <2 x double> %wide.load, %121
  %128 = fadd <2 x double> %wide.load56, %122
  %129 = bitcast double* %123 to <2 x double>*
  store <2 x double> %127, <2 x double>* %129, align 8, !alias.scope !14, !noalias !16
  %130 = bitcast double* %125 to <2 x double>*
  store <2 x double> %128, <2 x double>* %130, align 8, !alias.scope !14, !noalias !16
  %index.next49 = add nuw nsw i64 %index48, 4
  %131 = icmp eq i64 %index.next49, 2000
  br i1 %131, label %.preheader1.loopexit87, label %vector.body33, !llvm.loop !17

scalar.ph35:                                      ; preds = %scalar.ph35, %.preheader1._crit_edge.scalar.ph35_crit_edge
  %indvars.iv48 = phi i64 [ 0, %.preheader1._crit_edge.scalar.ph35_crit_edge ], [ %indvars.iv.next5.1, %scalar.ph35 ]
  %132 = load double, double* %100, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv1210
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %92, i64 0, i64 %indvars.iv89, i64 %indvars.iv48
  %137 = load double, double* %136, align 8
  %138 = fadd double %137, %135
  store double %138, double* %136, align 8
  %indvars.iv.next5 = or i64 %indvars.iv48, 1
  %139 = load double, double* %100, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv1210
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next5
  %144 = load double, double* %143, align 8
  %145 = fadd double %144, %142
  store double %145, double* %143, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv48, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond.1, label %.preheader1.loopexit, label %scalar.ph35, !llvm.loop !18

.preheader1.loopexit:                             ; preds = %scalar.ph35
  br label %.preheader1

.preheader1.loopexit87:                           ; preds = %vector.body33
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit87, %.preheader1.loopexit
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond41, label %146, label %.preheader1._crit_edge

; <label>:146:                                    ; preds = %.preheader1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1210, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond2, label %..._crit_edge46_crit_edge_crit_edge, label %..preheader1_crit_edge

..._crit_edge46_crit_edge_crit_edge:              ; preds = %146
  %147 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %148 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %149 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %150 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %151 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %152 = bitcast i8* %65 to [2000 x [2000 x double]]*
  %153 = bitcast i8* %65 to [2000 x [2000 x double]]*
  br label %.._crit_edge46_crit_edge

.._crit_edge46_crit_edge:                         ; preds = %middle.block58, %..._crit_edge46_crit_edge_crit_edge
  %indvars.iv27 = phi i64 [ 0, %..._crit_edge46_crit_edge_crit_edge ], [ %indvars.iv.next3, %middle.block58 ]
  %scevgep62 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 0
  %scevgep6263 = bitcast double* %scevgep62 to i8*
  %154 = add nuw i64 %indvars.iv27, 1
  %scevgep64 = getelementptr [2000 x double], [2000 x double]* %0, i64 %154, i64 0
  %scevgep6465 = bitcast double* %scevgep64 to i8*
  %155 = mul nuw nsw i64 %indvars.iv27, 16000
  %scevgep66 = getelementptr i8, i8* %65, i64 %155
  %156 = add nuw i64 %155, 16000
  %scevgep67 = getelementptr i8, i8* %65, i64 %156
  %bound068 = icmp ult i8* %scevgep6263, %scevgep67
  %bound169 = icmp ult i8* %scevgep66, %scevgep6465
  %memcheck.conflict71 = and i1 %bound068, %bound169
  br i1 %memcheck.conflict71, label %.._crit_edge46_crit_edge.._crit_edge46_crit_edge, label %.._crit_edge46_crit_edge.vector.body57_crit_edge

.._crit_edge46_crit_edge.vector.body57_crit_edge: ; preds = %.._crit_edge46_crit_edge
  br label %vector.body57

.._crit_edge46_crit_edge.._crit_edge46_crit_edge: ; preds = %.._crit_edge46_crit_edge
  br label %._crit_edge46

vector.body57:                                    ; preds = %vector.body57, %.._crit_edge46_crit_edge.vector.body57_crit_edge
  %index74 = phi i64 [ 0, %.._crit_edge46_crit_edge.vector.body57_crit_edge ], [ %index.next75.1, %vector.body57 ]
  %157 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %152, i64 0, i64 %indvars.iv27, i64 %index74
  %158 = bitcast double* %157 to <2 x i64>*
  %wide.load82 = load <2 x i64>, <2 x i64>* %158, align 8, !alias.scope !19
  %159 = getelementptr double, double* %157, i64 2
  %160 = bitcast double* %159 to <2 x i64>*
  %wide.load83 = load <2 x i64>, <2 x i64>* %160, align 8, !alias.scope !19
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index74
  %162 = bitcast double* %161 to <2 x i64>*
  store <2 x i64> %wide.load82, <2 x i64>* %162, align 8, !alias.scope !22, !noalias !19
  %163 = getelementptr double, double* %161, i64 2
  %164 = bitcast double* %163 to <2 x i64>*
  store <2 x i64> %wide.load83, <2 x i64>* %164, align 8, !alias.scope !22, !noalias !19
  %index.next75 = or i64 %index74, 4
  %165 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %153, i64 0, i64 %indvars.iv27, i64 %index.next75
  %166 = bitcast double* %165 to <2 x i64>*
  %wide.load82.1 = load <2 x i64>, <2 x i64>* %166, align 8, !alias.scope !19
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x i64>*
  %wide.load83.1 = load <2 x i64>, <2 x i64>* %168, align 8, !alias.scope !19
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index.next75
  %170 = bitcast double* %169 to <2 x i64>*
  store <2 x i64> %wide.load82.1, <2 x i64>* %170, align 8, !alias.scope !22, !noalias !19
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x i64>*
  store <2 x i64> %wide.load83.1, <2 x i64>* %172, align 8, !alias.scope !22, !noalias !19
  %index.next75.1 = add nsw i64 %index74, 8
  %173 = icmp eq i64 %index.next75.1, 2000
  br i1 %173, label %middle.block58.loopexit86, label %vector.body57, !llvm.loop !24

._crit_edge46:                                    ; preds = %._crit_edge46, %.._crit_edge46_crit_edge.._crit_edge46_crit_edge
  %indvars.iv6 = phi i64 [ 0, %.._crit_edge46_crit_edge.._crit_edge46_crit_edge ], [ %indvars.iv.next.4, %._crit_edge46 ]
  %174 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %147, i64 0, i64 %indvars.iv27, i64 %indvars.iv6
  %175 = bitcast double* %174 to i64*
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv6
  %178 = bitcast double* %177 to i64*
  store i64 %176, i64* %178, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %179 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %148, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next
  %180 = bitcast double* %179 to i64*
  %181 = load i64, i64* %180, align 8
  %182 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next
  %183 = bitcast double* %182 to i64*
  store i64 %181, i64* %183, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv6, 2
  %184 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %149, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %185 = bitcast double* %184 to i64*
  %186 = load i64, i64* %185, align 8
  %187 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %188 = bitcast double* %187 to i64*
  store i64 %186, i64* %188, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv6, 3
  %189 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %150, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %190 = bitcast double* %189 to i64*
  %191 = load i64, i64* %190, align 8
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %193 = bitcast double* %192 to i64*
  store i64 %191, i64* %193, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv6, 4
  %194 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %151, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %195 = bitcast double* %194 to i64*
  %196 = load i64, i64* %195, align 8
  %197 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %198 = bitcast double* %197 to i64*
  store i64 %196, i64* %198, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv6, 5
  %exitcond40.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond40.4, label %middle.block58.loopexit, label %._crit_edge46, !llvm.loop !25

middle.block58.loopexit:                          ; preds = %._crit_edge46
  br label %middle.block58

middle.block58.loopexit86:                        ; preds = %vector.body57
  br label %middle.block58

middle.block58:                                   ; preds = %middle.block58.loopexit86, %middle.block58.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond1, label %199, label %.._crit_edge46_crit_edge

; <label>:199:                                    ; preds = %middle.block58
  call void @free(i8* %65) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double*, double*) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge46._crit_edge, %4
  %indvars.iv3439 = phi i64 [ 0, %4 ], [ %indvars.iv.next35, %._crit_edge46._crit_edge ]
  %cond = icmp eq i64 %indvars.iv3439, 0
  br i1 %cond, label %.lr.ph38.preheader, label %.._crit_edge_crit_edge..lr.ph28_crit_edge

.._crit_edge_crit_edge..lr.ph28_crit_edge:        ; preds = %.._crit_edge_crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 0
  br label %.lr.ph28

._crit_edge.._crit_edge46_crit_edge:              ; preds = %._crit_edge
  br label %.lr.ph38.preheader

.lr.ph38.preheader:                               ; preds = %._crit_edge.._crit_edge46_crit_edge, %.._crit_edge_crit_edge
  %exitcond2729 = icmp eq i64 %indvars.iv3439, 0
  %xtraiter63 = and i64 %indvars.iv3439, 1
  %lcmp.mod64 = icmp eq i64 %xtraiter63, 0
  %6 = icmp eq i64 %indvars.iv3439, 1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 0
  br label %.lr.ph38

.lr.ph28:                                         ; preds = %._crit_edge, %.._crit_edge_crit_edge..lr.ph28_crit_edge
  %indvars.iv1727 = phi i64 [ 0, %.._crit_edge_crit_edge..lr.ph28_crit_edge ], [ %indvars.iv.next18, %._crit_edge ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 %indvars.iv1727
  %9 = load double, double* %8, align 8
  %exitcond1620 = icmp eq i64 %indvars.iv1727, 0
  br i1 %exitcond1620, label %._crit_edge, label %.lr.ph28..lr.ph23_crit_edge

.lr.ph28..lr.ph23_crit_edge:                      ; preds = %.lr.ph28
  %xtraiter60 = and i64 %indvars.iv1727, 1
  %lcmp.mod61 = icmp eq i64 %xtraiter60, 0
  br i1 %lcmp.mod61, label %.lr.ph23.prol.loopexit.unr-lcssa, label %.lr.ph23.prol.preheader

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph28..lr.ph23_crit_edge
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol.preheader
  %10 = load double, double* %5, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv1727
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %9, %13
  br label %.lr.ph23.prol.loopexit.unr-lcssa

.lr.ph23.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph23.prol, %.lr.ph28..lr.ph23_crit_edge
  %.lcssa54.unr.ph = phi double [ %14, %.lr.ph23.prol ], [ undef, %.lr.ph28..lr.ph23_crit_edge ]
  %.unr62.ph = phi double [ %14, %.lr.ph23.prol ], [ %9, %.lr.ph28..lr.ph23_crit_edge ]
  %indvars.iv1221.unr.ph = phi i64 [ 1, %.lr.ph23.prol ], [ 0, %.lr.ph28..lr.ph23_crit_edge ]
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %indvars.iv1727, 1
  br i1 %15, label %._crit_edge.loopexit, label %.lr.ph28..lr.ph23_crit_edge.new

.lr.ph28..lr.ph23_crit_edge.new:                  ; preds = %.lr.ph23.prol.loopexit
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23, %.lr.ph28..lr.ph23_crit_edge.new
  %16 = phi double [ %.unr62.ph, %.lr.ph28..lr.ph23_crit_edge.new ], [ %28, %.lr.ph23 ]
  %indvars.iv1221 = phi i64 [ %indvars.iv1221.unr.ph, %.lr.ph28..lr.ph23_crit_edge.new ], [ %indvars.iv.next13.1, %.lr.ph23 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 %indvars.iv1221
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1221, i64 %indvars.iv1727
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1221, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 %indvars.iv.next13
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next13, i64 %indvars.iv1727
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1221, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next13.1, %indvars.iv1727
  br i1 %exitcond16.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph23

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph23
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph23.prol.loopexit
  %.lcssa54 = phi double [ %.lcssa54.unr.ph, %.lr.ph23.prol.loopexit ], [ %28, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph28
  %.lcssa2 = phi double [ %9, %.lr.ph28 ], [ %.lcssa54, %._crit_edge.loopexit ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1727, i64 %indvars.iv1727
  %30 = load double, double* %29, align 8
  %31 = fdiv double %.lcssa2, %30
  store double %31, double* %8, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1727, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next18, %indvars.iv3439
  br i1 %exitcond22, label %._crit_edge.._crit_edge46_crit_edge, label %.lr.ph28

.lr.ph38:                                         ; preds = %._crit_edge46, %.lr.ph38.preheader
  %indvars.iv3036 = phi i64 [ %indvars.iv3439, %.lr.ph38.preheader ], [ %indvars.iv.next31, %._crit_edge46 ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 %indvars.iv3036
  %33 = load double, double* %32, align 8
  br i1 %exitcond2729, label %._crit_edge46, label %.lr.ph38..lr.ph32_crit_edge

.lr.ph38..lr.ph32_crit_edge:                      ; preds = %.lr.ph38
  br i1 %lcmp.mod64, label %.lr.ph32.prol.loopexit.unr-lcssa, label %.lr.ph32.prol.preheader

.lr.ph32.prol.preheader:                          ; preds = %.lr.ph38..lr.ph32_crit_edge
  br label %.lr.ph32.prol

.lr.ph32.prol:                                    ; preds = %.lr.ph32.prol.preheader
  %34 = load double, double* %7, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv3036
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %33, %37
  br label %.lr.ph32.prol.loopexit.unr-lcssa

.lr.ph32.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph32.prol, %.lr.ph38..lr.ph32_crit_edge
  %.lcssa55.unr.ph = phi double [ %38, %.lr.ph32.prol ], [ undef, %.lr.ph38..lr.ph32_crit_edge ]
  %.unr65.ph = phi double [ %38, %.lr.ph32.prol ], [ %33, %.lr.ph38..lr.ph32_crit_edge ]
  %indvars.iv2330.unr.ph = phi i64 [ 1, %.lr.ph32.prol ], [ 0, %.lr.ph38..lr.ph32_crit_edge ]
  br label %.lr.ph32.prol.loopexit

.lr.ph32.prol.loopexit:                           ; preds = %.lr.ph32.prol.loopexit.unr-lcssa
  br i1 %6, label %._crit_edge46.loopexit, label %.lr.ph38..lr.ph32_crit_edge.new

.lr.ph38..lr.ph32_crit_edge.new:                  ; preds = %.lr.ph32.prol.loopexit
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32, %.lr.ph38..lr.ph32_crit_edge.new
  %39 = phi double [ %.unr65.ph, %.lr.ph38..lr.ph32_crit_edge.new ], [ %51, %.lr.ph32 ]
  %indvars.iv2330 = phi i64 [ %indvars.iv2330.unr.ph, %.lr.ph38..lr.ph32_crit_edge.new ], [ %indvars.iv.next24.1, %.lr.ph32 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 %indvars.iv2330
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2330, i64 %indvars.iv3036
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %39, %44
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2330, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3439, i64 %indvars.iv.next24
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next24, i64 %indvars.iv3036
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %45, %50
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv2330, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next24.1, %indvars.iv3439
  br i1 %exitcond27.1, label %._crit_edge46.loopexit.unr-lcssa, label %.lr.ph32

._crit_edge46.loopexit.unr-lcssa:                 ; preds = %.lr.ph32
  br label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %._crit_edge46.loopexit.unr-lcssa, %.lr.ph32.prol.loopexit
  %.lcssa55 = phi double [ %.lcssa55.unr.ph, %.lr.ph32.prol.loopexit ], [ %51, %._crit_edge46.loopexit.unr-lcssa ]
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %.lr.ph38
  %.lcssa3 = phi double [ %33, %.lr.ph38 ], [ %.lcssa55, %._crit_edge46.loopexit ]
  store double %.lcssa3, double* %32, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3036, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next31, 2000
  br i1 %exitcond36, label %._crit_edge46._crit_edge, label %.lr.ph38

._crit_edge46._crit_edge:                         ; preds = %._crit_edge46
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3439, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond6, label %._crit_edge46._crit_edge._crit_edge, label %.._crit_edge_crit_edge

._crit_edge46._crit_edge._crit_edge:              ; preds = %._crit_edge46._crit_edge
  br label %52

; <label>:52:                                     ; preds = %._crit_edge17, %._crit_edge46._crit_edge._crit_edge
  %indvars.iv1019 = phi i64 [ 0, %._crit_edge46._crit_edge._crit_edge ], [ %indvars.iv.next11, %._crit_edge17 ]
  %53 = add i64 %indvars.iv1019, -1
  %54 = getelementptr inbounds double, double* %1, i64 %indvars.iv1019
  %55 = load double, double* %54, align 8
  %exitcond13 = icmp eq i64 %indvars.iv1019, 0
  br i1 %exitcond13, label %._crit_edge17, label %..lr.ph16_crit_edge

..lr.ph16_crit_edge:                              ; preds = %52
  %xtraiter56 = and i64 %indvars.iv1019, 3
  %lcmp.mod57 = icmp eq i64 %xtraiter56, 0
  br i1 %lcmp.mod57, label %.lr.ph16.prol.loopexit, label %.lr.ph16.prol.preheader

.lr.ph16.prol.preheader:                          ; preds = %..lr.ph16_crit_edge
  br label %.lr.ph16.prol

.lr.ph16.prol:                                    ; preds = %.lr.ph16.prol, %.lr.ph16.prol.preheader
  %56 = phi double [ %55, %.lr.ph16.prol.preheader ], [ %62, %.lr.ph16.prol ]
  %indvars.iv14.prol = phi i64 [ 0, %.lr.ph16.prol.preheader ], [ %indvars.iv.next.prol, %.lr.ph16.prol ]
  %prol.iter58 = phi i64 [ %xtraiter56, %.lr.ph16.prol.preheader ], [ %prol.iter58.sub, %.lr.ph16.prol ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1019, i64 %indvars.iv14.prol
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %3, i64 %indvars.iv14.prol
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fsub double %56, %61
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  %prol.iter58.sub = add i64 %prol.iter58, -1
  %prol.iter58.cmp = icmp eq i64 %prol.iter58.sub, 0
  br i1 %prol.iter58.cmp, label %.lr.ph16.prol.loopexit.unr-lcssa, label %.lr.ph16.prol, !llvm.loop !26

.lr.ph16.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph16.prol
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol.loopexit:                           ; preds = %.lr.ph16.prol.loopexit.unr-lcssa, %..lr.ph16_crit_edge
  %.lcssa53.unr = phi double [ undef, %..lr.ph16_crit_edge ], [ %62, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %.unr59 = phi double [ %55, %..lr.ph16_crit_edge ], [ %62, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %indvars.iv14.unr = phi i64 [ 0, %..lr.ph16_crit_edge ], [ %indvars.iv.next.prol, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %63 = icmp ult i64 %53, 3
  br i1 %63, label %._crit_edge17.loopexit, label %..lr.ph16_crit_edge.new

..lr.ph16_crit_edge.new:                          ; preds = %.lr.ph16.prol.loopexit
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16, %..lr.ph16_crit_edge.new
  %64 = phi double [ %.unr59, %..lr.ph16_crit_edge.new ], [ %88, %.lr.ph16 ]
  %indvars.iv14 = phi i64 [ %indvars.iv14.unr, %..lr.ph16_crit_edge.new ], [ %indvars.iv.next.3, %.lr.ph16 ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1019, i64 %indvars.iv14
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fsub double %64, %69
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1019, i64 %indvars.iv.next
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fsub double %70, %75
  %indvars.iv.next.1 = add nsw i64 %indvars.iv14, 2
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1019, i64 %indvars.iv.next.1
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fsub double %76, %81
  %indvars.iv.next.2 = add nsw i64 %indvars.iv14, 3
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1019, i64 %indvars.iv.next.2
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.2
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fsub double %82, %87
  %indvars.iv.next.3 = add nsw i64 %indvars.iv14, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1019
  br i1 %exitcond.3, label %._crit_edge17.loopexit.unr-lcssa, label %.lr.ph16

._crit_edge17.loopexit.unr-lcssa:                 ; preds = %.lr.ph16
  br label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge17.loopexit.unr-lcssa, %.lr.ph16.prol.loopexit
  %.lcssa53 = phi double [ %.lcssa53.unr, %.lr.ph16.prol.loopexit ], [ %88, %._crit_edge17.loopexit.unr-lcssa ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %52
  %.lcssa1 = phi double [ %55, %52 ], [ %.lcssa53, %._crit_edge17.loopexit ]
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv1019
  store double %.lcssa1, double* %89, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1019, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond5, label %90, label %52

; <label>:90:                                     ; preds = %._crit_edge17
  %91 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  br label %92

; <label>:92:                                     ; preds = %._crit_edge10, %90
  %indvar = phi i64 [ %indvar.next, %._crit_edge10 ], [ 0, %90 ]
  %indvars.iv.next712 = phi i64 [ %indvars.iv.next7, %._crit_edge10 ], [ 1999, %90 ]
  %indvars.iv611 = phi i64 [ %indvars.iv.next712, %._crit_edge10 ], [ 2000, %90 ]
  %93 = add i64 %indvar, -1
  %sunkaddr37 = shl i64 %indvars.iv611, 3
  %sunkaddr38 = add i64 %91, %sunkaddr37
  %sunkaddr39 = add i64 %sunkaddr38, -8
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  %94 = load double, double* %sunkaddr40, align 8
  %exitcond47 = icmp eq i64 %indvars.iv611, 2000
  br i1 %exitcond47, label %._crit_edge10, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %92
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %95 = phi double [ %94, %.lr.ph.prol.preheader ], [ %101, %.lr.ph.prol ]
  %indvars.iv48.prol = phi i64 [ %indvars.iv611, %.lr.ph.prol.preheader ], [ %indvars.iv.next5.prol, %.lr.ph.prol ]
  %prol.iter = phi i64 [ %xtraiter, %.lr.ph.prol.preheader ], [ %prol.iter.sub, %.lr.ph.prol ]
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next712, i64 %indvars.iv48.prol
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %2, i64 %indvars.iv48.prol
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fsub double %95, %100
  %indvars.iv.next5.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !27

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa, %..lr.ph_crit_edge
  %.lcssa52.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %101, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %94, %..lr.ph_crit_edge ], [ %101, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv48.unr = phi i64 [ %indvars.iv611, %..lr.ph_crit_edge ], [ %indvars.iv.next5.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %102 = icmp ult i64 %93, 3
  br i1 %102, label %._crit_edge10.loopexit, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %103 = phi double [ %.unr, %..lr.ph_crit_edge.new ], [ %127, %.lr.ph ]
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next5.3, %.lr.ph ]
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next712, i64 %indvars.iv48
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = fsub double %103, %108
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv48, 1
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next712, i64 %indvars.iv.next5
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next5
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fsub double %109, %114
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv48, 2
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next712, i64 %indvars.iv.next5.1
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next5.1
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fsub double %115, %120
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv48, 3
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next712, i64 %indvars.iv.next5.2
  %123 = load double, double* %122, align 8
  %124 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next5.2
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fsub double %121, %126
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv48, 4
  %exitcond4.3 = icmp eq i64 %indvars.iv.next5.3, 2000
  br i1 %exitcond4.3, label %._crit_edge10.loopexit.unr-lcssa, label %.lr.ph

._crit_edge10.loopexit.unr-lcssa:                 ; preds = %.lr.ph
  br label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge10.loopexit.unr-lcssa, %.lr.ph.prol.loopexit
  %.lcssa52 = phi double [ %.lcssa52.unr, %.lr.ph.prol.loopexit ], [ %127, %._crit_edge10.loopexit.unr-lcssa ]
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %92
  %.lcssa = phi double [ %94, %92 ], [ %.lcssa52, %._crit_edge10.loopexit ]
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next712, i64 %indvars.iv.next712
  %129 = load double, double* %128, align 8
  %130 = fdiv double %.lcssa, %129
  %sunkaddr41 = shl i64 %indvars.iv611, 3
  %sunkaddr42 = add i64 %sunkaddr, %sunkaddr41
  %sunkaddr46 = add i64 %sunkaddr42, -8
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  store double %130, double* %sunkaddr47, align 8
  %indvars.iv.next7 = add nsw i64 %indvars.iv.next712, -1
  %131 = icmp sgt i64 %indvars.iv.next712, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %131, label %92, label %132

; <label>:132:                                    ; preds = %._crit_edge10
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv1 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %6

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!26 = distinct !{!26, !2}
!27 = distinct !{!27, !2}
