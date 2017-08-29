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
  br i1 %25, label %26, label %31

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  tail call fastcc void @print_array(i32 2000, double* %30)
  br label %31

; <label>:31:                                     ; preds = %26, %29, %2
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
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %15 = fdiv double 0.000000e+00, %13
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %.lr.ph4.split.us.preheader, %..loopexit_crit_edge.us
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %16 = icmp eq i32 %xtraiter, 0
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
  br i1 %16, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph4.split.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 0
  store double %15, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph4.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph4.split.us ]
  %36 = icmp eq i32 %0, 1
  br i1 %36, label %..loopexit_crit_edge.us, label %.lr.ph4.split.us.new.preheader

.lr.ph4.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new.preheader, %.lr.ph4.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph4.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph4.split.us.new.preheader ]
  %37 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %0
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %13
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %13
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %47, double* %48, align 8
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
  %wide.trip.count53 = zext i32 %0 to i64
  %wide.trip.count45.1 = zext i32 %0 to i64
  %14 = add nsw i64 %wide.trip.count45.1, -2
  %15 = add nsw i64 %wide.trip.count45.1, -2
  %scevgep95 = getelementptr double, double* %5, i64 2
  %scevgep100 = getelementptr double, double* %7, i64 2
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge20.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge20.us ], [ 0, %.preheader8.us.preheader ]
  %16 = icmp eq i32 %xtraiter49, 0
  %scevgep90 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 2
  br i1 %16, label %.prol.loopexit48, label %.prol.preheader47

.prol.preheader47:                                ; preds = %.preheader8.us
  %17 = ptrtoint double* %6 to i64
  %18 = ptrtoint double* %4 to i64
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 0
  %20 = load double, double* %19, align 8
  %sunkaddr56 = shl i64 %indvars.iv51, 3
  %sunkaddr57 = add i64 %18, %sunkaddr56
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to double*
  %21 = load double, double* %sunkaddr58, align 8
  %22 = load double, double* %5, align 8
  %23 = fmul double %21, %22
  %24 = fadd double %20, %23
  %sunkaddr60 = shl i64 %indvars.iv51, 3
  %sunkaddr61 = add i64 %17, %sunkaddr60
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to double*
  %25 = load double, double* %sunkaddr62, align 8
  %26 = load double, double* %7, align 8
  %27 = fmul double %25, %26
  %28 = fadd double %24, %27
  store double %28, double* %19, align 8
  br label %.prol.loopexit48

