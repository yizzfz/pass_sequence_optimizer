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
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %9

; <label>:9:                                      ; preds = %.lr.ph
  %10 = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %8
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  store double %11, double* %1, align 8
  store double %12, double* %2, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %9
  %indvars.iv10.unr = phi i64 [ 0, %.lr.ph ], [ 1, %9 ]
  %13 = icmp eq i32 %0, 1
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv10 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv10.unr, %.lr.ph.new.preheader ]
  %14 = trunc i64 %indvars.iv10 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = fadd <2 x double> %18, <double 2.000000e+00, double 3.000000e+00>
  %20 = fdiv <2 x double> %19, %8
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %16, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double %22, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %27 = insertelement <2 x double> undef, double %25, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = fadd <2 x double> %28, <double 2.000000e+00, double 3.000000e+00>
  %30 = fdiv <2 x double> %29, %8
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  store double %31, double* %26, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  store double %32, double* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %4
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %3
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
  %scevgep88 = getelementptr double, double* %2, i64 2
  %13 = add nsw i64 %8, -2
  %scevgep91 = getelementptr double, double* %3, i64 -1
  %scevgep94 = getelementptr double, double* %3, i64 3
  %14 = add nsw i64 %8, -2
  %scevgep133 = getelementptr double, double* %3, i64 2
  %15 = add nsw i64 %8, -2
  %scevgep136 = getelementptr double, double* %2, i64 -1
  %scevgep139 = getelementptr double, double* %2, i64 3
  %16 = icmp eq i64 %xtraiter, 0
  %17 = icmp eq i64 %11, 0
  %18 = icmp sgt i32 %5, 1
  %19 = icmp eq i64 %xtraiter52, 0
  %20 = icmp eq i64 %11, 0
  %sunkaddr175 = ptrtoint double* %3 to i64
  %sunkaddr176 = add i64 %sunkaddr175, 8
  %sunkaddr177 = inttoptr i64 %sunkaddr176 to double*
  %sunkaddr178 = ptrtoint double* %3 to i64
  %sunkaddr179 = add i64 %sunkaddr178, 16
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to double*
  %sunkaddr181 = ptrtoint double* %2 to i64
  %sunkaddr182 = add i64 %sunkaddr181, 8
  %sunkaddr183 = inttoptr i64 %sunkaddr182 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr167 = add i64 %sunkaddr, 8
  %sunkaddr168 = inttoptr i64 %sunkaddr167 to double*
  %sunkaddr169 = ptrtoint double* %2 to i64
  %sunkaddr170 = add i64 %sunkaddr169, 16
  %sunkaddr171 = inttoptr i64 %sunkaddr170 to double*
  %sunkaddr172 = ptrtoint double* %3 to i64
  %sunkaddr173 = add i64 %sunkaddr172, 8
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to double*
  br label %.preheader25.preheader.us

.preheader25.preheader.us:                        ; preds = %.preheader._crit_edge.us, %.preheader25.preheader.us.preheader
  %.02431.us = phi i32 [ %57, %.preheader._crit_edge.us ], [ 0, %.preheader25.preheader.us.preheader ]
  br i1 %16, label %.preheader25.us.prol.loopexit, label %.preheader25.us.prol

.preheader25.us.prol:                             ; preds = %.preheader25.preheader.us
  %21 = load double, double* %2, align 8
  %22 = load double, double* %sunkaddr168, align 8
  %23 = fadd double %21, %22
  %24 = load double, double* %sunkaddr171, align 8
  %25 = fadd double %23, %24
  %26 = fmul double %25, 3.333300e-01
  store double %26, double* %sunkaddr174, align 8
  br label %.preheader25.us.prol.loopexit

.preheader25.us.prol.loopexit:                    ; preds = %.preheader25.preheader.us, %.preheader25.us.prol
  %indvars.iv28.us.unr.ph = phi i64 [ 2, %.preheader25.us.prol ], [ 1, %.preheader25.preheader.us ]
  br i1 %17, label %.preheader25..preheader.preheader_crit_edge.us, label %.preheader25.us.preheader

.preheader25.us.preheader:                        ; preds = %.preheader25.us.prol.loopexit
  %27 = sub nsw i64 %14, %indvars.iv28.us.unr.ph
  %28 = lshr i64 %27, 1
  %29 = add nuw i64 %28, 1
  %min.iters.check125 = icmp ult i64 %29, 2
  br i1 %min.iters.check125, label %.preheader25.us.preheader195, label %min.iters.checked126

