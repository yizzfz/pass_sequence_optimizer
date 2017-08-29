; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %26
  tail call fastcc void @print_array(i32 2000, double* %19)
  br label %30

; <label>:30:                                     ; preds = %26, %29, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  tail call void @free(i8* %10) #4
  tail call void @free(i8* %11) #4
  tail call void @free(i8* %12) #4
  tail call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %13 = sitofp i32 %0 to double
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph4.split.us.preheader, label %._crit_edge

.lr.ph4.split.us.preheader:                       ; preds = %12
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %16 = fdiv double 0.000000e+00, %13
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %.lr.ph4.split.us.preheader, %..loopexit_crit_edge.us
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %17 = trunc i64 %indvars.iv5 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %18, double* %19, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %20 = trunc i64 %indvars.iv.next6 to i32
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = fmul double %22, 5.000000e-01
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv5
  store double %23, double* %24, align 8
  %25 = fmul double %22, 2.500000e-01
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv5
  store double %25, double* %26, align 8
  %27 = fdiv double %22, 6.000000e+00
  %28 = getelementptr inbounds double, double* %7, i64 %indvars.iv5
  store double %27, double* %28, align 8
  %29 = fmul double %22, 1.250000e-01
  %30 = getelementptr inbounds double, double* %10, i64 %indvars.iv5
  store double %29, double* %30, align 8
  %31 = fdiv double %22, 9.000000e+00
  %32 = getelementptr inbounds double, double* %11, i64 %indvars.iv5
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds double, double* %9, i64 %indvars.iv5
  store double 0.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds double, double* %8, i64 %indvars.iv5
  store double 0.000000e+00, double* %34, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph4.split.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 0
  store double %16, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph4.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph4.split.us ]
  br i1 %15, label %..loopexit_crit_edge.us, label %.lr.ph4.split.us.new.preheader

.lr.ph4.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new.preheader, %.lr.ph4.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph4.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph4.split.us.new.preheader ]
  %36 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %0
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %13
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %13
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %46, double* %47, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph4.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph4.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph4.split.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %12
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader8.us.preheader, label %._crit_edge11

.preheader8.us.preheader:                         ; preds = %12
  %xtraiter49 = and i32 %0, 1
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  %14 = icmp eq i32 %0, 1
  %wide.trip.count53 = zext i32 %0 to i64
  %wide.trip.count45.1 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count45.1, -2
  %16 = add nsw i64 %wide.trip.count45.1, -2
  %scevgep64 = getelementptr double, double* %5, i64 2
  %scevgep69 = getelementptr double, double* %7, i64 2
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge20.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge20.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep59 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 2
  %17 = getelementptr inbounds double, double* %4, i64 %indvars.iv51
  %18 = getelementptr inbounds double, double* %6, i64 %indvars.iv51
  br i1 %lcmp.mod50, label %.prol.loopexit48, label %.prol.preheader47

.prol.preheader47:                                ; preds = %.preheader8.us
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 0
  %20 = load double, double* %19, align 8
  %21 = load double, double* %17, align 8
  %22 = load double, double* %5, align 8
  %23 = fmul double %21, %22
  %24 = fadd double %20, %23
  %25 = load double, double* %18, align 8
  %26 = load double, double* %7, align 8
  %27 = fmul double %25, %26
  %28 = fadd double %24, %27
  store double %28, double* %19, align 8
  br label %.prol.loopexit48