.prol.loopexit48:                                 ; preds = %.prol.preheader47, %.preheader8.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %.prol.preheader47 ], [ 0, %.preheader8.us ]
  %29 = icmp eq i32 %0, 1
  br i1 %29, label %._crit_edge20.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit48
  %30 = ptrtoint double* %6 to i64
  %31 = ptrtoint double* %4 to i64
  %sunkaddr64 = shl i64 %indvars.iv51, 3
  %sunkaddr65 = add i64 %31, %sunkaddr64
  %sunkaddr68 = shl i64 %indvars.iv51, 3
  %sunkaddr69 = add i64 %30, %sunkaddr68
  %32 = sub nsw i64 %14, %indvars.iv43.unr.ph
  %33 = lshr i64 %32, 1
  %34 = add nuw i64 %33, 1
  %min.iters.check = icmp ult i64 %34, 2
  br i1 %min.iters.check, label %.preheader8.us.new.preheader168, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader8.us.new.preheader
  %n.mod.vf = and i64 %34, 1
  %n.vec = sub i64 %34, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader8.us.new.preheader168, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep88 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43.unr.ph
  %scevgep8889 = bitcast double* %scevgep88 to i8*
  %35 = sub nsw i64 %15, %indvars.iv43.unr.ph
  %36 = and i64 %35, -2
  %37 = or i64 %indvars.iv43.unr.ph, %36
  %scevgep91 = getelementptr double, double* %scevgep90, i64 %37
  %scevgep9192 = bitcast double* %scevgep91 to i8*
  %scevgep93 = getelementptr double, double* %5, i64 %indvars.iv43.unr.ph
  %scevgep96 = getelementptr double, double* %scevgep95, i64 %37
  %scevgep98 = getelementptr double, double* %7, i64 %indvars.iv43.unr.ph
  %scevgep101 = getelementptr double, double* %scevgep100, i64 %37
  %bc = inttoptr i64 %sunkaddr65 to i8*
  %bc103 = inttoptr i64 %sunkaddr65 to i8*
  %bound0 = icmp ult i8* %scevgep8889, %bc103
  %bound1 = icmp ult i8* %bc, %scevgep9192
  %found.conflict = and i1 %bound0, %bound1
  %bound0104 = icmp ult double* %scevgep88, %scevgep96
  %bound1105 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx = or i1 %found.conflict, %found.conflict106
  %bc107 = inttoptr i64 %sunkaddr69 to i8*
  %bc108 = inttoptr i64 %sunkaddr69 to i8*
  %bound0109 = icmp ult i8* %scevgep8889, %bc108
  %bound1110 = icmp ult i8* %bc107, %scevgep9192
  %found.conflict111 = and i1 %bound0109, %bound1110
  %conflict.rdx112 = or i1 %conflict.rdx, %found.conflict111
  %bound0113 = icmp ult double* %scevgep88, %scevgep101
  %bound1114 = icmp ult double* %scevgep98, %scevgep91
  %found.conflict115 = and i1 %bound0113, %bound1114
  %conflict.rdx116 = or i1 %conflict.rdx112, %found.conflict115
  %38 = or i64 %indvars.iv43.unr.ph, 2
  %39 = shl nuw i64 %33, 1
  %40 = add i64 %38, %39
  %41 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %40, %41
  br i1 %conflict.rdx116, label %.preheader8.us.new.preheader168, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %42 = inttoptr i64 %sunkaddr69 to double*
  %43 = inttoptr i64 %sunkaddr65 to double*
  %44 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv43.unr.ph, %44
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %offset.idx
  %46 = bitcast double* %45 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %46, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec117 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %47 = load double, double* %43, align 8, !alias.scope !9
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec118 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !10
  %strided.vec119 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec120 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %52 = fmul <2 x double> %49, %strided.vec119
  %53 = fadd <2 x double> %strided.vec, %52
  %54 = load double, double* %42, align 8, !alias.scope !11
  %55 = insertelement <2 x double> undef, double %54, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %58 = bitcast double* %57 to <4 x double>*
  %wide.vec121 = load <4 x double>, <4 x double>* %58, align 8, !alias.scope !12
  %strided.vec122 = shufflevector <4 x double> %wide.vec121, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec123 = shufflevector <4 x double> %wide.vec121, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %59 = fmul <2 x double> %56, %strided.vec122
  %60 = fadd <2 x double> %53, %59
  %61 = add nuw nsw i64 %offset.idx, 1
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %61
  %63 = load double, double* %43, align 8, !alias.scope !9
  %64 = insertelement <2 x double> undef, double %63, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = fmul <2 x double> %65, %strided.vec120
  %67 = fadd <2 x double> %strided.vec117, %66
  %68 = load double, double* %42, align 8, !alias.scope !11
  %69 = insertelement <2 x double> undef, double %68, i32 0
  %70 = shufflevector <2 x double> %69, <2 x double> undef, <2 x i32> zeroinitializer
  %71 = fmul <2 x double> %70, %strided.vec123
  %72 = fadd <2 x double> %67, %71
  %73 = getelementptr double, double* %62, i64 -1
  %74 = bitcast double* %73 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %60, <2 x double> %72, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %74, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %75 = icmp eq i64 %index.next, %n.vec
  br i1 %75, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge20.us, label %.preheader8.us.new.preheader168

.preheader8.us.new.preheader168:                  ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader8.us.new.preheader
  %indvars.iv43.ph = phi i64 [ %indvars.iv43.unr.ph, %vector.memcheck ], [ %indvars.iv43.unr.ph, %min.iters.checked ], [ %indvars.iv43.unr.ph, %.preheader8.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader168, %.preheader8.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %.preheader8.us.new ], [ %indvars.iv43.ph, %.preheader8.us.new.preheader168 ]
  %76 = inttoptr i64 %sunkaddr69 to double*
  %77 = inttoptr i64 %sunkaddr65 to double*
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43
  %79 = load double, double* %78, align 8
  %80 = load double, double* %77, align 8
  %81 = getelementptr inbounds double, double* %5, i64 %indvars.iv43
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double %79, %83
  %85 = load double, double* %76, align 8
  %86 = getelementptr inbounds double, double* %7, i64 %indvars.iv43
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %84, %88
  store double %89, double* %78, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv.next44
  %91 = load double, double* %90, align 8
  %92 = load double, double* %77, align 8
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next44
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fadd double %91, %95
  %97 = load double, double* %76, align 8
  %98 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next44
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fadd double %96, %100
  store double %101, double* %90, align 8
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
  %102 = icmp sgt i32 %0, 0
  br i1 %102, label %.preheader6.us.preheader, label %._crit_edge11

