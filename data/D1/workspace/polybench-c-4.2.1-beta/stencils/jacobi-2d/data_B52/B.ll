; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [1300 x double]*
  %8 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %7, [1300 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [1300 x double]*
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader.us.preheader, label %._crit_edge19

.preheader.us.preheader:                          ; preds = %3
  %wide.trip.count = zext i32 %0 to i64
  %6 = sitofp i32 %0 to double
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv1317.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv1317.us to i32
  %8 = sitofp i32 %7 to double
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader.us
  %indvars.iv16.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %9 ]
  %10 = add nuw nsw i64 %indvars.iv16.us, 2
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %8, %12
  %14 = fadd double %13, 2.000000e+00
  %15 = fdiv double %14, %6
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv1317.us, i64 %indvars.iv16.us
  store double %15, double* %16, align 8
  %17 = add nuw nsw i64 %indvars.iv16.us, 3
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = fmul double %8, %19
  %21 = fadd double %20, 3.000000e+00
  %22 = fdiv double %21, %6
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv1317.us, i64 %indvars.iv16.us
  store double %22, double* %23, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv16.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %9
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1317.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next14.us, %4
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.preheader.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader51.lr.ph, label %._crit_edge72

.preheader51.lr.ph:                               ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = sext i32 %7 to i64
  %wide.trip.count = zext i32 %5 to i64
  %exitcond60 = icmp eq i32 %5, 1
  %9 = icmp sgt i32 %5, 1
  %wide.trip.count56 = zext i32 %5 to i64
  %10 = add nsw i64 %wide.trip.count56, -1
  %.not = icmp slt i32 %1, 3
  %brmerge = or i1 %.not, %exitcond60
  %min.iters.check = icmp ult i64 %10, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %10, %n.vec
  %min.iters.check99 = icmp ult i64 %10, 4
  %n.vec102 = and i64 %10, -4
  %cmp.zero103 = icmp eq i64 %n.vec102, 0
  %ind.end124 = or i64 %n.vec102, 1
  %cmp.n125 = icmp eq i64 %10, %n.vec102
  br label %.preheader51

.preheader51:                                     ; preds = %._crit_edge70, %.preheader51.lr.ph
  %storemerge71 = phi i32 [ 0, %.preheader51.lr.ph ], [ %127, %._crit_edge70 ]
  br i1 %brmerge, label %.preheader50, label %.preheader49.us.preheader

.preheader49.us.preheader:                        ; preds = %.preheader51
  br label %.preheader49.us

.preheader49.us:                                  ; preds = %.preheader49.us.preheader, %._crit_edge.us
  %indvar105 = phi i64 [ %indvar.next106, %._crit_edge.us ], [ 0, %.preheader49.us.preheader ]
  %indvars.iv5262.us = phi i64 [ %indvars.iv.next53.us, %._crit_edge.us ], [ 1, %.preheader49.us.preheader ]
  %11 = add i64 %indvar105, 1
  %scevgep107 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 1
  %scevgep109 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 %wide.trip.count56
  %scevgep111 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar105, i64 1
  %12 = add i64 %indvar105, 2
  %scevgep113 = getelementptr [1300 x double], [1300 x double]* %2, i64 %12, i64 %wide.trip.count56
  %13 = add nuw nsw i64 %indvars.iv5262.us, 1
  %14 = add nsw i64 %indvars.iv5262.us, -1
  br i1 %min.iters.check99, label %scalar.ph98.preheader, label %min.iters.checked100

min.iters.checked100:                             ; preds = %.preheader49.us
  br i1 %cmp.zero103, label %scalar.ph98.preheader, label %vector.memcheck119

vector.memcheck119:                               ; preds = %min.iters.checked100
  %bound0115 = icmp ult double* %scevgep107, %scevgep113
  %bound1116 = icmp ult double* %scevgep111, %scevgep109
  %memcheck.conflict118 = and i1 %bound0115, %bound1116
  br i1 %memcheck.conflict118, label %scalar.ph98.preheader, label %vector.body96.preheader

vector.body96.preheader:                          ; preds = %vector.memcheck119
  br label %vector.body96

vector.body96:                                    ; preds = %vector.body96.preheader, %vector.body96
  %index121 = phi i64 [ %index.next122, %vector.body96 ], [ 0, %vector.body96.preheader ]
  %offset.idx126 = or i64 %index121, 1
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5262.us, i64 %offset.idx126
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = add nsw i64 %offset.idx126, -1
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5262.us, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %wide.load131, %wide.load133
  %25 = fadd <2 x double> %wide.load132, %wide.load134
  %26 = add nuw nsw i64 %offset.idx126, 1
  %27 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5262.us, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %24, %wide.load135
  %32 = fadd <2 x double> %25, %wide.load136
  %33 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %offset.idx126
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fadd <2 x double> %31, %wide.load137
  %38 = fadd <2 x double> %32, %wide.load138
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %14, i64 %offset.idx126
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !1
  %43 = fadd <2 x double> %37, %wide.load139
  %44 = fadd <2 x double> %38, %wide.load140
  %45 = fmul <2 x double> %43, <double 2.000000e-01, double 2.000000e-01>
  %46 = fmul <2 x double> %44, <double 2.000000e-01, double 2.000000e-01>
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5262.us, i64 %offset.idx126
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %45, <2 x double>* %48, align 8, !alias.scope !4, !noalias !1
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %46, <2 x double>* %50, align 8, !alias.scope !4, !noalias !1
  %index.next122 = add i64 %index121, 4
  %51 = icmp eq i64 %index.next122, %n.vec102
  br i1 %51, label %middle.block97, label %vector.body96, !llvm.loop !6

middle.block97:                                   ; preds = %vector.body96
  br i1 %cmp.n125, label %._crit_edge.us, label %scalar.ph98.preheader

