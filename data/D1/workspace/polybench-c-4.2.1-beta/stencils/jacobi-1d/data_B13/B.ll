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
  %scevgep12 = getelementptr double, double* %2, i64 %4
  %bound0 = icmp ugt double* %scevgep12, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %6, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind14 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next15, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind14 to <2 x double>
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
  %vec.ind.next15 = add <2 x i32> %vec.ind14, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv10.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv10 = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv10.ph, %scalar.ph.preheader ]
  %17 = trunc i64 %indvars.iv10 to i32
  %18 = sitofp i32 %17 to double
  %19 = fadd double %18, 2.000000e+00
  %20 = fdiv double %19, %6
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  store double %20, double* %21, align 8
  %22 = fadd double %18, 3.000000e+00
  %23 = fdiv double %22, %6
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
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
  br i1 %6, label %.preheader25.preheader.lr.ph, label %._crit_edge

.preheader25.preheader.lr.ph:                     ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = sext i32 %7 to i64
  %9 = icmp sgt i32 %7, 1
  br i1 %9, label %.preheader25.preheader.us.preheader, label %.preheader25.preheader.lr.ph.split

.preheader25.preheader.us.preheader:              ; preds = %.preheader25.preheader.lr.ph
  %10 = add nsw i64 %8, -1
  %11 = add nsw i64 %8, -2
  %xtraiter = and i64 %10, 1
  %xtraiter52 = and i64 %10, 1
  %12 = add nsw i64 %8, -2
  %scevgep114 = getelementptr double, double* %2, i64 2
  %13 = add nsw i64 %8, -2
  %scevgep117 = getelementptr double, double* %3, i64 -1
  %scevgep120 = getelementptr double, double* %3, i64 3
  %14 = add nsw i64 %8, -2
  %scevgep159 = getelementptr double, double* %3, i64 2
  %15 = add nsw i64 %8, -2
  %scevgep162 = getelementptr double, double* %2, i64 -1
  %scevgep165 = getelementptr double, double* %2, i64 3
  %16 = icmp eq i64 %xtraiter, 0
  %17 = icmp eq i64 %11, 0
  %18 = icmp sgt i32 %5, 1
  %19 = icmp eq i64 %xtraiter52, 0
  %20 = icmp eq i64 %11, 0
  %sunkaddr66 = ptrtoint double* %3 to i64
  %sunkaddr67 = add i64 %sunkaddr66, 8
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to double*
  %sunkaddr69 = ptrtoint double* %3 to i64
  %sunkaddr70 = add i64 %sunkaddr69, 16
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  %sunkaddr72 = ptrtoint double* %2 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 8
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr58 = add i64 %sunkaddr, 8
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to double*
  %sunkaddr60 = ptrtoint double* %2 to i64
  %sunkaddr61 = add i64 %sunkaddr60, 16
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to double*
  %sunkaddr63 = ptrtoint double* %3 to i64
  %sunkaddr64 = add i64 %sunkaddr63, 8
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to double*
  br label %.preheader25.preheader.us

.preheader25.preheader.us:                        ; preds = %.preheader._crit_edge.us, %.preheader25.preheader.us.preheader
  %.02431.us = phi i32 [ %143, %.preheader._crit_edge.us ], [ 0, %.preheader25.preheader.us.preheader ]
  br i1 %16, label %.preheader25.us.prol.loopexit, label %.preheader25.us.prol

.preheader25.us.prol:                             ; preds = %.preheader25.preheader.us
  %21 = load double, double* %2, align 8
  %22 = load double, double* %sunkaddr59, align 8
  %23 = fadd double %21, %22
  %24 = load double, double* %sunkaddr62, align 8
  %25 = fadd double %23, %24
  %26 = fmul double %25, 3.333300e-01
  store double %26, double* %sunkaddr65, align 8
  br label %.preheader25.us.prol.loopexit

