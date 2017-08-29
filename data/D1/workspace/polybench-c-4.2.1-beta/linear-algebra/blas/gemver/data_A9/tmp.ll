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
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(i32 2000, double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %13 = sitofp i32 %0 to double
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph35.split.us.preheader, label %._crit_edge

.lr.ph35.split.us.preheader:                      ; preds = %12
  %xtraiter = and i32 %0, 1
  %wide.trip.count38 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %15 = fdiv double 0.000000e+00, %13
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %.lr.ph35.split.us.preheader, %..loopexit_crit_edge.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %..loopexit_crit_edge.us ], [ 0, %.lr.ph35.split.us.preheader ]
  %18 = icmp eq i32 %xtraiter, 0
  %19 = trunc i64 %indvars.iv36 to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv36
  store double %20, double* %21, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %22 = trunc i64 %indvars.iv.next37 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %13
  %25 = fmul double %24, 5.000000e-01
  %26 = getelementptr inbounds double, double* %6, i64 %indvars.iv36
  store double %25, double* %26, align 8
  %27 = fmul double %24, 2.500000e-01
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv36
  store double %27, double* %28, align 8
  %29 = fdiv double %24, 6.000000e+00
  %30 = getelementptr inbounds double, double* %7, i64 %indvars.iv36
  store double %29, double* %30, align 8
  %31 = fmul double %24, 1.250000e-01
  %32 = getelementptr inbounds double, double* %10, i64 %indvars.iv36
  store double %31, double* %32, align 8
  %33 = fdiv double %24, 9.000000e+00
  %34 = getelementptr inbounds double, double* %11, i64 %indvars.iv36
  store double %33, double* %34, align 8
  %35 = getelementptr inbounds double, double* %9, i64 %indvars.iv36
  store double 0.000000e+00, double* %35, align 8
  %36 = getelementptr inbounds double, double* %8, i64 %indvars.iv36
  store double 0.000000e+00, double* %36, align 8
  br i1 %18, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph35.split.us
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv36, i64 0
  store double %15, double* %37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph35.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph35.split.us ]
  %38 = icmp eq i32 %0, 1
  br i1 %38, label %..loopexit_crit_edge.us, label %.lr.ph35.split.us.new.preheader

.lr.ph35.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph35.split.us.new

.lr.ph35.split.us.new:                            ; preds = %.lr.ph35.split.us.new.preheader, %.lr.ph35.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph35.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph35.split.us.new.preheader ]
  %39 = mul nuw nsw i64 %indvars.iv, %indvars.iv36
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv36
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fdiv <2 x double> %49, %17
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph35.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph35.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph35.split.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %12
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader60.us.preheader, label %._crit_edge63

.preheader60.us.preheader:                        ; preds = %12
  %xtraiter101 = and i32 %0, 1
  %wide.trip.count105 = zext i32 %0 to i64
  %wide.trip.count97.1 = zext i32 %0 to i64
  %14 = add nsw i64 %wide.trip.count97.1, -2
  %15 = add nsw i64 %wide.trip.count97.1, -2
  %scevgep116 = getelementptr double, double* %5, i64 2
  %scevgep121 = getelementptr double, double* %7, i64 2
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %.preheader60.us.preheader, %._crit_edge72.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge72.us ], [ 0, %.preheader60.us.preheader ]
  %16 = icmp eq i32 %xtraiter101, 0
  %scevgep111 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 2
  %17 = getelementptr inbounds double, double* %4, i64 %indvars.iv103
  %18 = getelementptr inbounds double, double* %6, i64 %indvars.iv103
  br i1 %16, label %.prol.loopexit100, label %.prol.preheader99

.prol.preheader99:                                ; preds = %.preheader60.us
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 0
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
  br label %.prol.loopexit100

.prol.loopexit100:                                ; preds = %.prol.preheader99, %.preheader60.us
  %indvars.iv95.unr.ph = phi i64 [ 1, %.prol.preheader99 ], [ 0, %.preheader60.us ]
  %29 = icmp eq i32 %0, 1
  br i1 %29, label %._crit_edge72.us, label %.preheader60.us.new.preheader

