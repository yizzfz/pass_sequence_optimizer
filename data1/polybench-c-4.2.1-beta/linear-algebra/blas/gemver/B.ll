; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  call void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  tail call void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
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
  tail call void @print_array(i32 2000, double* %30)
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

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) #2 {
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
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

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader8.us.preheader, label %._crit_edge11

.preheader8.us.preheader:                         ; preds = %12
  %xtraiter49 = and i32 %0, 1
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  %14 = icmp eq i32 %0, 1
  %wide.trip.count53 = zext i32 %0 to i64
  %sunkaddr64 = ptrtoint double* %4 to i64
  %sunkaddr68 = ptrtoint double* %6 to i64
  %wide.trip.count45.1 = zext i32 %0 to i64
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr60 = ptrtoint double* %6 to i64
  %15 = add nsw i64 %wide.trip.count45.1, -2
  %16 = add nsw i64 %wide.trip.count45.1, -2
  %scevgep95 = getelementptr double, double* %5, i64 2
  %scevgep100 = getelementptr double, double* %7, i64 2
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge20.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge20.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep90 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 2
  br i1 %lcmp.mod50, label %.prol.loopexit48, label %.prol.preheader47

.prol.preheader47:                                ; preds = %.preheader8.us
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 0
  %18 = load double, double* %17, align 8
  %sunkaddr57 = shl i64 %indvars.iv51, 3
  %sunkaddr58 = add i64 %sunkaddr, %sunkaddr57
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to double*
  %19 = load double, double* %sunkaddr59, align 8
  %20 = load double, double* %5, align 8
  %21 = fmul double %19, %20
  %22 = fadd double %18, %21
  %sunkaddr61 = shl i64 %indvars.iv51, 3
  %sunkaddr62 = add i64 %sunkaddr60, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  %23 = load double, double* %sunkaddr63, align 8
  %24 = load double, double* %7, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %22, %25
  store double %26, double* %17, align 8
  br label %.prol.loopexit48