.preheader25.us.preheader195:                     ; preds = %middle.block123, %vector.memcheck146, %min.iters.checked126, %.preheader25.us.preheader
  %indvars.iv28.us.ph = phi i64 [ %indvars.iv28.us.unr.ph, %vector.memcheck146 ], [ %indvars.iv28.us.unr.ph, %min.iters.checked126 ], [ %indvars.iv28.us.unr.ph, %.preheader25.us.preheader ], [ %ind.end151, %middle.block123 ]
  br label %.preheader25.us

min.iters.checked126:                             ; preds = %.preheader25.us.preheader
  %n.mod.vf127 = and i64 %29, 1
  %n.vec128 = sub i64 %29, %n.mod.vf127
  %cmp.zero129 = icmp eq i64 %n.vec128, 0
  br i1 %cmp.zero129, label %.preheader25.us.preheader195, label %vector.memcheck146

vector.memcheck146:                               ; preds = %min.iters.checked126
  %scevgep131 = getelementptr double, double* %3, i64 %indvars.iv28.us.unr.ph
  %30 = sub nsw i64 %15, %indvars.iv28.us.unr.ph
  %31 = and i64 %30, -2
  %32 = add nsw i64 %indvars.iv28.us.unr.ph, %31
  %scevgep134 = getelementptr double, double* %scevgep133, i64 %32
  %scevgep137 = getelementptr double, double* %scevgep136, i64 %indvars.iv28.us.unr.ph
  %scevgep140 = getelementptr double, double* %scevgep139, i64 %32
  %bound0142 = icmp ult double* %scevgep131, %scevgep140
  %bound1143 = icmp ult double* %scevgep137, %scevgep134
  %memcheck.conflict145 = and i1 %bound0142, %bound1143
  %33 = add nuw nsw i64 %indvars.iv28.us.unr.ph, 2
  %34 = shl nuw i64 %28, 1
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf127, 1
  %ind.end151 = sub i64 %35, %36
  br i1 %memcheck.conflict145, label %.preheader25.us.preheader195, label %vector.body122.preheader

vector.body122.preheader:                         ; preds = %vector.memcheck146
  br label %vector.body122

vector.body122:                                   ; preds = %vector.body122.preheader, %vector.body122
  %index148 = phi i64 [ %index.next149, %vector.body122 ], [ 0, %vector.body122.preheader ]
  %37 = shl i64 %index148, 1
  %offset.idx153 = or i64 %indvars.iv28.us.unr.ph, %37
  %38 = add nsw i64 %offset.idx153, -1
  %39 = getelementptr inbounds double, double* %2, i64 %38
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec157 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !1
  %strided.vec158 = shufflevector <4 x double> %wide.vec157, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec159 = shufflevector <4 x double> %wide.vec157, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <2 x double> %strided.vec158, %strided.vec159
  %42 = add nuw nsw i64 %offset.idx153, 1
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = getelementptr double, double* %43, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec160 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !1
  %strided.vec162 = shufflevector <4 x double> %wide.vec160, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %41, %strided.vec162
  %47 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %48 = bitcast double* %43 to <4 x double>*
  %wide.vec163 = load <4 x double>, <4 x double>* %48, align 8, !alias.scope !1
  %strided.vec165 = shufflevector <4 x double> %wide.vec163, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = fadd <4 x double> %wide.vec160, %wide.vec163
  %50 = shufflevector <4 x double> %49, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %51 = fadd <2 x double> %50, %strided.vec165
  %52 = fmul <2 x double> %51, <double 3.333300e-01, double 3.333300e-01>
  %53 = getelementptr inbounds double, double* %3, i64 %42
  %54 = getelementptr double, double* %53, i64 -1
  %55 = bitcast double* %54 to <4 x double>*
  %interleaved.vec166 = shufflevector <2 x double> %47, <2 x double> %52, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec166, <4 x double>* %55, align 8, !alias.scope !4, !noalias !1
  %index.next149 = add i64 %index148, 2
  %56 = icmp eq i64 %index.next149, %n.vec128
  br i1 %56, label %middle.block123, label %vector.body122, !llvm.loop !6