.preheader60.us.new.preheader:                    ; preds = %.prol.loopexit100
  %30 = sub nsw i64 %14, %indvars.iv95.unr.ph
  %31 = lshr i64 %30, 1
  %32 = add nuw i64 %31, 1
  %min.iters.check = icmp ult i64 %32, 2
  br i1 %min.iters.check, label %.preheader60.us.new.preheader189, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader60.us.new.preheader
  %n.mod.vf = and i64 %32, 1
  %n.vec = sub i64 %32, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader60.us.new.preheader189, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep109 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %indvars.iv95.unr.ph
  %33 = sub nsw i64 %15, %indvars.iv95.unr.ph
  %34 = and i64 %33, -2
  %35 = or i64 %indvars.iv95.unr.ph, %34
  %scevgep112 = getelementptr double, double* %scevgep111, i64 %35
  %scevgep114 = getelementptr double, double* %5, i64 %indvars.iv95.unr.ph
  %scevgep117 = getelementptr double, double* %scevgep116, i64 %35
  %scevgep119 = getelementptr double, double* %7, i64 %indvars.iv95.unr.ph
  %scevgep122 = getelementptr double, double* %scevgep121, i64 %35
  %bound0 = icmp ult double* %scevgep109, %17
  %bound1 = icmp ult double* %17, %scevgep112
  %found.conflict = and i1 %bound0, %bound1
  %bound0125 = icmp ult double* %scevgep109, %scevgep117
  %bound1126 = icmp ult double* %scevgep114, %scevgep112
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx = or i1 %found.conflict, %found.conflict127
  %bound0130 = icmp ult double* %scevgep109, %18
  %bound1131 = icmp ult double* %18, %scevgep112
  %found.conflict132 = and i1 %bound0130, %bound1131
  %conflict.rdx133 = or i1 %conflict.rdx, %found.conflict132
  %bound0134 = icmp ult double* %scevgep109, %scevgep122
  %bound1135 = icmp ult double* %scevgep119, %scevgep112
  %found.conflict136 = and i1 %bound0134, %bound1135
  %conflict.rdx137 = or i1 %conflict.rdx133, %found.conflict136
  %36 = or i64 %indvars.iv95.unr.ph, 2
  %37 = shl nuw i64 %31, 1
  %38 = add i64 %36, %37
  %39 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %38, %39
  br i1 %conflict.rdx137, label %.preheader60.us.new.preheader189, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %40 = load double, double* %17, align 8, !alias.scope !1
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %43 = load double, double* %18, align 8, !alias.scope !4
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = load double, double* %17, align 8, !alias.scope !1
  %47 = insertelement <2 x double> undef, double %46, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = load double, double* %18, align 8, !alias.scope !4
  %50 = insertelement <2 x double> undef, double %49, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %52 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv95.unr.ph, %52
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %offset.idx
  %54 = bitcast double* %53 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec138 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %55 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %56 = bitcast double* %55 to <4 x double>*
  %wide.vec139 = load <4 x double>, <4 x double>* %56, align 8, !alias.scope !11
  %strided.vec140 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec141 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %57 = fmul <2 x double> %42, %strided.vec140
  %58 = fadd <2 x double> %strided.vec, %57
  %59 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %60 = bitcast double* %59 to <4 x double>*
  %wide.vec142 = load <4 x double>, <4 x double>* %60, align 8, !alias.scope !12
  %strided.vec143 = shufflevector <4 x double> %wide.vec142, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec144 = shufflevector <4 x double> %wide.vec142, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %61 = fmul <2 x double> %45, %strided.vec143
  %62 = fadd <2 x double> %58, %61
  %63 = add nuw nsw i64 %offset.idx, 1
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %63
  %65 = fmul <2 x double> %48, %strided.vec141
  %66 = fadd <2 x double> %strided.vec138, %65
  %67 = fmul <2 x double> %51, %strided.vec144
  %68 = fadd <2 x double> %66, %67
  %69 = getelementptr double, double* %64, i64 -1
  %70 = bitcast double* %69 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %62, <2 x double> %68, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %71 = icmp eq i64 %index.next, %n.vec
  br i1 %71, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge72.us, label %.preheader60.us.new.preheader189

