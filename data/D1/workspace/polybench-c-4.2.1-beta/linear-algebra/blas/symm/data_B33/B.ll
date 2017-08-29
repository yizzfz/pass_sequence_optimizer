; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge18

.._crit_edge_crit_edge18:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge18, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader7.preheader

.preheader7.preheader:                            ; preds = %..preheader7.preheader_crit_edge, %7
  %indvars.iv60 = phi i64 [ 0, %7 ], [ %indvars.iv.next61, %..preheader7.preheader_crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv60, 1200
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7..preheader7_crit_edge, %.preheader7.preheader
  %indvars.iv57 = phi i64 [ 0, %.preheader7.preheader ], [ %indvars.iv.next58, %.preheader7..preheader7_crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv57, %indvars.iv60
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv60, i64 %indvars.iv57
  store double %13, double* %14, align 8
  %15 = sub nuw nsw i64 %8, %indvars.iv57
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv60, i64 %indvars.iv57
  store double %19, double* %20, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next58, 1200
  br i1 %exitcond59, label %21, label %.preheader7..preheader7_crit_edge

.preheader7..preheader7_crit_edge:                ; preds = %.preheader7
  br label %.preheader7

; <label>:21:                                     ; preds = %.preheader7
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next61, 1000
  br i1 %exitcond62, label %.lr.ph.preheader, label %..preheader7.preheader_crit_edge

..preheader7.preheader_crit_edge:                 ; preds = %21
  br label %.preheader7.preheader

.lr.ph.preheader:                                 ; preds = %21
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader6..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %.preheader6..lr.ph_crit_edge ], [ 1, %.lr.ph.preheader ]
  %indvars.iv54 = phi i64 [ %indvars.iv.next5566, %.preheader6..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %22 = sub i64 999, %indvars.iv54
  %23 = sub i64 998, %indvars.iv54
  %24 = and i64 %indvars.iv54, 1
  %lcmp.mod = icmp eq i64 %24, 0
  br i1 %lcmp.mod, label %.preheader5.prol, label %.lr.ph..preheader5.prol.loopexit_crit_edge

.lr.ph..preheader5.prol.loopexit_crit_edge:       ; preds = %.lr.ph
  br label %.preheader5.prol.loopexit

.preheader5.prol:                                 ; preds = %.lr.ph
  %25 = trunc i64 %indvars.iv54 to i32
  %26 = srem i32 %25, 100
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 0
  store double %28, double* %29, align 8
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.lr.ph..preheader5.prol.loopexit_crit_edge, %.preheader5.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.preheader5.prol ], [ 0, %.lr.ph..preheader5.prol.loopexit_crit_edge ]
  %30 = icmp eq i64 %indvars.iv54, 0
  br i1 %30, label %.preheader5.prol.loopexit..lr.ph41_crit_edge, label %.preheader5.preheader

.preheader5.prol.loopexit..lr.ph41_crit_edge:     ; preds = %.preheader5.prol.loopexit
  br label %.lr.ph41

.preheader5.preheader:                            ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader.preheader:                             ; preds = %.preheader5
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %31 = icmp slt i64 %indvars.iv.next55, 1000
  br i1 %31, label %.preheader.preheader..lr.ph41_crit_edge, label %.preheader.preheader..preheader6_crit_edge

.preheader.preheader..preheader6_crit_edge:       ; preds = %.preheader.preheader
  br label %.preheader6

.preheader.preheader..lr.ph41_crit_edge:          ; preds = %.preheader.preheader
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.preheader.preheader..lr.ph41_crit_edge, %.preheader5.prol.loopexit..lr.ph41_crit_edge
  %indvars.iv.next5567 = phi i64 [ %indvars.iv.next55, %.preheader.preheader..lr.ph41_crit_edge ], [ 1, %.preheader5.prol.loopexit..lr.ph41_crit_edge ]
  %xtraiter63 = and i64 %22, 7
  %lcmp.mod64 = icmp eq i64 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.lr.ph41..preheader.prol.loopexit_crit_edge, label %.preheader.prol.preheader

.lr.ph41..preheader.prol.loopexit_crit_edge:      ; preds = %.lr.ph41
  br label %.preheader.prol.loopexit

.preheader.prol.preheader:                        ; preds = %.lr.ph41
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol..preheader.prol_crit_edge, %.preheader.prol.preheader
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %.preheader.prol..preheader.prol_crit_edge ], [ %indvars.iv69, %.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.prol..preheader.prol_crit_edge ], [ %xtraiter63, %.preheader.prol.preheader ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv49.prol
  store double -9.990000e+02, double* %32, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv49.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.loopexit, label %.preheader.prol..preheader.prol_crit_edge, !llvm.loop !1

.preheader.prol..preheader.prol_crit_edge:        ; preds = %.preheader.prol
  br label %.preheader.prol

.preheader.prol.loopexit.loopexit:                ; preds = %.preheader.prol
  %33 = add i64 %indvars.iv69, %xtraiter63
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.lr.ph41..preheader.prol.loopexit_crit_edge, %.preheader.prol.loopexit.loopexit
  %indvars.iv49.unr = phi i64 [ %indvars.iv69, %.lr.ph41..preheader.prol.loopexit_crit_edge ], [ %33, %.preheader.prol.loopexit.loopexit ]
  %34 = icmp ult i64 %23, 7
  br i1 %34, label %.preheader.prol.loopexit..preheader6_crit_edge, label %.preheader.preheader71

.preheader.prol.loopexit..preheader6_crit_edge:   ; preds = %.preheader.prol.loopexit
  br label %.preheader6

.preheader.preheader71:                           ; preds = %.preheader.prol.loopexit
  %35 = sub i64 992, %indvars.iv49.unr
  %36 = lshr i64 %35, 3
  %37 = add nuw nsw i64 %36, 1
  %min.iters.check = icmp ult i64 %37, 2
  br i1 %min.iters.check, label %.preheader.preheader71..preheader.preheader72_crit_edge, label %min.iters.checked

.preheader.preheader71..preheader.preheader72_crit_edge: ; preds = %.preheader.preheader71
  br label %.preheader.preheader72

.preheader.preheader72:                           ; preds = %middle.block..preheader.preheader72_crit_edge, %min.iters.checked..preheader.preheader72_crit_edge, %.preheader.preheader71..preheader.preheader72_crit_edge
  %indvars.iv49.ph = phi i64 [ %indvars.iv49.unr, %min.iters.checked..preheader.preheader72_crit_edge ], [ %indvars.iv49.unr, %.preheader.preheader71..preheader.preheader72_crit_edge ], [ %ind.end, %middle.block..preheader.preheader72_crit_edge ]
  br label %.preheader

min.iters.checked:                                ; preds = %.preheader.preheader71
  %n.mod.vf = and i64 %37, 1
  %n.vec = sub nsw i64 %37, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %38 = add i64 %indvars.iv49.unr, 8
  %39 = shl nuw i64 %36, 3
  %40 = add i64 %38, %39
  %41 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %40, %41
  br i1 %cmp.zero, label %min.iters.checked..preheader.preheader72_crit_edge, label %vector.body.preheader

min.iters.checked..preheader.preheader72_crit_edge: ; preds = %min.iters.checked
  br label %.preheader.preheader72

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %42 = shl i64 %index, 3
  %43 = add i64 %indvars.iv49.unr, %42
  %44 = add nsw i64 %43, 7
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %44
  %46 = getelementptr double, double* %45, i64 -7
  %47 = bitcast double* %46 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %47, align 8
  %index.next = add i64 %index, 2
  %48 = icmp eq i64 %index.next, %n.vec
  br i1 %48, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader6_crit_edge, label %middle.block..preheader.preheader72_crit_edge

middle.block..preheader.preheader72_crit_edge:    ; preds = %middle.block
  br label %.preheader.preheader72

middle.block..preheader6_crit_edge:               ; preds = %middle.block
  br label %.preheader6

.preheader5:                                      ; preds = %.preheader5..preheader5_crit_edge, %.preheader5.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader5..preheader5_crit_edge ], [ %indvars.iv.unr.ph, %.preheader5.preheader ]
  %49 = add nuw nsw i64 %indvars.iv, %indvars.iv54
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, 100
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, 1.000000e+03
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = add nuw nsw i64 %indvars.iv.next, %indvars.iv54
  %56 = trunc i64 %55 to i32
  %57 = srem i32 %56, 100
  %58 = sitofp i32 %57 to double
  %59 = fdiv double %58, 1.000000e+03
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next
  store double %59, double* %60, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv69
  br i1 %exitcond.1, label %.preheader.preheader, label %.preheader5..preheader5_crit_edge