.prol.loopexit48:                                 ; preds = %.prol.preheader47, %.preheader8.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %.prol.preheader47 ], [ 0, %.preheader8.us ]
  br i1 %14, label %._crit_edge20.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit48
  %sunkaddr65 = shl i64 %indvars.iv51, 3
  %sunkaddr66 = add i64 %sunkaddr64, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  %sunkaddr69 = shl i64 %indvars.iv51, 3
  %sunkaddr70 = add i64 %sunkaddr68, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  %27 = sub nsw i64 %15, %indvars.iv43.unr.ph
  %28 = lshr i64 %27, 1
  %29 = add nuw i64 %28, 1
  %min.iters.check = icmp ult i64 %29, 2
  br i1 %min.iters.check, label %.preheader8.us.new.preheader168, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader8.us.new.preheader
  %n.mod.vf = and i64 %29, 1
  %n.vec = sub i64 %29, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader8.us.new.preheader168, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep88 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43.unr.ph
  %scevgep8889 = bitcast double* %scevgep88 to i8*
  %30 = sub nsw i64 %16, %indvars.iv43.unr.ph
  %31 = and i64 %30, -2
  %32 = or i64 %indvars.iv43.unr.ph, %31
  %scevgep91 = getelementptr double, double* %scevgep90, i64 %32
  %scevgep9192 = bitcast double* %scevgep91 to i8*
  %scevgep93 = getelementptr double, double* %5, i64 %indvars.iv43.unr.ph
  %scevgep96 = getelementptr double, double* %scevgep95, i64 %32
  %scevgep98 = getelementptr double, double* %7, i64 %indvars.iv43.unr.ph
  %scevgep101 = getelementptr double, double* %scevgep100, i64 %32
  %bc = inttoptr i64 %sunkaddr66 to i8*
  %bc103 = inttoptr i64 %sunkaddr66 to i8*
  %bound0 = icmp ult i8* %scevgep8889, %bc103
  %bound1 = icmp ult i8* %bc, %scevgep9192
  %found.conflict = and i1 %bound0, %bound1
  %bound0104 = icmp ult double* %scevgep88, %scevgep96
  %bound1105 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx = or i1 %found.conflict, %found.conflict106
  %bc107 = inttoptr i64 %sunkaddr70 to i8*
  %bc108 = inttoptr i64 %sunkaddr70 to i8*
  %bound0109 = icmp ult i8* %scevgep8889, %bc108
  %bound1110 = icmp ult i8* %bc107, %scevgep9192
  %found.conflict111 = and i1 %bound0109, %bound1110
  %conflict.rdx112 = or i1 %conflict.rdx, %found.conflict111
  %bound0113 = icmp ult double* %scevgep88, %scevgep101
  %bound1114 = icmp ult double* %scevgep98, %scevgep91
  %found.conflict115 = and i1 %bound0113, %bound1114
  %conflict.rdx116 = or i1 %conflict.rdx112, %found.conflict115
  %33 = or i64 %indvars.iv43.unr.ph, 2
  %34 = shl nuw i64 %28, 1
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %35, %36
  br i1 %conflict.rdx116, label %.preheader8.us.new.preheader168, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv43.unr.ph, %37
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %offset.idx
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %39, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec117 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %40 = load double, double* %sunkaddr67, align 8, !alias.scope !9
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %43 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %44 = bitcast double* %43 to <4 x double>*
  %wide.vec118 = load <4 x double>, <4 x double>* %44, align 8, !alias.scope !10
  %strided.vec119 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec120 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %45 = fmul <2 x double> %42, %strided.vec119
  %46 = fadd <2 x double> %strided.vec, %45
  %47 = load double, double* %sunkaddr71, align 8, !alias.scope !11
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec121 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !12
  %strided.vec122 = shufflevector <4 x double> %wide.vec121, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec123 = shufflevector <4 x double> %wide.vec121, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %52 = fmul <2 x double> %49, %strided.vec122
  %53 = fadd <2 x double> %46, %52
  %54 = add nuw nsw i64 %offset.idx, 1
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %54
  %56 = load double, double* %sunkaddr67, align 8, !alias.scope !9
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = fmul <2 x double> %58, %strided.vec120
  %60 = fadd <2 x double> %strided.vec117, %59
  %61 = load double, double* %sunkaddr71, align 8, !alias.scope !11
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = fmul <2 x double> %63, %strided.vec123
  %65 = fadd <2 x double> %60, %64
  %66 = getelementptr double, double* %55, i64 -1
  %67 = bitcast double* %66 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %53, <2 x double> %65, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %67, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %68 = icmp eq i64 %index.next, %n.vec
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge20.us, label %.preheader8.us.new.preheader168

.preheader8.us.new.preheader168:                  ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader8.us.new.preheader
  %indvars.iv43.ph = phi i64 [ %indvars.iv43.unr.ph, %vector.memcheck ], [ %indvars.iv43.unr.ph, %min.iters.checked ], [ %indvars.iv43.unr.ph, %.preheader8.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader168, %.preheader8.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %.preheader8.us.new ], [ %indvars.iv43.ph, %.preheader8.us.new.preheader168 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43
  %70 = load double, double* %69, align 8
  %71 = load double, double* %sunkaddr67, align 8
  %72 = getelementptr inbounds double, double* %5, i64 %indvars.iv43
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %70, %74
  %76 = load double, double* %sunkaddr71, align 8
  %77 = getelementptr inbounds double, double* %7, i64 %indvars.iv43
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %75, %79
  store double %80, double* %69, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv.next44
  %82 = load double, double* %81, align 8
  %83 = load double, double* %sunkaddr67, align 8
  %84 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next44
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fadd double %82, %86
  %88 = load double, double* %sunkaddr71, align 8
  %89 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next44
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fadd double %87, %91
  store double %92, double* %81, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next44.1, %wide.trip.count45.1
  br i1 %exitcond46.1, label %._crit_edge20.us.loopexit, label %.preheader8.us.new, !llvm.loop !16

._crit_edge20.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %middle.block, %.prol.loopexit48
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %.preheader7, label %.preheader8.us

.preheader7:                                      ; preds = %._crit_edge20.us
  %93 = icmp sgt i32 %0, 0
  br i1 %93, label %.preheader6.us.preheader, label %._crit_edge11

.preheader6.us.preheader:                         ; preds = %.preheader7
  %xtraiter37 = and i32 %0, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %94 = icmp eq i32 %0, 1
  %wide.trip.count41 = zext i32 %0 to i64
  %sunkaddr76 = ptrtoint double* %9 to i64
  %wide.trip.count33.1 = zext i32 %0 to i64
  %sunkaddr72 = ptrtoint double* %9 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge16.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge16.us ], [ 0, %.preheader6.us.preheader ]
  br i1 %lcmp.mod38, label %.prol.loopexit36, label %.prol.preheader35

