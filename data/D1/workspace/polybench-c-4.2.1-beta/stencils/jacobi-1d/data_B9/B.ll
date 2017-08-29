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

; <label>:13:                                     ; preds = %8, %11, %2
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
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %4, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %4
  %scevgep3 = getelementptr double, double* %2, i64 %4
  %bound0 = icmp ugt double* %scevgep3, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %6, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind5 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next6, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind5 to <2 x double>
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 2.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = fadd <2 x double> %7, <double 3.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, %broadcast.splat
  %14 = getelementptr inbounds double, double* %2, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next6 = add <2 x i32> %vec.ind5, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv1.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv1.ph, %scalar.ph.preheader ]
  %17 = trunc i64 %indvars.iv1 to i32
  %18 = sitofp i32 %17 to double
  %19 = fadd double %18, 2.000000e+00
  %20 = fdiv double %19, %6
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %20, double* %21, align 8
  %22 = fadd double %18, 3.000000e+00
  %23 = fdiv double %22, %6
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader2.preheader.lr.ph, label %._crit_edge

.preheader2.preheader.lr.ph:                      ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = sext i32 %7 to i64
  %9 = icmp sgt i32 %7, 1
  br i1 %9, label %.preheader2.preheader.us.preheader, label %.preheader2.preheader.lr.ph.split

.preheader2.preheader.us.preheader:               ; preds = %.preheader2.preheader.lr.ph
  %10 = add nsw i64 %8, -1
  %11 = add nsw i64 %8, -2
  %xtraiter = and i64 %10, 1
  %xtraiter29 = and i64 %10, 1
  %12 = add nsw i64 %8, -2
  %scevgep65 = getelementptr double, double* %2, i64 2
  %13 = add nsw i64 %8, -2
  %scevgep68 = getelementptr double, double* %3, i64 -1
  %scevgep71 = getelementptr double, double* %3, i64 3
  %14 = add nsw i64 %8, -2
  %scevgep110 = getelementptr double, double* %3, i64 2
  %15 = add nsw i64 %8, -2
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
  %.018.us = phi i32 [ %57, %.preheader._crit_edge.us ], [ 0, %.preheader2.preheader.us.preheader ]
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
  %wide.vec134 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !10
  %strided.vec135 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec136 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <2 x double> %strided.vec135, %strided.vec136
  %42 = add nuw nsw i64 %offset.idx130, 1
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = getelementptr double, double* %43, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec137 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !10
  %strided.vec139 = shufflevector <4 x double> %wide.vec137, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %41, %strided.vec139
  %47 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %48 = bitcast double* %43 to <4 x double>*
  %wide.vec140 = load <4 x double>, <4 x double>* %48, align 8, !alias.scope !10
  %strided.vec142 = shufflevector <4 x double> %wide.vec140, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = fadd <4 x double> %wide.vec137, %wide.vec140
  %50 = shufflevector <4 x double> %49, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %51 = fadd <2 x double> %50, %strided.vec142
  %52 = fmul <2 x double> %51, <double 3.333300e-01, double 3.333300e-01>
  %53 = getelementptr inbounds double, double* %3, i64 %42
  %54 = getelementptr double, double* %53, i64 -1
  %55 = bitcast double* %54 to <4 x double>*
  %interleaved.vec143 = shufflevector <2 x double> %47, <2 x double> %52, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec143, <4 x double>* %55, align 8, !alias.scope !13, !noalias !10
  %index.next126 = add i64 %index125, 2
  %56 = icmp eq i64 %index.next126, %n.vec105
  br i1 %56, label %middle.block100, label %vector.body99, !llvm.loop !15

