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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %26
  call fastcc void @print_array(i32 2000, double* %19)
  br label %30

; <label>:30:                                     ; preds = %26, %29, %2
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
define internal fastcc void @init_array(i32, double*, double*, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) unnamed_addr #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  br i1 true, label %.lr.ph35.split.us.preheader, label %._crit_edge

.lr.ph35.split.us.preheader:                      ; preds = %12
  %13 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %.lr.ph35.split.us.preheader, %..loopexit_crit_edge.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %..loopexit_crit_edge.us ], [ 0, %.lr.ph35.split.us.preheader ]
  %14 = trunc i64 %indvars.iv36 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv36
  store double %15, double* %16, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %17 = trunc i64 %indvars.iv.next37 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.000000e+03
  %20 = fmul double %19, 5.000000e-01
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv36
  store double %20, double* %21, align 8
  %22 = fmul double %19, 2.500000e-01
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv36
  store double %22, double* %23, align 8
  %24 = fdiv double %19, 6.000000e+00
  %25 = getelementptr inbounds double, double* %7, i64 %indvars.iv36
  store double %24, double* %25, align 8
  %26 = fmul double %19, 1.250000e-01
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv36
  store double %26, double* %27, align 8
  %28 = fdiv double %19, 9.000000e+00
  %29 = getelementptr inbounds double, double* %11, i64 %indvars.iv36
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds double, double* %9, i64 %indvars.iv36
  store double 0.000000e+00, double* %30, align 8
  %31 = getelementptr inbounds double, double* %8, i64 %indvars.iv36
  store double 0.000000e+00, double* %31, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph35.split.us
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv36, i64 0
  store double %13, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph35.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph35.split.us ]
  br i1 false, label %..loopexit_crit_edge.us, label %.lr.ph35.split.us.new.preheader

.lr.ph35.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph35.split.us.new

.lr.ph35.split.us.new:                            ; preds = %.lr.ph35.split.us.new.preheader, %.lr.ph35.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph35.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph35.split.us.new.preheader ]
  %33 = mul nuw nsw i64 %indvars.iv, %indvars.iv36
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 2000
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 2.000000e+03
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv36
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 2000
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 2.000000e+03
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %43, double* %44, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph35.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph35.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph35.split.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %12
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) unnamed_addr #2 {
  br i1 true, label %.preheader60.us.preheader, label %._crit_edge63

.preheader60.us.preheader:                        ; preds = %12
  %scevgep116 = getelementptr double, double* %5, i64 2
  %scevgep121 = getelementptr double, double* %7, i64 2
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %.preheader60.us.preheader, %._crit_edge72.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge72.us ], [ 0, %.preheader60.us.preheader ]
  %scevgep111 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 2
  %13 = getelementptr inbounds double, double* %4, i64 %indvars.iv103
  %14 = getelementptr inbounds double, double* %6, i64 %indvars.iv103
  br i1 true, label %.prol.loopexit100, label %.prol.preheader99

.prol.preheader99:                                ; preds = %.preheader60.us
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 0
  %16 = load double, double* %15, align 8
  %17 = load double, double* %13, align 8
  %18 = load double, double* %5, align 8
  %19 = fmul double %17, %18
  %20 = fadd double %16, %19
  %21 = load double, double* %14, align 8
  %22 = load double, double* %7, align 8
  %23 = fmul double %21, %22
  %24 = fadd double %20, %23
  store double %24, double* %15, align 8
  br label %.prol.loopexit100

.prol.loopexit100:                                ; preds = %.prol.preheader99, %.preheader60.us
  %indvars.iv95.unr.ph = phi i64 [ 1, %.prol.preheader99 ], [ 0, %.preheader60.us ]
  br i1 false, label %._crit_edge72.us, label %.preheader60.us.new.preheader

