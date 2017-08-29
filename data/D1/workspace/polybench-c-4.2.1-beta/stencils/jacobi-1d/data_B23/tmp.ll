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
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge12

._crit_edge12:                                    ; preds = %10
  br label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %15

; <label>:15:                                     ; preds = %._crit_edge12, %._crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %3
  br label %._crit_edge

.lr.ph:                                           ; preds = %3
  %6 = sitofp i32 %0 to double
  %7 = sitofp i32 %0 to double
  %8 = insertelement <2 x double> undef, double %6, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  br label %10

; <label>:10:                                     ; preds = %._crit_edge11, %.lr.ph
  %indvars.iv10 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge11 ]
  %11 = trunc i64 %indvars.iv10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %14 = trunc i64 %indvars.iv10 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, %9
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %13, align 8
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge11

._crit_edge11:                                    ; preds = %10
  br label %10

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader27.lr.ph, label %.._crit_edge32_crit_edge

.._crit_edge32_crit_edge:                         ; preds = %4
  br label %._crit_edge32

.preheader27.lr.ph:                               ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = sext i32 %6 to i64
  %8 = icmp sgt i32 %6, 1
  %9 = add nsw i32 %1, -1
  br i1 %8, label %.preheader27.us.preheader, label %.preheader27.lr.ph.split

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %10 = add nsw i64 %7, -1
  %11 = add nsw i64 %7, -2
  %xtraiter = and i64 %10, 1
  %xtraiter51 = and i64 %10, 1
  %12 = add nsw i64 %7, -2
  %scevgep89 = getelementptr double, double* %2, i64 2
  %13 = add nsw i64 %7, -2
  %scevgep92 = getelementptr double, double* %3, i64 -1
  %scevgep95 = getelementptr double, double* %3, i64 3
  %14 = add nsw i64 %7, -2
  %scevgep134 = getelementptr double, double* %3, i64 2
  %15 = add nsw i64 %7, -2
  %scevgep137 = getelementptr double, double* %2, i64 -1
  %scevgep140 = getelementptr double, double* %2, i64 3
  %16 = icmp eq i64 %xtraiter, 0
  %17 = icmp eq i64 %11, 0
  %18 = icmp sgt i32 %9, 1
  %19 = icmp eq i64 %xtraiter51, 0
  %20 = icmp eq i64 %11, 0
  %sunkaddr176 = ptrtoint double* %3 to i64
  %sunkaddr177 = add i64 %sunkaddr176, 8
  %sunkaddr178 = inttoptr i64 %sunkaddr177 to double*
  %sunkaddr179 = ptrtoint double* %3 to i64
  %sunkaddr180 = add i64 %sunkaddr179, 16
  %sunkaddr181 = inttoptr i64 %sunkaddr180 to double*
  %sunkaddr182 = ptrtoint double* %2 to i64
  %sunkaddr183 = add i64 %sunkaddr182, 8
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr168 = add i64 %sunkaddr, 8
  %sunkaddr169 = inttoptr i64 %sunkaddr168 to double*
  %sunkaddr170 = ptrtoint double* %2 to i64
  %sunkaddr171 = add i64 %sunkaddr170, 16
  %sunkaddr172 = inttoptr i64 %sunkaddr171 to double*
  %sunkaddr173 = ptrtoint double* %3 to i64
  %sunkaddr174 = add i64 %sunkaddr173, 8
  %sunkaddr175 = inttoptr i64 %sunkaddr174 to double*
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %.02431.us = phi i32 [ %60, %._crit_edge.us..preheader27.us_crit_edge ], [ 0, %.preheader27.us.preheader ]
  br i1 %16, label %.preheader27.us..prol.loopexit_crit_edge, label %21

.preheader27.us..prol.loopexit_crit_edge:         ; preds = %.preheader27.us
  br label %.prol.loopexit

; <label>:21:                                     ; preds = %.preheader27.us
  %22 = load double, double* %2, align 8
  %23 = load double, double* %sunkaddr169, align 8
  %24 = fadd double %22, %23
  %25 = load double, double* %sunkaddr172, align 8
  %26 = fadd double %24, %25
  %27 = fmul double %26, 3.333300e-01
  store double %27, double* %sunkaddr175, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader27.us..prol.loopexit_crit_edge, %21
  %indvars.iv28.us.unr.ph = phi i64 [ 2, %21 ], [ 1, %.preheader27.us..prol.loopexit_crit_edge ]
  br i1 %17, label %.prol.loopexit...preheader_crit_edge.us_crit_edge, label %.preheader27.us.new.preheader

