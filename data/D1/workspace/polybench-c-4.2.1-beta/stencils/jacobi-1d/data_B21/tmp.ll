; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %6 = sitofp i32 %0 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %9

; <label>:9:                                      ; preds = %.prol.preheader
  %10 = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %8
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  store double %11, double* %1, align 8
  store double %12, double* %2, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %9
  %indvars.iv1.unr = phi i64 [ 0, %.lr.ph ], [ 1, %9 ]
  %13 = icmp eq i32 %0, 1
  br i1 %13, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %14

; <label>:14:                                     ; preds = %14, %.lr.ph.new
  %indvars.iv1 = phi i64 [ %indvars.iv1.unr, %.lr.ph.new ], [ %indvars.iv.next.1, %14 ]
  %15 = trunc i64 %indvars.iv1 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %18 = insertelement <2 x double> undef, double %16, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = fadd <2 x double> %19, <double 2.000000e+00, double 3.000000e+00>
  %21 = fdiv <2 x double> %20, %8
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  store double %22, double* %17, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %28 = insertelement <2 x double> undef, double %26, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = fadd <2 x double> %29, <double 2.000000e+00, double 3.000000e+00>
  %31 = fdiv <2 x double> %30, %8
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  store double %32, double* %27, align 8
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  store double %33, double* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %4
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %14

._crit_edge.loopexit.unr-lcssa:                   ; preds = %14
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = sext i32 %5 to i64
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader2.preheader.lr.ph, label %._crit_edge

.preheader2.preheader.lr.ph:                      ; preds = %4
  %8 = add nsw i32 %1, -1
  %9 = icmp sgt i32 %8, 1
  br i1 %9, label %.preheader2.preheader.us.preheader, label %.preheader2.preheader.lr.ph.split

.preheader2.preheader.us.preheader:               ; preds = %.preheader2.preheader.lr.ph
  %10 = add nsw i64 %6, -1
  %11 = add nsw i64 %6, -2
  %xtraiter = and i64 %10, 1
  %xtraiter29 = and i64 %10, 1
  %12 = add nsw i64 %6, -2
  %scevgep65 = getelementptr double, double* %2, i64 2
  %13 = add nsw i64 %6, -2
  %scevgep68 = getelementptr double, double* %3, i64 -1
  %scevgep71 = getelementptr double, double* %3, i64 3
  %14 = add nsw i64 %6, -2
  %scevgep110 = getelementptr double, double* %3, i64 2
  %15 = add nsw i64 %6, -2
  %scevgep113 = getelementptr double, double* %2, i64 -1
  %scevgep116 = getelementptr double, double* %2, i64 3
  %16 = icmp eq i64 %xtraiter, 0
  %17 = icmp eq i64 %11, 0
  %18 = icmp sgt i32 %5, 1
  %19 = icmp eq i64 %xtraiter29, 0
  %20 = icmp eq i64 %11, 0
  %sunkaddr152 = ptrtoint double* %3 to i64
  %sunkaddr153 = add i64 %sunkaddr152, 8
  %sunkaddr154 = inttoptr i64 %sunkaddr153 to double*
  %sunkaddr155 = ptrtoint double* %3 to i64
  %sunkaddr156 = add i64 %sunkaddr155, 16
  %sunkaddr157 = inttoptr i64 %sunkaddr156 to double*
  %sunkaddr158 = ptrtoint double* %2 to i64
  %sunkaddr159 = add i64 %sunkaddr158, 8
  %sunkaddr160 = inttoptr i64 %sunkaddr159 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr144 = add i64 %sunkaddr, 8
  %sunkaddr145 = inttoptr i64 %sunkaddr144 to double*
  %sunkaddr146 = ptrtoint double* %2 to i64
  %sunkaddr147 = add i64 %sunkaddr146, 16
  %sunkaddr148 = inttoptr i64 %sunkaddr147 to double*
  %sunkaddr149 = ptrtoint double* %3 to i64
  %sunkaddr150 = add i64 %sunkaddr149, 8
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to double*
  br label %.preheader2.preheader.us

