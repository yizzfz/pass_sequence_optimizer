; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array([1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader35

.preheader35:                                     ; preds = %23, %5
  %indvars.iv4045 = phi i64 [ 0, %5 ], [ %indvars.iv.next41, %23 ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader35
  %indvars.iv3844 = phi i64 [ 0, %.preheader35 ], [ %indvars.iv.next39, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv3844, %indvars.iv4045
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4045, i64 %indvars.iv3844
  %13 = add nuw nsw i64 %7, 2
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.000000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %12, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv4045, i64 %indvars.iv3844
  store double %21, double* %22, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3844, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond47, label %23, label %6

; <label>:23:                                     ; preds = %6
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv4045, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond48, label %.preheader.preheader, label %.preheader35

.preheader.preheader:                             ; preds = %23
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %32
  %indvars.iv3643 = phi i64 [ %indvars.iv.next37, %32 ], [ 0, %.preheader.preheader ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader
  %indvars.iv42 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %24 ]
  %25 = mul nuw nsw i64 %indvars.iv42, %indvars.iv3643
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3643, i64 %indvars.iv42
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %32, label %24

; <label>:32:                                     ; preds = %24
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv3643, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond46, label %33, label %.preheader

; <label>:33:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %6 = insertelement <2 x double> undef, double %1, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %1, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = insertelement <2 x double> undef, double %1, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader35

.preheader35:                                     ; preds = %96, %5
  %indvars.iv = phi i2 [ %indvars.iv.next, %96 ], [ 1, %5 ]
  %indvars.iv4654 = phi i64 [ %indvars.iv.next47, %96 ], [ 1, %5 ]
  %indvars.iv4853 = phi i64 [ %17, %96 ], [ 0, %5 ]
  %12 = add nsw i64 %indvars.iv4853, -3
  %13 = zext i2 %indvars.iv to i64
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 0
  %14 = mul nuw nsw i64 %indvars.iv4853, 1201
  %15 = add nuw nsw i64 %14, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %15
  %16 = add nuw nsw i64 %indvars.iv4853, 1
  %17 = add nuw nsw i64 %indvars.iv4853, 1
  %xtraiter = and i64 %17, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader35
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv50.prol
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %1
  store double %20, double* %18, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader35
  %indvars.iv50.unr = phi i64 [ 0, %.preheader35 ], [ %13, %.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %indvars.iv4853, 3
  br i1 %21, label %.preheader.preheader, label %.preheader35.new.preheader

.preheader35.new.preheader:                       ; preds = %.prol.loopexit
  %22 = sub i64 %12, %indvars.iv50.unr
  %23 = lshr i64 %22, 2
  %24 = and i64 %23, 1
  %lcmp.mod29 = icmp eq i64 %24, 0
  br i1 %lcmp.mod29, label %.preheader35.new.prol.preheader, label %.preheader35.new.prol.loopexit.unr-lcssa

.preheader35.new.prol.preheader:                  ; preds = %.preheader35.new.preheader
  br label %.preheader35.new.prol

.preheader35.new.prol:                            ; preds = %.preheader35.new.prol.preheader
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv50.unr
  %26 = bitcast double* %25 to <2 x double>*
  %27 = load <2 x double>, <2 x double>* %26, align 8
  %28 = fmul <2 x double> %27, %7
  store <2 x double> %28, <2 x double>* %26, align 8
  %indvars.iv.next.1.prol = add nuw nsw i64 %indvars.iv50.unr, 2
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv.next.1.prol
  %30 = bitcast double* %29 to <2 x double>*
  %31 = load <2 x double>, <2 x double>* %30, align 8
  %32 = fmul <2 x double> %31, %7
  store <2 x double> %32, <2 x double>* %30, align 8
  %indvars.iv.next.3.prol = or i64 %indvars.iv50.unr, 4
  br label %.preheader35.new.prol.loopexit.unr-lcssa

.preheader35.new.prol.loopexit.unr-lcssa:         ; preds = %.preheader35.new.preheader, %.preheader35.new.prol
  %indvars.iv50.unr31.ph = phi i64 [ %indvars.iv.next.3.prol, %.preheader35.new.prol ], [ %indvars.iv50.unr, %.preheader35.new.preheader ]
  br label %.preheader35.new.prol.loopexit

.preheader35.new.prol.loopexit:                   ; preds = %.preheader35.new.prol.loopexit.unr-lcssa
  %33 = icmp eq i64 %23, 0
  br i1 %33, label %.preheader.preheader.loopexit, label %.preheader35.new.preheader.new

.preheader35.new.preheader.new:                   ; preds = %.preheader35.new.prol.loopexit
  br label %.preheader35.new

.preheader35.new:                                 ; preds = %.preheader35.new, %.preheader35.new.preheader.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr31.ph, %.preheader35.new.preheader.new ], [ %indvars.iv.next.3.1, %.preheader35.new ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv50
  %35 = bitcast double* %34 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %35, align 8
  %37 = fmul <2 x double> %36, %9
  store <2 x double> %37, <2 x double>* %35, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv50, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv.next.1
  %39 = bitcast double* %38 to <2 x double>*
  %40 = load <2 x double>, <2 x double>* %39, align 8
  %41 = fmul <2 x double> %40, %9
  store <2 x double> %41, <2 x double>* %39, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv50, 4
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv.next.3
  %43 = bitcast double* %42 to <2 x double>*
  %44 = load <2 x double>, <2 x double>* %43, align 8
  %45 = fmul <2 x double> %44, %11
  store <2 x double> %45, <2 x double>* %43, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv50, 6
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv.next.1.1
  %47 = bitcast double* %46 to <2 x double>*
  %48 = load <2 x double>, <2 x double>* %47, align 8
  %49 = fmul <2 x double> %48, %11
  store <2 x double> %49, <2 x double>* %47, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv50, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv4654
  br i1 %exitcond.3.1, label %.preheader.preheader.loopexit.unr-lcssa, label %.preheader35.new

.preheader.preheader.loopexit.unr-lcssa:          ; preds = %.preheader35.new
  br label %.preheader.preheader.loopexit

.preheader.preheader.loopexit:                    ; preds = %.preheader35.new.prol.loopexit, %.preheader.preheader.loopexit.unr-lcssa
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %.prol.loopexit
  %min.iters.check = icmp ult i64 %16, 2
  %n.vec = and i64 %16, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %16, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv4452 = phi i64 [ %indvars.iv.next45, %.loopexit ], [ 0, %.preheader.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv4452
  %50 = add nuw nsw i64 %indvars.iv4452, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv4853, i64 %50
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv4452
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv4853, i64 %50
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv4853, i64 %indvars.iv4452
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4853, i64 %indvars.iv4452
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %52
  %bound1 = icmp ult double* %52, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %51
  %bound123 = icmp ult double* %51, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %53 = load double, double* %51, align 8, !alias.scope !3
  %54 = insertelement <2 x double> undef, double %53, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = load double, double* %52, align 8, !alias.scope !6
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %59 = or i64 %index, 1
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv4452
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %59, i64 %indvars.iv4452
  %62 = load double, double* %60, align 8, !alias.scope !8
  %63 = load double, double* %61, align 8, !alias.scope !8
  %64 = insertelement <2 x double> undef, double %62, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fmul <2 x double> %65, %broadcast.splat27
  %67 = fmul <2 x double> %66, %55
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv4452
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %59, i64 %indvars.iv4452
  %70 = load double, double* %68, align 8, !alias.scope !10
  %71 = load double, double* %69, align 8, !alias.scope !10
  %72 = insertelement <2 x double> undef, double %70, i32 0
  %73 = insertelement <2 x double> %72, double %71, i32 1
  %74 = fmul <2 x double> %73, %broadcast.splat27
  %75 = fmul <2 x double> %74, %58
  %76 = fadd <2 x double> %67, %75
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !12, !noalias !14
  %79 = fadd <2 x double> %wide.load, %76
  %80 = bitcast double* %77 to <2 x double>*
  store <2 x double> %79, <2 x double>* %80, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 2
  %81 = icmp eq i64 %index.next, %n.vec
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv3851.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv3851 = phi i64 [ %indvars.iv.next39, %scalar.ph ], [ %indvars.iv3851.ph, %scalar.ph.preheader ]
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3851, i64 %indvars.iv4452
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %0
  %85 = load double, double* %51, align 8
  %86 = fmul double %84, %85
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv3851, i64 %indvars.iv4452
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %0
  %90 = load double, double* %52, align 8
  %91 = fmul double %89, %90
  %92 = fadd double %86, %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853, i64 %indvars.iv3851
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %92
  store double %95, double* %93, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3851, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next39, %indvars.iv4654
  br i1 %exitcond43, label %.loopexit.loopexit, label %scalar.ph, !llvm.loop !18

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv4452, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond55, label %96, label %.preheader

; <label>:96:                                     ; preds = %.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4654, 1
  %exitcond56 = icmp eq i64 %17, 1200
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond56, label %97, label %.preheader35

; <label>:97:                                     ; preds = %96
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv1114 = phi i64 [ 0, %1 ], [ %indvars.iv.next12, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv1114, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv13, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1114, i64 %indvars.iv13
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1114, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond15, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!11}
!11 = distinct !{!11, !5}
!12 = !{!13}
!13 = distinct !{!13, !5}
!14 = !{!7, !9, !11, !4}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !16, !17}