.prol.loopexit...preheader_crit_edge.us_crit_edge: ; preds = %.prol.loopexit
  br label %..preheader_crit_edge.us

.preheader27.us.new.preheader:                    ; preds = %.prol.loopexit
  %28 = sub nsw i64 %14, %indvars.iv28.us.unr.ph
  %29 = lshr i64 %28, 1
  %30 = add nuw i64 %29, 1
  %min.iters.check126 = icmp ult i64 %30, 2
  br i1 %min.iters.check126, label %.preheader27.us.new.preheader..preheader27.us.new.preheader196_crit_edge, label %min.iters.checked127

.preheader27.us.new.preheader..preheader27.us.new.preheader196_crit_edge: ; preds = %.preheader27.us.new.preheader
  br label %.preheader27.us.new.preheader196

.preheader27.us.new.preheader196:                 ; preds = %middle.block124..preheader27.us.new.preheader196_crit_edge, %vector.memcheck147..preheader27.us.new.preheader196_crit_edge, %min.iters.checked127..preheader27.us.new.preheader196_crit_edge, %.preheader27.us.new.preheader..preheader27.us.new.preheader196_crit_edge
  %indvars.iv28.us.ph = phi i64 [ %indvars.iv28.us.unr.ph, %vector.memcheck147..preheader27.us.new.preheader196_crit_edge ], [ %indvars.iv28.us.unr.ph, %min.iters.checked127..preheader27.us.new.preheader196_crit_edge ], [ %indvars.iv28.us.unr.ph, %.preheader27.us.new.preheader..preheader27.us.new.preheader196_crit_edge ], [ %ind.end152, %middle.block124..preheader27.us.new.preheader196_crit_edge ]
  br label %.preheader27.us.new

min.iters.checked127:                             ; preds = %.preheader27.us.new.preheader
  %n.mod.vf128 = and i64 %30, 1
  %n.vec129 = sub i64 %30, %n.mod.vf128
  %cmp.zero130 = icmp eq i64 %n.vec129, 0
  br i1 %cmp.zero130, label %min.iters.checked127..preheader27.us.new.preheader196_crit_edge, label %vector.memcheck147

min.iters.checked127..preheader27.us.new.preheader196_crit_edge: ; preds = %min.iters.checked127
  br label %.preheader27.us.new.preheader196

vector.memcheck147:                               ; preds = %min.iters.checked127
  %scevgep132 = getelementptr double, double* %3, i64 %indvars.iv28.us.unr.ph
  %31 = sub nsw i64 %15, %indvars.iv28.us.unr.ph
  %32 = and i64 %31, -2
  %33 = add nsw i64 %indvars.iv28.us.unr.ph, %32
  %scevgep135 = getelementptr double, double* %scevgep134, i64 %33
  %scevgep138 = getelementptr double, double* %scevgep137, i64 %indvars.iv28.us.unr.ph
  %scevgep141 = getelementptr double, double* %scevgep140, i64 %33
  %bound0143 = icmp ult double* %scevgep132, %scevgep141
  %bound1144 = icmp ult double* %scevgep138, %scevgep135
  %memcheck.conflict146 = and i1 %bound0143, %bound1144
  %34 = add nuw nsw i64 %indvars.iv28.us.unr.ph, 2
  %35 = shl nuw i64 %29, 1
  %36 = add i64 %34, %35
  %37 = shl nuw nsw i64 %n.mod.vf128, 1
  %ind.end152 = sub i64 %36, %37
  br i1 %memcheck.conflict146, label %vector.memcheck147..preheader27.us.new.preheader196_crit_edge, label %vector.body123.preheader

vector.memcheck147..preheader27.us.new.preheader196_crit_edge: ; preds = %vector.memcheck147
  br label %.preheader27.us.new.preheader196

vector.body123.preheader:                         ; preds = %vector.memcheck147
  br label %vector.body123