middle.block100:                                  ; preds = %vector.body99
  %cmp.n129 = icmp eq i64 %n.mod.vf104, 0
  br i1 %cmp.n129, label %.preheader2..preheader.preheader_crit_edge.us, label %.preheader2.us.preheader172

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block55, %.preheader.us.prol.loopexit, %.preheader2..preheader.preheader_crit_edge.us
  %57 = add nuw nsw i32 %.018.us, 1
  %exitcond25 = icmp eq i32 %57, %0
  br i1 %exitcond25, label %._crit_edge.loopexit, label %.preheader2.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader171, %.preheader.us
  %indvars.iv36.us = phi i64 [ %indvars.iv.next4.us.1, %.preheader.us ], [ %indvars.iv36.us.ph, %.preheader.us.preheader171 ]
  %58 = add nsw i64 %indvars.iv36.us, -1
  %59 = getelementptr inbounds double, double* %3, i64 %58
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv36.us, 1
  %64 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 3.333300e-01
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us
  store double %67, double* %68, align 8
  %69 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv36.us, 2
  %74 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us.1
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = fmul double %76, 3.333300e-01
  %78 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us
  store double %77, double* %78, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next4.us.1, %8
  br i1 %exitcond24.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !16

.preheader2.us:                                   ; preds = %.preheader2.us.preheader172, %.preheader2.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.preheader2.us ], [ %indvars.iv5.us.ph, %.preheader2.us.preheader172 ]
  %79 = add nsw i64 %indvars.iv5.us, -1
  %80 = getelementptr inbounds double, double* %2, i64 %79
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %85 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  %88 = fmul double %87, 3.333300e-01
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.us
  store double %88, double* %89, align 8
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us.1
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %98 = fmul double %97, 3.333300e-01
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %98, double* %99, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %8
  br i1 %exitcond.1, label %.preheader2..preheader.preheader_crit_edge.us.loopexit, label %.preheader2.us, !llvm.loop !17

.preheader2..preheader.preheader_crit_edge.us.loopexit: ; preds = %.preheader2.us
  br label %.preheader2..preheader.preheader_crit_edge.us

.preheader2..preheader.preheader_crit_edge.us:    ; preds = %.preheader2..preheader.preheader_crit_edge.us.loopexit, %middle.block100, %.preheader2.us.prol.loopexit
  br i1 %18, label %.preheader.us.preheader, label %.preheader._crit_edge.us

.preheader.us.preheader:                          ; preds = %.preheader2..preheader.preheader_crit_edge.us
  br i1 %19, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.preheader
  %100 = load double, double* %3, align 8
  %101 = load double, double* %sunkaddr154, align 8
  %102 = fadd double %100, %101
  %103 = load double, double* %sunkaddr157, align 8
  %104 = fadd double %102, %103
  %105 = fmul double %104, 3.333300e-01
  store double %105, double* %sunkaddr160, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol
  %indvars.iv36.us.unr.ph = phi i64 [ 2, %.preheader.us.prol ], [ 1, %.preheader.us.preheader ]
  br i1 %20, label %.preheader._crit_edge.us, label %.preheader.us.preheader35

.preheader.us.preheader35:                        ; preds = %.preheader.us.prol.loopexit
  %106 = sub nsw i64 %12, %indvars.iv36.us.unr.ph
  %107 = lshr i64 %106, 1
  %108 = add nuw i64 %107, 1
  %min.iters.check57 = icmp ult i64 %108, 2
  br i1 %min.iters.check57, label %.preheader.us.preheader171, label %min.iters.checked58

.preheader.us.preheader171:                       ; preds = %middle.block55, %vector.memcheck78, %min.iters.checked58, %.preheader.us.preheader35
  %indvars.iv36.us.ph = phi i64 [ %indvars.iv36.us.unr.ph, %vector.memcheck78 ], [ %indvars.iv36.us.unr.ph, %min.iters.checked58 ], [ %indvars.iv36.us.unr.ph, %.preheader.us.preheader35 ], [ %ind.end83, %middle.block55 ]
  br label %.preheader.us

min.iters.checked58:                              ; preds = %.preheader.us.preheader35
  %n.mod.vf59 = and i64 %108, 1
  %n.vec60 = sub i64 %108, %n.mod.vf59
  %cmp.zero61 = icmp eq i64 %n.vec60, 0
  br i1 %cmp.zero61, label %.preheader.us.preheader171, label %vector.memcheck78