.preheader60.us.new.preheader189:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader60.us.new.preheader
  %indvars.iv95.ph = phi i64 [ %indvars.iv95.unr.ph, %vector.memcheck ], [ %indvars.iv95.unr.ph, %min.iters.checked ], [ %indvars.iv95.unr.ph, %.preheader60.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader60.us.new

.preheader60.us.new:                              ; preds = %.preheader60.us.new.preheader189, %.preheader60.us.new
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %.preheader60.us.new ], [ %indvars.iv95.ph, %.preheader60.us.new.preheader189 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %indvars.iv95
  %73 = load double, double* %72, align 8
  %74 = load double, double* %17, align 8
  %75 = getelementptr inbounds double, double* %5, i64 %indvars.iv95
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %73, %77
  %79 = load double, double* %18, align 8
  %80 = getelementptr inbounds double, double* %7, i64 %indvars.iv95
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %78, %82
  store double %83, double* %72, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %indvars.iv.next96
  %85 = load double, double* %84, align 8
  %86 = load double, double* %17, align 8
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next96
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fadd double %85, %89
  %91 = load double, double* %18, align 8
  %92 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next96
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fadd double %90, %94
  store double %95, double* %84, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %exitcond98.1 = icmp eq i64 %indvars.iv.next96.1, %wide.trip.count97.1
  br i1 %exitcond98.1, label %._crit_edge72.us.loopexit, label %.preheader60.us.new, !llvm.loop !16

._crit_edge72.us.loopexit:                        ; preds = %.preheader60.us.new
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %._crit_edge72.us.loopexit, %middle.block, %.prol.loopexit100
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, %wide.trip.count105
  br i1 %exitcond106, label %.preheader59, label %.preheader60.us

.preheader59:                                     ; preds = %._crit_edge72.us
  %96 = icmp sgt i32 %0, 0
  br i1 %96, label %.preheader58.us.preheader, label %._crit_edge63

.preheader58.us.preheader:                        ; preds = %.preheader59
  %xtraiter89 = and i32 %0, 1
  %wide.trip.count93 = zext i32 %0 to i64
  %wide.trip.count85.1 = zext i32 %0 to i64
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %.preheader58.us.preheader, %._crit_edge68.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge68.us ], [ 0, %.preheader58.us.preheader ]
  %97 = icmp eq i32 %xtraiter89, 0
  br i1 %97, label %.prol.loopexit88, label %.prol.preheader87

.prol.preheader87:                                ; preds = %.preheader58.us
  %sunkaddr = ptrtoint double* %9 to i64
  %sunkaddr190 = mul i64 %indvars.iv91, 8
  %sunkaddr191 = add i64 %sunkaddr, %sunkaddr190
  %sunkaddr192 = inttoptr i64 %sunkaddr191 to double*
  %98 = load double, double* %sunkaddr192, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv91
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %2
  %102 = load double, double* %10, align 8
  %103 = fmul double %101, %102
  %104 = fadd double %98, %103
  store double %104, double* %sunkaddr192, align 8
  br label %.prol.loopexit88

.prol.loopexit88:                                 ; preds = %.prol.preheader87, %.preheader58.us
  %indvars.iv83.unr.ph = phi i64 [ 1, %.prol.preheader87 ], [ 0, %.preheader58.us ]
  %105 = icmp eq i32 %0, 1
  br i1 %105, label %._crit_edge68.us, label %.preheader58.us.new.preheader

.preheader58.us.new.preheader:                    ; preds = %.prol.loopexit88
  br label %.preheader58.us.new

