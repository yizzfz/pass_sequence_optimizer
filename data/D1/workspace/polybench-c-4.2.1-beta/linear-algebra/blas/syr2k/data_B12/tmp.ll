; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %5, %19
  %indvars.iv915 = phi i64 [ 0, %5 ], [ %indvars.iv.next10, %19 ]
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %.preheader2
  %indvars.iv614 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next7, %.preheader2 ]
  %6 = mul nuw nsw i64 %indvars.iv614, %indvars.iv915
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv915, i64 %indvars.iv614
  store double %11, double* %12, align 8
  %13 = add nuw nsw i64 %6, 2
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+03
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv915, i64 %indvars.iv614
  store double %17, double* %18, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv614, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %19, label %.preheader2

; <label>:19:                                     ; preds = %.preheader2
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv915, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond11, label %.preheader.preheader.preheader, label %.preheader2.preheader

.preheader.preheader.preheader:                   ; preds = %19
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader1
  %indvars.iv313 = phi i64 [ %indvars.iv.next4, %.preheader1 ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv12, %indvars.iv313
  %21 = add nuw nsw i64 %20, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1200
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv313, i64 %indvars.iv12
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.preheader1, label %.preheader

.preheader1:                                      ; preds = %.preheader
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond5, label %27, label %.preheader.preheader

; <label>:27:                                     ; preds = %.preheader1
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert73 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat74 = shufflevector <2 x double> %broadcast.splatinsert73, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert52 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat53 = shufflevector <2 x double> %broadcast.splatinsert52, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %5, %93
  %indvars.iv = phi i2 [ 1, %5 ], [ %indvars.iv.next26, %93 ]
  %indvars.iv1423 = phi i64 [ 1, %5 ], [ %indvars.iv.next15, %93 ]
  %indvars.iv1622 = phi i64 [ 0, %5 ], [ %9, %93 ]
  %6 = add i64 %indvars.iv1622, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 0
  %7 = mul i64 %indvars.iv1622, 1201
  %8 = add i64 %7, 1
  %scevgep28 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %8
  %9 = add i64 %indvars.iv1622, 1
  %10 = zext i2 %indvars.iv to i64
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader2.prol.loopexit, label %.preheader2.prol.preheader

.preheader2.prol.preheader:                       ; preds = %.preheader2.preheader
  br label %.preheader2.prol

.preheader2.prol:                                 ; preds = %.preheader2.prol.preheader, %.preheader2.prol
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next.prol, %.preheader2.prol ], [ 0, %.preheader2.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader2.prol ], [ %xtraiter, %.preheader2.prol.preheader ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %indvars.iv19.prol
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %1
  store double %13, double* %11, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader2.prol.loopexit.loopexit, label %.preheader2.prol, !llvm.loop !1

.preheader2.prol.loopexit.loopexit:               ; preds = %.preheader2.prol
  br label %.preheader2.prol.loopexit

.preheader2.prol.loopexit:                        ; preds = %.preheader2.prol.loopexit.loopexit, %.preheader2.preheader
  %indvars.iv19.unr = phi i64 [ 0, %.preheader2.preheader ], [ %10, %.preheader2.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %indvars.iv1622, 3
  br i1 %14, label %.preheader.preheader.preheader, label %.preheader2.preheader25

.preheader2.preheader25:                          ; preds = %.preheader2.prol.loopexit
  %15 = sub i64 %6, %indvars.iv19.unr
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check57 = icmp ult i64 %17, 2
  br i1 %min.iters.check57, label %.preheader2.preheader76, label %min.iters.checked58

min.iters.checked58:                              ; preds = %.preheader2.preheader25
  %n.mod.vf59 = and i64 %17, 1
  %n.vec60 = sub nsw i64 %17, %n.mod.vf59
  %cmp.zero61 = icmp eq i64 %n.vec60, 0
  %18 = or i64 %indvars.iv19.unr, 4
  %19 = shl nuw i64 %16, 2
  %20 = add i64 %18, %19
  %21 = shl nuw nsw i64 %n.mod.vf59, 2
  %ind.end = sub i64 %20, %21
  br i1 %cmp.zero61, label %.preheader2.preheader76, label %vector.ph62

vector.ph62:                                      ; preds = %min.iters.checked58
  br label %vector.body54

vector.body54:                                    ; preds = %vector.body54, %vector.ph62
  %index63 = phi i64 [ 0, %vector.ph62 ], [ %index.next64, %vector.body54 ]
  %22 = shl i64 %index63, 2
  %offset.idx = or i64 %indvars.iv19.unr, %22
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %offset.idx
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %24, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec70 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec71 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %25 = fmul <2 x double> %strided.vec, %broadcast.splat74
  %26 = fmul <2 x double> %strided.vec70, %broadcast.splat74
  %27 = fmul <2 x double> %strided.vec71, %broadcast.splat74
  %28 = add nsw i64 %offset.idx, 3
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %28
  %30 = fmul <2 x double> %strided.vec72, %broadcast.splat74
  %31 = getelementptr double, double* %29, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  %33 = shufflevector <2 x double> %25, <2 x double> %26, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %34 = shufflevector <2 x double> %27, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %33, <4 x double> %34, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8
  %index.next64 = add i64 %index63, 2
  %35 = icmp eq i64 %index.next64, %n.vec60
  br i1 %35, label %middle.block55, label %vector.body54, !llvm.loop !3

middle.block55:                                   ; preds = %vector.body54
  %cmp.n66 = icmp eq i64 %n.mod.vf59, 0
  br i1 %cmp.n66, label %.preheader.preheader.preheader, label %.preheader2.preheader76

.preheader2.preheader76:                          ; preds = %middle.block55, %min.iters.checked58, %.preheader2.preheader25
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked58 ], [ %indvars.iv19.unr, %.preheader2.preheader25 ], [ %ind.end, %middle.block55 ]
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader76, %.preheader2
  %indvars.iv19 = phi i64 [ %indvars.iv.next.3, %.preheader2 ], [ %indvars.iv19.ph, %.preheader2.preheader76 ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %indvars.iv19
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %1
  store double %38, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %1
  store double %41, double* %39, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv19, 2
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %1
  store double %44, double* %42, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv19, 3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %indvars.iv.next.2
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %1
  store double %47, double* %45, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv19, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1423
  br i1 %exitcond.3, label %.preheader.preheader.preheader.loopexit, label %.preheader2, !llvm.loop !6

.preheader.preheader.preheader.loopexit:          ; preds = %.preheader2
  br label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader.preheader.preheader.loopexit, %middle.block55, %.preheader2.prol.loopexit
  %min.iters.check = icmp ult i64 %9, 2
  %n.vec = and i64 %9, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader1
  %indvars.iv1121 = phi i64 [ %48, %.preheader1 ], [ 0, %.preheader.preheader.preheader ]
  %scevgep30 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv1121
  %48 = add i64 %indvars.iv1121, 1
  %scevgep32 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv1622, i64 %48
  %scevgep34 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv1121
  %scevgep36 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv1622, i64 %48
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1622, i64 %indvars.iv1121
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1622, i64 %indvars.iv1121
  br i1 %min.iters.check, label %.preheader.preheader75, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.preheader
  br i1 %cmp.zero, label %.preheader.preheader75, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %50
  %bound1 = icmp ult double* %50, %scevgep28
  %found.conflict = and i1 %bound0, %bound1
  %bound039 = icmp ult double* %scevgep, %scevgep32
  %bound140 = icmp ult double* %scevgep30, %scevgep28
  %found.conflict41 = and i1 %bound039, %bound140
  %conflict.rdx = or i1 %found.conflict, %found.conflict41
  %bound042 = icmp ult double* %scevgep, %scevgep36
  %bound143 = icmp ult double* %scevgep34, %scevgep28
  %found.conflict44 = and i1 %bound042, %bound143
  %conflict.rdx45 = or i1 %conflict.rdx, %found.conflict44
  %bound048 = icmp ult double* %scevgep, %49
  %bound149 = icmp ult double* %49, %scevgep28
  %found.conflict50 = and i1 %bound048, %bound149
  %conflict.rdx51 = or i1 %conflict.rdx45, %found.conflict50
  br i1 %conflict.rdx51, label %.preheader.preheader75, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %51 = or i64 %index, 1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv1121
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %51, i64 %indvars.iv1121
  %54 = load double, double* %52, align 8, !alias.scope !8
  %55 = load double, double* %53, align 8, !alias.scope !8
  %56 = insertelement <2 x double> undef, double %54, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  %58 = fmul <2 x double> %57, %broadcast.splat53
  %59 = load double, double* %49, align 8, !alias.scope !11
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = fmul <2 x double> %58, %61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv1121
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %51, i64 %indvars.iv1121
  %65 = load double, double* %63, align 8, !alias.scope !13
  %66 = load double, double* %64, align 8, !alias.scope !13
  %67 = insertelement <2 x double> undef, double %65, i32 0
  %68 = insertelement <2 x double> %67, double %66, i32 1
  %69 = fmul <2 x double> %68, %broadcast.splat53
  %70 = load double, double* %50, align 8, !alias.scope !15
  %71 = insertelement <2 x double> undef, double %70, i32 0
  %72 = shufflevector <2 x double> %71, <2 x double> undef, <2 x i32> zeroinitializer
  %73 = fmul <2 x double> %69, %72
  %74 = fadd <2 x double> %62, %73
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !17, !noalias !19
  %77 = fadd <2 x double> %wide.load, %74
  store <2 x double> %77, <2 x double>* %76, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %78 = icmp eq i64 %index.next, %n.vec
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.preheader1, label %.preheader.preheader75

.preheader.preheader75:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.preheader
  %indvars.iv520.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.preheader ], [ %n.vec, %middle.block ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader75, %.preheader
  %indvars.iv520 = phi i64 [ %indvars.iv.next6, %.preheader ], [ %indvars.iv520.ph, %.preheader.preheader75 ]
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv520, i64 %indvars.iv1121
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %0
  %82 = load double, double* %49, align 8
  %83 = fmul double %81, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv520, i64 %indvars.iv1121
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %0
  %87 = load double, double* %50, align 8
  %88 = fmul double %86, %87
  %89 = fadd double %83, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1622, i64 %indvars.iv520
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv520, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next6, %indvars.iv1423
  br i1 %exitcond10, label %.preheader1.loopexit, label %.preheader, !llvm.loop !21

.preheader1.loopexit:                             ; preds = %.preheader
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %middle.block
  %exitcond13 = icmp eq i64 %48, 1000
  br i1 %exitcond13, label %93, label %.preheader.preheader

; <label>:93:                                     ; preds = %.preheader1
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1423, 1
  %exitcond18 = icmp eq i64 %9, 1200
  %indvars.iv.next26 = add i2 %indvars.iv, 1
  br i1 %exitcond18, label %94, label %.preheader2.preheader

; <label>:94:                                     ; preds = %93
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %1, %18
  %indvars.iv15 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv15, 1200
  br label %7

; <label>:7:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nuw nsw i64 %indvars.iv4, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.preheader

.preheader:                                       ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv4
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %.preheader
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %19, label %.preheader.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!16, !9, !14, !12}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