vector.body123:                                   ; preds = %vector.body123.vector.body123_crit_edge, %vector.body123.preheader
  %index149 = phi i64 [ %index.next150, %vector.body123.vector.body123_crit_edge ], [ 0, %vector.body123.preheader ]
  %38 = shl i64 %index149, 1
  %offset.idx154 = or i64 %indvars.iv28.us.unr.ph, %38
  %39 = add nsw i64 %offset.idx154, -1
  %40 = getelementptr inbounds double, double* %2, i64 %39
  %41 = bitcast double* %40 to <4 x double>*
  %wide.vec158 = load <4 x double>, <4 x double>* %41, align 8, !alias.scope !1
  %strided.vec159 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec160 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %42 = fadd <2 x double> %strided.vec159, %strided.vec160
  %43 = add nuw nsw i64 %offset.idx154, 1
  %44 = getelementptr inbounds double, double* %2, i64 %43
  %45 = getelementptr double, double* %44, i64 -1
  %46 = bitcast double* %45 to <4 x double>*
  %wide.vec161 = load <4 x double>, <4 x double>* %46, align 8, !alias.scope !1
  %strided.vec163 = shufflevector <4 x double> %wide.vec161, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %47 = fadd <2 x double> %42, %strided.vec163
  %48 = fmul <2 x double> %47, <double 3.333300e-01, double 3.333300e-01>
  %49 = add nuw nsw i64 %offset.idx154, 1
  %50 = getelementptr inbounds double, double* %2, i64 %49
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec164 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !1
  %strided.vec166 = shufflevector <4 x double> %wide.vec164, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %52 = fadd <4 x double> %wide.vec161, %wide.vec164
  %53 = shufflevector <4 x double> %52, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %54 = fadd <2 x double> %53, %strided.vec166
  %55 = fmul <2 x double> %54, <double 3.333300e-01, double 3.333300e-01>
  %56 = getelementptr inbounds double, double* %3, i64 %49
  %57 = getelementptr double, double* %56, i64 -1
  %58 = bitcast double* %57 to <4 x double>*
  %interleaved.vec167 = shufflevector <2 x double> %48, <2 x double> %55, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec167, <4 x double>* %58, align 8, !alias.scope !4, !noalias !1
  %index.next150 = add i64 %index149, 2
  %59 = icmp eq i64 %index.next150, %n.vec129
  br i1 %59, label %middle.block124, label %vector.body123.vector.body123_crit_edge, !llvm.loop !6

vector.body123.vector.body123_crit_edge:          ; preds = %vector.body123
  br label %vector.body123

middle.block124:                                  ; preds = %vector.body123
  %cmp.n153 = icmp eq i64 %n.mod.vf128, 0
  br i1 %cmp.n153, label %middle.block124...preheader_crit_edge.us_crit_edge, label %middle.block124..preheader27.us.new.preheader196_crit_edge

middle.block124..preheader27.us.new.preheader196_crit_edge: ; preds = %middle.block124
  br label %.preheader27.us.new.preheader196

middle.block124...preheader_crit_edge.us_crit_edge: ; preds = %middle.block124
  br label %..preheader_crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph30.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block79.._crit_edge.us_crit_edge, %.lr.ph30.us.prol.loopexit.._crit_edge.us_crit_edge, %..preheader_crit_edge.us.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %60 = add nuw nsw i32 %.02431.us, 1
  %exitcond47 = icmp eq i32 %60, %0
  br i1 %exitcond47, label %._crit_edge32.loopexit, label %._crit_edge.us..preheader27.us_crit_edge

._crit_edge.us..preheader27.us_crit_edge:         ; preds = %._crit_edge.us
  br label %.preheader27.us

.lr.ph30.us:                                      ; preds = %.lr.ph30.us..lr.ph30.us_crit_edge, %.lr.ph30.us.preheader195
  %indvars.iv2529.us = phi i64 [ %indvars.iv.next26.us.1, %.lr.ph30.us..lr.ph30.us_crit_edge ], [ %indvars.iv2529.us.ph, %.lr.ph30.us.preheader195 ]
  %61 = add nsw i64 %indvars.iv2529.us, -1
  %62 = getelementptr inbounds double, double* %3, i64 %61
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds double, double* %3, i64 %indvars.iv2529.us
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = add nuw nsw i64 %indvars.iv2529.us, 1
  %68 = getelementptr inbounds double, double* %3, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fadd double %66, %69
  %71 = fmul double %70, 3.333300e-01
  %72 = getelementptr inbounds double, double* %2, i64 %indvars.iv2529.us
  store double %71, double* %72, align 8
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2529.us, 1
  %73 = getelementptr inbounds double, double* %3, i64 %indvars.iv2529.us
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next26.us
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  %78 = add nsw i64 %indvars.iv2529.us, 2
  %79 = getelementptr inbounds double, double* %3, i64 %78
  %80 = load double, double* %79, align 8
  %81 = fadd double %77, %80
  %82 = fmul double %81, 3.333300e-01
  %83 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next26.us
  store double %82, double* %83, align 8
  %indvars.iv.next26.us.1 = add nsw i64 %indvars.iv2529.us, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next26.us.1, %7
  br i1 %exitcond46.1, label %._crit_edge.us.loopexit, label %.lr.ph30.us..lr.ph30.us_crit_edge, !llvm.loop !9