.preheader2.preheader.us:                         ; preds = %.preheader._crit_edge.us, %.preheader2.preheader.us.preheader
  %.018.us = phi i32 [ %59, %.preheader._crit_edge.us ], [ 0, %.preheader2.preheader.us.preheader ]
  br i1 %16, label %.preheader2.us.prol.loopexit, label %.preheader2.us.prol

.preheader2.us.prol:                              ; preds = %.preheader2.preheader.us
  %21 = load double, double* %2, align 8
  %22 = load double, double* %sunkaddr145, align 8
  %23 = fadd double %21, %22
  %24 = load double, double* %sunkaddr148, align 8
  %25 = fadd double %23, %24
  %26 = fmul double %25, 3.333300e-01
  store double %26, double* %sunkaddr151, align 8
  br label %.preheader2.us.prol.loopexit

.preheader2.us.prol.loopexit:                     ; preds = %.preheader2.preheader.us, %.preheader2.us.prol
  %indvars.iv5.us.unr.ph = phi i64 [ 2, %.preheader2.us.prol ], [ 1, %.preheader2.preheader.us ]
  br i1 %17, label %.preheader2..preheader.preheader_crit_edge.us, label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.prol.loopexit
  %27 = sub nsw i64 %14, %indvars.iv5.us.unr.ph
  %28 = lshr i64 %27, 1
  %29 = add nuw i64 %28, 1
  %min.iters.check102 = icmp ult i64 %29, 2
  br i1 %min.iters.check102, label %.preheader2.us.preheader172, label %min.iters.checked103

.preheader2.us.preheader172:                      ; preds = %middle.block100, %vector.memcheck123, %min.iters.checked103, %.preheader2.us.preheader
  %indvars.iv5.us.ph = phi i64 [ %indvars.iv5.us.unr.ph, %vector.memcheck123 ], [ %indvars.iv5.us.unr.ph, %min.iters.checked103 ], [ %indvars.iv5.us.unr.ph, %.preheader2.us.preheader ], [ %ind.end128, %middle.block100 ]
  br label %.preheader2.us

min.iters.checked103:                             ; preds = %.preheader2.us.preheader
  %n.mod.vf104 = and i64 %29, 1
  %n.vec105 = sub i64 %29, %n.mod.vf104
  %cmp.zero106 = icmp eq i64 %n.vec105, 0
  br i1 %cmp.zero106, label %.preheader2.us.preheader172, label %vector.memcheck123

vector.memcheck123:                               ; preds = %min.iters.checked103
  %scevgep108 = getelementptr double, double* %3, i64 %indvars.iv5.us.unr.ph
  %30 = sub nsw i64 %15, %indvars.iv5.us.unr.ph
  %31 = and i64 %30, -2
  %32 = add nsw i64 %indvars.iv5.us.unr.ph, %31
  %scevgep111 = getelementptr double, double* %scevgep110, i64 %32
  %scevgep114 = getelementptr double, double* %scevgep113, i64 %indvars.iv5.us.unr.ph
  %scevgep117 = getelementptr double, double* %scevgep116, i64 %32
  %bound0119 = icmp ult double* %scevgep108, %scevgep117
  %bound1120 = icmp ult double* %scevgep114, %scevgep111
  %memcheck.conflict122 = and i1 %bound0119, %bound1120
  %33 = add nuw nsw i64 %indvars.iv5.us.unr.ph, 2
  %34 = shl nuw i64 %28, 1
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf104, 1
  %ind.end128 = sub i64 %35, %36
  br i1 %memcheck.conflict122, label %.preheader2.us.preheader172, label %vector.body99.preheader