.preheader58.us.new:                              ; preds = %.preheader58.us.new.preheader, %.preheader58.us.new
  %indvars.iv83 = phi i64 [ %indvars.iv.next84.1, %.preheader58.us.new ], [ %indvars.iv83.unr.ph, %.preheader58.us.new.preheader ]
  %sunkaddr193 = ptrtoint double* %9 to i64
  %sunkaddr194 = mul i64 %indvars.iv91, 8
  %sunkaddr195 = add i64 %sunkaddr193, %sunkaddr194
  %sunkaddr196 = inttoptr i64 %sunkaddr195 to double*
  %106 = load double, double* %sunkaddr196, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv83, i64 %indvars.iv91
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %2
  %110 = getelementptr inbounds double, double* %10, i64 %indvars.iv83
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = fadd double %106, %112
  store double %113, double* %sunkaddr196, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next84, i64 %indvars.iv91
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %2
  %117 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next84
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fadd double %113, %119
  store double %120, double* %sunkaddr196, align 8
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next84.1, %wide.trip.count85.1
  br i1 %exitcond86.1, label %._crit_edge68.us.loopexit, label %.preheader58.us.new

._crit_edge68.us.loopexit:                        ; preds = %.preheader58.us.new
  br label %._crit_edge68.us

._crit_edge68.us:                                 ; preds = %._crit_edge68.us.loopexit, %.prol.loopexit88
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %.preheader57, label %.preheader58.us

.preheader57:                                     ; preds = %._crit_edge68.us
  %121 = icmp sgt i32 %0, 0
  br i1 %121, label %.lr.ph65.preheader, label %._crit_edge63

.lr.ph65.preheader:                               ; preds = %.preheader57
  %122 = add i32 %0, -1
  %xtraiter81 = and i32 %0, 3
  %lcmp.mod82 = icmp eq i32 %xtraiter81, 0
  br i1 %lcmp.mod82, label %.lr.ph65.prol.loopexit, label %.lr.ph65.prol.preheader

.lr.ph65.prol.preheader:                          ; preds = %.lr.ph65.preheader
  br label %.lr.ph65.prol

.lr.ph65.prol:                                    ; preds = %.lr.ph65.prol.preheader, %.lr.ph65.prol
  %indvars.iv77.prol = phi i64 [ %indvars.iv.next78.prol, %.lr.ph65.prol ], [ 0, %.lr.ph65.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph65.prol ], [ %xtraiter81, %.lr.ph65.prol.preheader ]
  %123 = getelementptr inbounds double, double* %9, i64 %indvars.iv77.prol
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds double, double* %11, i64 %indvars.iv77.prol
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  store double %127, double* %123, align 8
  %indvars.iv.next78.prol = add nuw nsw i64 %indvars.iv77.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph65.prol.loopexit.loopexit, label %.lr.ph65.prol, !llvm.loop !17

.lr.ph65.prol.loopexit.loopexit:                  ; preds = %.lr.ph65.prol
  br label %.lr.ph65.prol.loopexit

.lr.ph65.prol.loopexit:                           ; preds = %.lr.ph65.prol.loopexit.loopexit, %.lr.ph65.preheader
  %indvars.iv77.unr = phi i64 [ 0, %.lr.ph65.preheader ], [ %indvars.iv.next78.prol, %.lr.ph65.prol.loopexit.loopexit ]
  %128 = icmp ult i32 %122, 3
  br i1 %128, label %.preheader.us.preheader, label %.lr.ph65.preheader108

.lr.ph65.preheader108:                            ; preds = %.lr.ph65.prol.loopexit
  %wide.trip.count79.3 = zext i32 %0 to i64
  %129 = add nsw i64 %wide.trip.count97.1, -4
  %130 = sub i64 %129, %indvars.iv77.unr
  %131 = lshr i64 %130, 2
  %132 = add nuw nsw i64 %131, 1
  %min.iters.check148 = icmp ult i64 %132, 2
  br i1 %min.iters.check148, label %.lr.ph65.preheader188, label %min.iters.checked149

.lr.ph65.preheader188:                            ; preds = %middle.block146, %vector.memcheck166, %min.iters.checked149, %.lr.ph65.preheader108
  %indvars.iv77.ph = phi i64 [ %indvars.iv77.unr, %vector.memcheck166 ], [ %indvars.iv77.unr, %min.iters.checked149 ], [ %indvars.iv77.unr, %.lr.ph65.preheader108 ], [ %ind.end171, %middle.block146 ]
  br label %.lr.ph65