.prol.preheader35:                                ; preds = %.preheader6.us
  %sunkaddr73 = shl i64 %indvars.iv39, 3
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  %95 = load double, double* %sunkaddr75, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv39
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, %2
  %99 = load double, double* %10, align 8
  %100 = fmul double %98, %99
  %101 = fadd double %95, %100
  store double %101, double* %sunkaddr75, align 8
  br label %.prol.loopexit36

.prol.loopexit36:                                 ; preds = %.prol.preheader35, %.preheader6.us
  %indvars.iv31.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %.preheader6.us ]
  br i1 %94, label %._crit_edge16.us, label %.preheader6.us.new.preheader

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit36
  %sunkaddr77 = shl i64 %indvars.iv39, 3
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new.preheader, %.preheader6.us.new
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %.preheader6.us.new ], [ %indvars.iv31.unr.ph, %.preheader6.us.new.preheader ]
  %102 = load double, double* %sunkaddr79, align 8
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv39
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %2
  %106 = getelementptr inbounds double, double* %10, i64 %indvars.iv31
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = fadd double %102, %108
  store double %109, double* %sunkaddr79, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next32, i64 %indvars.iv39
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %2
  %113 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next32
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fadd double %109, %115
  store double %116, double* %sunkaddr79, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next32.1, %wide.trip.count33.1
  br i1 %exitcond34.1, label %._crit_edge16.us.loopexit, label %.preheader6.us.new

._crit_edge16.us.loopexit:                        ; preds = %.preheader6.us.new
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %.prol.loopexit36
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %.preheader5, label %.preheader6.us

.preheader5:                                      ; preds = %._crit_edge16.us
  %117 = icmp sgt i32 %0, 0
  br i1 %117, label %.lr.ph13.preheader, label %._crit_edge11

.lr.ph13.preheader:                               ; preds = %.preheader5
  %118 = add i32 %0, -1
  %xtraiter29 = and i32 %0, 3
  %lcmp.mod30 = icmp eq i32 %xtraiter29, 0
  br i1 %lcmp.mod30, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol.preheader

.lr.ph13.prol.preheader:                          ; preds = %.lr.ph13.preheader
  br label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.prol.preheader, %.lr.ph13.prol
  %indvars.iv25.prol = phi i64 [ %indvars.iv.next26.prol, %.lr.ph13.prol ], [ 0, %.lr.ph13.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph13.prol ], [ %xtraiter29, %.lr.ph13.prol.preheader ]
  %119 = getelementptr inbounds double, double* %9, i64 %indvars.iv25.prol
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds double, double* %11, i64 %indvars.iv25.prol
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  store double %123, double* %119, align 8
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.prol.loopexit.loopexit, label %.lr.ph13.prol, !llvm.loop !17

.lr.ph13.prol.loopexit.loopexit:                  ; preds = %.lr.ph13.prol
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.prol.loopexit.loopexit, %.lr.ph13.preheader
  %indvars.iv25.unr = phi i64 [ 0, %.lr.ph13.preheader ], [ %indvars.iv.next26.prol, %.lr.ph13.prol.loopexit.loopexit ]
  %124 = icmp ult i32 %118, 3
  br i1 %124, label %.preheader.us.preheader, label %.lr.ph13.preheader56