.preheader60.us.new.preheader:                    ; preds = %.prol.loopexit100
  %25 = sub nsw i64 1998, %indvars.iv95.unr.ph
  %26 = lshr i64 %25, 1
  %27 = add nuw i64 %26, 1
  %min.iters.check = icmp ult i64 %27, 2
  br i1 %min.iters.check, label %.preheader60.us.new.preheader189, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader60.us.new.preheader
  %n.mod.vf = and i64 %27, 1
  %n.vec = sub i64 %27, %n.mod.vf
  br i1 false, label %.preheader60.us.new.preheader189, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep109 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %indvars.iv95.unr.ph
  %28 = sub nsw i64 1998, %indvars.iv95.unr.ph
  %29 = and i64 %28, -2
  %30 = or i64 %indvars.iv95.unr.ph, %29
  %scevgep112 = getelementptr double, double* %scevgep111, i64 %30
  %scevgep114 = getelementptr double, double* %5, i64 %indvars.iv95.unr.ph
  %scevgep117 = getelementptr double, double* %scevgep116, i64 %30
  %scevgep119 = getelementptr double, double* %7, i64 %indvars.iv95.unr.ph
  %scevgep122 = getelementptr double, double* %scevgep121, i64 %30
  %bound0 = icmp ult double* %scevgep109, %13
  %bound1 = icmp ult double* %13, %scevgep112
  %found.conflict = and i1 %bound0, %bound1
  %bound0125 = icmp ult double* %scevgep109, %scevgep117
  %bound1126 = icmp ult double* %scevgep114, %scevgep112
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx = or i1 %found.conflict, %found.conflict127
  %bound0130 = icmp ult double* %scevgep109, %14
  %bound1131 = icmp ult double* %14, %scevgep112
  %found.conflict132 = and i1 %bound0130, %bound1131
  %conflict.rdx133 = or i1 %conflict.rdx, %found.conflict132
  %bound0134 = icmp ult double* %scevgep109, %scevgep122
  %bound1135 = icmp ult double* %scevgep119, %scevgep112
  %found.conflict136 = and i1 %bound0134, %bound1135
  %conflict.rdx137 = or i1 %conflict.rdx133, %found.conflict136
  %31 = or i64 %indvars.iv95.unr.ph, 2
  %32 = shl nuw i64 %26, 1
  %33 = add i64 %31, %32
  %34 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %33, %34
  br i1 %conflict.rdx137, label %.preheader60.us.new.preheader189, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %35 = load double, double* %13, align 8, !alias.scope !1
  %36 = insertelement <2 x double> undef, double %35, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = load double, double* %14, align 8, !alias.scope !4
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = load double, double* %13, align 8, !alias.scope !1
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = load double, double* %14, align 8, !alias.scope !4
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %47 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv95.unr.ph, %47
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %offset.idx
  %49 = bitcast double* %48 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %49, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec138 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %50 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec139 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !11
  %strided.vec140 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec141 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %52 = fmul <2 x double> %37, %strided.vec140
  %53 = fadd <2 x double> %strided.vec, %52
  %54 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %55 = bitcast double* %54 to <4 x double>*
  %wide.vec142 = load <4 x double>, <4 x double>* %55, align 8, !alias.scope !12
  %strided.vec143 = shufflevector <4 x double> %wide.vec142, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec144 = shufflevector <4 x double> %wide.vec142, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %56 = fmul <2 x double> %40, %strided.vec143
  %57 = fadd <2 x double> %53, %56
  %58 = add nuw nsw i64 %offset.idx, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %58
  %60 = fmul <2 x double> %43, %strided.vec141
  %61 = fadd <2 x double> %strided.vec138, %60
  %62 = fmul <2 x double> %46, %strided.vec144
  %63 = fadd <2 x double> %61, %62
  %64 = getelementptr double, double* %59, i64 -1
  %65 = bitcast double* %64 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %57, <2 x double> %63, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %66 = icmp eq i64 %index.next, %n.vec
  br i1 %66, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge72.us, label %.preheader60.us.new.preheader189