.lr.ph30.us..lr.ph30.us_crit_edge:                ; preds = %.lr.ph30.us
  br label %.lr.ph30.us

.preheader27.us.new:                              ; preds = %.preheader27.us.new..preheader27.us.new_crit_edge, %.preheader27.us.new.preheader196
  %indvars.iv28.us = phi i64 [ %indvars.iv.next.us.1, %.preheader27.us.new..preheader27.us.new_crit_edge ], [ %indvars.iv28.us.ph, %.preheader27.us.new.preheader196 ]
  %84 = add nsw i64 %indvars.iv28.us, -1
  %85 = getelementptr inbounds double, double* %2, i64 %84
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv28.us
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  %90 = add nuw nsw i64 %indvars.iv28.us, 1
  %91 = getelementptr inbounds double, double* %2, i64 %90
  %92 = load double, double* %91, align 8
  %93 = fadd double %89, %92
  %94 = fmul double %93, 3.333300e-01
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv28.us
  store double %94, double* %95, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv28.us, 1
  %96 = getelementptr inbounds double, double* %2, i64 %indvars.iv28.us
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %99 = load double, double* %98, align 8
  %100 = fadd double %97, %99
  %101 = add nsw i64 %indvars.iv28.us, 2
  %102 = getelementptr inbounds double, double* %2, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fadd double %100, %103
  %105 = fmul double %104, 3.333300e-01
  %106 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %105, double* %106, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv28.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %7
  br i1 %exitcond.1, label %..preheader_crit_edge.us.loopexit, label %.preheader27.us.new..preheader27.us.new_crit_edge, !llvm.loop !10

.preheader27.us.new..preheader27.us.new_crit_edge: ; preds = %.preheader27.us.new
  br label %.preheader27.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.preheader27.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %middle.block124...preheader_crit_edge.us_crit_edge, %.prol.loopexit...preheader_crit_edge.us_crit_edge, %..preheader_crit_edge.us.loopexit
  br i1 %18, label %.lr.ph30.us.preheader, label %..preheader_crit_edge.us.._crit_edge.us_crit_edge

..preheader_crit_edge.us.._crit_edge.us_crit_edge: ; preds = %..preheader_crit_edge.us
  br label %._crit_edge.us

.lr.ph30.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %19, label %.lr.ph30.us.preheader..lr.ph30.us.prol.loopexit_crit_edge, label %.lr.ph30.us.prol

.lr.ph30.us.preheader..lr.ph30.us.prol.loopexit_crit_edge: ; preds = %.lr.ph30.us.preheader
  br label %.lr.ph30.us.prol.loopexit

.lr.ph30.us.prol:                                 ; preds = %.lr.ph30.us.preheader
  %107 = load double, double* %3, align 8
  %108 = load double, double* %sunkaddr178, align 8
  %109 = fadd double %107, %108
  %110 = load double, double* %sunkaddr181, align 8
  %111 = fadd double %109, %110
  %112 = fmul double %111, 3.333300e-01
  store double %112, double* %sunkaddr184, align 8
  br label %.lr.ph30.us.prol.loopexit

.lr.ph30.us.prol.loopexit:                        ; preds = %.lr.ph30.us.preheader..lr.ph30.us.prol.loopexit_crit_edge, %.lr.ph30.us.prol
  %indvars.iv2529.us.unr.ph = phi i64 [ 2, %.lr.ph30.us.prol ], [ 1, %.lr.ph30.us.preheader..lr.ph30.us.prol.loopexit_crit_edge ]
  br i1 %20, label %.lr.ph30.us.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph30.us.preheader59

.lr.ph30.us.prol.loopexit.._crit_edge.us_crit_edge: ; preds = %.lr.ph30.us.prol.loopexit
  br label %._crit_edge.us

.lr.ph30.us.preheader59:                          ; preds = %.lr.ph30.us.prol.loopexit
  %113 = sub nsw i64 %12, %indvars.iv2529.us.unr.ph
  %114 = lshr i64 %113, 1
  %115 = add nuw i64 %114, 1
  %min.iters.check81 = icmp ult i64 %115, 2
  br i1 %min.iters.check81, label %.lr.ph30.us.preheader59..lr.ph30.us.preheader195_crit_edge, label %min.iters.checked82

.lr.ph30.us.preheader59..lr.ph30.us.preheader195_crit_edge: ; preds = %.lr.ph30.us.preheader59
  br label %.lr.ph30.us.preheader195

