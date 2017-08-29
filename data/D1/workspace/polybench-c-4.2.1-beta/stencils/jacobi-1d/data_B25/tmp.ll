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
  tail call fastcc void @init_array(double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(double* %5, double* %6)
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
  tail call fastcc void @print_array(double* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  br i1 true, label %.prol.loopexit, label %3

; <label>:3:                                      ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %3
  %indvars.iv10.unr = phi i64 [ 0, %.lr.ph ], [ 1, %3 ]
  br i1 false, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv10 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv10.unr, %.lr.ph.new.preheader ]
  %4 = trunc i64 %indvars.iv10 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %0, i64 %indvars.iv10
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %9 = fadd <2 x double> %8, <double 2.000000e+00, double 3.000000e+00>
  %10 = fdiv <2 x double> %9, <double 2.000000e+03, double 2.000000e+03>
  %11 = bitcast double* %6 to <2 x double>*
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %13 = bitcast double* %12 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, <double 2.000000e+03, double 2.000000e+03>
  %20 = shufflevector <2 x double> %10, <2 x double> %19, <2 x i32> <i32 0, i32 2>
  store <2 x double> %20, <2 x double>* %11, align 8
  %21 = shufflevector <2 x double> %10, <2 x double> %19, <2 x i32> <i32 1, i32 3>
  store <2 x double> %21, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double* nocapture, double* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader27.lr.ph, label %._crit_edge32

.preheader27.lr.ph:                               ; preds = %2
  br i1 true, label %.preheader27.us.preheader, label %.preheader27.lr.ph.split

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %scevgep91 = getelementptr double, double* %0, i64 2
  %scevgep94 = getelementptr double, double* %1, i64 -1
  %scevgep97 = getelementptr double, double* %1, i64 3
  %scevgep136 = getelementptr double, double* %1, i64 2
  %scevgep139 = getelementptr double, double* %0, i64 -1
  %scevgep142 = getelementptr double, double* %0, i64 3
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge.us, %.preheader27.us.preheader
  %.02431.us = phi i32 [ %34, %._crit_edge.us ], [ 0, %.preheader27.us.preheader ]
  br i1 true, label %.prol.loopexit, label %3

; <label>:3:                                      ; preds = %.preheader27.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader27.us, %3
  %indvars.iv28.us.unr.ph = phi i64 [ 2, %3 ], [ 1, %.preheader27.us ]
  br i1 false, label %..preheader_crit_edge.us, label %.preheader27.us.new.preheader

.preheader27.us.new.preheader:                    ; preds = %.prol.loopexit
  %4 = sub nsw i64 1997, %indvars.iv28.us.unr.ph
  %5 = lshr i64 %4, 1
  %6 = add nuw nsw i64 %5, 1
  br i1 false, label %.preheader27.us.new.preheader198, label %min.iters.checked129

.preheader27.us.new.preheader198:                 ; preds = %middle.block126, %vector.memcheck149, %min.iters.checked129, %.preheader27.us.new.preheader
  %indvars.iv28.us.ph = phi i64 [ %indvars.iv28.us.unr.ph, %vector.memcheck149 ], [ %indvars.iv28.us.unr.ph, %min.iters.checked129 ], [ %indvars.iv28.us.unr.ph, %.preheader27.us.new.preheader ], [ %ind.end154, %middle.block126 ]
  br label %.preheader27.us.new

min.iters.checked129:                             ; preds = %.preheader27.us.new.preheader
  %n.mod.vf130 = and i64 %6, 1
  %n.vec131 = sub nsw i64 %6, %n.mod.vf130
  br i1 false, label %.preheader27.us.new.preheader198, label %vector.memcheck149

vector.memcheck149:                               ; preds = %min.iters.checked129
  %scevgep134 = getelementptr double, double* %1, i64 %indvars.iv28.us.unr.ph
  %7 = sub nsw i64 1997, %indvars.iv28.us.unr.ph
  %8 = and i64 %7, 1998
  %9 = add nuw nsw i64 %indvars.iv28.us.unr.ph, %8
  %scevgep137 = getelementptr double, double* %scevgep136, i64 %9
  %scevgep140 = getelementptr double, double* %scevgep139, i64 %indvars.iv28.us.unr.ph
  %scevgep143 = getelementptr double, double* %scevgep142, i64 %9
  %bound0145 = icmp ult double* %scevgep134, %scevgep143
  %bound1146 = icmp ult double* %scevgep140, %scevgep137
  %memcheck.conflict148 = and i1 %bound0145, %bound1146
  %10 = add nuw nsw i64 %indvars.iv28.us.unr.ph, 2
  %11 = shl nuw nsw i64 %5, 1
  %12 = add nuw nsw i64 %10, %11
  %13 = shl nuw nsw i64 %n.mod.vf130, 1
  %ind.end154 = sub nsw i64 %12, %13
  br i1 %memcheck.conflict148, label %.preheader27.us.new.preheader198, label %vector.body125.preheader

vector.body125.preheader:                         ; preds = %vector.memcheck149
  br label %vector.body125

vector.body125:                                   ; preds = %vector.body125.preheader, %vector.body125
  %index151 = phi i64 [ %index.next152, %vector.body125 ], [ 0, %vector.body125.preheader ]
  %14 = shl i64 %index151, 1
  %offset.idx156 = or i64 %indvars.iv28.us.unr.ph, %14
  %15 = add nsw i64 %offset.idx156, -1
  %16 = getelementptr inbounds double, double* %0, i64 %15
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec160 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !1
  %strided.vec161 = shufflevector <4 x double> %wide.vec160, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec162 = shufflevector <4 x double> %wide.vec160, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %18 = fadd <2 x double> %strided.vec161, %strided.vec162
  %19 = add nuw nsw i64 %offset.idx156, 1
  %20 = getelementptr inbounds double, double* %0, i64 %19
  %21 = getelementptr double, double* %20, i64 -1
  %22 = bitcast double* %21 to <4 x double>*
  %wide.vec163 = load <4 x double>, <4 x double>* %22, align 8, !alias.scope !1
  %strided.vec165 = shufflevector <4 x double> %wide.vec163, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %23 = fadd <2 x double> %18, %strided.vec165
  %24 = fmul <2 x double> %23, <double 3.333300e-01, double 3.333300e-01>
  %25 = bitcast double* %20 to <4 x double>*
  %wide.vec166 = load <4 x double>, <4 x double>* %25, align 8, !alias.scope !1
  %strided.vec168 = shufflevector <4 x double> %wide.vec166, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fadd <4 x double> %wide.vec163, %wide.vec166
  %27 = shufflevector <4 x double> %26, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %28 = fadd <2 x double> %27, %strided.vec168
  %29 = fmul <2 x double> %28, <double 3.333300e-01, double 3.333300e-01>
  %30 = getelementptr inbounds double, double* %1, i64 %19
  %31 = getelementptr double, double* %30, i64 -1
  %32 = bitcast double* %31 to <4 x double>*
  %interleaved.vec169 = shufflevector <2 x double> %24, <2 x double> %29, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec169, <4 x double>* %32, align 8, !alias.scope !4, !noalias !1
  %index.next152 = add i64 %index151, 2
  %33 = icmp eq i64 %index.next152, %n.vec131
  br i1 %33, label %middle.block126, label %vector.body125, !llvm.loop !6

middle.block126:                                  ; preds = %vector.body125
  %cmp.n155 = icmp eq i64 %n.mod.vf130, 0
  br i1 %cmp.n155, label %..preheader_crit_edge.us, label %.preheader27.us.new.preheader198

._crit_edge.us.loopexit:                          ; preds = %.lr.ph30.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block81, %.lr.ph30.us.prol.loopexit, %..preheader_crit_edge.us
  %34 = add nuw nsw i32 %.02431.us, 1
  %exitcond49 = icmp eq i32 %34, 500
  br i1 %exitcond49, label %._crit_edge32.loopexit, label %.preheader27.us

.lr.ph30.us:                                      ; preds = %.lr.ph30.us.preheader197, %.lr.ph30.us
  %indvars.iv2529.us = phi i64 [ %indvars.iv.next26.us.1, %.lr.ph30.us ], [ %indvars.iv2529.us.ph, %.lr.ph30.us.preheader197 ]
  %35 = add nsw i64 %indvars.iv2529.us, -1
  %36 = getelementptr inbounds double, double* %1, i64 %35
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds double, double* %1, i64 %indvars.iv2529.us
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2529.us, 1
  %41 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next26.us
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = fmul double %43, 3.333300e-01
  %45 = getelementptr inbounds double, double* %0, i64 %indvars.iv2529.us
  store double %44, double* %45, align 8
  %46 = getelementptr inbounds double, double* %1, i64 %indvars.iv2529.us
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next26.us
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %indvars.iv.next26.us.1 = add nsw i64 %indvars.iv2529.us, 2
  %51 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next26.us.1
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  %54 = fmul double %53, 3.333300e-01
  %55 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next26.us
  store double %54, double* %55, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next26.us.1, 1999
  br i1 %exitcond48.1, label %._crit_edge.us.loopexit, label %.lr.ph30.us, !llvm.loop !9

.preheader27.us.new:                              ; preds = %.preheader27.us.new.preheader198, %.preheader27.us.new
  %indvars.iv28.us = phi i64 [ %indvars.iv.next.us.1, %.preheader27.us.new ], [ %indvars.iv28.us.ph, %.preheader27.us.new.preheader198 ]
  %56 = add nsw i64 %indvars.iv28.us, -1
  %57 = getelementptr inbounds double, double* %0, i64 %56
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %0, i64 %indvars.iv28.us
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv28.us, 1
  %62 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.us
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 3.333300e-01
  %66 = getelementptr inbounds double, double* %1, i64 %indvars.iv28.us
  store double %65, double* %66, align 8
  %67 = getelementptr inbounds double, double* %0, i64 %indvars.iv28.us
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.us
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv28.us, 2
  %72 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.us.1
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = fmul double %74, 3.333300e-01
  %76 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.us
  store double %75, double* %76, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, 1999
  br i1 %exitcond.1, label %..preheader_crit_edge.us.loopexit, label %.preheader27.us.new, !llvm.loop !10

..preheader_crit_edge.us.loopexit:                ; preds = %.preheader27.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %middle.block126, %.prol.loopexit
  br i1 true, label %.lr.ph30.us.preheader, label %._crit_edge.us

.lr.ph30.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 true, label %.lr.ph30.us.prol.loopexit, label %.lr.ph30.us.prol

.lr.ph30.us.prol:                                 ; preds = %.lr.ph30.us.preheader
  br label %.lr.ph30.us.prol.loopexit

.lr.ph30.us.prol.loopexit:                        ; preds = %.lr.ph30.us.preheader, %.lr.ph30.us.prol
  %indvars.iv2529.us.unr.ph = phi i64 [ 2, %.lr.ph30.us.prol ], [ 1, %.lr.ph30.us.preheader ]
  br i1 false, label %._crit_edge.us, label %.lr.ph30.us.preheader61

.lr.ph30.us.preheader61:                          ; preds = %.lr.ph30.us.prol.loopexit
  %77 = sub nsw i64 1997, %indvars.iv2529.us.unr.ph
  %78 = lshr i64 %77, 1
  %79 = add nuw nsw i64 %78, 1
  br i1 false, label %.lr.ph30.us.preheader197, label %min.iters.checked84

.lr.ph30.us.preheader197:                         ; preds = %middle.block81, %vector.memcheck104, %min.iters.checked84, %.lr.ph30.us.preheader61
  %indvars.iv2529.us.ph = phi i64 [ %indvars.iv2529.us.unr.ph, %vector.memcheck104 ], [ %indvars.iv2529.us.unr.ph, %min.iters.checked84 ], [ %indvars.iv2529.us.unr.ph, %.lr.ph30.us.preheader61 ], [ %ind.end109, %middle.block81 ]
  br label %.lr.ph30.us

min.iters.checked84:                              ; preds = %.lr.ph30.us.preheader61
  %n.mod.vf85 = and i64 %79, 1
  %n.vec86 = sub nsw i64 %79, %n.mod.vf85
  br i1 false, label %.lr.ph30.us.preheader197, label %vector.memcheck104

vector.memcheck104:                               ; preds = %min.iters.checked84
  %scevgep89 = getelementptr double, double* %0, i64 %indvars.iv2529.us.unr.ph
  %80 = sub nsw i64 1997, %indvars.iv2529.us.unr.ph
  %81 = and i64 %80, 1998
  %82 = add nuw nsw i64 %indvars.iv2529.us.unr.ph, %81
  %scevgep92 = getelementptr double, double* %scevgep91, i64 %82
  %scevgep95 = getelementptr double, double* %scevgep94, i64 %indvars.iv2529.us.unr.ph
  %scevgep98 = getelementptr double, double* %scevgep97, i64 %82
  %bound0100 = icmp ult double* %scevgep89, %scevgep98
  %bound1101 = icmp ult double* %scevgep95, %scevgep92
  %memcheck.conflict103 = and i1 %bound0100, %bound1101
  %83 = add nuw nsw i64 %indvars.iv2529.us.unr.ph, 2
  %84 = shl nuw nsw i64 %78, 1
  %85 = add nuw nsw i64 %83, %84
  %86 = shl nuw nsw i64 %n.mod.vf85, 1
  %ind.end109 = sub nsw i64 %85, %86
  br i1 %memcheck.conflict103, label %.lr.ph30.us.preheader197, label %vector.body80.preheader

vector.body80.preheader:                          ; preds = %vector.memcheck104
  br label %vector.body80

vector.body80:                                    ; preds = %vector.body80.preheader, %vector.body80
  %index106 = phi i64 [ %index.next107, %vector.body80 ], [ 0, %vector.body80.preheader ]
  %87 = shl i64 %index106, 1
  %offset.idx111 = or i64 %indvars.iv2529.us.unr.ph, %87
  %88 = add nsw i64 %offset.idx111, -1
  %89 = getelementptr inbounds double, double* %1, i64 %88
  %90 = bitcast double* %89 to <4 x double>*
  %wide.vec115 = load <4 x double>, <4 x double>* %90, align 8, !alias.scope !11
  %strided.vec116 = shufflevector <4 x double> %wide.vec115, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec117 = shufflevector <4 x double> %wide.vec115, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %91 = fadd <2 x double> %strided.vec116, %strided.vec117
  %92 = add nuw nsw i64 %offset.idx111, 1
  %93 = getelementptr inbounds double, double* %1, i64 %92
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec118 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !11
  %strided.vec120 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fadd <2 x double> %91, %strided.vec120
  %97 = fmul <2 x double> %96, <double 3.333300e-01, double 3.333300e-01>
  %98 = bitcast double* %93 to <4 x double>*
  %wide.vec121 = load <4 x double>, <4 x double>* %98, align 8, !alias.scope !11
  %strided.vec123 = shufflevector <4 x double> %wide.vec121, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %99 = fadd <4 x double> %wide.vec118, %wide.vec121
  %100 = shufflevector <4 x double> %99, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %101 = fadd <2 x double> %100, %strided.vec123
  %102 = fmul <2 x double> %101, <double 3.333300e-01, double 3.333300e-01>
  %103 = getelementptr inbounds double, double* %0, i64 %92
  %104 = getelementptr double, double* %103, i64 -1
  %105 = bitcast double* %104 to <4 x double>*
  %interleaved.vec124 = shufflevector <2 x double> %97, <2 x double> %102, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec124, <4 x double>* %105, align 8, !alias.scope !14, !noalias !11
  %index.next107 = add i64 %index106, 2
  %106 = icmp eq i64 %index.next107, %n.vec86
  br i1 %106, label %middle.block81, label %vector.body80, !llvm.loop !16

middle.block81:                                   ; preds = %vector.body80
  %cmp.n110 = icmp eq i64 %n.mod.vf85, 0
  br i1 %cmp.n110, label %._crit_edge.us, label %.lr.ph30.us.preheader197

.preheader27.lr.ph.split:                         ; preds = %.preheader27.lr.ph
  br label %._crit_edge32

.preheader27.us33.preheader:                      ; No predecessors!
  br label %.preheader27.us33

.preheader27.us33:                                ; preds = %.preheader27.us33.preheader
  br label %.prol.loopexit56
                                                  ; No predecessors!
  br label %.prol.loopexit56

.prol.loopexit56:                                 ; preds = %.preheader27.us33, %107
  br label %._crit_edge.us43

.preheader27.us33.new.preheader:                  ; No predecessors!
  br label %.preheader27.us33.new.preheader199

min.iters.checked:                                ; No predecessors!
  br label %.preheader27.us33.new.preheader199

vector.memcheck:                                  ; No predecessors!
  br label %.preheader27.us33.new.preheader199

vector.body.preheader:                            ; No predecessors!
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader
  br label %._crit_edge.us43

.preheader27.us33.new.preheader199:               ; preds = %min.iters.checked, %.preheader27.us33.new.preheader, %vector.memcheck
  br label %.preheader27.us33.new

.preheader27.us33.new:                            ; preds = %.preheader27.us33.new.preheader199
  br label %._crit_edge.us43

._crit_edge.us43:                                 ; preds = %vector.body, %.prol.loopexit56, %.preheader27.us33.new
  br label %._crit_edge32

._crit_edge32.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %.preheader27.lr.ph.split, %._crit_edge.us43, %._crit_edge32.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %11
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %11 ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %11

; <label>:11:                                     ; preds = %9, %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv5
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %11
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