.preheader6.us.preheader:                         ; preds = %.preheader7
  %xtraiter37 = and i32 %0, 1
  %wide.trip.count41 = zext i32 %0 to i64
  %wide.trip.count33.1 = zext i32 %0 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge16.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge16.us ], [ 0, %.preheader6.us.preheader ]
  %103 = icmp eq i32 %xtraiter37, 0
  br i1 %103, label %.prol.loopexit36, label %.prol.preheader35

.prol.preheader35:                                ; preds = %.preheader6.us
  %104 = ptrtoint double* %9 to i64
  %sunkaddr72 = shl nuw nsw i64 %indvars.iv39, 3
  %sunkaddr73 = add i64 %104, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %105 = load double, double* %sunkaddr74, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv39
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %2
  %109 = load double, double* %10, align 8
  %110 = fmul double %108, %109
  %111 = fadd double %105, %110
  store double %111, double* %sunkaddr74, align 8
  br label %.prol.loopexit36

.prol.loopexit36:                                 ; preds = %.prol.preheader35, %.preheader6.us
  %indvars.iv31.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %.preheader6.us ]
  %112 = icmp eq i32 %0, 1
  br i1 %112, label %._crit_edge16.us, label %.preheader6.us.new.preheader

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit36
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new.preheader, %.preheader6.us.new
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %.preheader6.us.new ], [ %indvars.iv31.unr.ph, %.preheader6.us.new.preheader ]
  %sunkaddr = ptrtoint double* %9 to i64
  %sunkaddr169 = mul i64 %indvars.iv39, 8
  %sunkaddr170 = add i64 %sunkaddr, %sunkaddr169
  %sunkaddr171 = inttoptr i64 %sunkaddr170 to double*
  %113 = load double, double* %sunkaddr171, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv39
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %2
  %117 = getelementptr inbounds double, double* %10, i64 %indvars.iv31
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fadd double %113, %119
  store double %120, double* %sunkaddr171, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next32, i64 %indvars.iv39
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, %2
  %124 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next32
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fadd double %120, %126
  store double %127, double* %sunkaddr171, align 8
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
  %128 = icmp sgt i32 %0, 0
  br i1 %128, label %.lr.ph13.preheader, label %._crit_edge11

.lr.ph13.preheader:                               ; preds = %.preheader5
  %129 = add i32 %0, -1
  %xtraiter29 = and i32 %0, 3
  %lcmp.mod30 = icmp eq i32 %xtraiter29, 0
  br i1 %lcmp.mod30, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol.preheader

.lr.ph13.prol.preheader:                          ; preds = %.lr.ph13.preheader
  %130 = add nsw i32 %xtraiter29, -1
  %131 = zext i32 %130 to i64
  br label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.prol.preheader, %.lr.ph13.prol
  %indvars.iv25.prol = phi i64 [ %indvars.iv.next26.prol, %.lr.ph13.prol ], [ 0, %.lr.ph13.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph13.prol ], [ %xtraiter29, %.lr.ph13.prol.preheader ]
  %132 = getelementptr inbounds double, double* %9, i64 %indvars.iv25.prol
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds double, double* %11, i64 %indvars.iv25.prol
  %135 = load double, double* %134, align 8
  %136 = fadd double %133, %135
  store double %136, double* %132, align 8
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.prol.loopexit.loopexit, label %.lr.ph13.prol, !llvm.loop !17