middle.block123:                                  ; preds = %vector.body122
  %cmp.n152 = icmp eq i64 %n.mod.vf127, 0
  br i1 %cmp.n152, label %.preheader25..preheader.preheader_crit_edge.us, label %.preheader25.us.preheader195

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block78, %.preheader.us.prol.loopexit, %.preheader25..preheader.preheader_crit_edge.us
  %57 = add nuw nsw i32 %.02431.us, 1
  %exitcond48 = icmp eq i32 %57, %0
  br i1 %exitcond48, label %._crit_edge.loopexit, label %.preheader25.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader194, %.preheader.us
  %indvars.iv2629.us = phi i64 [ %indvars.iv.next27.us.1, %.preheader.us ], [ %indvars.iv2629.us.ph, %.preheader.us.preheader194 ]
  %58 = add nsw i64 %indvars.iv2629.us, -1
  %59 = getelementptr inbounds double, double* %3, i64 %58
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %indvars.iv.next27.us = add nuw nsw i64 %indvars.iv2629.us, 1
  %64 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 3.333300e-01
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv2629.us
  store double %67, double* %68, align 8
  %69 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %indvars.iv.next27.us.1 = add nsw i64 %indvars.iv2629.us, 2
  %74 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us.1
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = fmul double %76, 3.333300e-01
  %78 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next27.us
  store double %77, double* %78, align 8
  %exitcond47.1 = icmp eq i64 %indvars.iv.next27.us.1, %8
  br i1 %exitcond47.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !9

.preheader25.us:                                  ; preds = %.preheader25.us.preheader195, %.preheader25.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next.us.1, %.preheader25.us ], [ %indvars.iv28.us.ph, %.preheader25.us.preheader195 ]
  %79 = add nsw i64 %indvars.iv28.us, -1
  %80 = getelementptr inbounds double, double* %2, i64 %79
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv28.us
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv28.us, 1
  %85 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  %88 = fmul double %87, 3.333300e-01
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv28.us
  store double %88, double* %89, align 8
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv28.us
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv28.us, 2
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us.1
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %98 = fmul double %97, 3.333300e-01
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %98, double* %99, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %8
  br i1 %exitcond.1, label %.preheader25..preheader.preheader_crit_edge.us.loopexit, label %.preheader25.us, !llvm.loop !10

.preheader25..preheader.preheader_crit_edge.us.loopexit: ; preds = %.preheader25.us
  br label %.preheader25..preheader.preheader_crit_edge.us

.preheader25..preheader.preheader_crit_edge.us:   ; preds = %.preheader25..preheader.preheader_crit_edge.us.loopexit, %middle.block123, %.preheader25.us.prol.loopexit
  br i1 %18, label %.preheader.us.preheader, label %.preheader._crit_edge.us

.preheader.us.preheader:                          ; preds = %.preheader25..preheader.preheader_crit_edge.us
  br i1 %19, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.preheader
  %100 = load double, double* %3, align 8
  %101 = load double, double* %sunkaddr177, align 8
  %102 = fadd double %100, %101
  %103 = load double, double* %sunkaddr180, align 8
  %104 = fadd double %102, %103
  %105 = fmul double %104, 3.333300e-01
  store double %105, double* %sunkaddr183, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol
  %indvars.iv2629.us.unr.ph = phi i64 [ 2, %.preheader.us.prol ], [ 1, %.preheader.us.preheader ]
  br i1 %20, label %.preheader._crit_edge.us, label %.preheader.us.preheader58

.preheader.us.preheader58:                        ; preds = %.preheader.us.prol.loopexit
  %106 = sub nsw i64 %12, %indvars.iv2629.us.unr.ph
  %107 = lshr i64 %106, 1
  %108 = add nuw i64 %107, 1
  %min.iters.check80 = icmp ult i64 %108, 2
  br i1 %min.iters.check80, label %.preheader.us.preheader194, label %min.iters.checked81

.preheader.us.preheader194:                       ; preds = %middle.block78, %vector.memcheck101, %min.iters.checked81, %.preheader.us.preheader58
  %indvars.iv2629.us.ph = phi i64 [ %indvars.iv2629.us.unr.ph, %vector.memcheck101 ], [ %indvars.iv2629.us.unr.ph, %min.iters.checked81 ], [ %indvars.iv2629.us.unr.ph, %.preheader.us.preheader58 ], [ %ind.end106, %middle.block78 ]
  br label %.preheader.us