.lr.ph30.us.preheader195:                         ; preds = %middle.block79..lr.ph30.us.preheader195_crit_edge, %vector.memcheck102..lr.ph30.us.preheader195_crit_edge, %min.iters.checked82..lr.ph30.us.preheader195_crit_edge, %.lr.ph30.us.preheader59..lr.ph30.us.preheader195_crit_edge
  %indvars.iv2529.us.ph = phi i64 [ %indvars.iv2529.us.unr.ph, %vector.memcheck102..lr.ph30.us.preheader195_crit_edge ], [ %indvars.iv2529.us.unr.ph, %min.iters.checked82..lr.ph30.us.preheader195_crit_edge ], [ %indvars.iv2529.us.unr.ph, %.lr.ph30.us.preheader59..lr.ph30.us.preheader195_crit_edge ], [ %ind.end107, %middle.block79..lr.ph30.us.preheader195_crit_edge ]
  br label %.lr.ph30.us

min.iters.checked82:                              ; preds = %.lr.ph30.us.preheader59
  %n.mod.vf83 = and i64 %115, 1
  %n.vec84 = sub i64 %115, %n.mod.vf83
  %cmp.zero85 = icmp eq i64 %n.vec84, 0
  br i1 %cmp.zero85, label %min.iters.checked82..lr.ph30.us.preheader195_crit_edge, label %vector.memcheck102

min.iters.checked82..lr.ph30.us.preheader195_crit_edge: ; preds = %min.iters.checked82
  br label %.lr.ph30.us.preheader195

vector.memcheck102:                               ; preds = %min.iters.checked82
  %scevgep87 = getelementptr double, double* %2, i64 %indvars.iv2529.us.unr.ph
  %116 = sub nsw i64 %13, %indvars.iv2529.us.unr.ph
  %117 = and i64 %116, -2
  %118 = add nsw i64 %indvars.iv2529.us.unr.ph, %117
  %scevgep90 = getelementptr double, double* %scevgep89, i64 %118
  %scevgep93 = getelementptr double, double* %scevgep92, i64 %indvars.iv2529.us.unr.ph
  %scevgep96 = getelementptr double, double* %scevgep95, i64 %118
  %bound098 = icmp ult double* %scevgep87, %scevgep96
  %bound199 = icmp ult double* %scevgep93, %scevgep90
  %memcheck.conflict101 = and i1 %bound098, %bound199
  %119 = add nuw nsw i64 %indvars.iv2529.us.unr.ph, 2
  %120 = shl nuw i64 %114, 1
  %121 = add i64 %119, %120
  %122 = shl nuw nsw i64 %n.mod.vf83, 1
  %ind.end107 = sub i64 %121, %122
  br i1 %memcheck.conflict101, label %vector.memcheck102..lr.ph30.us.preheader195_crit_edge, label %vector.body78.preheader

vector.memcheck102..lr.ph30.us.preheader195_crit_edge: ; preds = %vector.memcheck102
  br label %.lr.ph30.us.preheader195

vector.body78.preheader:                          ; preds = %vector.memcheck102
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78.vector.body78_crit_edge, %vector.body78.preheader
  %index104 = phi i64 [ %index.next105, %vector.body78.vector.body78_crit_edge ], [ 0, %vector.body78.preheader ]
  %123 = shl i64 %index104, 1
  %offset.idx109 = or i64 %indvars.iv2529.us.unr.ph, %123
  %124 = add nsw i64 %offset.idx109, -1
  %125 = getelementptr inbounds double, double* %3, i64 %124
  %126 = bitcast double* %125 to <4 x double>*
  %wide.vec113 = load <4 x double>, <4 x double>* %126, align 8, !alias.scope !11
  %strided.vec114 = shufflevector <4 x double> %wide.vec113, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec115 = shufflevector <4 x double> %wide.vec113, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %127 = fadd <2 x double> %strided.vec114, %strided.vec115
  %128 = add nuw nsw i64 %offset.idx109, 1
  %129 = getelementptr inbounds double, double* %3, i64 %128
  %130 = getelementptr double, double* %129, i64 -1
  %131 = bitcast double* %130 to <4 x double>*
  %wide.vec116 = load <4 x double>, <4 x double>* %131, align 8, !alias.scope !11
  %strided.vec118 = shufflevector <4 x double> %wide.vec116, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %132 = fadd <2 x double> %127, %strided.vec118
  %133 = fmul <2 x double> %132, <double 3.333300e-01, double 3.333300e-01>
  %134 = add nuw nsw i64 %offset.idx109, 1
  %135 = getelementptr inbounds double, double* %3, i64 %134
  %136 = bitcast double* %135 to <4 x double>*
  %wide.vec119 = load <4 x double>, <4 x double>* %136, align 8, !alias.scope !11
  %strided.vec121 = shufflevector <4 x double> %wide.vec119, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %137 = fadd <4 x double> %wide.vec116, %wide.vec119
  %138 = shufflevector <4 x double> %137, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %139 = fadd <2 x double> %138, %strided.vec121
  %140 = fmul <2 x double> %139, <double 3.333300e-01, double 3.333300e-01>
  %141 = getelementptr inbounds double, double* %2, i64 %134
  %142 = getelementptr double, double* %141, i64 -1
  %143 = bitcast double* %142 to <4 x double>*
  %interleaved.vec122 = shufflevector <2 x double> %133, <2 x double> %140, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec122, <4 x double>* %143, align 8, !alias.scope !14, !noalias !11
  %index.next105 = add i64 %index104, 2
  %144 = icmp eq i64 %index.next105, %n.vec84
  br i1 %144, label %middle.block79, label %vector.body78.vector.body78_crit_edge, !llvm.loop !16