.preheader60.us.new.preheader189:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader60.us.new.preheader
  %indvars.iv95.ph = phi i64 [ %indvars.iv95.unr.ph, %vector.memcheck ], [ %indvars.iv95.unr.ph, %min.iters.checked ], [ %indvars.iv95.unr.ph, %.preheader60.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader60.us.new

.preheader60.us.new:                              ; preds = %.preheader60.us.new.preheader189, %.preheader60.us.new
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %.preheader60.us.new ], [ %indvars.iv95.ph, %.preheader60.us.new.preheader189 ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %indvars.iv95
  %68 = load double, double* %67, align 8
  %69 = load double, double* %13, align 8
  %70 = getelementptr inbounds double, double* %5, i64 %indvars.iv95
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %68, %72
  %74 = load double, double* %14, align 8
  %75 = getelementptr inbounds double, double* %7, i64 %indvars.iv95
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %73, %77
  store double %78, double* %67, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv103, i64 %indvars.iv.next96
  %80 = load double, double* %79, align 8
  %81 = load double, double* %13, align 8
  %82 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next96
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %80, %84
  %86 = load double, double* %14, align 8
  %87 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next96
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fadd double %85, %89
  store double %90, double* %79, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %exitcond98.1 = icmp eq i64 %indvars.iv.next96.1, 2000
  br i1 %exitcond98.1, label %._crit_edge72.us.loopexit, label %.preheader60.us.new, !llvm.loop !16

._crit_edge72.us.loopexit:                        ; preds = %.preheader60.us.new
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %._crit_edge72.us.loopexit, %middle.block, %.prol.loopexit100
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond106, label %.preheader59, label %.preheader60.us

.preheader59:                                     ; preds = %._crit_edge72.us
  br i1 true, label %.preheader58.us.preheader, label %._crit_edge63

.preheader58.us.preheader:                        ; preds = %.preheader59
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %.preheader58.us.preheader, %._crit_edge68.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge68.us ], [ 0, %.preheader58.us.preheader ]
  %91 = getelementptr inbounds double, double* %9, i64 %indvars.iv91
  br i1 true, label %.prol.loopexit88, label %.prol.preheader87

.prol.preheader87:                                ; preds = %.preheader58.us
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv91
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, %2
  %96 = load double, double* %10, align 8
  %97 = fmul double %95, %96
  %98 = fadd double %92, %97
  store double %98, double* %91, align 8
  br label %.prol.loopexit88

.prol.loopexit88:                                 ; preds = %.prol.preheader87, %.preheader58.us
  %indvars.iv83.unr.ph = phi i64 [ 1, %.prol.preheader87 ], [ 0, %.preheader58.us ]
  br i1 false, label %._crit_edge68.us, label %.preheader58.us.new.preheader

.preheader58.us.new.preheader:                    ; preds = %.prol.loopexit88
  br label %.preheader58.us.new

.preheader58.us.new:                              ; preds = %.preheader58.us.new.preheader, %.preheader58.us.new
  %indvars.iv83 = phi i64 [ %indvars.iv.next84.1, %.preheader58.us.new ], [ %indvars.iv83.unr.ph, %.preheader58.us.new.preheader ]
  %99 = load double, double* %91, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv83, i64 %indvars.iv91
  %101 = load double, double* %100, align 8
  %102 = fmul double %101, %2
  %103 = getelementptr inbounds double, double* %10, i64 %indvars.iv83
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = fadd double %99, %105
  store double %106, double* %91, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next84, i64 %indvars.iv91
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %2
  %110 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next84
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = fadd double %106, %112
  store double %113, double* %91, align 8
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next84.1, 2000
  br i1 %exitcond86.1, label %._crit_edge68.us.loopexit, label %.preheader58.us.new

._crit_edge68.us.loopexit:                        ; preds = %.preheader58.us.new
  br label %._crit_edge68.us

._crit_edge68.us:                                 ; preds = %._crit_edge68.us.loopexit, %.prol.loopexit88
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond94, label %.preheader57, label %.preheader58.us

.preheader57:                                     ; preds = %._crit_edge68.us
  br i1 true, label %.lr.ph65.preheader, label %._crit_edge63

.lr.ph65.preheader:                               ; preds = %.preheader57
  br i1 true, label %.lr.ph65.prol.loopexit, label %.lr.ph65.prol.preheader

.lr.ph65.prol.preheader:                          ; preds = %.lr.ph65.preheader
  br label %.lr.ph65.prol

.lr.ph65.prol:                                    ; preds = %.lr.ph65.prol.preheader, %.lr.ph65.prol
  %indvars.iv77.prol = phi i64 [ %indvars.iv.next78.prol, %.lr.ph65.prol ], [ 0, %.lr.ph65.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph65.prol ], [ 0, %.lr.ph65.prol.preheader ]
  %114 = getelementptr inbounds double, double* %9, i64 %indvars.iv77.prol
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds double, double* %11, i64 %indvars.iv77.prol
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  store double %118, double* %114, align 8
  %indvars.iv.next78.prol = add nuw nsw i64 %indvars.iv77.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph65.prol.loopexit.loopexit, label %.lr.ph65.prol, !llvm.loop !17