vector.body99.preheader:                          ; preds = %vector.memcheck123
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99.preheader, %vector.body99
  %index125 = phi i64 [ %index.next126, %vector.body99 ], [ 0, %vector.body99.preheader ]
  %37 = shl i64 %index125, 1
  %offset.idx130 = or i64 %indvars.iv5.us.unr.ph, %37
  %38 = add nsw i64 %offset.idx130, -1
  %39 = getelementptr inbounds double, double* %2, i64 %38
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec134 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !1
  %strided.vec135 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec136 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <2 x double> %strided.vec135, %strided.vec136
  %42 = add nuw nsw i64 %offset.idx130, 1
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = getelementptr double, double* %43, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec137 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !1
  %strided.vec139 = shufflevector <4 x double> %wide.vec137, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %41, %strided.vec139
  %47 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %48 = add nuw nsw i64 %offset.idx130, 1
  %49 = getelementptr inbounds double, double* %2, i64 %48
  %50 = bitcast double* %49 to <4 x double>*
  %wide.vec140 = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !1
  %strided.vec142 = shufflevector <4 x double> %wide.vec140, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = fadd <4 x double> %wide.vec137, %wide.vec140
  %52 = shufflevector <4 x double> %51, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %53 = fadd <2 x double> %52, %strided.vec142
  %54 = fmul <2 x double> %53, <double 3.333300e-01, double 3.333300e-01>
  %55 = getelementptr inbounds double, double* %3, i64 %48
  %56 = getelementptr double, double* %55, i64 -1
  %57 = bitcast double* %56 to <4 x double>*
  %interleaved.vec143 = shufflevector <2 x double> %47, <2 x double> %54, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec143, <4 x double>* %57, align 8, !alias.scope !4, !noalias !1
  %index.next126 = add i64 %index125, 2
  %58 = icmp eq i64 %index.next126, %n.vec105
  br i1 %58, label %middle.block100, label %vector.body99, !llvm.loop !6

middle.block100:                                  ; preds = %vector.body99
  %cmp.n129 = icmp eq i64 %n.mod.vf104, 0
  br i1 %cmp.n129, label %.preheader2..preheader.preheader_crit_edge.us, label %.preheader2.us.preheader172

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block55, %.preheader.us.prol.loopexit, %.preheader2..preheader.preheader_crit_edge.us
  %59 = add nuw nsw i32 %.018.us, 1
  %exitcond25 = icmp eq i32 %59, %0
  br i1 %exitcond25, label %._crit_edge.loopexit, label %.preheader2.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader171, %.preheader.us
  %indvars.iv36.us = phi i64 [ %indvars.iv.next4.us.1, %.preheader.us ], [ %indvars.iv36.us.ph, %.preheader.us.preheader171 ]
  %60 = add nsw i64 %indvars.iv36.us, -1
  %61 = getelementptr inbounds double, double* %3, i64 %60
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = add nuw nsw i64 %indvars.iv36.us, 1
  %67 = getelementptr inbounds double, double* %3, i64 %66
  %68 = load double, double* %67, align 8
  %69 = fadd double %65, %68
  %70 = fmul double %69, 3.333300e-01
  %71 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us
  store double %70, double* %71, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv36.us, 1
  %72 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = add nsw i64 %indvars.iv36.us, 2
  %78 = getelementptr inbounds double, double* %3, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fadd double %76, %79
  %81 = fmul double %80, 3.333300e-01
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us
  store double %81, double* %82, align 8
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv36.us, 2
  %exitcond24.1 = icmp eq i64 %indvars.iv.next4.us.1, %6
  br i1 %exitcond24.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !9

.preheader2.us:                                   ; preds = %.preheader2.us.preheader172, %.preheader2.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.preheader2.us ], [ %indvars.iv5.us.ph, %.preheader2.us.preheader172 ]
  %83 = add nsw i64 %indvars.iv5.us, -1
  %84 = getelementptr inbounds double, double* %2, i64 %83
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  %89 = add nuw nsw i64 %indvars.iv5.us, 1
  %90 = getelementptr inbounds double, double* %2, i64 %89
  %91 = load double, double* %90, align 8
  %92 = fadd double %88, %91
  %93 = fmul double %92, 3.333300e-01
  %94 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.us
  store double %93, double* %94, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %98 = load double, double* %97, align 8
  %99 = fadd double %96, %98
  %100 = add nsw i64 %indvars.iv5.us, 2
  %101 = getelementptr inbounds double, double* %2, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fadd double %99, %102
  %104 = fmul double %103, 3.333300e-01
  %105 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %104, double* %105, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %6
  br i1 %exitcond.1, label %.preheader2..preheader.preheader_crit_edge.us.loopexit, label %.preheader2.us, !llvm.loop !10