.lr.ph13.prol.loopexit.loopexit:                  ; preds = %.lr.ph13.prol
  %137 = add nuw nsw i64 %131, 1
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.prol.loopexit.loopexit, %.lr.ph13.preheader
  %indvars.iv25.unr = phi i64 [ 0, %.lr.ph13.preheader ], [ %137, %.lr.ph13.prol.loopexit.loopexit ]
  %138 = icmp ult i32 %129, 3
  br i1 %138, label %.preheader.us.preheader, label %.lr.ph13.preheader87

.lr.ph13.preheader87:                             ; preds = %.lr.ph13.prol.loopexit
  %wide.trip.count27.3 = zext i32 %0 to i64
  %139 = add nsw i64 %wide.trip.count45.1, -4
  %140 = sub nsw i64 %139, %indvars.iv25.unr
  %141 = lshr i64 %140, 2
  %142 = add nuw nsw i64 %141, 1
  %min.iters.check127 = icmp ult i64 %142, 2
  br i1 %min.iters.check127, label %.lr.ph13.preheader167, label %min.iters.checked128

.lr.ph13.preheader167:                            ; preds = %middle.block125, %vector.memcheck145, %min.iters.checked128, %.lr.ph13.preheader87
  %indvars.iv25.ph = phi i64 [ %indvars.iv25.unr, %vector.memcheck145 ], [ %indvars.iv25.unr, %min.iters.checked128 ], [ %indvars.iv25.unr, %.lr.ph13.preheader87 ], [ %ind.end150, %middle.block125 ]
  br label %.lr.ph13

min.iters.checked128:                             ; preds = %.lr.ph13.preheader87
  %n.mod.vf129 = and i64 %142, 1
  %n.vec130 = sub nsw i64 %142, %n.mod.vf129
  %cmp.zero131 = icmp eq i64 %n.vec130, 0
  br i1 %cmp.zero131, label %.lr.ph13.preheader167, label %vector.memcheck145

vector.memcheck145:                               ; preds = %min.iters.checked128
  %scevgep133 = getelementptr double, double* %9, i64 %indvars.iv25.unr
  %143 = add nsw i64 %wide.trip.count45.1, -4
  %144 = sub nsw i64 %143, %indvars.iv25.unr
  %145 = and i64 %144, -4
  %146 = add nsw i64 %indvars.iv25.unr, %145
  %147 = add nsw i64 %146, 4
  %scevgep135 = getelementptr double, double* %9, i64 %147
  %scevgep137 = getelementptr double, double* %11, i64 %indvars.iv25.unr
  %scevgep139 = getelementptr double, double* %11, i64 %147
  %bound0141 = icmp ult double* %scevgep133, %scevgep139
  %bound1142 = icmp ult double* %scevgep137, %scevgep135
  %memcheck.conflict144 = and i1 %bound0141, %bound1142
  %148 = shl nuw i64 %141, 2
  %149 = add i64 %indvars.iv25.unr, %148
  %150 = add i64 %149, 4
  %151 = shl nuw nsw i64 %n.mod.vf129, 2
  %ind.end150 = sub i64 %150, %151
  br i1 %memcheck.conflict144, label %.lr.ph13.preheader167, label %vector.body124.preheader

vector.body124.preheader:                         ; preds = %vector.memcheck145
  br label %vector.body124

vector.body124:                                   ; preds = %vector.body124.preheader, %vector.body124
  %index147 = phi i64 [ %index.next148, %vector.body124 ], [ 0, %vector.body124.preheader ]
  %152 = shl i64 %index147, 2
  %153 = add i64 %indvars.iv25.unr, %152
  %154 = getelementptr inbounds double, double* %9, i64 %153
  %155 = bitcast double* %154 to <8 x double>*
  %wide.vec156 = load <8 x double>, <8 x double>* %155, align 8, !alias.scope !19, !noalias !22
  %156 = getelementptr inbounds double, double* %11, i64 %153
  %157 = bitcast double* %156 to <8 x double>*
  %wide.vec161 = load <8 x double>, <8 x double>* %157, align 8, !alias.scope !22
  %158 = fadd <8 x double> %wide.vec156, %wide.vec161
  %159 = shufflevector <8 x double> %158, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %160 = fadd <8 x double> %wide.vec156, %wide.vec161
  %161 = shufflevector <8 x double> %160, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %162 = fadd <8 x double> %wide.vec156, %wide.vec161
  %163 = shufflevector <8 x double> %162, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %164 = add nsw i64 %153, 3
  %165 = getelementptr inbounds double, double* %9, i64 %164
  %166 = fadd <8 x double> %wide.vec156, %wide.vec161
  %167 = shufflevector <8 x double> %166, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %168 = getelementptr double, double* %165, i64 -3
  %169 = bitcast double* %168 to <8 x double>*
  %170 = shufflevector <2 x double> %159, <2 x double> %161, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %171 = shufflevector <2 x double> %163, <2 x double> %167, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec166 = shufflevector <4 x double> %170, <4 x double> %171, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec166, <8 x double>* %169, align 8, !alias.scope !19, !noalias !22
  %index.next148 = add i64 %index147, 2
  %172 = icmp eq i64 %index.next148, %n.vec130
  br i1 %172, label %middle.block125, label %vector.body124, !llvm.loop !24

