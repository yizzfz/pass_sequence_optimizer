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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  br label %.preheader4

.preheader4:                                      ; preds = %22, %7
  %indvars.iv15 = phi i64 [ 0, %7 ], [ %indvars.iv.next16, %22 ]
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader4
  %indvars.iv12 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next13, %8 ]
  %9 = mul nuw nsw i64 %indvars.iv12, %indvars.iv15
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 1200
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.200000e+03
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv15, i64 %indvars.iv12
  store double %14, double* %15, align 8
  %16 = add nuw nsw i64 %9, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv15, i64 %indvars.iv12
  store double %20, double* %21, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %22, label %8

; <label>:22:                                     ; preds = %8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %.preheader.preheader, label %.preheader4

.preheader.preheader:                             ; preds = %22
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %31
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %31 ], [ 0, %.preheader.preheader ]
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %23 ]
  %24 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %25 = add nuw nsw i64 %24, 3
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 1200
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 1.000000e+03
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv
  store double %29, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %31, label %23

; <label>:31:                                     ; preds = %23
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond11, label %32, label %.preheader

; <label>:32:                                     ; preds = %31
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
  %indvars.iv77 = phi i2 [ 1, %7 ], [ %indvars.iv.next78, %.us-lcssa.us ]
  %indvars.iv25 = phi i64 [ 0, %7 ], [ %indvars.iv.next26, %.us-lcssa.us ]
  %indvars.iv23 = phi i64 [ 1, %7 ], [ %indvars.iv.next24, %.us-lcssa.us ]
  %8 = zext i2 %indvars.iv77 to i64
  %9 = add nuw nsw i64 %8, 4294967295
  %10 = and i64 %9, 4294967295
  %11 = add nuw nsw i64 %10, 1
  %12 = add nsw i64 %indvars.iv25, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 0
  %13 = mul nuw nsw i64 %indvars.iv25, 1201
  %14 = add nuw nsw i64 %13, 1
  %scevgep29 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %14
  %15 = add nuw nsw i64 %indvars.iv25, 1
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %16 = trunc i64 %indvars.iv.next26 to i32
  %xtraiter = and i32 %16, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.prol
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  store double %19, double* %17, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %11, %.prol.loopexit.loopexit ]
  %20 = icmp ult i64 %indvars.iv25, 3
  br i1 %20, label %.preheader.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %21 = sub i64 %12, %indvars.iv.unr
  %22 = lshr i64 %21, 2
  %23 = add nuw nsw i64 %22, 1
  %min.iters.check58 = icmp ult i64 %23, 2
  br i1 %min.iters.check58, label %.lr.ph.new.preheader76, label %min.iters.checked59

min.iters.checked59:                              ; preds = %.lr.ph.new.preheader
  %n.mod.vf60 = and i64 %23, 1
  %n.vec61 = sub nsw i64 %23, %n.mod.vf60
  %cmp.zero62 = icmp eq i64 %n.vec61, 0
  %24 = add nsw i64 %indvars.iv.unr, 4
  %25 = shl nuw i64 %22, 2
  %26 = add i64 %24, %25
  %27 = shl nuw nsw i64 %n.mod.vf60, 2
  %ind.end = sub i64 %26, %27
  br i1 %cmp.zero62, label %.lr.ph.new.preheader76, label %vector.ph63

vector.ph63:                                      ; preds = %min.iters.checked59
  br label %vector.body55

vector.body55:                                    ; preds = %vector.body55, %vector.ph63
  %index64 = phi i64 [ 0, %vector.ph63 ], [ %index.next65, %vector.body55 ]
  %28 = shl i64 %index64, 2
  %29 = add i64 %indvars.iv.unr, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %29
  %31 = bitcast double* %30 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %31, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec71 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %32 = fmul <2 x double> %strided.vec, %broadcast.splat75
  %33 = fmul <2 x double> %strided.vec71, %broadcast.splat75
  %34 = fmul <2 x double> %strided.vec72, %broadcast.splat75
  %35 = add nsw i64 %29, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %35
  %37 = fmul <2 x double> %strided.vec73, %broadcast.splat75
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %32, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %34, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %39, align 8
  %index.next65 = add i64 %index64, 2
  %42 = icmp eq i64 %index.next65, %n.vec61
  br i1 %42, label %middle.block56, label %vector.body55, !llvm.loop !3