min.iters.checked81:                              ; preds = %.preheader.us.preheader58
  %n.mod.vf82 = and i64 %108, 1
  %n.vec83 = sub i64 %108, %n.mod.vf82
  %cmp.zero84 = icmp eq i64 %n.vec83, 0
  br i1 %cmp.zero84, label %.preheader.us.preheader194, label %vector.memcheck101

vector.memcheck101:                               ; preds = %min.iters.checked81
  %scevgep86 = getelementptr double, double* %2, i64 %indvars.iv2629.us.unr.ph
  %109 = sub nsw i64 %13, %indvars.iv2629.us.unr.ph
  %110 = and i64 %109, -2
  %111 = add nsw i64 %indvars.iv2629.us.unr.ph, %110
  %scevgep89 = getelementptr double, double* %scevgep88, i64 %111
  %scevgep92 = getelementptr double, double* %scevgep91, i64 %indvars.iv2629.us.unr.ph
  %scevgep95 = getelementptr double, double* %scevgep94, i64 %111
  %bound097 = icmp ult double* %scevgep86, %scevgep95
  %bound198 = icmp ult double* %scevgep92, %scevgep89
  %memcheck.conflict100 = and i1 %bound097, %bound198
  %112 = add nuw nsw i64 %indvars.iv2629.us.unr.ph, 2
  %113 = shl nuw i64 %107, 1
  %114 = add i64 %112, %113
  %115 = shl nuw nsw i64 %n.mod.vf82, 1
  %ind.end106 = sub i64 %114, %115
  br i1 %memcheck.conflict100, label %.preheader.us.preheader194, label %vector.body77.preheader

vector.body77.preheader:                          ; preds = %vector.memcheck101
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77.preheader, %vector.body77
  %index103 = phi i64 [ %index.next104, %vector.body77 ], [ 0, %vector.body77.preheader ]
  %116 = shl i64 %index103, 1
  %offset.idx108 = or i64 %indvars.iv2629.us.unr.ph, %116
  %117 = add nsw i64 %offset.idx108, -1
  %118 = getelementptr inbounds double, double* %3, i64 %117
  %119 = bitcast double* %118 to <4 x double>*
  %wide.vec112 = load <4 x double>, <4 x double>* %119, align 8, !alias.scope !11
  %strided.vec113 = shufflevector <4 x double> %wide.vec112, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec114 = shufflevector <4 x double> %wide.vec112, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %120 = fadd <2 x double> %strided.vec113, %strided.vec114
  %121 = add nuw nsw i64 %offset.idx108, 1
  %122 = getelementptr inbounds double, double* %3, i64 %121
  %123 = getelementptr double, double* %122, i64 -1
  %124 = bitcast double* %123 to <4 x double>*
  %wide.vec115 = load <4 x double>, <4 x double>* %124, align 8, !alias.scope !11
  %strided.vec117 = shufflevector <4 x double> %wide.vec115, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %125 = fadd <2 x double> %120, %strided.vec117
  %126 = fmul <2 x double> %125, <double 3.333300e-01, double 3.333300e-01>
  %127 = bitcast double* %122 to <4 x double>*
  %wide.vec118 = load <4 x double>, <4 x double>* %127, align 8, !alias.scope !11
  %strided.vec120 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %128 = fadd <4 x double> %wide.vec115, %wide.vec118
  %129 = shufflevector <4 x double> %128, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %130 = fadd <2 x double> %129, %strided.vec120
  %131 = fmul <2 x double> %130, <double 3.333300e-01, double 3.333300e-01>
  %132 = getelementptr inbounds double, double* %2, i64 %121
  %133 = getelementptr double, double* %132, i64 -1
  %134 = bitcast double* %133 to <4 x double>*
  %interleaved.vec121 = shufflevector <2 x double> %126, <2 x double> %131, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec121, <4 x double>* %134, align 8, !alias.scope !14, !noalias !11
  %index.next104 = add i64 %index103, 2
  %135 = icmp eq i64 %index.next104, %n.vec83
  br i1 %135, label %middle.block78, label %vector.body77, !llvm.loop !16

middle.block78:                                   ; preds = %vector.body77
  %cmp.n107 = icmp eq i64 %n.mod.vf82, 0
  br i1 %cmp.n107, label %.preheader._crit_edge.us, label %.preheader.us.preheader194