vector.body78.vector.body78_crit_edge:            ; preds = %vector.body78
  br label %vector.body78

middle.block79:                                   ; preds = %vector.body78
  %cmp.n108 = icmp eq i64 %n.mod.vf83, 0
  br i1 %cmp.n108, label %middle.block79.._crit_edge.us_crit_edge, label %middle.block79..lr.ph30.us.preheader195_crit_edge

middle.block79..lr.ph30.us.preheader195_crit_edge: ; preds = %middle.block79
  br label %.lr.ph30.us.preheader195

middle.block79.._crit_edge.us_crit_edge:          ; preds = %middle.block79
  br label %._crit_edge.us

.preheader27.lr.ph.split:                         ; preds = %.preheader27.lr.ph
  %145 = icmp sgt i32 %9, 1
  br i1 %145, label %.preheader27.us33.preheader, label %.preheader27.lr.ph.split.._crit_edge32_crit_edge

.preheader27.lr.ph.split.._crit_edge32_crit_edge: ; preds = %.preheader27.lr.ph.split
  br label %._crit_edge32

.preheader27.us33.preheader:                      ; preds = %.preheader27.lr.ph.split
  %146 = and i64 %7, 1
  %147 = add nsw i64 %7, -2
  %scevgep62 = getelementptr double, double* %2, i64 2
  %148 = add nsw i64 %7, -2
  %scevgep65 = getelementptr double, double* %3, i64 -1
  %scevgep68 = getelementptr double, double* %3, i64 3
  %149 = icmp eq i64 %146, 0
  %sunkaddr185 = ptrtoint double* %3 to i64
  %sunkaddr186 = add i64 %sunkaddr185, 8
  %sunkaddr187 = inttoptr i64 %sunkaddr186 to double*
  %sunkaddr188 = ptrtoint double* %3 to i64
  %sunkaddr189 = add i64 %sunkaddr188, 16
  %sunkaddr190 = inttoptr i64 %sunkaddr189 to double*
  %sunkaddr191 = ptrtoint double* %2 to i64
  %sunkaddr192 = add i64 %sunkaddr191, 8
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to double*
  %150 = icmp eq i32 %6, 2
  br label %.preheader27.us33

.preheader27.us33:                                ; preds = %._crit_edge.us43..preheader27.us33_crit_edge, %.preheader27.us33.preheader
  %.02431.us34 = phi i32 [ %213, %._crit_edge.us43..preheader27.us33_crit_edge ], [ 0, %.preheader27.us33.preheader ]
  br i1 %149, label %151, label %.preheader27.us33..prol.loopexit54_crit_edge

.preheader27.us33..prol.loopexit54_crit_edge:     ; preds = %.preheader27.us33
  br label %.prol.loopexit54

; <label>:151:                                    ; preds = %.preheader27.us33
  %152 = load double, double* %3, align 8
  %153 = load double, double* %sunkaddr187, align 8
  %154 = fadd double %152, %153
  %155 = load double, double* %sunkaddr190, align 8
  %156 = fadd double %154, %155
  %157 = fmul double %156, 3.333300e-01
  store double %157, double* %sunkaddr193, align 8
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.preheader27.us33..prol.loopexit54_crit_edge, %151
  %indvars.iv2529.us36.unr.ph = phi i64 [ 2, %151 ], [ 1, %.preheader27.us33..prol.loopexit54_crit_edge ]
  br i1 %150, label %.prol.loopexit54.._crit_edge.us43_crit_edge, label %.preheader27.us33.new.preheader