scalar.ph98.preheader:                            ; preds = %middle.block97, %vector.memcheck119, %min.iters.checked100, %.preheader49.us
  %indvars.iv61.us.ph = phi i64 [ 1, %vector.memcheck119 ], [ 1, %min.iters.checked100 ], [ 1, %.preheader49.us ], [ %ind.end124, %middle.block97 ]
  br label %scalar.ph98

scalar.ph98:                                      ; preds = %scalar.ph98.preheader, %scalar.ph98
  %indvars.iv61.us = phi i64 [ %indvars.iv.next.us, %scalar.ph98 ], [ %indvars.iv61.us.ph, %scalar.ph98.preheader ]
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5262.us, i64 %indvars.iv61.us
  %53 = load double, double* %52, align 8
  %54 = add nsw i64 %indvars.iv61.us, -1
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5262.us, i64 %54
  %56 = load double, double* %55, align 8
  %57 = fadd double %53, %56
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv61.us, 1
  %58 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5262.us, i64 %indvars.iv.next.us
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %indvars.iv61.us
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %14, i64 %indvars.iv61.us
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 2.000000e-01
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5262.us, i64 %indvars.iv61.us
  store double %67, double* %68, align 8
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us.loopexit, label %scalar.ph98, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph98
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block97
  %indvars.iv.next53.us = add nuw nsw i64 %indvars.iv5262.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next53.us, %8
  %indvar.next106 = add i64 %indvar105, 1
  br i1 %exitcond, label %.preheader50.loopexit, label %.preheader49.us

.preheader50.loopexit:                            ; preds = %._crit_edge.us
  br label %.preheader50

.preheader50:                                     ; preds = %.preheader50.loopexit, %.preheader51
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge70

.preheader.us.preheader:                          ; preds = %.preheader50
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge67.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge67.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv5868.us = phi i64 [ %indvars.iv.next59.us, %._crit_edge67.us ], [ 1, %.preheader.us.preheader ]
  %69 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %69, i64 1
  %scevgep80 = getelementptr [1300 x double], [1300 x double]* %2, i64 %69, i64 %wide.trip.count56
  %scevgep82 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %70 = add i64 %indvar, 2
  %scevgep84 = getelementptr [1300 x double], [1300 x double]* %3, i64 %70, i64 %wide.trip.count56
  %71 = add nuw nsw i64 %indvars.iv5868.us, 1
  %72 = add nsw i64 %indvars.iv5868.us, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep84
  %bound1 = icmp ult double* %scevgep82, %scevgep80
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %73 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5868.us, i64 %offset.idx
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = add nsw i64 %offset.idx, -1
  %78 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5868.us, i64 %77
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fadd <2 x double> %wide.load, %wide.load88
  %83 = fadd <2 x double> %wide.load87, %wide.load89
  %84 = add nuw nsw i64 %offset.idx, 1
  %85 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5868.us, i64 %84
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %82, %wide.load90
  %90 = fadd <2 x double> %83, %wide.load91
  %91 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %71, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %89, %wide.load92
  %96 = fadd <2 x double> %90, %wide.load93
  %97 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %72, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fadd <2 x double> %95, %wide.load94
  %102 = fadd <2 x double> %96, %wide.load95
  %103 = fmul <2 x double> %101, <double 2.000000e-01, double 2.000000e-01>
  %104 = fmul <2 x double> %102, <double 2.000000e-01, double 2.000000e-01>
  %105 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5868.us, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  store <2 x double> %103, <2 x double>* %106, align 8, !alias.scope !13, !noalias !10
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x double>*
  store <2 x double> %104, <2 x double>* %108, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %109 = icmp eq i64 %index.next, %n.vec
  br i1 %109, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge67.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv5465.us.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv5465.us = phi i64 [ %indvars.iv.next55.us, %scalar.ph ], [ %indvars.iv5465.us.ph, %scalar.ph.preheader ]
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5868.us, i64 %indvars.iv5465.us
  %111 = load double, double* %110, align 8
  %112 = add nsw i64 %indvars.iv5465.us, -1
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5868.us, i64 %112
  %114 = load double, double* %113, align 8
  %115 = fadd double %111, %114
  %indvars.iv.next55.us = add nuw nsw i64 %indvars.iv5465.us, 1
  %116 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv5868.us, i64 %indvars.iv.next55.us
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  %119 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %71, i64 %indvars.iv5465.us
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %72, i64 %indvars.iv5465.us
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = fmul double %124, 2.000000e-01
  %126 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5868.us, i64 %indvars.iv5465.us
  store double %125, double* %126, align 8
  %exitcond57.us = icmp eq i64 %indvars.iv.next55.us, %wide.trip.count56
  br i1 %exitcond57.us, label %._crit_edge67.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge67.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge67.us

._crit_edge67.us:                                 ; preds = %._crit_edge67.us.loopexit, %middle.block
  %indvars.iv.next59.us = add nuw nsw i64 %indvars.iv5868.us, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next59.us, %8
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond76, label %._crit_edge70.loopexit, label %.preheader.us

._crit_edge70.loopexit:                           ; preds = %._crit_edge67.us
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %.preheader50
  %127 = add nuw nsw i32 %storemerge71, 1
  %exitcond78 = icmp eq i32 %127, %0
  br i1 %exitcond78, label %._crit_edge72.loopexit, label %.preheader51

._crit_edge72.loopexit:                           ; preds = %._crit_edge70
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv913.us = phi i64 [ %indvars.iv.next10.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %9 = mul nsw i64 %indvars.iv913.us, %7
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %17 ]
  %11 = add nsw i64 %indvars.iv12.us, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv913.us, i64 %indvars.iv12.us
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv913.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next10.us, %7
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