.preheader2..preheader.preheader_crit_edge.us.loopexit: ; preds = %.preheader2.us
  br label %.preheader2..preheader.preheader_crit_edge.us

.preheader2..preheader.preheader_crit_edge.us:    ; preds = %.preheader2..preheader.preheader_crit_edge.us.loopexit, %middle.block100, %.preheader2.us.prol.loopexit
  br i1 %18, label %.preheader.us.preheader, label %.preheader._crit_edge.us

.preheader.us.preheader:                          ; preds = %.preheader2..preheader.preheader_crit_edge.us
  br i1 %19, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.preheader
  %106 = load double, double* %3, align 8
  %107 = load double, double* %sunkaddr154, align 8
  %108 = fadd double %106, %107
  %109 = load double, double* %sunkaddr157, align 8
  %110 = fadd double %108, %109
  %111 = fmul double %110, 3.333300e-01
  store double %111, double* %sunkaddr160, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol
  %indvars.iv36.us.unr.ph = phi i64 [ 2, %.preheader.us.prol ], [ 1, %.preheader.us.preheader ]
  br i1 %20, label %.preheader._crit_edge.us, label %.preheader.us.preheader35

.preheader.us.preheader35:                        ; preds = %.preheader.us.prol.loopexit
  %112 = sub nsw i64 %12, %indvars.iv36.us.unr.ph
  %113 = lshr i64 %112, 1
  %114 = add nuw i64 %113, 1
  %min.iters.check57 = icmp ult i64 %114, 2
  br i1 %min.iters.check57, label %.preheader.us.preheader171, label %min.iters.checked58

.preheader.us.preheader171:                       ; preds = %middle.block55, %vector.memcheck78, %min.iters.checked58, %.preheader.us.preheader35
  %indvars.iv36.us.ph = phi i64 [ %indvars.iv36.us.unr.ph, %vector.memcheck78 ], [ %indvars.iv36.us.unr.ph, %min.iters.checked58 ], [ %indvars.iv36.us.unr.ph, %.preheader.us.preheader35 ], [ %ind.end83, %middle.block55 ]
  br label %.preheader.us

min.iters.checked58:                              ; preds = %.preheader.us.preheader35
  %n.mod.vf59 = and i64 %114, 1
  %n.vec60 = sub i64 %114, %n.mod.vf59
  %cmp.zero61 = icmp eq i64 %n.vec60, 0
  br i1 %cmp.zero61, label %.preheader.us.preheader171, label %vector.memcheck78

vector.memcheck78:                                ; preds = %min.iters.checked58
  %scevgep63 = getelementptr double, double* %2, i64 %indvars.iv36.us.unr.ph
  %115 = sub nsw i64 %13, %indvars.iv36.us.unr.ph
  %116 = and i64 %115, -2
  %117 = add nsw i64 %indvars.iv36.us.unr.ph, %116
  %scevgep66 = getelementptr double, double* %scevgep65, i64 %117
  %scevgep69 = getelementptr double, double* %scevgep68, i64 %indvars.iv36.us.unr.ph
  %scevgep72 = getelementptr double, double* %scevgep71, i64 %117
  %bound074 = icmp ult double* %scevgep63, %scevgep72
  %bound175 = icmp ult double* %scevgep69, %scevgep66
  %memcheck.conflict77 = and i1 %bound074, %bound175
  %118 = add nuw nsw i64 %indvars.iv36.us.unr.ph, 2
  %119 = shl nuw i64 %113, 1
  %120 = add i64 %118, %119
  %121 = shl nuw nsw i64 %n.mod.vf59, 1
  %ind.end83 = sub i64 %120, %121
  br i1 %memcheck.conflict77, label %.preheader.us.preheader171, label %vector.body54.preheader