vector.memcheck78:                                ; preds = %min.iters.checked58
  %scevgep63 = getelementptr double, double* %2, i64 %indvars.iv36.us.unr.ph
  %109 = sub nsw i64 %13, %indvars.iv36.us.unr.ph
  %110 = and i64 %109, -2
  %111 = add nsw i64 %indvars.iv36.us.unr.ph, %110
  %scevgep66 = getelementptr double, double* %scevgep65, i64 %111
  %scevgep69 = getelementptr double, double* %scevgep68, i64 %indvars.iv36.us.unr.ph
  %scevgep72 = getelementptr double, double* %scevgep71, i64 %111
  %bound074 = icmp ult double* %scevgep63, %scevgep72
  %bound175 = icmp ult double* %scevgep69, %scevgep66
  %memcheck.conflict77 = and i1 %bound074, %bound175
  %112 = add nuw nsw i64 %indvars.iv36.us.unr.ph, 2
  %113 = shl nuw i64 %107, 1
  %114 = add i64 %112, %113
  %115 = shl nuw nsw i64 %n.mod.vf59, 1
  %ind.end83 = sub i64 %114, %115
  br i1 %memcheck.conflict77, label %.preheader.us.preheader171, label %vector.body54.preheader

vector.body54.preheader:                          ; preds = %vector.memcheck78
  br label %vector.body54

vector.body54:                                    ; preds = %vector.body54.preheader, %vector.body54
  %index80 = phi i64 [ %index.next81, %vector.body54 ], [ 0, %vector.body54.preheader ]
  %116 = shl i64 %index80, 1
  %offset.idx85 = or i64 %indvars.iv36.us.unr.ph, %116
  %117 = add nsw i64 %offset.idx85, -1
  %118 = getelementptr inbounds double, double* %3, i64 %117
  %119 = bitcast double* %118 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %119, align 8, !alias.scope !18
  %strided.vec90 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec91 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %120 = fadd <2 x double> %strided.vec90, %strided.vec91
  %121 = add nuw nsw i64 %offset.idx85, 1
  %122 = getelementptr inbounds double, double* %3, i64 %121
  %123 = getelementptr double, double* %122, i64 -1
  %124 = bitcast double* %123 to <4 x double>*
  %wide.vec92 = load <4 x double>, <4 x double>* %124, align 8, !alias.scope !18
  %strided.vec94 = shufflevector <4 x double> %wide.vec92, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %125 = fadd <2 x double> %120, %strided.vec94
  %126 = fmul <2 x double> %125, <double 3.333300e-01, double 3.333300e-01>
  %127 = bitcast double* %122 to <4 x double>*
  %wide.vec95 = load <4 x double>, <4 x double>* %127, align 8, !alias.scope !18
  %strided.vec97 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %128 = fadd <4 x double> %wide.vec92, %wide.vec95
  %129 = shufflevector <4 x double> %128, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %130 = fadd <2 x double> %129, %strided.vec97
  %131 = fmul <2 x double> %130, <double 3.333300e-01, double 3.333300e-01>
  %132 = getelementptr inbounds double, double* %2, i64 %121
  %133 = getelementptr double, double* %132, i64 -1
  %134 = bitcast double* %133 to <4 x double>*
  %interleaved.vec98 = shufflevector <2 x double> %126, <2 x double> %131, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec98, <4 x double>* %134, align 8, !alias.scope !21, !noalias !18
  %index.next81 = add i64 %index80, 2
  %135 = icmp eq i64 %index.next81, %n.vec60
  br i1 %135, label %middle.block55, label %vector.body54, !llvm.loop !23

middle.block55:                                   ; preds = %vector.body54
  %cmp.n84 = icmp eq i64 %n.mod.vf59, 0
  br i1 %cmp.n84, label %.preheader._crit_edge.us, label %.preheader.us.preheader171

.preheader2.preheader.lr.ph.split:                ; preds = %.preheader2.preheader.lr.ph
  %136 = icmp sgt i32 %5, 1
  br i1 %136, label %.preheader2.preheader.us9.preheader, label %._crit_edge