.preheader5..preheader5_crit_edge:                ; preds = %.preheader5
  br label %.preheader5

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader72
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.7, %.preheader..preheader_crit_edge ], [ %indvars.iv49.ph, %.preheader.preheader72 ]
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv49
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next50
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next50.1
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next50.2
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, 4
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next50.3
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next50.4 = add nsw i64 %indvars.iv49, 5
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next50.4
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next50.5 = add nsw i64 %indvars.iv49, 6
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next50.5
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next50.6 = add nsw i64 %indvars.iv49, 7
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv.next50.6
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next50.7 = add nsw i64 %indvars.iv49, 8
  %exitcond51.7 = icmp eq i64 %indvars.iv.next50.7, 1000
  br i1 %exitcond51.7, label %.preheader6.loopexit, label %.preheader..preheader_crit_edge, !llvm.loop !6

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader6.loopexit:                             ; preds = %.preheader
  br label %.preheader6

.preheader6:                                      ; preds = %middle.block..preheader6_crit_edge, %.preheader.prol.loopexit..preheader6_crit_edge, %.preheader.preheader..preheader6_crit_edge, %.preheader6.loopexit
  %indvars.iv.next5566 = phi i64 [ %indvars.iv.next55, %.preheader.preheader..preheader6_crit_edge ], [ %indvars.iv.next5567, %.preheader.prol.loopexit..preheader6_crit_edge ], [ %indvars.iv.next5567, %middle.block..preheader6_crit_edge ], [ %indvars.iv.next5567, %.preheader6.loopexit ]
  %indvars.iv.next70 = add nuw i64 %indvars.iv69, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next5566, 1000
  br i1 %exitcond56, label %69, label %.preheader6..lr.ph_crit_edge