vector.body54.preheader:                          ; preds = %vector.memcheck78
  br label %vector.body54

vector.body54:                                    ; preds = %vector.body54.preheader, %vector.body54
  %index80 = phi i64 [ %index.next81, %vector.body54 ], [ 0, %vector.body54.preheader ]
  %122 = shl i64 %index80, 1
  %offset.idx85 = or i64 %indvars.iv36.us.unr.ph, %122
  %123 = add nsw i64 %offset.idx85, -1
  %124 = getelementptr inbounds double, double* %3, i64 %123
  %125 = bitcast double* %124 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %125, align 8, !alias.scope !11
  %strided.vec90 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec91 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %126 = fadd <2 x double> %strided.vec90, %strided.vec91
  %127 = add nuw nsw i64 %offset.idx85, 1
  %128 = getelementptr inbounds double, double* %3, i64 %127
  %129 = getelementptr double, double* %128, i64 -1
  %130 = bitcast double* %129 to <4 x double>*
  %wide.vec92 = load <4 x double>, <4 x double>* %130, align 8, !alias.scope !11
  %strided.vec94 = shufflevector <4 x double> %wide.vec92, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %131 = fadd <2 x double> %126, %strided.vec94
  %132 = fmul <2 x double> %131, <double 3.333300e-01, double 3.333300e-01>
  %133 = add nuw nsw i64 %offset.idx85, 1
  %134 = getelementptr inbounds double, double* %3, i64 %133
  %135 = bitcast double* %134 to <4 x double>*
  %wide.vec95 = load <4 x double>, <4 x double>* %135, align 8, !alias.scope !11
  %strided.vec97 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %136 = fadd <4 x double> %wide.vec92, %wide.vec95
  %137 = shufflevector <4 x double> %136, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %138 = fadd <2 x double> %137, %strided.vec97
  %139 = fmul <2 x double> %138, <double 3.333300e-01, double 3.333300e-01>
  %140 = getelementptr inbounds double, double* %2, i64 %133
  %141 = getelementptr double, double* %140, i64 -1
  %142 = bitcast double* %141 to <4 x double>*
  %interleaved.vec98 = shufflevector <2 x double> %132, <2 x double> %139, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec98, <4 x double>* %142, align 8, !alias.scope !14, !noalias !11
  %index.next81 = add i64 %index80, 2
  %143 = icmp eq i64 %index.next81, %n.vec60
  br i1 %143, label %middle.block55, label %vector.body54, !llvm.loop !16

middle.block55:                                   ; preds = %vector.body54
  %cmp.n84 = icmp eq i64 %n.mod.vf59, 0
  br i1 %cmp.n84, label %.preheader._crit_edge.us, label %.preheader.us.preheader171

.preheader2.preheader.lr.ph.split:                ; preds = %.preheader2.preheader.lr.ph
  %144 = icmp sgt i32 %5, 1
  br i1 %144, label %.preheader2.preheader.us9.preheader, label %._crit_edge

.preheader2.preheader.us9.preheader:              ; preds = %.preheader2.preheader.lr.ph.split
  %145 = and i64 %6, 1
  %146 = add nsw i64 %6, -2
  %scevgep38 = getelementptr double, double* %2, i64 2
  %147 = add nsw i64 %6, -2
  %scevgep41 = getelementptr double, double* %3, i64 -1
  %scevgep44 = getelementptr double, double* %3, i64 3
  %148 = icmp eq i64 %145, 0
  %sunkaddr161 = ptrtoint double* %3 to i64
  %sunkaddr162 = add i64 %sunkaddr161, 8
  %sunkaddr163 = inttoptr i64 %sunkaddr162 to double*
  %sunkaddr164 = ptrtoint double* %3 to i64
  %sunkaddr165 = add i64 %sunkaddr164, 16
  %sunkaddr166 = inttoptr i64 %sunkaddr165 to double*
  %sunkaddr167 = ptrtoint double* %2 to i64
  %sunkaddr168 = add i64 %sunkaddr167, 8
  %sunkaddr169 = inttoptr i64 %sunkaddr168 to double*
  %149 = icmp eq i32 %5, 2
  br label %.preheader2.preheader.us9