min.iters.checked149:                             ; preds = %.lr.ph65.preheader108
  %n.mod.vf150 = and i64 %132, 1
  %n.vec151 = sub nsw i64 %132, %n.mod.vf150
  %cmp.zero152 = icmp eq i64 %n.vec151, 0
  br i1 %cmp.zero152, label %.lr.ph65.preheader188, label %vector.memcheck166

vector.memcheck166:                               ; preds = %min.iters.checked149
  %scevgep154 = getelementptr double, double* %9, i64 %indvars.iv77.unr
  %133 = add nsw i64 %wide.trip.count97.1, -4
  %134 = sub i64 %133, %indvars.iv77.unr
  %135 = and i64 %134, -4
  %136 = add i64 %indvars.iv77.unr, %135
  %137 = add i64 %136, 4
  %scevgep156 = getelementptr double, double* %9, i64 %137
  %scevgep158 = getelementptr double, double* %11, i64 %indvars.iv77.unr
  %scevgep160 = getelementptr double, double* %11, i64 %137
  %bound0162 = icmp ult double* %scevgep154, %scevgep160
  %bound1163 = icmp ult double* %scevgep158, %scevgep156
  %memcheck.conflict165 = and i1 %bound0162, %bound1163
  %138 = shl nuw i64 %131, 2
  %139 = add i64 %indvars.iv77.unr, %138
  %140 = add i64 %139, 4
  %141 = shl nuw nsw i64 %n.mod.vf150, 2
  %ind.end171 = sub i64 %140, %141
  br i1 %memcheck.conflict165, label %.lr.ph65.preheader188, label %vector.body145.preheader

vector.body145.preheader:                         ; preds = %vector.memcheck166
  br label %vector.body145

vector.body145:                                   ; preds = %vector.body145.preheader, %vector.body145
  %index168 = phi i64 [ %index.next169, %vector.body145 ], [ 0, %vector.body145.preheader ]
  %142 = shl i64 %index168, 2
  %143 = add i64 %indvars.iv77.unr, %142
  %144 = getelementptr inbounds double, double* %9, i64 %143
  %145 = bitcast double* %144 to <8 x double>*
  %wide.vec177 = load <8 x double>, <8 x double>* %145, align 8, !alias.scope !19, !noalias !22
  %146 = getelementptr inbounds double, double* %11, i64 %143
  %147 = bitcast double* %146 to <8 x double>*
  %wide.vec182 = load <8 x double>, <8 x double>* %147, align 8, !alias.scope !22
  %148 = fadd <8 x double> %wide.vec177, %wide.vec182
  %149 = shufflevector <8 x double> %148, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %150 = fadd <8 x double> %wide.vec177, %wide.vec182
  %151 = shufflevector <8 x double> %150, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %152 = fadd <8 x double> %wide.vec177, %wide.vec182
  %153 = shufflevector <8 x double> %152, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %154 = add nsw i64 %143, 3
  %155 = getelementptr inbounds double, double* %9, i64 %154
  %156 = fadd <8 x double> %wide.vec177, %wide.vec182
  %157 = shufflevector <8 x double> %156, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %158 = getelementptr double, double* %155, i64 -3
  %159 = bitcast double* %158 to <8 x double>*
  %160 = shufflevector <2 x double> %149, <2 x double> %151, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %161 = shufflevector <2 x double> %153, <2 x double> %157, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec187 = shufflevector <4 x double> %160, <4 x double> %161, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec187, <8 x double>* %159, align 8, !alias.scope !19, !noalias !22
  %index.next169 = add i64 %index168, 2
  %162 = icmp eq i64 %index.next169, %n.vec151
  br i1 %162, label %middle.block146, label %vector.body145, !llvm.loop !24

middle.block146:                                  ; preds = %vector.body145
  %cmp.n172 = icmp eq i64 %n.mod.vf150, 0
  br i1 %cmp.n172, label %.preheader56, label %.lr.ph65.preheader188