.lr.ph65.prol.loopexit.loopexit:                  ; preds = %.lr.ph65.prol
  br label %.lr.ph65.prol.loopexit

.lr.ph65.prol.loopexit:                           ; preds = %.lr.ph65.prol.loopexit.loopexit, %.lr.ph65.preheader
  %indvars.iv77.unr = phi i64 [ 0, %.lr.ph65.preheader ], [ %indvars.iv.next78.prol, %.lr.ph65.prol.loopexit.loopexit ]
  br i1 false, label %.preheader.us.preheader, label %.lr.ph65.preheader108

.lr.ph65.preheader108:                            ; preds = %.lr.ph65.prol.loopexit
  %119 = sub i64 1996, %indvars.iv77.unr
  %120 = lshr i64 %119, 2
  %121 = add nuw nsw i64 %120, 1
  %min.iters.check148 = icmp ult i64 %121, 2
  br i1 %min.iters.check148, label %.lr.ph65.preheader188, label %min.iters.checked149

.lr.ph65.preheader188:                            ; preds = %middle.block146, %vector.memcheck166, %min.iters.checked149, %.lr.ph65.preheader108
  %indvars.iv77.ph = phi i64 [ %indvars.iv77.unr, %vector.memcheck166 ], [ %indvars.iv77.unr, %min.iters.checked149 ], [ %indvars.iv77.unr, %.lr.ph65.preheader108 ], [ %ind.end171, %middle.block146 ]
  br label %.lr.ph65

min.iters.checked149:                             ; preds = %.lr.ph65.preheader108
  %n.mod.vf150 = and i64 %121, 1
  %n.vec151 = sub nsw i64 %121, %n.mod.vf150
  %cmp.zero152 = icmp eq i64 %n.vec151, 0
  br i1 %cmp.zero152, label %.lr.ph65.preheader188, label %vector.memcheck166

vector.memcheck166:                               ; preds = %min.iters.checked149
  %scevgep154 = getelementptr double, double* %9, i64 %indvars.iv77.unr
  %122 = sub i64 1996, %indvars.iv77.unr
  %123 = and i64 %122, -4
  %124 = add i64 %indvars.iv77.unr, %123
  %125 = add i64 %124, 4
  %scevgep156 = getelementptr double, double* %9, i64 %125
  %scevgep158 = getelementptr double, double* %11, i64 %indvars.iv77.unr
  %scevgep160 = getelementptr double, double* %11, i64 %125
  %bound0162 = icmp ult double* %scevgep154, %scevgep160
  %bound1163 = icmp ult double* %scevgep158, %scevgep156
  %memcheck.conflict165 = and i1 %bound0162, %bound1163
  %126 = shl nuw i64 %120, 2
  %127 = add i64 %indvars.iv77.unr, %126
  %128 = add i64 %127, 4
  %129 = shl nuw nsw i64 %n.mod.vf150, 2
  %ind.end171 = sub i64 %128, %129
  br i1 %memcheck.conflict165, label %.lr.ph65.preheader188, label %vector.body145.preheader

vector.body145.preheader:                         ; preds = %vector.memcheck166
  br label %vector.body145

vector.body145:                                   ; preds = %vector.body145.preheader, %vector.body145
  %index168 = phi i64 [ %index.next169, %vector.body145 ], [ 0, %vector.body145.preheader ]
  %130 = shl i64 %index168, 2
  %131 = add i64 %indvars.iv77.unr, %130
  %132 = getelementptr inbounds double, double* %9, i64 %131
  %133 = bitcast double* %132 to <8 x double>*
  %wide.vec177 = load <8 x double>, <8 x double>* %133, align 8, !alias.scope !19, !noalias !22
  %134 = getelementptr inbounds double, double* %11, i64 %131
  %135 = bitcast double* %134 to <8 x double>*
  %wide.vec182 = load <8 x double>, <8 x double>* %135, align 8, !alias.scope !22
  %136 = fadd <8 x double> %wide.vec177, %wide.vec182
  %137 = shufflevector <8 x double> %136, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %138 = fadd <8 x double> %wide.vec177, %wide.vec182
  %139 = shufflevector <8 x double> %138, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %140 = fadd <8 x double> %wide.vec177, %wide.vec182
  %141 = shufflevector <8 x double> %140, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %142 = add nsw i64 %131, 3
  %143 = getelementptr inbounds double, double* %9, i64 %142
  %144 = fadd <8 x double> %wide.vec177, %wide.vec182
  %145 = shufflevector <8 x double> %144, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %146 = getelementptr double, double* %143, i64 -3
  %147 = bitcast double* %146 to <8 x double>*
  %148 = shufflevector <2 x double> %137, <2 x double> %139, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %149 = shufflevector <2 x double> %141, <2 x double> %145, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec187 = shufflevector <4 x double> %148, <4 x double> %149, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec187, <8 x double>* %147, align 8, !alias.scope !19, !noalias !22
  %index.next169 = add i64 %index168, 2
  %150 = icmp eq i64 %index.next169, %n.vec151
  br i1 %150, label %middle.block146, label %vector.body145, !llvm.loop !24