.preheader2.preheader.us9:                        ; preds = %.preheader2.preheader.us9.preheader, %.preheader._crit_edge.us21
  %.018.us10 = phi i32 [ %211, %.preheader._crit_edge.us21 ], [ 0, %.preheader2.preheader.us9.preheader ]
  br i1 %148, label %.preheader.us12.prol, label %.preheader.us12.prol.loopexit

.preheader.us12.prol:                             ; preds = %.preheader2.preheader.us9
  %150 = load double, double* %3, align 8
  %151 = load double, double* %sunkaddr163, align 8
  %152 = fadd double %150, %151
  %153 = load double, double* %sunkaddr166, align 8
  %154 = fadd double %152, %153
  %155 = fmul double %154, 3.333300e-01
  store double %155, double* %sunkaddr169, align 8
  br label %.preheader.us12.prol.loopexit

.preheader.us12.prol.loopexit:                    ; preds = %.preheader.us12.prol, %.preheader2.preheader.us9
  %indvars.iv36.us13.unr.ph = phi i64 [ 2, %.preheader.us12.prol ], [ 1, %.preheader2.preheader.us9 ]
  br i1 %149, label %.preheader._crit_edge.us21, label %.preheader.us12.preheader

.preheader.us12.preheader:                        ; preds = %.preheader.us12.prol.loopexit
  %156 = sub nsw i64 %146, %indvars.iv36.us13.unr.ph
  %157 = lshr i64 %156, 1
  %158 = add nuw i64 %157, 1
  %min.iters.check = icmp ult i64 %158, 2
  br i1 %min.iters.check, label %.preheader.us12.preheader173, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us12.preheader
  %n.mod.vf = and i64 %158, 1
  %n.vec = sub i64 %158, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us12.preheader173, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv36.us13.unr.ph
  %159 = sub nsw i64 %147, %indvars.iv36.us13.unr.ph
  %160 = and i64 %159, -2
  %161 = add nsw i64 %indvars.iv36.us13.unr.ph, %160
  %scevgep39 = getelementptr double, double* %scevgep38, i64 %161
  %scevgep42 = getelementptr double, double* %scevgep41, i64 %indvars.iv36.us13.unr.ph
  %scevgep45 = getelementptr double, double* %scevgep44, i64 %161
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep42, %scevgep39
  %memcheck.conflict = and i1 %bound0, %bound1
  %162 = add nuw nsw i64 %indvars.iv36.us13.unr.ph, 2
  %163 = shl nuw i64 %157, 1
  %164 = add i64 %162, %163
  %165 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %164, %165
  br i1 %memcheck.conflict, label %.preheader.us12.preheader173, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %166 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv36.us13.unr.ph, %166
  %167 = add nsw i64 %offset.idx, -1
  %168 = getelementptr inbounds double, double* %3, i64 %167
  %169 = bitcast double* %168 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %169, align 8, !alias.scope !17
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec47 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %170 = fadd <2 x double> %strided.vec, %strided.vec47
  %171 = add nuw nsw i64 %offset.idx, 1
  %172 = getelementptr inbounds double, double* %3, i64 %171
  %173 = getelementptr double, double* %172, i64 -1
  %174 = bitcast double* %173 to <4 x double>*
  %wide.vec48 = load <4 x double>, <4 x double>* %174, align 8, !alias.scope !17
  %strided.vec50 = shufflevector <4 x double> %wide.vec48, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %175 = fadd <2 x double> %170, %strided.vec50
  %176 = fmul <2 x double> %175, <double 3.333300e-01, double 3.333300e-01>
  %177 = add nuw nsw i64 %offset.idx, 1
  %178 = getelementptr inbounds double, double* %3, i64 %177
  %179 = bitcast double* %178 to <4 x double>*
  %wide.vec51 = load <4 x double>, <4 x double>* %179, align 8, !alias.scope !17
  %strided.vec53 = shufflevector <4 x double> %wide.vec51, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %180 = fadd <4 x double> %wide.vec48, %wide.vec51
  %181 = shufflevector <4 x double> %180, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %182 = fadd <2 x double> %181, %strided.vec53
  %183 = fmul <2 x double> %182, <double 3.333300e-01, double 3.333300e-01>
  %184 = getelementptr inbounds double, double* %2, i64 %177
  %185 = getelementptr double, double* %184, i64 -1
  %186 = bitcast double* %185 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %176, <2 x double> %183, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %186, align 8, !alias.scope !20, !noalias !17
  %index.next = add i64 %index, 2
  %187 = icmp eq i64 %index.next, %n.vec
  br i1 %187, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader._crit_edge.us21, label %.preheader.us12.preheader173