middle.block56:                                   ; preds = %vector.body55
  %cmp.n67 = icmp eq i64 %n.mod.vf60, 0
  br i1 %cmp.n67, label %.preheader.preheader, label %.lr.ph.new.preheader76

.lr.ph.new.preheader76:                           ; preds = %middle.block56, %min.iters.checked59, %.lr.ph.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked59 ], [ %indvars.iv.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block56 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader76, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.ph, %.lr.ph.new.preheader76 ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %3
  store double %45, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %3
  store double %48, double* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next.1
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %3
  store double %51, double* %49, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %3
  store double %54, double* %52, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv23
  br i1 %exitcond.3, label %.preheader.preheader.loopexit, label %.lr.ph.new, !llvm.loop !6

.preheader.preheader.loopexit:                    ; preds = %.lr.ph.new
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %middle.block56, %.prol.loopexit
  %min.iters.check = icmp ult i64 %15, 2
  %n.vec = and i64 %15, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %15, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv19
  %55 = add nuw nsw i64 %indvars.iv19, 1
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %55
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv19
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %55
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv19
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv19
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %57
  %bound1 = icmp ult double* %57, %scevgep29
  %found.conflict = and i1 %bound0, %bound1
  %bound040 = icmp ult double* %scevgep, %scevgep33
  %bound141 = icmp ult double* %scevgep31, %scevgep29
  %found.conflict42 = and i1 %bound040, %bound141
  %conflict.rdx = or i1 %found.conflict, %found.conflict42
  %bound043 = icmp ult double* %scevgep, %scevgep37
  %bound144 = icmp ult double* %scevgep35, %scevgep29
  %found.conflict45 = and i1 %bound043, %bound144
  %conflict.rdx46 = or i1 %conflict.rdx, %found.conflict45
  %bound049 = icmp ult double* %scevgep, %56
  %bound150 = icmp ult double* %56, %scevgep29
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx52 = or i1 %conflict.rdx46, %found.conflict51
  br i1 %conflict.rdx52, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %58 = load double, double* %56, align 8, !alias.scope !8
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = load double, double* %57, align 8, !alias.scope !11
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %64 = or i64 %index, 1
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv19
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %64, i64 %indvars.iv19
  %67 = load double, double* %65, align 8, !alias.scope !13
  %68 = load double, double* %66, align 8, !alias.scope !13
  %69 = insertelement <2 x double> undef, double %67, i32 0
  %70 = insertelement <2 x double> %69, double %68, i32 1
  %71 = fmul <2 x double> %70, %broadcast.splat54
  %72 = fmul <2 x double> %71, %60
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv19
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %64, i64 %indvars.iv19
  %75 = load double, double* %73, align 8, !alias.scope !15
  %76 = load double, double* %74, align 8, !alias.scope !15
  %77 = insertelement <2 x double> undef, double %75, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fmul <2 x double> %78, %broadcast.splat54
  %80 = fmul <2 x double> %79, %63
  %81 = fadd <2 x double> %72, %80
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %index
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !17, !noalias !19
  %84 = fadd <2 x double> %wide.load, %81
  %85 = bitcast double* %82 to <2 x double>*
  store <2 x double> %84, <2 x double>* %85, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %86 = icmp eq i64 %index.next, %n.vec
  br i1 %86, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %scalar.ph ], [ %indvars.iv14.ph, %scalar.ph.preheader ]
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv19
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %2
  %90 = load double, double* %56, align 8
  %91 = fmul double %89, %90
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv14, i64 %indvars.iv19
  %93 = load double, double* %92, align 8
  %94 = fmul double %93, %2
  %95 = load double, double* %57, align 8
  %96 = fmul double %94, %95
  %97 = fadd double %91, %96
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv14
  %99 = load double, double* %98, align 8
  %100 = fadd double %99, %97
  store double %100, double* %98, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %indvars.iv23
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !21

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond21, label %.us-lcssa.us, label %.preheader

.us-lcssa.us:                                     ; preds = %._crit_edge
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1200
  %indvars.iv.next78 = add i2 %indvars.iv77, 1
  br i1 %exitcond27, label %101, label %.lr.ph

; <label>:101:                                    ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %20, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %20 ]
  %7 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %20, label %8

; <label>:20:                                     ; preds = %15
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