.prol.loopexit54.._crit_edge.us43_crit_edge:      ; preds = %.prol.loopexit54
  br label %._crit_edge.us43

.preheader27.us33.new.preheader:                  ; preds = %.prol.loopexit54
  %158 = sub nsw i64 %147, %indvars.iv2529.us36.unr.ph
  %159 = lshr i64 %158, 1
  %160 = add nuw i64 %159, 1
  %min.iters.check = icmp ult i64 %160, 2
  br i1 %min.iters.check, label %.preheader27.us33.new.preheader..preheader27.us33.new.preheader197_crit_edge, label %min.iters.checked

.preheader27.us33.new.preheader..preheader27.us33.new.preheader197_crit_edge: ; preds = %.preheader27.us33.new.preheader
  br label %.preheader27.us33.new.preheader197

min.iters.checked:                                ; preds = %.preheader27.us33.new.preheader
  %n.mod.vf = and i64 %160, 1
  %n.vec = sub i64 %160, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked..preheader27.us33.new.preheader197_crit_edge, label %vector.memcheck

min.iters.checked..preheader27.us33.new.preheader197_crit_edge: ; preds = %min.iters.checked
  br label %.preheader27.us33.new.preheader197

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv2529.us36.unr.ph
  %161 = sub nsw i64 %148, %indvars.iv2529.us36.unr.ph
  %162 = and i64 %161, -2
  %163 = add nsw i64 %indvars.iv2529.us36.unr.ph, %162
  %scevgep63 = getelementptr double, double* %scevgep62, i64 %163
  %scevgep66 = getelementptr double, double* %scevgep65, i64 %indvars.iv2529.us36.unr.ph
  %scevgep69 = getelementptr double, double* %scevgep68, i64 %163
  %bound0 = icmp ult double* %scevgep, %scevgep69
  %bound1 = icmp ult double* %scevgep66, %scevgep63
  %memcheck.conflict = and i1 %bound0, %bound1
  %164 = add nuw nsw i64 %indvars.iv2529.us36.unr.ph, 2
  %165 = shl nuw i64 %159, 1
  %166 = add i64 %164, %165
  %167 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %166, %167
  br i1 %memcheck.conflict, label %vector.memcheck..preheader27.us33.new.preheader197_crit_edge, label %vector.body.preheader

vector.memcheck..preheader27.us33.new.preheader197_crit_edge: ; preds = %vector.memcheck
  br label %.preheader27.us33.new.preheader197

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %168 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv2529.us36.unr.ph, %168
  %169 = add nsw i64 %offset.idx, -1
  %170 = getelementptr inbounds double, double* %3, i64 %169
  %171 = bitcast double* %170 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %171, align 8, !alias.scope !17
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec71 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %172 = fadd <2 x double> %strided.vec, %strided.vec71
  %173 = add nuw nsw i64 %offset.idx, 1
  %174 = getelementptr inbounds double, double* %3, i64 %173
  %175 = getelementptr double, double* %174, i64 -1
  %176 = bitcast double* %175 to <4 x double>*
  %wide.vec72 = load <4 x double>, <4 x double>* %176, align 8, !alias.scope !17
  %strided.vec74 = shufflevector <4 x double> %wide.vec72, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %177 = fadd <2 x double> %172, %strided.vec74
  %178 = fmul <2 x double> %177, <double 3.333300e-01, double 3.333300e-01>
  %179 = add nuw nsw i64 %offset.idx, 1
  %180 = getelementptr inbounds double, double* %3, i64 %179
  %181 = bitcast double* %180 to <4 x double>*
  %wide.vec75 = load <4 x double>, <4 x double>* %181, align 8, !alias.scope !17
  %strided.vec77 = shufflevector <4 x double> %wide.vec75, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %182 = fadd <4 x double> %wide.vec72, %wide.vec75
  %183 = shufflevector <4 x double> %182, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %184 = fadd <2 x double> %183, %strided.vec77
  %185 = fmul <2 x double> %184, <double 3.333300e-01, double 3.333300e-01>
  %186 = getelementptr inbounds double, double* %2, i64 %179
  %187 = getelementptr double, double* %186, i64 -1
  %188 = bitcast double* %187 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %178, <2 x double> %185, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %188, align 8, !alias.scope !20, !noalias !17
  %index.next = add i64 %index, 2
  %189 = icmp eq i64 %index.next, %n.vec
  br i1 %189, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !22

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.._crit_edge.us43_crit_edge, label %middle.block..preheader27.us33.new.preheader197_crit_edge

middle.block..preheader27.us33.new.preheader197_crit_edge: ; preds = %middle.block
  br label %.preheader27.us33.new.preheader197

