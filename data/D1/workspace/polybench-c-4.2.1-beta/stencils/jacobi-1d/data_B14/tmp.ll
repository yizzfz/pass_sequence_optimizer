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
  br label %9

; <label>:9:                                      ; preds = %9, %.lr.ph
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %9 ]
  %10 = trunc i64 %indvars.iv1 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = fadd <2 x double> %14, <double 2.000000e+00, double 3.000000e+00>
  %16 = fdiv <2 x double> %15, %8
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  store double %17, double* %12, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond, label %._crit_edge.loopexit, label %9

._crit_edge.loopexit:                             ; preds = %9
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
  %8 = icmp sgt i32 %5, 1
  %or.cond = and i1 %7, %8
  br i1 %or.cond, label %.preheader2.preheader.us.preheader, label %._crit_edge

.preheader2.preheader.us.preheader:               ; preds = %4
  %9 = add nsw i64 %6, -2
  %10 = and i64 %6, 1
  %xtraiter = xor i64 %10, 1
  %11 = add nsw i64 %6, -2
  %scevgep30 = getelementptr double, double* %2, i64 2
  %12 = add nsw i64 %6, -2
  %scevgep33 = getelementptr double, double* %3, i64 -1
  %scevgep36 = getelementptr double, double* %3, i64 3
  %13 = add nsw i64 %6, -2
  %scevgep57 = getelementptr double, double* %3, i64 2
  %14 = add nsw i64 %6, -2
  %scevgep60 = getelementptr double, double* %2, i64 -1
  %scevgep63 = getelementptr double, double* %2, i64 3
  %15 = icmp eq i64 %xtraiter, 0
  %16 = icmp eq i64 %9, 0
  %17 = icmp eq i64 %xtraiter, 0
  %18 = icmp eq i64 %9, 0
  %sunkaddr99 = ptrtoint double* %3 to i64
  %sunkaddr100 = add i64 %sunkaddr99, 8
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to double*
  %sunkaddr102 = ptrtoint double* %3 to i64
  %sunkaddr103 = add i64 %sunkaddr102, 16
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to double*
  %sunkaddr105 = ptrtoint double* %2 to i64
  %sunkaddr106 = add i64 %sunkaddr105, 8
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr91 = add i64 %sunkaddr, 8
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to double*
  %sunkaddr93 = ptrtoint double* %2 to i64
  %sunkaddr94 = add i64 %sunkaddr93, 16
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  %sunkaddr96 = ptrtoint double* %3 to i64
  %sunkaddr97 = add i64 %sunkaddr96, 8
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to double*
  br label %.preheader2.preheader.us

.preheader2.preheader.us:                         ; preds = %.preheader._crit_edge.us, %.preheader2.preheader.us.preheader
  %.018.us = phi i32 [ %55, %.preheader._crit_edge.us ], [ 0, %.preheader2.preheader.us.preheader ]
  br i1 %15, label %.preheader2.us.prol.loopexit, label %.preheader2.us.prol

.preheader2.us.prol:                              ; preds = %.preheader2.preheader.us
  %19 = load double, double* %2, align 8
  %20 = load double, double* %sunkaddr92, align 8
  %21 = fadd double %19, %20
  %22 = load double, double* %sunkaddr95, align 8
  %23 = fadd double %21, %22
  %24 = fmul double %23, 3.333300e-01
  store double %24, double* %sunkaddr98, align 8
  br label %.preheader2.us.prol.loopexit

.preheader2.us.prol.loopexit:                     ; preds = %.preheader2.preheader.us, %.preheader2.us.prol
  %indvars.iv5.us.unr.ph = phi i64 [ 2, %.preheader2.us.prol ], [ 1, %.preheader2.preheader.us ]
  br i1 %16, label %.preheader.us.preheader, label %.preheader2.us.prol.loopexit..preheader2.us_crit_edge

.preheader2.us.prol.loopexit..preheader2.us_crit_edge: ; preds = %.preheader2.us.prol.loopexit
  %25 = sub nsw i64 %13, %indvars.iv5.us.unr.ph
  %26 = lshr i64 %25, 1
  %27 = add nuw i64 %26, 1
  %min.iters.check49 = icmp ult i64 %27, 2
  br i1 %min.iters.check49, label %.preheader2.us.preheader, label %min.iters.checked50

.preheader2.us.preheader:                         ; preds = %middle.block47, %vector.memcheck70, %min.iters.checked50, %.preheader2.us.prol.loopexit..preheader2.us_crit_edge
  %indvars.iv5.us.ph = phi i64 [ %indvars.iv5.us.unr.ph, %vector.memcheck70 ], [ %indvars.iv5.us.unr.ph, %min.iters.checked50 ], [ %indvars.iv5.us.unr.ph, %.preheader2.us.prol.loopexit..preheader2.us_crit_edge ], [ %ind.end75, %middle.block47 ]
  br label %.preheader2.us

min.iters.checked50:                              ; preds = %.preheader2.us.prol.loopexit..preheader2.us_crit_edge
  %n.mod.vf51 = and i64 %27, 1
  %n.vec52 = sub i64 %27, %n.mod.vf51
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  br i1 %cmp.zero53, label %.preheader2.us.preheader, label %vector.memcheck70

