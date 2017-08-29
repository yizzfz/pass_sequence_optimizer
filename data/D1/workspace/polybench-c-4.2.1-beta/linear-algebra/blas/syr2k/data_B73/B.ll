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
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %21, %7
  %indvars.iv15 = phi i64 [ 0, %7 ], [ %indvars.iv.next16, %21 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv12 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next13, %._crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv12, %indvars.iv15
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv15, i64 %indvars.iv12
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %8, 2
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv15, i64 %indvars.iv12
  store double %19, double* %20, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %._crit_edge4.preheader.preheader, label %._crit_edge.preheader

._crit_edge4.preheader.preheader:                 ; preds = %21
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader.preheader, %._crit_edge3
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge3 ], [ 0, %._crit_edge4.preheader.preheader ]
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %._crit_edge4.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge4.preheader ], [ %indvars.iv.next, %._crit_edge4 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3, label %._crit_edge4

._crit_edge3:                                     ; preds = %._crit_edge4
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond11, label %29, label %._crit_edge4.preheader

; <label>:29:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert53 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat54 = shufflevector <2 x double> %broadcast.splatinsert53, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert74 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat75 = shufflevector <2 x double> %broadcast.splatinsert74, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %7, %.us-lcssa.us
  %indvars.iv25 = phi i64 [ 0, %7 ], [ %11, %.us-lcssa.us ]
  %indvars.iv23 = phi i64 [ 1, %7 ], [ %indvars.iv.next24, %.us-lcssa.us ]
  %8 = add i64 %indvars.iv25, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 0
  %9 = mul i64 %indvars.iv25, 1201
  %10 = add i64 %9, 1
  %scevgep29 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %10
  %11 = add i64 %indvars.iv25, 1
  %12 = trunc i64 %11 to i32
  %xtraiter = and i32 %12, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.prol ], [ %xtraiter, %._crit_edge.prol.preheader ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.prol
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !1

._crit_edge.prol.loopexit.loopexit:               ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %indvars.iv25, 3
  br i1 %16, label %._crit_edge4.preheader.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.prol.loopexit
  %17 = sub i64 %8, %indvars.iv.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check58 = icmp ult i64 %19, 2
  br i1 %min.iters.check58, label %._crit_edge.preheader78, label %min.iters.checked59

min.iters.checked59:                              ; preds = %._crit_edge.preheader
  %n.mod.vf60 = and i64 %19, 1
  %n.vec61 = sub nsw i64 %19, %n.mod.vf60
  %cmp.zero62 = icmp eq i64 %n.vec61, 0
  %20 = add i64 %indvars.iv.unr, 4
  %21 = shl nuw i64 %18, 2
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf60, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero62, label %._crit_edge.preheader78, label %vector.ph63

vector.ph63:                                      ; preds = %min.iters.checked59
  br label %vector.body55

vector.body55:                                    ; preds = %vector.body55, %vector.ph63
  %index64 = phi i64 [ 0, %vector.ph63 ], [ %index.next65, %vector.body55 ]
  %24 = shl i64 %index64, 2
  %25 = add i64 %indvars.iv.unr, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %25
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %27, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec71 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %28 = fmul <2 x double> %strided.vec, %broadcast.splat75
  %29 = fmul <2 x double> %strided.vec71, %broadcast.splat75
  %30 = fmul <2 x double> %strided.vec72, %broadcast.splat75
  %31 = add nsw i64 %25, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %31
  %33 = fmul <2 x double> %strided.vec73, %broadcast.splat75
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  %index.next65 = add i64 %index64, 2
  %38 = icmp eq i64 %index.next65, %n.vec61
  br i1 %38, label %middle.block56, label %vector.body55, !llvm.loop !3

middle.block56:                                   ; preds = %vector.body55
  %cmp.n67 = icmp eq i64 %n.mod.vf60, 0
  br i1 %cmp.n67, label %._crit_edge4.preheader.preheader, label %._crit_edge.preheader78

._crit_edge.preheader78:                          ; preds = %middle.block56, %min.iters.checked59, %._crit_edge.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked59 ], [ %indvars.iv.unr, %._crit_edge.preheader ], [ %ind.end, %middle.block56 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader78, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader78 ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %3
  store double %41, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  store double %44, double* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %3
  store double %47, double* %45, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %3
  store double %50, double* %48, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv23
  br i1 %exitcond.3, label %._crit_edge4.preheader.preheader.loopexit, label %._crit_edge, !llvm.loop !6

._crit_edge4.preheader.preheader.loopexit:        ; preds = %._crit_edge
  br label %._crit_edge4.preheader.preheader

._crit_edge4.preheader.preheader:                 ; preds = %._crit_edge4.preheader.preheader.loopexit, %middle.block56, %._crit_edge.prol.loopexit
  %min.iters.check = icmp ult i64 %11, 2
  %n.vec = and i64 %11, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %11, %n.vec
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader.preheader, %._crit_edge3
  %indvars.iv19 = phi i64 [ %51, %._crit_edge3 ], [ 0, %._crit_edge4.preheader.preheader ]
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv19
  %51 = add i64 %indvars.iv19, 1
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %51
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv19
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %51
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv19
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv19
  br i1 %min.iters.check, label %._crit_edge4.preheader77, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge4.preheader
  br i1 %cmp.zero, label %._crit_edge4.preheader77, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %53
  %bound1 = icmp ult double* %53, %scevgep29
  %found.conflict = and i1 %bound0, %bound1
  %bound040 = icmp ult double* %scevgep, %scevgep33
  %bound141 = icmp ult double* %scevgep31, %scevgep29
  %found.conflict42 = and i1 %bound040, %bound141
  %conflict.rdx = or i1 %found.conflict, %found.conflict42
  %bound043 = icmp ult double* %scevgep, %scevgep37
  %bound144 = icmp ult double* %scevgep35, %scevgep29
  %found.conflict45 = and i1 %bound043, %bound144
  %conflict.rdx46 = or i1 %conflict.rdx, %found.conflict45
  %bound049 = icmp ult double* %scevgep, %52
  %bound150 = icmp ult double* %52, %scevgep29
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx52 = or i1 %conflict.rdx46, %found.conflict51
  br i1 %conflict.rdx52, label %._crit_edge4.preheader77, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %52, align 8, !alias.scope !8
  %.pre76 = load double, double* %53, align 8, !alias.scope !11
  %54 = insertelement <2 x double> undef, double %.pre, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = insertelement <2 x double> undef, double %.pre76, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %58 = or i64 %index, 1
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv19
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %58, i64 %indvars.iv19
  %61 = load double, double* %59, align 8, !alias.scope !13
  %62 = load double, double* %60, align 8, !alias.scope !13
  %63 = insertelement <2 x double> undef, double %61, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  %65 = fmul <2 x double> %64, %broadcast.splat54
  %66 = fmul <2 x double> %65, %55
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv19
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %58, i64 %indvars.iv19
  %69 = load double, double* %67, align 8, !alias.scope !15
  %70 = load double, double* %68, align 8, !alias.scope !15
  %71 = insertelement <2 x double> undef, double %69, i32 0
  %72 = insertelement <2 x double> %71, double %70, i32 1
  %73 = fmul <2 x double> %72, %broadcast.splat54
  %74 = fmul <2 x double> %73, %57
  %75 = fadd <2 x double> %66, %74
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !17, !noalias !19
  %78 = fadd <2 x double> %wide.load, %75
  store <2 x double> %78, <2 x double>* %77, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %79 = icmp eq i64 %index.next, %n.vec
  br i1 %79, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge3, label %._crit_edge4.preheader77

._crit_edge4.preheader77:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge4.preheader
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge4.preheader ], [ %n.vec, %middle.block ]
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.preheader77, %._crit_edge4
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge4 ], [ %indvars.iv14.ph, %._crit_edge4.preheader77 ]
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv19
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %2
  %83 = load double, double* %52, align 8
  %84 = fmul double %82, %83
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv14, i64 %indvars.iv19
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %2
  %88 = load double, double* %53, align 8
  %89 = fmul double %87, %88
  %90 = fadd double %84, %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv14
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %indvars.iv23
  br i1 %exitcond, label %._crit_edge3.loopexit, label %._crit_edge4, !llvm.loop !21

._crit_edge3.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %middle.block
  %exitcond21 = icmp eq i64 %51, 1000
  br i1 %exitcond21, label %.us-lcssa.us, label %._crit_edge4.preheader

.us-lcssa.us:                                     ; preds = %._crit_edge3
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27 = icmp eq i64 %11, 1200
  br i1 %exitcond27, label %94, label %.lr.ph

; <label>:94:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %19, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %20, label %._crit_edge.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