.preheader.us12.preheader173:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us12.preheader
  %indvars.iv36.us13.ph = phi i64 [ %indvars.iv36.us13.unr.ph, %vector.memcheck ], [ %indvars.iv36.us13.unr.ph, %min.iters.checked ], [ %indvars.iv36.us13.unr.ph, %.preheader.us12.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us12

.preheader.us12:                                  ; preds = %.preheader.us12.preheader173, %.preheader.us12
  %indvars.iv36.us13 = phi i64 [ %indvars.iv.next4.us14.1, %.preheader.us12 ], [ %indvars.iv36.us13.ph, %.preheader.us12.preheader173 ]
  %188 = add nsw i64 %indvars.iv36.us13, -1
  %189 = getelementptr inbounds double, double* %3, i64 %188
  %190 = load double, double* %189, align 8
  %191 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us13
  %192 = load double, double* %191, align 8
  %193 = fadd double %190, %192
  %194 = add nuw nsw i64 %indvars.iv36.us13, 1
  %195 = getelementptr inbounds double, double* %3, i64 %194
  %196 = load double, double* %195, align 8
  %197 = fadd double %193, %196
  %198 = fmul double %197, 3.333300e-01
  %199 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us13
  store double %198, double* %199, align 8
  %indvars.iv.next4.us14 = add nuw nsw i64 %indvars.iv36.us13, 1
  %200 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us13
  %201 = load double, double* %200, align 8
  %202 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us14
  %203 = load double, double* %202, align 8
  %204 = fadd double %201, %203
  %205 = add nsw i64 %indvars.iv36.us13, 2
  %206 = getelementptr inbounds double, double* %3, i64 %205
  %207 = load double, double* %206, align 8
  %208 = fadd double %204, %207
  %209 = fmul double %208, 3.333300e-01
  %210 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us14
  store double %209, double* %210, align 8
  %indvars.iv.next4.us14.1 = add nsw i64 %indvars.iv36.us13, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next4.us14.1, %6
  br i1 %exitcond26.1, label %.preheader._crit_edge.us21.loopexit, label %.preheader.us12, !llvm.loop !23

.preheader._crit_edge.us21.loopexit:              ; preds = %.preheader.us12
  br label %.preheader._crit_edge.us21

.preheader._crit_edge.us21:                       ; preds = %.preheader._crit_edge.us21.loopexit, %middle.block, %.preheader.us12.prol.loopexit
  %211 = add nuw nsw i32 %.018.us10, 1
  %exitcond27 = icmp eq i32 %211, %0
  br i1 %exitcond27, label %._crit_edge.loopexit174, label %.preheader2.preheader.us9

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge.loopexit174:                          ; preds = %.preheader._crit_edge.us21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit174, %._crit_edge.loopexit, %.preheader2.preheader.lr.ph.split, %4
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
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %14
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv1 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