middle.block146:                                  ; preds = %vector.body145
  %cmp.n172 = icmp eq i64 %n.mod.vf150, 0
  br i1 %cmp.n172, label %.preheader56, label %.lr.ph65.preheader188

.preheader56.loopexit:                            ; preds = %.lr.ph65
  br label %.preheader56

.preheader56:                                     ; preds = %.preheader56.loopexit, %middle.block146
  br i1 true, label %.preheader.us.preheader, label %._crit_edge63

.preheader.us.preheader:                          ; preds = %.preheader56, %.lr.ph65.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %151 = getelementptr inbounds double, double* %8, i64 %indvars.iv74
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv74, i64 0
  %154 = load double, double* %153, align 8
  %155 = fmul double %154, %1
  %156 = load double, double* %9, align 8
  %157 = fmul double %155, %156
  %158 = fadd double %152, %157
  store double %158, double* %151, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 false, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %159 = load double, double* %151, align 8
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv
  %161 = load double, double* %160, align 8
  %162 = fmul double %161, %1
  %163 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %164 = load double, double* %163, align 8
  %165 = fmul double %162, %164
  %166 = fadd double %159, %165
  store double %166, double* %151, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv.next
  %168 = load double, double* %167, align 8
  %169 = fmul double %168, %1
  %170 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %171 = load double, double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fadd double %166, %172
  store double %173, double* %151, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond, label %._crit_edge63.loopexit, label %.preheader.us

.lr.ph65:                                         ; preds = %.lr.ph65.preheader188, %.lr.ph65
  %indvars.iv77 = phi i64 [ %indvars.iv.next78.3, %.lr.ph65 ], [ %indvars.iv77.ph, %.lr.ph65.preheader188 ]
  %174 = getelementptr inbounds double, double* %9, i64 %indvars.iv77
  %175 = load double, double* %174, align 8
  %176 = getelementptr inbounds double, double* %11, i64 %indvars.iv77
  %177 = load double, double* %176, align 8
  %178 = fadd double %175, %177
  store double %178, double* %174, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %179 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next78
  %180 = load double, double* %179, align 8
  %181 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next78
  %182 = load double, double* %181, align 8
  %183 = fadd double %180, %182
  store double %183, double* %179, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %184 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next78.1
  %185 = load double, double* %184, align 8
  %186 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next78.1
  %187 = load double, double* %186, align 8
  %188 = fadd double %185, %187
  store double %188, double* %184, align 8
  %indvars.iv.next78.2 = add nsw i64 %indvars.iv77, 3
  %189 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next78.2
  %190 = load double, double* %189, align 8
  %191 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next78.2
  %192 = load double, double* %191, align 8
  %193 = fadd double %190, %192
  store double %193, double* %189, align 8
  %indvars.iv.next78.3 = add nsw i64 %indvars.iv77, 4
  %exitcond80.3 = icmp eq i64 %indvars.iv.next78.3, 2000
  br i1 %exitcond80.3, label %.preheader56.loopexit, label %.lr.ph65, !llvm.loop !25

._crit_edge63.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.loopexit, %12, %.preheader59, %.preheader57, %.preheader56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %12
  %indvars.iv = phi i64 [ %indvars.iv.next, %12 ], [ 0, %.lr.ph.preheader ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %.lr.ph, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %12
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
attributes #6 = { cold nounwind }

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