vector.memcheck70:                                ; preds = %min.iters.checked50
  %scevgep55 = getelementptr double, double* %3, i64 %indvars.iv5.us.unr.ph
  %28 = sub nsw i64 %14, %indvars.iv5.us.unr.ph
  %29 = and i64 %28, -2
  %30 = add nsw i64 %indvars.iv5.us.unr.ph, %29
  %scevgep58 = getelementptr double, double* %scevgep57, i64 %30
  %scevgep61 = getelementptr double, double* %scevgep60, i64 %indvars.iv5.us.unr.ph
  %scevgep64 = getelementptr double, double* %scevgep63, i64 %30
  %bound066 = icmp ult double* %scevgep55, %scevgep64
  %bound167 = icmp ult double* %scevgep61, %scevgep58
  %memcheck.conflict69 = and i1 %bound066, %bound167
  %31 = add nuw nsw i64 %indvars.iv5.us.unr.ph, 2
  %32 = shl nuw i64 %26, 1
  %33 = add i64 %31, %32
  %34 = shl nuw nsw i64 %n.mod.vf51, 1
  %ind.end75 = sub i64 %33, %34
  br i1 %memcheck.conflict69, label %.preheader2.us.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck70
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.preheader, %vector.body46
  %index72 = phi i64 [ %index.next73, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %35 = shl i64 %index72, 1
  %offset.idx77 = or i64 %indvars.iv5.us.unr.ph, %35
  %36 = add nsw i64 %offset.idx77, -1
  %37 = getelementptr inbounds double, double* %2, i64 %36
  %38 = bitcast double* %37 to <4 x double>*
  %wide.vec81 = load <4 x double>, <4 x double>* %38, align 8, !alias.scope !1
  %strided.vec82 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec83 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %39 = fadd <2 x double> %strided.vec82, %strided.vec83
  %40 = add nuw nsw i64 %offset.idx77, 1
  %41 = getelementptr inbounds double, double* %2, i64 %40
  %42 = getelementptr double, double* %41, i64 -1
  %43 = bitcast double* %42 to <4 x double>*
  %wide.vec84 = load <4 x double>, <4 x double>* %43, align 8, !alias.scope !1
  %strided.vec86 = shufflevector <4 x double> %wide.vec84, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %44 = fadd <2 x double> %39, %strided.vec86
  %45 = fmul <2 x double> %44, <double 3.333300e-01, double 3.333300e-01>
  %46 = bitcast double* %41 to <4 x double>*
  %wide.vec87 = load <4 x double>, <4 x double>* %46, align 8, !alias.scope !1
  %strided.vec89 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %47 = fadd <4 x double> %wide.vec84, %wide.vec87
  %48 = shufflevector <4 x double> %47, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %49 = fadd <2 x double> %48, %strided.vec89
  %50 = fmul <2 x double> %49, <double 3.333300e-01, double 3.333300e-01>
  %51 = getelementptr inbounds double, double* %3, i64 %40
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %interleaved.vec90 = shufflevector <2 x double> %45, <2 x double> %50, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec90, <4 x double>* %53, align 8, !alias.scope !4, !noalias !1
  %index.next73 = add i64 %index72, 2
  %54 = icmp eq i64 %index.next73, %n.vec52
  br i1 %54, label %middle.block47, label %vector.body46, !llvm.loop !6

middle.block47:                                   ; preds = %vector.body46
  %cmp.n76 = icmp eq i64 %n.mod.vf51, 0
  br i1 %cmp.n76, label %.preheader.us.preheader, label %.preheader2.us.preheader

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.preheader.us.prol.loopexit, %middle.block
  %55 = add nuw nsw i32 %.018.us, 1
  %exitcond24 = icmp eq i32 %55, %0
  br i1 %exitcond24, label %._crit_edge.loopexit, label %.preheader2.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader108, %.preheader.us
  %indvars.iv36.us = phi i64 [ %indvars.iv.next4.us.1, %.preheader.us ], [ %indvars.iv36.us.ph, %.preheader.us.preheader108 ]
  %56 = add nsw i64 %indvars.iv36.us, -1
  %57 = getelementptr inbounds double, double* %3, i64 %56
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv36.us, 1
  %62 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 3.333300e-01
  %66 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us
  store double %65, double* %66, align 8
  %67 = load double, double* %59, align 8
  %68 = load double, double* %62, align 8
  %69 = fadd double %67, %68
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv36.us, 2
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us.1
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  %73 = fmul double %72, 3.333300e-01
  %74 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us
  store double %73, double* %74, align 8
  %exitcond23.1 = icmp eq i64 %indvars.iv.next4.us.1, %6
  br i1 %exitcond23.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !9

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %.preheader2.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.preheader2.us ], [ %indvars.iv5.us.ph, %.preheader2.us.preheader ]
  %75 = add nsw i64 %indvars.iv5.us, -1
  %76 = getelementptr inbounds double, double* %2, i64 %75
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %81 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  %84 = fmul double %83, 3.333300e-01
  %85 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.us
  store double %84, double* %85, align 8
  %86 = load double, double* %78, align 8
  %87 = load double, double* %81, align 8
  %88 = fadd double %86, %87
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us.1
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %92 = fmul double %91, 3.333300e-01
  %93 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %92, double* %93, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %6
  br i1 %exitcond.1, label %.preheader.us.preheader.loopexit, label %.preheader2.us, !llvm.loop !10