.preheader25.preheader.lr.ph.split:               ; preds = %.preheader25.preheader.lr.ph
  %136 = icmp sgt i32 %5, 1
  br i1 %136, label %.preheader25.preheader.us32.preheader, label %._crit_edge

.preheader25.preheader.us32.preheader:            ; preds = %.preheader25.preheader.lr.ph.split
  %137 = and i64 %8, 1
  %138 = add nsw i64 %8, -2
  %scevgep61 = getelementptr double, double* %2, i64 2
  %139 = add nsw i64 %8, -2
  %scevgep64 = getelementptr double, double* %3, i64 -1
  %scevgep67 = getelementptr double, double* %3, i64 3
  %140 = icmp eq i64 %137, 0
  %sunkaddr184 = ptrtoint double* %3 to i64
  %sunkaddr185 = add i64 %sunkaddr184, 8
  %sunkaddr186 = inttoptr i64 %sunkaddr185 to double*
  %sunkaddr187 = ptrtoint double* %3 to i64
  %sunkaddr188 = add i64 %sunkaddr187, 16
  %sunkaddr189 = inttoptr i64 %sunkaddr188 to double*
  %sunkaddr190 = ptrtoint double* %2 to i64
  %sunkaddr191 = add i64 %sunkaddr190, 8
  %sunkaddr192 = inttoptr i64 %sunkaddr191 to double*
  %141 = icmp eq i32 %7, 2
  br label %.preheader25.preheader.us32

.preheader25.preheader.us32:                      ; preds = %.preheader25.preheader.us32.preheader, %.preheader._crit_edge.us44
  %.02431.us33 = phi i32 [ %199, %.preheader._crit_edge.us44 ], [ 0, %.preheader25.preheader.us32.preheader ]
  br i1 %140, label %.preheader.us35.prol, label %.preheader.us35.prol.loopexit

.preheader.us35.prol:                             ; preds = %.preheader25.preheader.us32
  %142 = load double, double* %3, align 8
  %143 = load double, double* %sunkaddr186, align 8
  %144 = fadd double %142, %143
  %145 = load double, double* %sunkaddr189, align 8
  %146 = fadd double %144, %145
  %147 = fmul double %146, 3.333300e-01
  store double %147, double* %sunkaddr192, align 8
  br label %.preheader.us35.prol.loopexit

.preheader.us35.prol.loopexit:                    ; preds = %.preheader.us35.prol, %.preheader25.preheader.us32
  %indvars.iv2629.us36.unr.ph = phi i64 [ 2, %.preheader.us35.prol ], [ 1, %.preheader25.preheader.us32 ]
  br i1 %141, label %.preheader._crit_edge.us44, label %.preheader.us35.preheader