.preheader25.us.prol.loopexit:                    ; preds = %.preheader25.preheader.us, %.preheader25.us.prol
  %indvars.iv28.us.unr.ph = phi i64 [ 2, %.preheader25.us.prol ], [ 1, %.preheader25.preheader.us ]
  br i1 %17, label %.preheader.preheader.us, label %.preheader25.us.preheader

.preheader25.us.preheader:                        ; preds = %.preheader25.us.prol.loopexit
  %27 = sub nsw i64 %14, %indvars.iv28.us.unr.ph
  %28 = lshr i64 %27, 1
  %29 = add nuw i64 %28, 1
  %min.iters.check151 = icmp ult i64 %29, 2
  br i1 %min.iters.check151, label %.preheader25.us.preheader195, label %min.iters.checked152

min.iters.checked152:                             ; preds = %.preheader25.us.preheader
  %n.mod.vf153 = and i64 %29, 1
  %n.vec154 = sub i64 %29, %n.mod.vf153
  %cmp.zero155 = icmp eq i64 %n.vec154, 0
  br i1 %cmp.zero155, label %.preheader25.us.preheader195, label %vector.memcheck172

vector.memcheck172:                               ; preds = %min.iters.checked152
  %scevgep157 = getelementptr double, double* %3, i64 %indvars.iv28.us.unr.ph
  %30 = sub nsw i64 %15, %indvars.iv28.us.unr.ph
  %31 = and i64 %30, -2
  %32 = add nsw i64 %indvars.iv28.us.unr.ph, %31
  %scevgep160 = getelementptr double, double* %scevgep159, i64 %32
  %scevgep163 = getelementptr double, double* %scevgep162, i64 %indvars.iv28.us.unr.ph
  %scevgep166 = getelementptr double, double* %scevgep165, i64 %32
  %bound0168 = icmp ult double* %scevgep157, %scevgep166
  %bound1169 = icmp ult double* %scevgep163, %scevgep160
  %memcheck.conflict171 = and i1 %bound0168, %bound1169
  %33 = add nuw nsw i64 %indvars.iv28.us.unr.ph, 2
  %34 = shl nuw i64 %28, 1
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf153, 1
  %ind.end177 = sub i64 %35, %36
  br i1 %memcheck.conflict171, label %.preheader25.us.preheader195, label %vector.body148.preheader

vector.body148.preheader:                         ; preds = %vector.memcheck172
  br label %vector.body148

vector.body148:                                   ; preds = %vector.body148.preheader, %vector.body148
  %index174 = phi i64 [ %index.next175, %vector.body148 ], [ 0, %vector.body148.preheader ]
  %37 = shl i64 %index174, 1
  %offset.idx179 = or i64 %indvars.iv28.us.unr.ph, %37
  %38 = add nsw i64 %offset.idx179, -1
  %39 = getelementptr inbounds double, double* %2, i64 %38
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec183 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !10
  %strided.vec184 = shufflevector <4 x double> %wide.vec183, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec185 = shufflevector <4 x double> %wide.vec183, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <2 x double> %strided.vec184, %strided.vec185
  %42 = add nuw nsw i64 %offset.idx179, 1
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = getelementptr double, double* %43, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec186 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !10
  %strided.vec188 = shufflevector <4 x double> %wide.vec186, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %41, %strided.vec188
  %47 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %48 = add nuw nsw i64 %offset.idx179, 1
  %49 = getelementptr inbounds double, double* %2, i64 %48
  %50 = bitcast double* %49 to <4 x double>*
  %wide.vec189 = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !10
  %strided.vec191 = shufflevector <4 x double> %wide.vec189, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = fadd <4 x double> %wide.vec186, %wide.vec189
  %52 = shufflevector <4 x double> %51, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %53 = fadd <2 x double> %52, %strided.vec191
  %54 = fmul <2 x double> %53, <double 3.333300e-01, double 3.333300e-01>
  %55 = getelementptr inbounds double, double* %3, i64 %48
  %56 = getelementptr double, double* %55, i64 -1
  %57 = bitcast double* %56 to <4 x double>*
  %interleaved.vec192 = shufflevector <2 x double> %47, <2 x double> %54, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec192, <4 x double>* %57, align 8, !alias.scope !13, !noalias !10
  %index.next175 = add i64 %index174, 2
  %58 = icmp eq i64 %index.next175, %n.vec154
  br i1 %58, label %middle.block149, label %vector.body148, !llvm.loop !15