middle.block.._crit_edge.us43_crit_edge:          ; preds = %middle.block
  br label %._crit_edge.us43

.preheader27.us33.new.preheader197:               ; preds = %middle.block..preheader27.us33.new.preheader197_crit_edge, %vector.memcheck..preheader27.us33.new.preheader197_crit_edge, %min.iters.checked..preheader27.us33.new.preheader197_crit_edge, %.preheader27.us33.new.preheader..preheader27.us33.new.preheader197_crit_edge
  %indvars.iv2529.us36.ph = phi i64 [ %indvars.iv2529.us36.unr.ph, %vector.memcheck..preheader27.us33.new.preheader197_crit_edge ], [ %indvars.iv2529.us36.unr.ph, %min.iters.checked..preheader27.us33.new.preheader197_crit_edge ], [ %indvars.iv2529.us36.unr.ph, %.preheader27.us33.new.preheader..preheader27.us33.new.preheader197_crit_edge ], [ %ind.end, %middle.block..preheader27.us33.new.preheader197_crit_edge ]
  br label %.preheader27.us33.new

.preheader27.us33.new:                            ; preds = %.preheader27.us33.new..preheader27.us33.new_crit_edge, %.preheader27.us33.new.preheader197
  %indvars.iv2529.us36 = phi i64 [ %indvars.iv.next26.us37.1, %.preheader27.us33.new..preheader27.us33.new_crit_edge ], [ %indvars.iv2529.us36.ph, %.preheader27.us33.new.preheader197 ]
  %190 = add nsw i64 %indvars.iv2529.us36, -1
  %191 = getelementptr inbounds double, double* %3, i64 %190
  %192 = load double, double* %191, align 8
  %193 = getelementptr inbounds double, double* %3, i64 %indvars.iv2529.us36
  %194 = load double, double* %193, align 8
  %195 = fadd double %192, %194
  %196 = add nuw nsw i64 %indvars.iv2529.us36, 1
  %197 = getelementptr inbounds double, double* %3, i64 %196
  %198 = load double, double* %197, align 8
  %199 = fadd double %195, %198
  %200 = fmul double %199, 3.333300e-01
  %201 = getelementptr inbounds double, double* %2, i64 %indvars.iv2529.us36
  store double %200, double* %201, align 8
  %indvars.iv.next26.us37 = add nuw nsw i64 %indvars.iv2529.us36, 1
  %202 = getelementptr inbounds double, double* %3, i64 %indvars.iv2529.us36
  %203 = load double, double* %202, align 8
  %204 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next26.us37
  %205 = load double, double* %204, align 8
  %206 = fadd double %203, %205
  %207 = add nsw i64 %indvars.iv2529.us36, 2
  %208 = getelementptr inbounds double, double* %3, i64 %207
  %209 = load double, double* %208, align 8
  %210 = fadd double %206, %209
  %211 = fmul double %210, 3.333300e-01
  %212 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next26.us37
  store double %211, double* %212, align 8
  %indvars.iv.next26.us37.1 = add nsw i64 %indvars.iv2529.us36, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next26.us37.1, %7
  br i1 %exitcond48.1, label %._crit_edge.us43.loopexit, label %.preheader27.us33.new..preheader27.us33.new_crit_edge, !llvm.loop !23

.preheader27.us33.new..preheader27.us33.new_crit_edge: ; preds = %.preheader27.us33.new
  br label %.preheader27.us33.new

._crit_edge.us43.loopexit:                        ; preds = %.preheader27.us33.new
  br label %._crit_edge.us43

._crit_edge.us43:                                 ; preds = %middle.block.._crit_edge.us43_crit_edge, %.prol.loopexit54.._crit_edge.us43_crit_edge, %._crit_edge.us43.loopexit
  %213 = add nuw nsw i32 %.02431.us34, 1
  %exitcond49 = icmp eq i32 %213, %0
  br i1 %exitcond49, label %._crit_edge32.loopexit198, label %._crit_edge.us43..preheader27.us33_crit_edge

._crit_edge.us43..preheader27.us33_crit_edge:     ; preds = %._crit_edge.us43
  br label %.preheader27.us33

._crit_edge32.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32.loopexit198:                        ; preds = %._crit_edge.us43
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %.preheader27.lr.ph.split.._crit_edge32_crit_edge, %.._crit_edge32_crit_edge, %._crit_edge32.loopexit198, %._crit_edge32.loopexit
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
  br i1 %8, label %.lr.ph.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv5 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  br label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %.lr.ph._crit_edge, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %14
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