.lr.ph13.preheader56:                             ; preds = %.lr.ph13.prol.loopexit
  %wide.trip.count27.3 = zext i32 %0 to i64
  %125 = add nsw i64 %wide.trip.count45.1, -4
  %126 = sub i64 %125, %indvars.iv25.unr
  %127 = lshr i64 %126, 2
  %128 = add nuw nsw i64 %127, 1
  %min.iters.check127 = icmp ult i64 %128, 2
  br i1 %min.iters.check127, label %.lr.ph13.preheader167, label %min.iters.checked128

.lr.ph13.preheader167:                            ; preds = %middle.block125, %vector.memcheck145, %min.iters.checked128, %.lr.ph13.preheader56
  %indvars.iv25.ph = phi i64 [ %indvars.iv25.unr, %vector.memcheck145 ], [ %indvars.iv25.unr, %min.iters.checked128 ], [ %indvars.iv25.unr, %.lr.ph13.preheader56 ], [ %ind.end150, %middle.block125 ]
  br label %.lr.ph13

min.iters.checked128:                             ; preds = %.lr.ph13.preheader56
  %n.mod.vf129 = and i64 %128, 1
  %n.vec130 = sub nsw i64 %128, %n.mod.vf129
  %cmp.zero131 = icmp eq i64 %n.vec130, 0
  br i1 %cmp.zero131, label %.lr.ph13.preheader167, label %vector.memcheck145

vector.memcheck145:                               ; preds = %min.iters.checked128
  %scevgep133 = getelementptr double, double* %9, i64 %indvars.iv25.unr
  %129 = add nsw i64 %wide.trip.count45.1, -4
  %130 = sub i64 %129, %indvars.iv25.unr
  %131 = and i64 %130, -4
  %132 = add i64 %indvars.iv25.unr, %131
  %133 = add i64 %132, 4
  %scevgep135 = getelementptr double, double* %9, i64 %133
  %scevgep137 = getelementptr double, double* %11, i64 %indvars.iv25.unr
  %scevgep139 = getelementptr double, double* %11, i64 %133
  %bound0141 = icmp ult double* %scevgep133, %scevgep139
  %bound1142 = icmp ult double* %scevgep137, %scevgep135
  %memcheck.conflict144 = and i1 %bound0141, %bound1142
  %134 = shl nuw i64 %127, 2
  %135 = add i64 %indvars.iv25.unr, %134
  %136 = add i64 %135, 4
  %137 = shl nuw nsw i64 %n.mod.vf129, 2
  %ind.end150 = sub i64 %136, %137
  br i1 %memcheck.conflict144, label %.lr.ph13.preheader167, label %vector.body124.preheader

vector.body124.preheader:                         ; preds = %vector.memcheck145
  br label %vector.body124

vector.body124:                                   ; preds = %vector.body124.preheader, %vector.body124
  %index147 = phi i64 [ %index.next148, %vector.body124 ], [ 0, %vector.body124.preheader ]
  %138 = shl i64 %index147, 2
  %139 = add i64 %indvars.iv25.unr, %138
  %140 = getelementptr inbounds double, double* %9, i64 %139
  %141 = bitcast double* %140 to <8 x double>*
  %wide.vec156 = load <8 x double>, <8 x double>* %141, align 8, !alias.scope !19, !noalias !22
  %142 = getelementptr inbounds double, double* %11, i64 %139
  %143 = bitcast double* %142 to <8 x double>*
  %wide.vec161 = load <8 x double>, <8 x double>* %143, align 8, !alias.scope !22
  %144 = fadd <8 x double> %wide.vec156, %wide.vec161
  %145 = shufflevector <8 x double> %144, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %146 = fadd <8 x double> %wide.vec156, %wide.vec161
  %147 = shufflevector <8 x double> %146, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %148 = fadd <8 x double> %wide.vec156, %wide.vec161
  %149 = shufflevector <8 x double> %148, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %150 = add nsw i64 %139, 3
  %151 = getelementptr inbounds double, double* %9, i64 %150
  %152 = fadd <8 x double> %wide.vec156, %wide.vec161
  %153 = shufflevector <8 x double> %152, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %154 = getelementptr double, double* %151, i64 -3
  %155 = bitcast double* %154 to <8 x double>*
  %156 = shufflevector <2 x double> %145, <2 x double> %147, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %157 = shufflevector <2 x double> %149, <2 x double> %153, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec166 = shufflevector <4 x double> %156, <4 x double> %157, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec166, <8 x double>* %155, align 8, !alias.scope !19, !noalias !22
  %index.next148 = add i64 %index147, 2
  %158 = icmp eq i64 %index.next148, %n.vec130
  br i1 %158, label %middle.block125, label %vector.body124, !llvm.loop !24