middle.block149:                                  ; preds = %vector.body148
  %cmp.n178 = icmp eq i64 %n.mod.vf153, 0
  br i1 %cmp.n178, label %.preheader.preheader.us, label %.preheader25.us.preheader195

.preheader25.us.preheader195:                     ; preds = %middle.block149, %vector.memcheck172, %min.iters.checked152, %.preheader25.us.preheader
  %indvars.iv28.us.ph = phi i64 [ %indvars.iv28.us.unr.ph, %vector.memcheck172 ], [ %indvars.iv28.us.unr.ph, %min.iters.checked152 ], [ %indvars.iv28.us.unr.ph, %.preheader25.us.preheader ], [ %ind.end177, %middle.block149 ]
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %.preheader25.us.preheader195, %.preheader25.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next.us.1, %.preheader25.us ], [ %indvars.iv28.us.ph, %.preheader25.us.preheader195 ]
  %59 = add nsw i64 %indvars.iv28.us, -1
  %60 = getelementptr inbounds double, double* %2, i64 %59
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %2, i64 %indvars.iv28.us
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = add nuw nsw i64 %indvars.iv28.us, 1
  %66 = getelementptr inbounds double, double* %2, i64 %65
  %67 = load double, double* %66, align 8
  %68 = fadd double %64, %67
  %69 = fmul double %68, 3.333300e-01
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv28.us
  store double %69, double* %70, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv28.us, 1
  %71 = getelementptr inbounds double, double* %2, i64 %indvars.iv28.us
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  %76 = add nsw i64 %indvars.iv28.us, 2
  %77 = getelementptr inbounds double, double* %2, i64 %76
  %78 = load double, double* %77, align 8
  %79 = fadd double %75, %78
  %80 = fmul double %79, 3.333300e-01
  %81 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %80, double* %81, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv28.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %8
  br i1 %exitcond.1, label %.preheader.preheader.us.loopexit, label %.preheader25.us, !llvm.loop !16

.preheader.preheader.us.loopexit:                 ; preds = %.preheader25.us
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.loopexit, %middle.block149, %.preheader25.us.prol.loopexit
  br i1 %18, label %.preheader.us.preheader, label %.preheader._crit_edge.us

.preheader.us.preheader:                          ; preds = %.preheader.preheader.us
  br i1 %19, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.preheader
  %82 = load double, double* %3, align 8
  %83 = load double, double* %sunkaddr68, align 8
  %84 = fadd double %82, %83
  %85 = load double, double* %sunkaddr71, align 8
  %86 = fadd double %84, %85
  %87 = fmul double %86, 3.333300e-01
  store double %87, double* %sunkaddr74, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol
  %indvars.iv2629.us.unr.ph = phi i64 [ 2, %.preheader.us.prol ], [ 1, %.preheader.us.preheader ]
  br i1 %20, label %.preheader._crit_edge.us, label %.preheader.us.preheader84

.preheader.us.preheader84:                        ; preds = %.preheader.us.prol.loopexit
  %88 = sub nsw i64 %12, %indvars.iv2629.us.unr.ph
  %89 = lshr i64 %88, 1
  %90 = add nuw i64 %89, 1
  %min.iters.check106 = icmp ult i64 %90, 2
  br i1 %min.iters.check106, label %.preheader.us.preheader194, label %min.iters.checked107

