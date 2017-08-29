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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_jacobi_1d(double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double*, double*) unnamed_addr #0 {
  br i1 true, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %0, i64 2000
  %scevgep5 = getelementptr double, double* %1, i64 2000
  %bound0 = icmp ugt double* %scevgep5, %0
  %bound1 = icmp ugt double* %scevgep, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind7 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next8, %vector.body ]
  %3 = sitofp <2 x i32> %vec.ind7 to <2 x double>
  %4 = fadd <2 x double> %3, <double 2.000000e+00, double 2.000000e+00>
  %5 = fdiv <2 x double> %4, <double 2.000000e+03, double 2.000000e+03>
  %6 = getelementptr inbounds double, double* %0, i64 %index
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> %5, <2 x double>* %7, align 8, !alias.scope !1, !noalias !4
  %8 = fadd <2 x double> %3, <double 3.000000e+00, double 3.000000e+00>
  %9 = fdiv <2 x double> %8, <double 2.000000e+03, double 2.000000e+03>
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next8 = add <2 x i32> %vec.ind7, <i32 2, i32 2>
  %12 = icmp eq i64 %index.next, 2000
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv2.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ 2000, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %scalar.ph ], [ %indvars.iv2.ph, %scalar.ph.preheader ]
  %13 = trunc i64 %indvars.iv2 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %0, i64 %indvars.iv2
  %16 = insertelement <2 x double> undef, double %14, i32 0
  %17 = insertelement <2 x double> %16, double %14, i32 1
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, <double 2.000000e+03, double 2.000000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %15, align 8
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv2
  store double %21, double* %22, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double*, double*) unnamed_addr #0 {
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge10

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge10

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep36 = getelementptr double, double* %0, i64 1999
  %scevgep38 = getelementptr double, double* %1, i64 2000
  %scevgep55 = getelementptr double, double* %1, i64 1
  %scevgep57 = getelementptr double, double* %1, i64 1999
  %scevgep59 = getelementptr double, double* %0, i64 2000
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ugt double* %scevgep36, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  %bound061 = icmp ult double* %scevgep55, %scevgep59
  %bound162 = icmp ugt double* %scevgep57, %0
  %memcheck.conflict64 = and i1 %bound061, %bound162
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge7.us, %._crit_edge.us.preheader
  %3 = phi i32 [ %29, %._crit_edge7.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 false, label %scalar.ph48.preheader, label %min.iters.checked50

scalar.ph48.preheader:                            ; preds = %middle.block47, %vector.memcheck65, %min.iters.checked50, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck65 ], [ 1, %min.iters.checked50 ], [ 1, %._crit_edge.us ], [ 1997, %middle.block47 ]
  br label %scalar.ph48.prol.loopexit.unr-lcssa

scalar.ph48.prol.preheader:                       ; No predecessors!
  br label %scalar.ph48.prol

scalar.ph48.prol:                                 ; preds = %scalar.ph48.prol.preheader
  unreachable

scalar.ph48.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph48.preheader
  br label %scalar.ph48.prol.loopexit

scalar.ph48.prol.loopexit:                        ; preds = %scalar.ph48.prol.loopexit.unr-lcssa
  br i1 false, label %.lr.ph6.us.preheader.loopexit, label %scalar.ph48.preheader.new

scalar.ph48.preheader.new:                        ; preds = %scalar.ph48.prol.loopexit
  br label %scalar.ph48

min.iters.checked50:                              ; preds = %._crit_edge.us
  br i1 false, label %scalar.ph48.preheader, label %vector.memcheck65