.preheader.us.preheader.loopexit:                 ; preds = %.preheader2.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %.preheader2.us.prol.loopexit, %middle.block47
  br i1 %17, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.preheader
  %94 = load double, double* %3, align 8
  %95 = load double, double* %sunkaddr101, align 8
  %96 = fadd double %94, %95
  %97 = load double, double* %sunkaddr104, align 8
  %98 = fadd double %96, %97
  %99 = fmul double %98, 3.333300e-01
  store double %99, double* %sunkaddr107, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol
  %indvars.iv36.us.unr.ph = phi i64 [ 2, %.preheader.us.prol ], [ 1, %.preheader.us.preheader ]
  br i1 %18, label %.preheader._crit_edge.us, label %.preheader.us.prol.loopexit..preheader.us_crit_edge

.preheader.us.prol.loopexit..preheader.us_crit_edge: ; preds = %.preheader.us.prol.loopexit
  %100 = sub nsw i64 %11, %indvars.iv36.us.unr.ph
  %101 = lshr i64 %100, 1
  %102 = add nuw i64 %101, 1
  %min.iters.check = icmp ult i64 %102, 2
  br i1 %min.iters.check, label %.preheader.us.preheader108, label %min.iters.checked

.preheader.us.preheader108:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.prol.loopexit..preheader.us_crit_edge
  %indvars.iv36.us.ph = phi i64 [ %indvars.iv36.us.unr.ph, %vector.memcheck ], [ %indvars.iv36.us.unr.ph, %min.iters.checked ], [ %indvars.iv36.us.unr.ph, %.preheader.us.prol.loopexit..preheader.us_crit_edge ], [ %ind.end, %middle.block ]
  br label %.preheader.us

min.iters.checked:                                ; preds = %.preheader.us.prol.loopexit..preheader.us_crit_edge
  %n.mod.vf = and i64 %102, 1
  %n.vec = sub i64 %102, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us.preheader108, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv36.us.unr.ph
  %103 = sub nsw i64 %12, %indvars.iv36.us.unr.ph
  %104 = and i64 %103, -2
  %105 = add nsw i64 %indvars.iv36.us.unr.ph, %104
  %scevgep31 = getelementptr double, double* %scevgep30, i64 %105
  %scevgep34 = getelementptr double, double* %scevgep33, i64 %indvars.iv36.us.unr.ph
  %scevgep37 = getelementptr double, double* %scevgep36, i64 %105
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ult double* %scevgep34, %scevgep31
  %memcheck.conflict = and i1 %bound0, %bound1
  %106 = add nuw nsw i64 %indvars.iv36.us.unr.ph, 2
  %107 = shl nuw i64 %101, 1
  %108 = add i64 %106, %107
  %109 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %108, %109
  br i1 %memcheck.conflict, label %.preheader.us.preheader108, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %110 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv36.us.unr.ph, %110
  %111 = add nsw i64 %offset.idx, -1
  %112 = getelementptr inbounds double, double* %3, i64 %111
  %113 = bitcast double* %112 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %113, align 8, !alias.scope !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec39 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %114 = fadd <2 x double> %strided.vec, %strided.vec39
  %115 = add nuw nsw i64 %offset.idx, 1
  %116 = getelementptr inbounds double, double* %3, i64 %115
  %117 = getelementptr double, double* %116, i64 -1
  %118 = bitcast double* %117 to <4 x double>*
  %wide.vec40 = load <4 x double>, <4 x double>* %118, align 8, !alias.scope !11
  %strided.vec42 = shufflevector <4 x double> %wide.vec40, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %119 = fadd <2 x double> %114, %strided.vec42
  %120 = fmul <2 x double> %119, <double 3.333300e-01, double 3.333300e-01>
  %121 = bitcast double* %116 to <4 x double>*
  %wide.vec43 = load <4 x double>, <4 x double>* %121, align 8, !alias.scope !11
  %strided.vec45 = shufflevector <4 x double> %wide.vec43, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %122 = fadd <4 x double> %wide.vec40, %wide.vec43
  %123 = shufflevector <4 x double> %122, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %124 = fadd <2 x double> %123, %strided.vec45
  %125 = fmul <2 x double> %124, <double 3.333300e-01, double 3.333300e-01>
  %126 = getelementptr inbounds double, double* %2, i64 %115
  %127 = getelementptr double, double* %126, i64 -1
  %128 = bitcast double* %127 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %120, <2 x double> %125, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %128, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 2
  %129 = icmp eq i64 %index.next, %n.vec
  br i1 %129, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader._crit_edge.us, label %.preheader.us.preheader108

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