min.iters.checked107:                             ; preds = %.preheader.us.preheader84
  %n.mod.vf108 = and i64 %90, 1
  %n.vec109 = sub i64 %90, %n.mod.vf108
  %cmp.zero110 = icmp eq i64 %n.vec109, 0
  br i1 %cmp.zero110, label %.preheader.us.preheader194, label %vector.memcheck127

vector.memcheck127:                               ; preds = %min.iters.checked107
  %scevgep112 = getelementptr double, double* %2, i64 %indvars.iv2629.us.unr.ph
  %91 = sub nsw i64 %13, %indvars.iv2629.us.unr.ph
  %92 = and i64 %91, -2
  %93 = add nsw i64 %indvars.iv2629.us.unr.ph, %92
  %scevgep115 = getelementptr double, double* %scevgep114, i64 %93
  %scevgep118 = getelementptr double, double* %scevgep117, i64 %indvars.iv2629.us.unr.ph
  %scevgep121 = getelementptr double, double* %scevgep120, i64 %93
  %bound0123 = icmp ult double* %scevgep112, %scevgep121
  %bound1124 = icmp ult double* %scevgep118, %scevgep115
  %memcheck.conflict126 = and i1 %bound0123, %bound1124
  %94 = add nuw nsw i64 %indvars.iv2629.us.unr.ph, 2
  %95 = shl nuw i64 %89, 1
  %96 = add i64 %94, %95
  %97 = shl nuw nsw i64 %n.mod.vf108, 1
  %ind.end132 = sub i64 %96, %97
  br i1 %memcheck.conflict126, label %.preheader.us.preheader194, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %vector.memcheck127
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103.preheader, %vector.body103
  %index129 = phi i64 [ %index.next130, %vector.body103 ], [ 0, %vector.body103.preheader ]
  %98 = shl i64 %index129, 1
  %offset.idx134 = or i64 %indvars.iv2629.us.unr.ph, %98
  %99 = add nsw i64 %offset.idx134, -1
  %100 = getelementptr inbounds double, double* %3, i64 %99
  %101 = bitcast double* %100 to <4 x double>*
  %wide.vec138 = load <4 x double>, <4 x double>* %101, align 8, !alias.scope !17
  %strided.vec139 = shufflevector <4 x double> %wide.vec138, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec140 = shufflevector <4 x double> %wide.vec138, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %102 = fadd <2 x double> %strided.vec139, %strided.vec140
  %103 = add nuw nsw i64 %offset.idx134, 1
  %104 = getelementptr inbounds double, double* %3, i64 %103
  %105 = getelementptr double, double* %104, i64 -1
  %106 = bitcast double* %105 to <4 x double>*
  %wide.vec141 = load <4 x double>, <4 x double>* %106, align 8, !alias.scope !17
  %strided.vec143 = shufflevector <4 x double> %wide.vec141, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %107 = fadd <2 x double> %102, %strided.vec143
  %108 = fmul <2 x double> %107, <double 3.333300e-01, double 3.333300e-01>
  %109 = add nuw nsw i64 %offset.idx134, 1
  %110 = getelementptr inbounds double, double* %3, i64 %109
  %111 = bitcast double* %110 to <4 x double>*
  %wide.vec144 = load <4 x double>, <4 x double>* %111, align 8, !alias.scope !17
  %strided.vec146 = shufflevector <4 x double> %wide.vec144, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %112 = fadd <4 x double> %wide.vec141, %wide.vec144
  %113 = shufflevector <4 x double> %112, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %114 = fadd <2 x double> %113, %strided.vec146
  %115 = fmul <2 x double> %114, <double 3.333300e-01, double 3.333300e-01>
  %116 = getelementptr inbounds double, double* %2, i64 %109
  %117 = getelementptr double, double* %116, i64 -1
  %118 = bitcast double* %117 to <4 x double>*
  %interleaved.vec147 = shufflevector <2 x double> %108, <2 x double> %115, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec147, <4 x double>* %118, align 8, !alias.scope !20, !noalias !17
  %index.next130 = add i64 %index129, 2
  %119 = icmp eq i64 %index.next130, %n.vec109
  br i1 %119, label %middle.block104, label %vector.body103, !llvm.loop !22