.preheader2.preheader.us9.preheader:              ; preds = %.preheader2.preheader.lr.ph.split
  %137 = and i64 %8, 1
  %138 = add nsw i64 %8, -2
  %scevgep38 = getelementptr double, double* %2, i64 2
  %139 = add nsw i64 %8, -2
  %scevgep41 = getelementptr double, double* %3, i64 -1
  %scevgep44 = getelementptr double, double* %3, i64 3
  %140 = icmp eq i64 %137, 0
  %sunkaddr161 = ptrtoint double* %3 to i64
  %sunkaddr162 = add i64 %sunkaddr161, 8
  %sunkaddr163 = inttoptr i64 %sunkaddr162 to double*
  %sunkaddr164 = ptrtoint double* %3 to i64
  %sunkaddr165 = add i64 %sunkaddr164, 16
  %sunkaddr166 = inttoptr i64 %sunkaddr165 to double*
  %sunkaddr167 = ptrtoint double* %2 to i64
  %sunkaddr168 = add i64 %sunkaddr167, 8
  %sunkaddr169 = inttoptr i64 %sunkaddr168 to double*
  %141 = icmp eq i32 %7, 2
  br label %.preheader2.preheader.us9

.preheader2.preheader.us9:                        ; preds = %.preheader2.preheader.us9.preheader, %.preheader._crit_edge.us21
  %.018.us10 = phi i32 [ %199, %.preheader._crit_edge.us21 ], [ 0, %.preheader2.preheader.us9.preheader ]
  br i1 %140, label %.preheader.us12.prol, label %.preheader.us12.prol.loopexit

.preheader.us12.prol:                             ; preds = %.preheader2.preheader.us9
  %142 = load double, double* %3, align 8
  %143 = load double, double* %sunkaddr163, align 8
  %144 = fadd double %142, %143
  %145 = load double, double* %sunkaddr166, align 8
  %146 = fadd double %144, %145
  %147 = fmul double %146, 3.333300e-01
  store double %147, double* %sunkaddr169, align 8
  br label %.preheader.us12.prol.loopexit

.preheader.us12.prol.loopexit:                    ; preds = %.preheader.us12.prol, %.preheader2.preheader.us9
  %indvars.iv36.us13.unr.ph = phi i64 [ 2, %.preheader.us12.prol ], [ 1, %.preheader2.preheader.us9 ]
  br i1 %141, label %.preheader._crit_edge.us21, label %.preheader.us12.preheader

.preheader.us12.preheader:                        ; preds = %.preheader.us12.prol.loopexit
  %148 = sub nsw i64 %138, %indvars.iv36.us13.unr.ph
  %149 = lshr i64 %148, 1
  %150 = add nuw i64 %149, 1
  %min.iters.check = icmp ult i64 %150, 2
  br i1 %min.iters.check, label %.preheader.us12.preheader173, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us12.preheader
  %n.mod.vf = and i64 %150, 1
  %n.vec = sub i64 %150, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us12.preheader173, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv36.us13.unr.ph
  %151 = sub nsw i64 %139, %indvars.iv36.us13.unr.ph
  %152 = and i64 %151, -2
  %153 = add nsw i64 %indvars.iv36.us13.unr.ph, %152
  %scevgep39 = getelementptr double, double* %scevgep38, i64 %153
  %scevgep42 = getelementptr double, double* %scevgep41, i64 %indvars.iv36.us13.unr.ph
  %scevgep45 = getelementptr double, double* %scevgep44, i64 %153
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep42, %scevgep39
  %memcheck.conflict = and i1 %bound0, %bound1
  %154 = add nuw nsw i64 %indvars.iv36.us13.unr.ph, 2
  %155 = shl nuw i64 %149, 1
  %156 = add i64 %154, %155
  %157 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %156, %157
  br i1 %memcheck.conflict, label %.preheader.us12.preheader173, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %158 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv36.us13.unr.ph, %158
  %159 = add nsw i64 %offset.idx, -1
  %160 = getelementptr inbounds double, double* %3, i64 %159
  %161 = bitcast double* %160 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %161, align 8, !alias.scope !24
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec47 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %162 = fadd <2 x double> %strided.vec, %strided.vec47
  %163 = add nuw nsw i64 %offset.idx, 1
  %164 = getelementptr inbounds double, double* %3, i64 %163
  %165 = getelementptr double, double* %164, i64 -1
  %166 = bitcast double* %165 to <4 x double>*
  %wide.vec48 = load <4 x double>, <4 x double>* %166, align 8, !alias.scope !24
  %strided.vec50 = shufflevector <4 x double> %wide.vec48, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %167 = fadd <2 x double> %162, %strided.vec50
  %168 = fmul <2 x double> %167, <double 3.333300e-01, double 3.333300e-01>
  %169 = bitcast double* %164 to <4 x double>*
  %wide.vec51 = load <4 x double>, <4 x double>* %169, align 8, !alias.scope !24
  %strided.vec53 = shufflevector <4 x double> %wide.vec51, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %170 = fadd <4 x double> %wide.vec48, %wide.vec51
  %171 = shufflevector <4 x double> %170, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %172 = fadd <2 x double> %171, %strided.vec53
  %173 = fmul <2 x double> %172, <double 3.333300e-01, double 3.333300e-01>
  %174 = getelementptr inbounds double, double* %2, i64 %163
  %175 = getelementptr double, double* %174, i64 -1
  %176 = bitcast double* %175 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %168, <2 x double> %173, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %176, align 8, !alias.scope !27, !noalias !24
  %index.next = add i64 %index, 2
  %177 = icmp eq i64 %index.next, %n.vec
  br i1 %177, label %middle.block, label %vector.body, !llvm.loop !29

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader._crit_edge.us21, label %.preheader.us12.preheader173