middle.block125:                                  ; preds = %vector.body124
  %cmp.n151 = icmp eq i64 %n.mod.vf129, 0
  br i1 %cmp.n151, label %.preheader4, label %.lr.ph13.preheader167

.preheader4.loopexit:                             ; preds = %.lr.ph13
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block125
  %159 = icmp sgt i32 %0, 0
  br i1 %159, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader4, %.lr.ph13.prol.loopexit
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %160 = icmp eq i32 %0, 1
  %wide.trip.count24 = zext i32 %0 to i64
  %sunkaddr84 = ptrtoint double* %8 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %sunkaddr80 = ptrtoint double* %8 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %sunkaddr81 = shl i64 %indvars.iv22, 3
  %sunkaddr82 = add i64 %sunkaddr80, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %161 = load double, double* %sunkaddr83, align 8
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 0
  %163 = load double, double* %162, align 8
  %164 = fmul double %163, %1
  %165 = load double, double* %9, align 8
  %166 = fmul double %164, %165
  %167 = fadd double %161, %166
  store double %167, double* %sunkaddr83, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %160, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %sunkaddr85 = shl i64 %indvars.iv22, 3
  %sunkaddr86 = add i64 %sunkaddr84, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %168 = load double, double* %sunkaddr87, align 8
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv
  %170 = load double, double* %169, align 8
  %171 = fmul double %170, %1
  %172 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %173 = load double, double* %172, align 8
  %174 = fmul double %171, %173
  %175 = fadd double %168, %174
  store double %175, double* %sunkaddr87, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv.next
  %177 = load double, double* %176, align 8
  %178 = fmul double %177, %1
  %179 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %180 = load double, double* %179, align 8
  %181 = fmul double %178, %180
  %182 = fadd double %175, %181
  store double %182, double* %sunkaddr87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
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
  %183 = getelementptr inbounds double, double* %9, i64 %indvars.iv25
  %184 = load double, double* %183, align 8
  %185 = getelementptr inbounds double, double* %11, i64 %indvars.iv25
  %186 = load double, double* %185, align 8
  %187 = fadd double %184, %186
  store double %187, double* %183, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %188 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26
  %189 = load double, double* %188, align 8
  %190 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26
  %191 = load double, double* %190, align 8
  %192 = fadd double %189, %191
  store double %192, double* %188, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %193 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.1
  %194 = load double, double* %193, align 8
  %195 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.1
  %196 = load double, double* %195, align 8
  %197 = fadd double %194, %196
  store double %197, double* %193, align 8
  %indvars.iv.next26.2 = add nsw i64 %indvars.iv25, 3
  %198 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.2
  %199 = load double, double* %198, align 8
  %200 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.2
  %201 = load double, double* %200, align 8
  %202 = fadd double %199, %201
  store double %202, double* %198, align 8
  %indvars.iv.next26.3 = add nsw i64 %indvars.iv25, 4
  %exitcond28.3 = icmp eq i64 %indvars.iv.next26.3, %wide.trip.count27.3
  br i1 %exitcond28.3, label %.preheader4.loopexit, label %.lr.ph13, !llvm.loop !25

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %12, %.preheader7, %.preheader5, %.preheader4
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double* nocapture readonly) #0 {
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