.preheader56.loopexit:                            ; preds = %.lr.ph65
  br label %.preheader56

.preheader56:                                     ; preds = %.preheader56.loopexit, %middle.block146
  %163 = icmp sgt i32 %0, 0
  br i1 %163, label %.preheader.us.preheader, label %._crit_edge63

.preheader.us.preheader:                          ; preds = %.preheader56, %.lr.ph65.prol.loopexit
  %xtraiter = and i32 %0, 1
  %wide.trip.count76 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %164 = icmp eq i32 %xtraiter, 0
  br i1 %164, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %sunkaddr197 = ptrtoint double* %8 to i64
  %sunkaddr198 = mul i64 %indvars.iv74, 8
  %sunkaddr199 = add i64 %sunkaddr197, %sunkaddr198
  %sunkaddr200 = inttoptr i64 %sunkaddr199 to double*
  %165 = load double, double* %sunkaddr200, align 8
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv74, i64 0
  %167 = load double, double* %166, align 8
  %168 = fmul double %167, %1
  %169 = load double, double* %9, align 8
  %170 = fmul double %168, %169
  %171 = fadd double %165, %170
  store double %171, double* %sunkaddr200, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  %172 = icmp eq i32 %0, 1
  br i1 %172, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %sunkaddr201 = ptrtoint double* %8 to i64
  %sunkaddr202 = mul i64 %indvars.iv74, 8
  %sunkaddr203 = add i64 %sunkaddr201, %sunkaddr202
  %sunkaddr204 = inttoptr i64 %sunkaddr203 to double*
  %173 = load double, double* %sunkaddr204, align 8
  %174 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv
  %175 = load double, double* %174, align 8
  %176 = fmul double %175, %1
  %177 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %178 = load double, double* %177, align 8
  %179 = fmul double %176, %178
  %180 = fadd double %173, %179
  store double %180, double* %sunkaddr204, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %181 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv.next
  %182 = load double, double* %181, align 8
  %183 = fmul double %182, %1
  %184 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %185 = load double, double* %184, align 8
  %186 = fmul double %183, %185
  %187 = fadd double %180, %186
  store double %187, double* %sunkaddr204, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond, label %._crit_edge63.loopexit, label %.preheader.us

.lr.ph65:                                         ; preds = %.lr.ph65.preheader188, %.lr.ph65
  %indvars.iv77 = phi i64 [ %indvars.iv.next78.3, %.lr.ph65 ], [ %indvars.iv77.ph, %.lr.ph65.preheader188 ]
  %188 = getelementptr inbounds double, double* %9, i64 %indvars.iv77
  %189 = load double, double* %188, align 8
  %190 = getelementptr inbounds double, double* %11, i64 %indvars.iv77
  %191 = load double, double* %190, align 8
  %192 = fadd double %189, %191
  store double %192, double* %188, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %193 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next78
  %194 = load double, double* %193, align 8
  %195 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next78
  %196 = load double, double* %195, align 8
  %197 = fadd double %194, %196
  store double %197, double* %193, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %198 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next78.1
  %199 = load double, double* %198, align 8
  %200 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next78.1
  %201 = load double, double* %200, align 8
  %202 = fadd double %199, %201
  store double %202, double* %198, align 8
  %indvars.iv.next78.2 = add nsw i64 %indvars.iv77, 3
  %203 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next78.2
  %204 = load double, double* %203, align 8
  %205 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next78.2
  %206 = load double, double* %205, align 8
  %207 = fadd double %204, %206
  store double %207, double* %203, align 8
  %indvars.iv.next78.3 = add nsw i64 %indvars.iv77, 4
  %exitcond80.3 = icmp eq i64 %indvars.iv.next78.3, %wide.trip.count79.3
  br i1 %exitcond80.3, label %.preheader56.loopexit, label %.lr.ph65, !llvm.loop !25

._crit_edge63.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.loopexit, %12, %.preheader59, %.preheader57, %.preheader56
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