.preheader.us35.preheader:                        ; preds = %.preheader.us35.prol.loopexit
  %148 = sub nsw i64 %138, %indvars.iv2629.us36.unr.ph
  %149 = lshr i64 %148, 1
  %150 = add nuw i64 %149, 1
  %min.iters.check = icmp ult i64 %150, 2
  br i1 %min.iters.check, label %.preheader.us35.preheader196, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us35.preheader
  %n.mod.vf = and i64 %150, 1
  %n.vec = sub i64 %150, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us35.preheader196, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv2629.us36.unr.ph
  %151 = sub nsw i64 %139, %indvars.iv2629.us36.unr.ph
  %152 = and i64 %151, -2
  %153 = add nsw i64 %indvars.iv2629.us36.unr.ph, %152
  %scevgep62 = getelementptr double, double* %scevgep61, i64 %153
  %scevgep65 = getelementptr double, double* %scevgep64, i64 %indvars.iv2629.us36.unr.ph
  %scevgep68 = getelementptr double, double* %scevgep67, i64 %153
  %bound0 = icmp ult double* %scevgep, %scevgep68
  %bound1 = icmp ult double* %scevgep65, %scevgep62
  %memcheck.conflict = and i1 %bound0, %bound1
  %154 = add nuw nsw i64 %indvars.iv2629.us36.unr.ph, 2
  %155 = shl nuw i64 %149, 1
  %156 = add i64 %154, %155
  %157 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %156, %157
  br i1 %memcheck.conflict, label %.preheader.us35.preheader196, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %158 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv2629.us36.unr.ph, %158
  %159 = add nsw i64 %offset.idx, -1
  %160 = getelementptr inbounds double, double* %3, i64 %159
  %161 = bitcast double* %160 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %161, align 8, !alias.scope !17
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec70 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %162 = fadd <2 x double> %strided.vec, %strided.vec70
  %163 = add nuw nsw i64 %offset.idx, 1
  %164 = getelementptr inbounds double, double* %3, i64 %163
  %165 = getelementptr double, double* %164, i64 -1
  %166 = bitcast double* %165 to <4 x double>*
  %wide.vec71 = load <4 x double>, <4 x double>* %166, align 8, !alias.scope !17
  %strided.vec73 = shufflevector <4 x double> %wide.vec71, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %167 = fadd <2 x double> %162, %strided.vec73
  %168 = fmul <2 x double> %167, <double 3.333300e-01, double 3.333300e-01>
  %169 = bitcast double* %164 to <4 x double>*
  %wide.vec74 = load <4 x double>, <4 x double>* %169, align 8, !alias.scope !17
  %strided.vec76 = shufflevector <4 x double> %wide.vec74, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %170 = fadd <4 x double> %wide.vec71, %wide.vec74
  %171 = shufflevector <4 x double> %170, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %172 = fadd <2 x double> %171, %strided.vec76
  %173 = fmul <2 x double> %172, <double 3.333300e-01, double 3.333300e-01>
  %174 = getelementptr inbounds double, double* %2, i64 %163
  %175 = getelementptr double, double* %174, i64 -1
  %176 = bitcast double* %175 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %168, <2 x double> %173, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %176, align 8, !alias.scope !20, !noalias !17
  %index.next = add i64 %index, 2
  %177 = icmp eq i64 %index.next, %n.vec
  br i1 %177, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader._crit_edge.us44, label %.preheader.us35.preheader196

.preheader.us35.preheader196:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us35.preheader
  %indvars.iv2629.us36.ph = phi i64 [ %indvars.iv2629.us36.unr.ph, %vector.memcheck ], [ %indvars.iv2629.us36.unr.ph, %min.iters.checked ], [ %indvars.iv2629.us36.unr.ph, %.preheader.us35.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us35

.preheader.us35:                                  ; preds = %.preheader.us35.preheader196, %.preheader.us35
  %indvars.iv2629.us36 = phi i64 [ %indvars.iv.next27.us37.1, %.preheader.us35 ], [ %indvars.iv2629.us36.ph, %.preheader.us35.preheader196 ]
  %178 = add nsw i64 %indvars.iv2629.us36, -1
  %179 = getelementptr inbounds double, double* %3, i64 %178
  %180 = load double, double* %179, align 8
  %181 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us36
  %182 = load double, double* %181, align 8
  %183 = fadd double %180, %182
  %indvars.iv.next27.us37 = add nuw nsw i64 %indvars.iv2629.us36, 1
  %184 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us37
  %185 = load double, double* %184, align 8
  %186 = fadd double %183, %185
  %187 = fmul double %186, 3.333300e-01
  %188 = getelementptr inbounds double, double* %2, i64 %indvars.iv2629.us36
  store double %187, double* %188, align 8
  %189 = getelementptr inbounds double, double* %3, i64 %indvars.iv2629.us36
  %190 = load double, double* %189, align 8
  %191 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us37
  %192 = load double, double* %191, align 8
  %193 = fadd double %190, %192
  %indvars.iv.next27.us37.1 = add nsw i64 %indvars.iv2629.us36, 2
  %194 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next27.us37.1
  %195 = load double, double* %194, align 8
  %196 = fadd double %193, %195
  %197 = fmul double %196, 3.333300e-01
  %198 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next27.us37
  store double %197, double* %198, align 8
  %exitcond49.1 = icmp eq i64 %indvars.iv.next27.us37.1, %8
  br i1 %exitcond49.1, label %.preheader._crit_edge.us44.loopexit, label %.preheader.us35, !llvm.loop !23

.preheader._crit_edge.us44.loopexit:              ; preds = %.preheader.us35
  br label %.preheader._crit_edge.us44

.preheader._crit_edge.us44:                       ; preds = %.preheader._crit_edge.us44.loopexit, %middle.block, %.preheader.us35.prol.loopexit
  %199 = add nuw nsw i32 %.02431.us33, 1
  %exitcond50 = icmp eq i32 %199, %0
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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