middle.block104:                                  ; preds = %vector.body103
  %cmp.n133 = icmp eq i64 %n.mod.vf108, 0
  br i1 %cmp.n133, label %.preheader._crit_edge.us, label %.preheader.us.preheader194

.preheader.us.preheader194:                       ; preds = %middle.block104, %vector.memcheck127, %min.iters.checked107, %.preheader.us.preheader84
  %indvars.iv2629.us.ph = phi i64 [ %indvars.iv2629.us.unr.ph, %vector.memcheck127 ], [ %indvars.iv2629.us.unr.ph, %min.iters.checked107 ], [ %indvars.iv2629.us.unr.ph, %.preheader.us.preheader84 ], [ %ind.end132, %middle.block104 ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader194, %.preheader.us
  %indvars.iv2629.us = phi i64 [ %indvars.iv.next27.us.1, %.preheader.us ], [ %indvars.iv2629.us.ph, %.preheader.us.preheader194 ]
  %120 = add nsw i64 %indvars.iv2629.us, -1
  %121 = getelementptr inbounds double, double* %3, i64 %120
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  %126 = add nuw nsw i64 %indvars.iv2629.us, 1
  %127 = getelementptr inbounds double, double* %3, i64 %126
  %128 = load double, double* %127, align 8
  %129 = fadd double %125, %128
  %130 = fmul double %129, 3.333300e-01
  %131 = getelementptr inbounds double, double* %2, i64 %indvars.iv2629.us
  store double %130, double* %131, align 8
  %indvars.iv.next27.us = add nuw nsw i64 %indvars.iv2629.us, 1
  %132 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us
  %135 = load double, double* %134, align 8
  %136 = fadd double %133, %135
  %137 = add nsw i64 %indvars.iv2629.us, 2
  %138 = getelementptr inbounds double, double* %3, i64 %137
  %139 = load double, double* %138, align 8
  %140 = fadd double %136, %139
  %141 = fmul double %140, 3.333300e-01
  %142 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next27.us
  store double %141, double* %142, align 8
  %indvars.iv.next27.us.1 = add nsw i64 %indvars.iv2629.us, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next27.us.1, %8
  br i1 %exitcond47.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !23

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block104, %.preheader.us.prol.loopexit, %.preheader.preheader.us
  %143 = add nuw nsw i32 %.02431.us, 1
  %exitcond48 = icmp eq i32 %143, %0
  br i1 %exitcond48, label %._crit_edge.loopexit, label %.preheader25.preheader.us

.preheader25.preheader.lr.ph.split:               ; preds = %.preheader25.preheader.lr.ph
  %144 = icmp sgt i32 %5, 1
  br i1 %144, label %.preheader25.preheader.us32.preheader, label %._crit_edge

.preheader25.preheader.us32.preheader:            ; preds = %.preheader25.preheader.lr.ph.split
  %145 = and i64 %8, 1
  %146 = add nsw i64 %8, -2
  %scevgep87 = getelementptr double, double* %2, i64 2
  %147 = add nsw i64 %8, -2
  %scevgep90 = getelementptr double, double* %3, i64 -1
  %scevgep93 = getelementptr double, double* %3, i64 3
  %148 = icmp eq i64 %145, 0
  %sunkaddr75 = ptrtoint double* %3 to i64
  %sunkaddr76 = add i64 %sunkaddr75, 8
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to double*
  %sunkaddr78 = ptrtoint double* %3 to i64
  %sunkaddr79 = add i64 %sunkaddr78, 16
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  %sunkaddr81 = ptrtoint double* %2 to i64
  %sunkaddr82 = add i64 %sunkaddr81, 8
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %149 = icmp eq i32 %7, 2
  br label %.preheader25.preheader.us32

.preheader25.preheader.us32:                      ; preds = %.preheader25.preheader.us32.preheader, %.preheader._crit_edge.us44
  %.02431.us33 = phi i32 [ %211, %.preheader._crit_edge.us44 ], [ 0, %.preheader25.preheader.us32.preheader ]
  br i1 %148, label %.preheader.us41.prol, label %.preheader.us41.prol.loopexit

.preheader.us41.prol:                             ; preds = %.preheader25.preheader.us32
  %150 = load double, double* %3, align 8
  %151 = load double, double* %sunkaddr77, align 8
  %152 = fadd double %150, %151
  %153 = load double, double* %sunkaddr80, align 8
  %154 = fadd double %152, %153
  %155 = fmul double %154, 3.333300e-01
  store double %155, double* %sunkaddr83, align 8
  br label %.preheader.us41.prol.loopexit

.preheader.us41.prol.loopexit:                    ; preds = %.preheader.us41.prol, %.preheader25.preheader.us32
  %indvars.iv2629.us42.unr.ph = phi i64 [ 2, %.preheader.us41.prol ], [ 1, %.preheader25.preheader.us32 ]
  br i1 %149, label %.preheader._crit_edge.us44, label %.preheader.us41.preheader

.preheader.us41.preheader:                        ; preds = %.preheader.us41.prol.loopexit
  %156 = sub nsw i64 %146, %indvars.iv2629.us42.unr.ph
  %157 = lshr i64 %156, 1
  %158 = add nuw i64 %157, 1
  %min.iters.check = icmp ult i64 %158, 2
  br i1 %min.iters.check, label %.preheader.us41.preheader196, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us41.preheader
  %n.mod.vf = and i64 %158, 1
  %n.vec = sub i64 %158, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us41.preheader196, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv2629.us42.unr.ph
  %159 = sub nsw i64 %147, %indvars.iv2629.us42.unr.ph
  %160 = and i64 %159, -2
  %161 = add nsw i64 %indvars.iv2629.us42.unr.ph, %160
  %scevgep88 = getelementptr double, double* %scevgep87, i64 %161
  %scevgep91 = getelementptr double, double* %scevgep90, i64 %indvars.iv2629.us42.unr.ph
  %scevgep94 = getelementptr double, double* %scevgep93, i64 %161
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep91, %scevgep88
  %memcheck.conflict = and i1 %bound0, %bound1
  %162 = add nuw nsw i64 %indvars.iv2629.us42.unr.ph, 2
  %163 = shl nuw i64 %157, 1
  %164 = add i64 %162, %163
  %165 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %164, %165
  br i1 %memcheck.conflict, label %.preheader.us41.preheader196, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %166 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv2629.us42.unr.ph, %166
  %167 = add nsw i64 %offset.idx, -1
  %168 = getelementptr inbounds double, double* %3, i64 %167
  %169 = bitcast double* %168 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %169, align 8, !alias.scope !24
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec96 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %170 = fadd <2 x double> %strided.vec, %strided.vec96
  %171 = add nuw nsw i64 %offset.idx, 1
  %172 = getelementptr inbounds double, double* %3, i64 %171
  %173 = getelementptr double, double* %172, i64 -1
  %174 = bitcast double* %173 to <4 x double>*
  %wide.vec97 = load <4 x double>, <4 x double>* %174, align 8, !alias.scope !24
  %strided.vec99 = shufflevector <4 x double> %wide.vec97, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %175 = fadd <2 x double> %170, %strided.vec99
  %176 = fmul <2 x double> %175, <double 3.333300e-01, double 3.333300e-01>
  %177 = add nuw nsw i64 %offset.idx, 1
  %178 = getelementptr inbounds double, double* %3, i64 %177
  %179 = bitcast double* %178 to <4 x double>*
  %wide.vec100 = load <4 x double>, <4 x double>* %179, align 8, !alias.scope !24
  %strided.vec102 = shufflevector <4 x double> %wide.vec100, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %180 = fadd <4 x double> %wide.vec97, %wide.vec100
  %181 = shufflevector <4 x double> %180, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %182 = fadd <2 x double> %181, %strided.vec102
  %183 = fmul <2 x double> %182, <double 3.333300e-01, double 3.333300e-01>
  %184 = getelementptr inbounds double, double* %2, i64 %177
  %185 = getelementptr double, double* %184, i64 -1
  %186 = bitcast double* %185 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %176, <2 x double> %183, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %186, align 8, !alias.scope !27, !noalias !24
  %index.next = add i64 %index, 2
  %187 = icmp eq i64 %index.next, %n.vec
  br i1 %187, label %middle.block, label %vector.body, !llvm.loop !29

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader._crit_edge.us44, label %.preheader.us41.preheader196

.preheader.us41.preheader196:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us41.preheader
  %indvars.iv2629.us42.ph = phi i64 [ %indvars.iv2629.us42.unr.ph, %vector.memcheck ], [ %indvars.iv2629.us42.unr.ph, %min.iters.checked ], [ %indvars.iv2629.us42.unr.ph, %.preheader.us41.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us41

.preheader.us41:                                  ; preds = %.preheader.us41.preheader196, %.preheader.us41
  %indvars.iv2629.us42 = phi i64 [ %indvars.iv.next27.us43.1, %.preheader.us41 ], [ %indvars.iv2629.us42.ph, %.preheader.us41.preheader196 ]
  %188 = add nsw i64 %indvars.iv2629.us42, -1
  %189 = getelementptr inbounds double, double* %3, i64 %188
  %190 = load double, double* %189, align 8
  %191 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us42
  %192 = load double, double* %191, align 8
  %193 = fadd double %190, %192
  %194 = add nuw nsw i64 %indvars.iv2629.us42, 1
  %195 = getelementptr inbounds double, double* %3, i64 %194
  %196 = load double, double* %195, align 8
  %197 = fadd double %193, %196
  %198 = fmul double %197, 3.333300e-01
  %199 = getelementptr inbounds double, double* %2, i64 %indvars.iv2629.us42
  store double %198, double* %199, align 8
  %indvars.iv.next27.us43 = add nuw nsw i64 %indvars.iv2629.us42, 1
  %200 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us42
  %201 = load double, double* %200, align 8
  %202 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us43
  %203 = load double, double* %202, align 8
  %204 = fadd double %201, %203
  %205 = add nsw i64 %indvars.iv2629.us42, 2
  %206 = getelementptr inbounds double, double* %3, i64 %205
  %207 = load double, double* %206, align 8
  %208 = fadd double %204, %207
  %209 = fmul double %208, 3.333300e-01
  %210 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next27.us43
  store double %209, double* %210, align 8
  %indvars.iv.next27.us43.1 = add nsw i64 %indvars.iv2629.us42, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next27.us43.1, %8
  br i1 %exitcond49.1, label %.preheader._crit_edge.us44.loopexit, label %.preheader.us41, !llvm.loop !30

.preheader._crit_edge.us44.loopexit:              ; preds = %.preheader.us41
  br label %.preheader._crit_edge.us44

.preheader._crit_edge.us44:                       ; preds = %.preheader._crit_edge.us44.loopexit, %middle.block, %.preheader.us41.prol.loopexit
  %211 = add nuw nsw i32 %.02431.us33, 1
  %exitcond50 = icmp eq i32 %211, %0
  br i1 %exitcond50, label %._crit_edge.loopexit197, label %.preheader25.preheader.us32

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge.loopexit197:                          ; preds = %.preheader._crit_edge.us44
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit197, %._crit_edge.loopexit, %.preheader25.preheader.lr.ph.split, %4
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
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv5 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %.lr.ph, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !7, !8}
!30 = distinct !{!30, !7, !8}