.preheader6..lr.ph_crit_edge:                     ; preds = %.preheader6
  br label %.lr.ph

; <label>:69:                                     ; preds = %.preheader6
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  %8 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert74 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat75 = shufflevector <2 x double> %broadcast.splatinsert74, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert78 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat79 = shufflevector <2 x double> %broadcast.splatinsert78, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.us-lcssa.us..preheader.preheader_crit_edge, %7
  %indvars.iv55 = phi i64 [ 0, %7 ], [ %indvars.iv.next56, %.us-lcssa.us..preheader.preheader_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 0
  %9 = add i64 %indvars.iv55, 1
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %10 = icmp sgt i64 %indvars.iv55, 0
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv55, i64 %indvars.iv55
  br i1 %10, label %.preheader._crit_edge.preheader.us.preheader, label %vector.memcheck

.preheader._crit_edge.preheader.us.preheader:     ; preds = %.preheader.preheader
  br label %.preheader._crit_edge.preheader.us

vector.memcheck:                                  ; preds = %.preheader.preheader
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %6, i64 %9, i64 0
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv55, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep66
  %bound1 = icmp ult double* %scevgep64, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound069 = icmp ult double* %scevgep, %11
  %bound170 = icmp ult double* %11, %scevgep62
  %found.conflict71 = and i1 %bound069, %bound170
  %conflict.rdx = or i1 %found.conflict, %found.conflict71
  br i1 %conflict.rdx, label %.preheader._crit_edge.preheader.preheader, label %vector.ph

.preheader._crit_edge.preheader.preheader:        ; preds = %vector.memcheck
  br label %.preheader._crit_edge.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %12 = load double, double* %11, align 8, !alias.scope !8
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %12, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !11, !noalias !13
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !11, !noalias !13
  %21 = fmul <2 x double> %wide.load, %broadcast.splat75
  %22 = fmul <2 x double> %wide.load73, %broadcast.splat75
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv55, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !15
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !15
  %27 = fmul <2 x double> %wide.load76, %broadcast.splat79
  %28 = fmul <2 x double> %wide.load77, %broadcast.splat79
  %29 = fmul <2 x double> %27, %14
  %30 = fmul <2 x double> %28, %16
  %31 = fadd <2 x double> %21, %29
  %32 = fadd <2 x double> %22, %30
  %33 = fadd <2 x double> %broadcast.splat81, %31
  %34 = fadd <2 x double> %broadcast.splat81, %32
  %35 = bitcast double* %17 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !11, !noalias !13
  %36 = bitcast double* %19 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, 1200
  br i1 %37, label %.us-lcssa.us.loopexit83, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.preheader._crit_edge.preheader.us:               ; preds = %.preheader._crit_edge._crit_edge.us..preheader._crit_edge.preheader.us_crit_edge, %.preheader._crit_edge.preheader.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %.preheader._crit_edge._crit_edge.us..preheader._crit_edge.preheader.us_crit_edge ], [ 0, %.preheader._crit_edge.preheader.us.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv55, i64 %indvars.iv52
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us..preheader._crit_edge.us_crit_edge, %.preheader._crit_edge.preheader.us
  %indvars.iv47 = phi i64 [ 0, %.preheader._crit_edge.preheader.us ], [ %indvars.iv.next48, %.preheader._crit_edge.us..preheader._crit_edge.us_crit_edge ]
  %.039.us = phi double [ 0.000000e+00, %.preheader._crit_edge.preheader.us ], [ %51, %.preheader._crit_edge.us..preheader._crit_edge.us_crit_edge ]
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %2
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv55, i64 %indvars.iv47
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv52
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv47, i64 %indvars.iv52
  %48 = load double, double* %47, align 8
  %49 = load double, double* %41, align 8
  %50 = fmul double %48, %49
  %51 = fadd double %.039.us, %50
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next48, %indvars.iv55
  br i1 %exitcond51, label %.preheader._crit_edge._crit_edge.us, label %.preheader._crit_edge.us..preheader._crit_edge.us_crit_edge

.preheader._crit_edge.us..preheader._crit_edge.us_crit_edge: ; preds = %.preheader._crit_edge.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge._crit_edge.us:              ; preds = %.preheader._crit_edge.us
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv52
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %3
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv55, i64 %indvars.iv52
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %11, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %54, %59
  %61 = fmul double %51, %2
  %62 = fadd double %61, %60
  store double %62, double* %52, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond54, label %.us-lcssa.us.loopexit, label %.preheader._crit_edge._crit_edge.us..preheader._crit_edge.preheader.us_crit_edge

.preheader._crit_edge._crit_edge.us..preheader._crit_edge.preheader.us_crit_edge: ; preds = %.preheader._crit_edge._crit_edge.us
  br label %.preheader._crit_edge.preheader.us

.preheader._crit_edge.preheader:                  ; preds = %.preheader._crit_edge.preheader..preheader._crit_edge.preheader_crit_edge, %.preheader._crit_edge.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader._crit_edge.preheader.preheader ], [ %indvars.iv.next.1, %.preheader._crit_edge.preheader..preheader._crit_edge.preheader_crit_edge ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv55, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %11, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %8, %71
  store double %72, double* %63, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv55, i64 %indvars.iv.next
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %2
  %79 = load double, double* %11, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %75, %80
  %82 = fadd double %8, %81
  store double %82, double* %73, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %.us-lcssa.us.loopexit82, label %.preheader._crit_edge.preheader..preheader._crit_edge.preheader_crit_edge, !llvm.loop !17

.preheader._crit_edge.preheader..preheader._crit_edge.preheader_crit_edge: ; preds = %.preheader._crit_edge.preheader
  br label %.preheader._crit_edge.preheader

.us-lcssa.us.loopexit:                            ; preds = %.preheader._crit_edge._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit82:                          ; preds = %.preheader._crit_edge.preheader
  br label %.us-lcssa.us

.us-lcssa.us.loopexit83:                          ; preds = %vector.body
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit83, %.us-lcssa.us.loopexit82, %.us-lcssa.us.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond57, label %83, label %.us-lcssa.us..preheader.preheader_crit_edge

.us-lcssa.us..preheader.preheader_crit_edge:      ; preds = %.us-lcssa.us
  br label %.preheader.preheader

; <label>:83:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %..preheader.preheader_crit_edge, %3
  %indvars.iv11 = phi i64 [ 0, %3 ], [ %indvars.iv.next12, %..preheader.preheader_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv11, 1000
  br label %9

; <label>:9:                                      ; preds = %._crit_edge._crit_edge, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %9
  br label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %20, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %9

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond13, label %21, label %..preheader.preheader_crit_edge

..preheader.preheader_crit_edge:                  ; preds = %20
  br label %.preheader.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