.prol.loopexit48:                                 ; preds = %.prol.preheader47, %.preheader8.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %.prol.preheader47 ], [ 0, %.preheader8.us ]
  br i1 %14, label %._crit_edge20.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit48
  %29 = sub nsw i64 %15, %indvars.iv43.unr.ph
  %30 = lshr i64 %29, 1
  %31 = add nuw i64 %30, 1
  %min.iters.check = icmp ult i64 %31, 2
  br i1 %min.iters.check, label %.preheader8.us.new.preheader137, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader8.us.new.preheader
  %n.mod.vf = and i64 %31, 1
  %n.vec = sub i64 %31, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader8.us.new.preheader137, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43.unr.ph
  %32 = sub nsw i64 %16, %indvars.iv43.unr.ph
  %33 = and i64 %32, -2
  %34 = or i64 %indvars.iv43.unr.ph, %33
  %scevgep60 = getelementptr double, double* %scevgep59, i64 %34
  %scevgep62 = getelementptr double, double* %5, i64 %indvars.iv43.unr.ph
  %scevgep65 = getelementptr double, double* %scevgep64, i64 %34
  %scevgep67 = getelementptr double, double* %7, i64 %indvars.iv43.unr.ph
  %scevgep70 = getelementptr double, double* %scevgep69, i64 %34
  %bound0 = icmp ult double* %scevgep57, %17
  %bound1 = icmp ult double* %17, %scevgep60
  %found.conflict = and i1 %bound0, %bound1
  %bound073 = icmp ult double* %scevgep57, %scevgep65
  %bound174 = icmp ult double* %scevgep62, %scevgep60
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx = or i1 %found.conflict, %found.conflict75
  %bound078 = icmp ult double* %scevgep57, %18
  %bound179 = icmp ult double* %18, %scevgep60
  %found.conflict80 = and i1 %bound078, %bound179
  %conflict.rdx81 = or i1 %conflict.rdx, %found.conflict80
  %bound082 = icmp ult double* %scevgep57, %scevgep70
  %bound183 = icmp ult double* %scevgep67, %scevgep60
  %found.conflict84 = and i1 %bound082, %bound183
  %conflict.rdx85 = or i1 %conflict.rdx81, %found.conflict84
  %35 = or i64 %indvars.iv43.unr.ph, 2
  %36 = shl nuw i64 %30, 1
  %37 = add i64 %35, %36
  %38 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %37, %38
  br i1 %conflict.rdx85, label %.preheader8.us.new.preheader137, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %39 = load double, double* %17, align 8, !alias.scope !1
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = load double, double* %18, align 8, !alias.scope !4
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = load double, double* %17, align 8, !alias.scope !1
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = load double, double* %18, align 8, !alias.scope !4
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv43.unr.ph, %51
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %offset.idx
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec86 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %54 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %55 = bitcast double* %54 to <4 x double>*
  %wide.vec87 = load <4 x double>, <4 x double>* %55, align 8, !alias.scope !11
  %strided.vec88 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec89 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %56 = fmul <2 x double> %41, %strided.vec88
  %57 = fadd <2 x double> %strided.vec, %56
  %58 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %59 = bitcast double* %58 to <4 x double>*
  %wide.vec90 = load <4 x double>, <4 x double>* %59, align 8, !alias.scope !12
  %strided.vec91 = shufflevector <4 x double> %wide.vec90, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec92 = shufflevector <4 x double> %wide.vec90, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %60 = fmul <2 x double> %44, %strided.vec91
  %61 = fadd <2 x double> %57, %60
  %62 = add nuw nsw i64 %offset.idx, 1
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %62
  %64 = fmul <2 x double> %47, %strided.vec89
  %65 = fadd <2 x double> %strided.vec86, %64
  %66 = fmul <2 x double> %50, %strided.vec92
  %67 = fadd <2 x double> %65, %66
  %68 = getelementptr double, double* %63, i64 -1
  %69 = bitcast double* %68 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %61, <2 x double> %67, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %70 = icmp eq i64 %index.next, %n.vec
  br i1 %70, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge20.us, label %.preheader8.us.new.preheader137