.preheader.us12.preheader173:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us12.preheader
  %indvars.iv36.us13.ph = phi i64 [ %indvars.iv36.us13.unr.ph, %vector.memcheck ], [ %indvars.iv36.us13.unr.ph, %min.iters.checked ], [ %indvars.iv36.us13.unr.ph, %.preheader.us12.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us12

.preheader.us12:                                  ; preds = %.preheader.us12.preheader173, %.preheader.us12
  %indvars.iv36.us13 = phi i64 [ %indvars.iv.next4.us14.1, %.preheader.us12 ], [ %indvars.iv36.us13.ph, %.preheader.us12.preheader173 ]
  %178 = add nsw i64 %indvars.iv36.us13, -1
  %179 = getelementptr inbounds double, double* %3, i64 %178
  %180 = load double, double* %179, align 8
  %181 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us13
  %182 = load double, double* %181, align 8
  %183 = fadd double %180, %182
  %indvars.iv.next4.us14 = add nuw nsw i64 %indvars.iv36.us13, 1
  %184 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us14
  %185 = load double, double* %184, align 8
  %186 = fadd double %183, %185
  %187 = fmul double %186, 3.333300e-01
  %188 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us13
  store double %187, double* %188, align 8
  %189 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us13
  %190 = load double, double* %189, align 8
  %191 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us14
  %192 = load double, double* %191, align 8
  %193 = fadd double %190, %192
  %indvars.iv.next4.us14.1 = add nsw i64 %indvars.iv36.us13, 2
  %194 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us14.1
  %195 = load double, double* %194, align 8
  %196 = fadd double %193, %195
  %197 = fmul double %196, 3.333300e-01
  %198 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us14
  store double %197, double* %198, align 8
  %exitcond26.1 = icmp eq i64 %indvars.iv.next4.us14.1, %8
  br i1 %exitcond26.1, label %.preheader._crit_edge.us21.loopexit, label %.preheader.us12, !llvm.loop !30

.preheader._crit_edge.us21.loopexit:              ; preds = %.preheader.us12
  br label %.preheader._crit_edge.us21

.preheader._crit_edge.us21:                       ; preds = %.preheader._crit_edge.us21.loopexit, %middle.block, %.preheader.us12.prol.loopexit
  %199 = add nuw nsw i32 %.018.us10, 1
  %exitcond27 = icmp eq i32 %199, %0
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

; <label>:14:                                     ; preds = %.lr.ph, %12
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !7, !8}
!30 = distinct !{!30, !7, !8}