vector.memcheck65:                                ; preds = %min.iters.checked50
  br i1 %memcheck.conflict64, label %scalar.ph48.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck65
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.preheader, %vector.body46
  %index67 = phi i64 [ %index.next68, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %offset.idx72 = or i64 %index67, 1
  %4 = add nsw i64 %offset.idx72, -1
  %5 = getelementptr inbounds double, double* %0, i64 %4
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !10
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !10
  %9 = getelementptr inbounds double, double* %0, i64 %offset.idx72
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !10
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !10
  %13 = fadd <2 x double> %wide.load77, %wide.load79
  %14 = fadd <2 x double> %wide.load78, %wide.load80
  %15 = add nuw nsw i64 %offset.idx72, 1
  %16 = getelementptr inbounds double, double* %0, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !10
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !10
  %20 = fadd <2 x double> %13, %wide.load81
  %21 = fadd <2 x double> %14, %wide.load82
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = getelementptr inbounds double, double* %1, i64 %offset.idx72
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %22, <2 x double>* %25, align 8, !alias.scope !13, !noalias !10
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %23, <2 x double>* %27, align 8, !alias.scope !13, !noalias !10
  %index.next68 = add i64 %index67, 4
  %28 = icmp eq i64 %index.next68, 1996
  br i1 %28, label %middle.block47, label %vector.body46, !llvm.loop !15

middle.block47:                                   ; preds = %vector.body46
  br i1 false, label %.lr.ph6.us.preheader, label %scalar.ph48.preheader

._crit_edge7.us.loopexit.unr-lcssa:               ; preds = %.lr.ph6.us
  br label %._crit_edge7.us.loopexit

._crit_edge7.us.loopexit:                         ; preds = %.lr.ph6.us.prol.loopexit, %._crit_edge7.us.loopexit.unr-lcssa
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %middle.block
  %29 = add nuw nsw i32 %3, 1
  %exitcond34 = icmp eq i32 %29, 500
  br i1 %exitcond34, label %._crit_edge10.loopexit, label %._crit_edge.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us, %.lr.ph6.us.preheader83.new
  %indvars.iv29 = phi i64 [ %indvars.iv29.ph, %.lr.ph6.us.preheader83.new ], [ %indvars.iv.next30.1, %.lr.ph6.us ]
  %30 = add nsw i64 %indvars.iv29, -1
  %31 = getelementptr inbounds double, double* %1, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %36 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next30
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %39 = fmul double %38, 3.333300e-01
  %40 = getelementptr inbounds double, double* %0, i64 %indvars.iv29
  store double %39, double* %40, align 8
  %41 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next30
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %46 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next30.1
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = fmul double %48, 3.333300e-01
  %50 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next30
  store double %49, double* %50, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next30.1, 1999
  br i1 %exitcond33.1, label %._crit_edge7.us.loopexit.unr-lcssa, label %.lr.ph6.us, !llvm.loop !16

scalar.ph48:                                      ; preds = %scalar.ph48, %scalar.ph48.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %scalar.ph48.preheader.new ], [ %indvars.iv.next.1, %scalar.ph48 ]
  %51 = add nsw i64 %indvars.iv, -1
  %52 = getelementptr inbounds double, double* %0, i64 %51
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %57 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = fmul double %59, 3.333300e-01
  %61 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %60, double* %61, align 8
  %62 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %67 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.1
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  %70 = fmul double %69, 3.333300e-01
  %71 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %70, double* %71, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %.lr.ph6.us.preheader.loopexit.unr-lcssa, label %scalar.ph48, !llvm.loop !17

.lr.ph6.us.preheader.loopexit.unr-lcssa:          ; preds = %scalar.ph48
  br label %.lr.ph6.us.preheader.loopexit

.lr.ph6.us.preheader.loopexit:                    ; preds = %scalar.ph48.prol.loopexit, %.lr.ph6.us.preheader.loopexit.unr-lcssa
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %middle.block47
  br i1 false, label %.lr.ph6.us.preheader83, label %min.iters.checked

.lr.ph6.us.preheader83:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6.us.preheader
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph6.us.preheader ], [ 1997, %middle.block ]
  br label %.lr.ph6.us.prol.loopexit.unr-lcssa

.lr.ph6.us.prol.preheader:                        ; No predecessors!
  br label %.lr.ph6.us.prol

.lr.ph6.us.prol:                                  ; preds = %.lr.ph6.us.prol.preheader
  unreachable

.lr.ph6.us.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph6.us.preheader83
  br label %.lr.ph6.us.prol.loopexit

.lr.ph6.us.prol.loopexit:                         ; preds = %.lr.ph6.us.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge7.us.loopexit, label %.lr.ph6.us.preheader83.new

.lr.ph6.us.preheader83.new:                       ; preds = %.lr.ph6.us.prol.loopexit
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader
  br i1 false, label %.lr.ph6.us.preheader83, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader83, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds double, double* %1, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !18
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !18
  %77 = getelementptr inbounds double, double* %1, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !18
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !18
  %81 = fadd <2 x double> %wide.load, %wide.load42
  %82 = fadd <2 x double> %wide.load41, %wide.load43
  %83 = add nuw nsw i64 %offset.idx, 1
  %84 = getelementptr inbounds double, double* %1, i64 %83
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !18
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !18
  %88 = fadd <2 x double> %81, %wide.load44
  %89 = fadd <2 x double> %82, %wide.load45
  %90 = fmul <2 x double> %88, <double 3.333300e-01, double 3.333300e-01>
  %91 = fmul <2 x double> %89, <double 3.333300e-01, double 3.333300e-01>
  %92 = getelementptr inbounds double, double* %0, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  store <2 x double> %90, <2 x double>* %93, align 8, !alias.scope !21, !noalias !18
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  store <2 x double> %91, <2 x double>* %95, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %96 = icmp eq i64 %index.next, 1996
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 false, label %._crit_edge7.us, label %.lr.ph6.us.preheader83

._crit_edge10.loopexit:                           ; preds = %._crit_edge7.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge.lr.ph, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %1
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %15, %._crit_edge ]
  %7 = srem i32 %storemerge1, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3.loopexit, label %6

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