.preheader8.us.new.preheader137:                  ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader8.us.new.preheader
  %indvars.iv43.ph = phi i64 [ %indvars.iv43.unr.ph, %vector.memcheck ], [ %indvars.iv43.unr.ph, %min.iters.checked ], [ %indvars.iv43.unr.ph, %.preheader8.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader137, %.preheader8.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %.preheader8.us.new ], [ %indvars.iv43.ph, %.preheader8.us.new.preheader137 ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43
  %72 = load double, double* %71, align 8
  %73 = load double, double* %17, align 8
  %74 = getelementptr inbounds double, double* %5, i64 %indvars.iv43
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %72, %76
  %78 = load double, double* %18, align 8
  %79 = getelementptr inbounds double, double* %7, i64 %indvars.iv43
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %77, %81
  store double %82, double* %71, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv.next44
  %84 = load double, double* %83, align 8
  %85 = load double, double* %17, align 8
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next44
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %84, %88
  %90 = load double, double* %18, align 8
  %91 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next44
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = fadd double %89, %93
  store double %94, double* %83, align 8
  %indvars.iv.next44.1 = add nuw nsw i64 %indvars.iv43, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next44.1, %wide.trip.count45.1
  br i1 %exitcond46.1, label %._crit_edge20.us.loopexit, label %.preheader8.us.new, !llvm.loop !16

._crit_edge20.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %middle.block, %.prol.loopexit48
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %.preheader7, label %.preheader8.us

.preheader7:                                      ; preds = %._crit_edge20.us
  %95 = icmp sgt i32 %0, 0
  br i1 %95, label %.preheader6.us.preheader, label %._crit_edge11

.preheader6.us.preheader:                         ; preds = %.preheader7
  %xtraiter37 = and i32 %0, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %96 = icmp eq i32 %0, 1
  %wide.trip.count41 = zext i32 %0 to i64
  %wide.trip.count33.1 = zext i32 %0 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge16.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge16.us ], [ 0, %.preheader6.us.preheader ]
  %97 = getelementptr inbounds double, double* %9, i64 %indvars.iv39
  br i1 %lcmp.mod38, label %.prol.loopexit36, label %.prol.preheader35

.prol.preheader35:                                ; preds = %.preheader6.us
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv39
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %2
  %102 = load double, double* %10, align 8
  %103 = fmul double %101, %102
  %104 = fadd double %98, %103
  store double %104, double* %97, align 8
  br label %.prol.loopexit36

.prol.loopexit36:                                 ; preds = %.prol.preheader35, %.preheader6.us
  %indvars.iv31.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %.preheader6.us ]
  br i1 %96, label %._crit_edge16.us, label %.preheader6.us.new.preheader

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit36
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new.preheader, %.preheader6.us.new
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %.preheader6.us.new ], [ %indvars.iv31.unr.ph, %.preheader6.us.new.preheader ]
  %105 = load double, double* %97, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv39
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %2
  %109 = getelementptr inbounds double, double* %10, i64 %indvars.iv31
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = fadd double %105, %111
  store double %112, double* %97, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next32, i64 %indvars.iv39
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, %2
  %116 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next32
  %117 = load double, double* %116, align 8
  %118 = fmul double %115, %117
  %119 = fadd double %112, %118
  store double %119, double* %97, align 8
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next32.1, %wide.trip.count33.1
  br i1 %exitcond34.1, label %._crit_edge16.us.loopexit, label %.preheader6.us.new

._crit_edge16.us.loopexit:                        ; preds = %.preheader6.us.new
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %.prol.loopexit36
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %.preheader5, label %.preheader6.us

.preheader5:                                      ; preds = %._crit_edge16.us
  %120 = icmp sgt i32 %0, 0
  br i1 %120, label %.lr.ph13.preheader, label %._crit_edge11

.lr.ph13.preheader:                               ; preds = %.preheader5
  %121 = add i32 %0, -1
  %xtraiter29 = and i32 %0, 3
  %lcmp.mod30 = icmp eq i32 %xtraiter29, 0
  br i1 %lcmp.mod30, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol.preheader

.lr.ph13.prol.preheader:                          ; preds = %.lr.ph13.preheader
  %122 = add nsw i32 %xtraiter29, -1
  br label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.prol.preheader, %.lr.ph13.prol
  %indvars.iv25.prol = phi i64 [ %indvars.iv.next26.prol, %.lr.ph13.prol ], [ 0, %.lr.ph13.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph13.prol ], [ %xtraiter29, %.lr.ph13.prol.preheader ]
  %123 = getelementptr inbounds double, double* %9, i64 %indvars.iv25.prol
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds double, double* %11, i64 %indvars.iv25.prol
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  store double %127, double* %123, align 8
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.prol.loopexit.loopexit, label %.lr.ph13.prol, !llvm.loop !17