middle.block125:                                  ; preds = %vector.body124
  %cmp.n151 = icmp eq i64 %n.mod.vf129, 0
  br i1 %cmp.n151, label %.preheader4, label %.lr.ph13.preheader167

.preheader4.loopexit:                             ; preds = %.lr.ph13
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block125
  %173 = icmp sgt i32 %0, 0
  br i1 %173, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader4, %.lr.ph13.prol.loopexit
  %xtraiter = and i32 %0, 1
  %wide.trip.count24 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %174 = icmp eq i32 %xtraiter, 0
  br i1 %174, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %175 = ptrtoint double* %8 to i64
  %sunkaddr80 = shl i64 %indvars.iv22, 3
  %sunkaddr81 = add i64 %175, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  %176 = load double, double* %sunkaddr82, align 8
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 0
  %178 = load double, double* %177, align 8
  %179 = fmul double %178, %1
  %180 = load double, double* %9, align 8
  %181 = fmul double %179, %180
  %182 = fadd double %176, %181
  store double %182, double* %sunkaddr82, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  %183 = icmp eq i32 %0, 1
  br i1 %183, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %sunkaddr172 = ptrtoint double* %8 to i64
  %sunkaddr173 = mul i64 %indvars.iv22, 8
  %sunkaddr174 = add i64 %sunkaddr172, %sunkaddr173
  %sunkaddr175 = inttoptr i64 %sunkaddr174 to double*
  %184 = load double, double* %sunkaddr175, align 8
  %185 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv
  %186 = load double, double* %185, align 8
  %187 = fmul double %186, %1
  %188 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %189 = load double, double* %188, align 8
  %190 = fmul double %187, %189
  %191 = fadd double %184, %190
  store double %191, double* %sunkaddr175, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv.next
  %193 = load double, double* %192, align 8
  %194 = fmul double %193, %1
  %195 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %196 = load double, double* %195, align 8
  %197 = fmul double %194, %196
  %198 = fadd double %191, %197
  store double %198, double* %sunkaddr175, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond, label %._crit_edge11.loopexit, label %.preheader.us

.lr.ph13:                                         ; preds = %.lr.ph13.preheader167, %.lr.ph13
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.3, %.lr.ph13 ], [ %indvars.iv25.ph, %.lr.ph13.preheader167 ]
  %199 = getelementptr inbounds double, double* %9, i64 %indvars.iv25
  %200 = load double, double* %199, align 8
  %201 = getelementptr inbounds double, double* %11, i64 %indvars.iv25
  %202 = load double, double* %201, align 8
  %203 = fadd double %200, %202
  store double %203, double* %199, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %204 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26
  %205 = load double, double* %204, align 8
  %206 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26
  %207 = load double, double* %206, align 8
  %208 = fadd double %205, %207
  store double %208, double* %204, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %209 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.1
  %210 = load double, double* %209, align 8
  %211 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.1
  %212 = load double, double* %211, align 8
  %213 = fadd double %210, %212
  store double %213, double* %209, align 8
  %indvars.iv.next26.2 = add nsw i64 %indvars.iv25, 3
  %214 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.2
  %215 = load double, double* %214, align 8
  %216 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.2
  %217 = load double, double* %216, align 8
  %218 = fadd double %215, %217
  store double %218, double* %214, align 8
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

; <label>:13:                                     ; preds = %.lr.ph, %11
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
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