.lr.ph13.prol.loopexit.loopexit:                  ; preds = %.lr.ph13.prol
  %128 = zext i32 %122 to i64
  %129 = add nuw nsw i64 %128, 1
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.prol.loopexit.loopexit, %.lr.ph13.preheader
  %indvars.iv25.unr = phi i64 [ 0, %.lr.ph13.preheader ], [ %129, %.lr.ph13.prol.loopexit.loopexit ]
  %130 = icmp ult i32 %121, 3
  br i1 %130, label %.preheader.us.preheader, label %.lr.ph13.preheader56

.lr.ph13.preheader56:                             ; preds = %.lr.ph13.prol.loopexit
  %wide.trip.count27.3 = zext i32 %0 to i64
  %131 = add nsw i64 %wide.trip.count45.1, -4
  %132 = sub nsw i64 %131, %indvars.iv25.unr
  %133 = lshr i64 %132, 2
  %134 = add nuw nsw i64 %133, 1
  %min.iters.check96 = icmp ult i64 %134, 2
  br i1 %min.iters.check96, label %.lr.ph13.preheader136, label %min.iters.checked97

.lr.ph13.preheader136:                            ; preds = %middle.block94, %vector.memcheck114, %min.iters.checked97, %.lr.ph13.preheader56
  %indvars.iv25.ph = phi i64 [ %indvars.iv25.unr, %vector.memcheck114 ], [ %indvars.iv25.unr, %min.iters.checked97 ], [ %indvars.iv25.unr, %.lr.ph13.preheader56 ], [ %ind.end119, %middle.block94 ]
  br label %.lr.ph13

min.iters.checked97:                              ; preds = %.lr.ph13.preheader56
  %n.mod.vf98 = and i64 %134, 1
  %n.vec99 = sub nsw i64 %134, %n.mod.vf98
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  br i1 %cmp.zero100, label %.lr.ph13.preheader136, label %vector.memcheck114

vector.memcheck114:                               ; preds = %min.iters.checked97
  %scevgep102 = getelementptr double, double* %9, i64 %indvars.iv25.unr
  %135 = add nsw i64 %wide.trip.count45.1, -4
  %136 = sub nsw i64 %135, %indvars.iv25.unr
  %137 = and i64 %136, -4
  %138 = add nsw i64 %indvars.iv25.unr, %137
  %139 = add nsw i64 %138, 4
  %scevgep104 = getelementptr double, double* %9, i64 %139
  %scevgep106 = getelementptr double, double* %11, i64 %indvars.iv25.unr
  %scevgep108 = getelementptr double, double* %11, i64 %139
  %bound0110 = icmp ult double* %scevgep102, %scevgep108
  %bound1111 = icmp ult double* %scevgep106, %scevgep104
  %memcheck.conflict113 = and i1 %bound0110, %bound1111
  %140 = shl nuw i64 %133, 2
  %141 = add i64 %indvars.iv25.unr, %140
  %142 = add i64 %141, 4
  %143 = shl nuw nsw i64 %n.mod.vf98, 2
  %ind.end119 = sub i64 %142, %143
  br i1 %memcheck.conflict113, label %.lr.ph13.preheader136, label %vector.body93.preheader

vector.body93.preheader:                          ; preds = %vector.memcheck114
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93.preheader, %vector.body93
  %index116 = phi i64 [ %index.next117, %vector.body93 ], [ 0, %vector.body93.preheader ]
  %144 = shl i64 %index116, 2
  %145 = add i64 %indvars.iv25.unr, %144
  %146 = getelementptr inbounds double, double* %9, i64 %145
  %147 = bitcast double* %146 to <8 x double>*
  %wide.vec125 = load <8 x double>, <8 x double>* %147, align 8, !alias.scope !19, !noalias !22
  %148 = getelementptr inbounds double, double* %11, i64 %145
  %149 = bitcast double* %148 to <8 x double>*
  %wide.vec130 = load <8 x double>, <8 x double>* %149, align 8, !alias.scope !22
  %150 = fadd <8 x double> %wide.vec125, %wide.vec130
  %151 = shufflevector <8 x double> %150, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %152 = fadd <8 x double> %wide.vec125, %wide.vec130
  %153 = shufflevector <8 x double> %152, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %154 = fadd <8 x double> %wide.vec125, %wide.vec130
  %155 = shufflevector <8 x double> %154, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %156 = add nsw i64 %145, 3
  %157 = getelementptr inbounds double, double* %9, i64 %156
  %158 = fadd <8 x double> %wide.vec125, %wide.vec130
  %159 = shufflevector <8 x double> %158, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %160 = getelementptr double, double* %157, i64 -3
  %161 = bitcast double* %160 to <8 x double>*
  %162 = shufflevector <2 x double> %151, <2 x double> %153, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %163 = shufflevector <2 x double> %155, <2 x double> %159, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec135 = shufflevector <4 x double> %162, <4 x double> %163, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec135, <8 x double>* %161, align 8, !alias.scope !19, !noalias !22
  %index.next117 = add i64 %index116, 2
  %164 = icmp eq i64 %index.next117, %n.vec99
  br i1 %164, label %middle.block94, label %vector.body93, !llvm.loop !24

middle.block94:                                   ; preds = %vector.body93
  %cmp.n120 = icmp eq i64 %n.mod.vf98, 0
  br i1 %cmp.n120, label %.preheader4, label %.lr.ph13.preheader136

.preheader4.loopexit:                             ; preds = %.lr.ph13
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block94
  %165 = icmp sgt i32 %0, 0
  br i1 %165, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader4, %.lr.ph13.prol.loopexit
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %166 = icmp eq i32 %0, 1
  %wide.trip.count24 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %167 = getelementptr inbounds double, double* %8, i64 %indvars.iv22
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %168 = load double, double* %167, align 8
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 0
  %170 = load double, double* %169, align 8
  %171 = fmul double %170, %1
  %172 = load double, double* %9, align 8
  %173 = fmul double %171, %172
  %174 = fadd double %168, %173
  store double %174, double* %167, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %166, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %175 = load double, double* %167, align 8
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv
  %177 = load double, double* %176, align 8
  %178 = fmul double %177, %1
  %179 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %180 = load double, double* %179, align 8
  %181 = fmul double %178, %180
  %182 = fadd double %175, %181
  store double %182, double* %167, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv.next
  %184 = load double, double* %183, align 8
  %185 = fmul double %184, %1
  %186 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %187 = load double, double* %186, align 8
  %188 = fmul double %185, %187
  %189 = fadd double %182, %188
  store double %189, double* %167, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond, label %._crit_edge11.loopexit, label %.preheader.us

.lr.ph13:                                         ; preds = %.lr.ph13.preheader136, %.lr.ph13
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.3, %.lr.ph13 ], [ %indvars.iv25.ph, %.lr.ph13.preheader136 ]
  %190 = getelementptr inbounds double, double* %9, i64 %indvars.iv25
  %191 = load double, double* %190, align 8
  %192 = getelementptr inbounds double, double* %11, i64 %indvars.iv25
  %193 = load double, double* %192, align 8
  %194 = fadd double %191, %193
  store double %194, double* %190, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %195 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26
  %196 = load double, double* %195, align 8
  %197 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26
  %198 = load double, double* %197, align 8
  %199 = fadd double %196, %198
  store double %199, double* %195, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %200 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.1
  %201 = load double, double* %200, align 8
  %202 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.1
  %203 = load double, double* %202, align 8
  %204 = fadd double %201, %203
  store double %204, double* %200, align 8
  %indvars.iv.next26.2 = add nsw i64 %indvars.iv25, 3
  %205 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.2
  %206 = load double, double* %205, align 8
  %207 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.2
  %208 = load double, double* %207, align 8
  %209 = fadd double %206, %208
  store double %209, double* %205, align 8
  %indvars.iv.next26.3 = add nsw i64 %indvars.iv25, 4
  %exitcond28.3 = icmp eq i64 %indvars.iv.next26.3, %wide.trip.count27.3
  br i1 %exitcond28.3, label %.preheader4.loopexit, label %.lr.ph13, !llvm.loop !25

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %12, %.preheader7, %.preheader5, %.preheader4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !14, !15}
