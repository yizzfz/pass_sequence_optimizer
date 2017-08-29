; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %5, [1300 x double]* %6)
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
  %12 = bitcast i8* %3 to [1300 x double]*
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader.us.preheader, label %._crit_edge8

.preheader.us.preheader:                          ; preds = %3
  %wide.trip.count = zext i32 %0 to i64
  %6 = sitofp i32 %0 to double
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv26.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv26.us to i32
  %8 = sitofp i32 %7 to double
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %9 ]
  %10 = add nuw nsw i64 %indvars.iv5.us, 2
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %8, %12
  %14 = fadd double %13, 2.000000e+00
  %15 = fdiv double %14, %6
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  store double %15, double* %16, align 8
  %17 = add nuw nsw i64 %indvars.iv5.us, 3
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = fmul double %8, %19
  %21 = fadd double %20, 3.000000e+00
  %22 = fdiv double %21, %6
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  store double %22, double* %23, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %9
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, %4
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader6.lr.ph, label %._crit_edge27

.preheader6.lr.ph:                                ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = sext i32 %7 to i64
  %wide.trip.count = zext i32 %5 to i64
  %wide.trip.count11 = zext i32 %5 to i64
  %9 = add nsw i64 %wide.trip.count11, -1
  %10 = icmp eq i32 %5, 1
  %.not = icmp slt i32 %1, 3
  %brmerge = or i1 %.not, %10
  %11 = icmp sgt i32 %5, 1
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  %min.iters.check54 = icmp ult i64 %9, 4
  %n.vec57 = and i64 %9, -4
  %cmp.zero58 = icmp eq i64 %n.vec57, 0
  %ind.end79 = or i64 %n.vec57, 1
  %cmp.n80 = icmp eq i64 %9, %n.vec57
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge25, %.preheader6.lr.ph
  %.0326 = phi i32 [ 0, %.preheader6.lr.ph ], [ %128, %._crit_edge25 ]
  br i1 %brmerge, label %.preheader5, label %.preheader4.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge.us
  %indvar60 = phi i64 [ %indvar.next61, %._crit_edge.us ], [ 0, %.preheader4.us.preheader ]
  %indvars.iv717.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge.us ], [ 1, %.preheader4.us.preheader ]
  %12 = add i64 %indvar60, 1
  %scevgep62 = getelementptr [1300 x double], [1300 x double]* %3, i64 %12, i64 1
  %scevgep64 = getelementptr [1300 x double], [1300 x double]* %3, i64 %12, i64 %wide.trip.count11
  %scevgep66 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar60, i64 1
  %13 = add i64 %indvar60, 2
  %scevgep68 = getelementptr [1300 x double], [1300 x double]* %2, i64 %13, i64 %wide.trip.count11
  %14 = add nuw nsw i64 %indvars.iv717.us, 1
  %15 = add nsw i64 %indvars.iv717.us, -1
  br i1 %min.iters.check54, label %scalar.ph53.preheader, label %min.iters.checked55

min.iters.checked55:                              ; preds = %.preheader4.us
  br i1 %cmp.zero58, label %scalar.ph53.preheader, label %vector.memcheck74

vector.memcheck74:                                ; preds = %min.iters.checked55
  %bound070 = icmp ult double* %scevgep62, %scevgep68
  %bound171 = icmp ult double* %scevgep66, %scevgep64
  %memcheck.conflict73 = and i1 %bound070, %bound171
  br i1 %memcheck.conflict73, label %scalar.ph53.preheader, label %vector.body51.preheader

vector.body51.preheader:                          ; preds = %vector.memcheck74
  br label %vector.body51

vector.body51:                                    ; preds = %vector.body51.preheader, %vector.body51
  %index76 = phi i64 [ %index.next77, %vector.body51 ], [ 0, %vector.body51.preheader ]
  %offset.idx81 = or i64 %index76, 1
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv717.us, i64 %offset.idx81
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = add nsw i64 %offset.idx81, -1
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv717.us, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %wide.load86, %wide.load88
  %26 = fadd <2 x double> %wide.load87, %wide.load89
  %27 = add nuw nsw i64 %offset.idx81, 1
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv717.us, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %25, %wide.load90
  %33 = fadd <2 x double> %26, %wide.load91
  %34 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %14, i64 %offset.idx81
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !1
  %38 = fadd <2 x double> %32, %wide.load92
  %39 = fadd <2 x double> %33, %wide.load93
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %15, i64 %offset.idx81
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1
  %44 = fadd <2 x double> %38, %wide.load94
  %45 = fadd <2 x double> %39, %wide.load95
  %46 = fmul <2 x double> %44, <double 2.000000e-01, double 2.000000e-01>
  %47 = fmul <2 x double> %45, <double 2.000000e-01, double 2.000000e-01>
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv717.us, i64 %offset.idx81
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %46, <2 x double>* %49, align 8, !alias.scope !4, !noalias !1
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> %47, <2 x double>* %51, align 8, !alias.scope !4, !noalias !1
  %index.next77 = add i64 %index76, 4
  %52 = icmp eq i64 %index.next77, %n.vec57
  br i1 %52, label %middle.block52, label %vector.body51, !llvm.loop !6

middle.block52:                                   ; preds = %vector.body51
  br i1 %cmp.n80, label %._crit_edge.us, label %scalar.ph53.preheader

scalar.ph53.preheader:                            ; preds = %middle.block52, %vector.memcheck74, %min.iters.checked55, %.preheader4.us
  %indvars.iv16.us.ph = phi i64 [ 1, %vector.memcheck74 ], [ 1, %min.iters.checked55 ], [ 1, %.preheader4.us ], [ %ind.end79, %middle.block52 ]
  br label %scalar.ph53

scalar.ph53:                                      ; preds = %scalar.ph53.preheader, %scalar.ph53
  %indvars.iv16.us = phi i64 [ %indvars.iv.next.us, %scalar.ph53 ], [ %indvars.iv16.us.ph, %scalar.ph53.preheader ]
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv717.us, i64 %indvars.iv16.us
  %54 = load double, double* %53, align 8
  %55 = add nsw i64 %indvars.iv16.us, -1
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv717.us, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fadd double %54, %57
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv16.us, 1
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv717.us, i64 %indvars.iv.next.us
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %14, i64 %indvars.iv16.us
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %15, i64 %indvars.iv16.us
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = fmul double %67, 2.000000e-01
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv717.us, i64 %indvars.iv16.us
  store double %68, double* %69, align 8
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us.loopexit, label %scalar.ph53, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph53
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block52
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv717.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next8.us, %8
  %indvar.next61 = add i64 %indvar60, 1
  br i1 %exitcond, label %.preheader5.loopexit, label %.preheader4.us

.preheader5.loopexit:                             ; preds = %._crit_edge.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader6
  br i1 %11, label %.preheader.us.preheader, label %._crit_edge25

.preheader.us.preheader:                          ; preds = %.preheader5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge22.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge22.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv1323.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge22.us ], [ 1, %.preheader.us.preheader ]
  %70 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %70, i64 1
  %scevgep35 = getelementptr [1300 x double], [1300 x double]* %2, i64 %70, i64 %wide.trip.count11
  %scevgep37 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %71 = add i64 %indvar, 2
  %scevgep39 = getelementptr [1300 x double], [1300 x double]* %3, i64 %71, i64 %wide.trip.count11
  %72 = add nuw nsw i64 %indvars.iv1323.us, 1
  %73 = add nsw i64 %indvars.iv1323.us, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ult double* %scevgep37, %scevgep35
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1323.us, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = add nsw i64 %offset.idx, -1
  %79 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1323.us, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fadd <2 x double> %wide.load, %wide.load43
  %84 = fadd <2 x double> %wide.load42, %wide.load44
  %85 = add nuw nsw i64 %offset.idx, 1
  %86 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1323.us, i64 %85
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %83, %wide.load45
  %91 = fadd <2 x double> %84, %wide.load46
  %92 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %72, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fadd <2 x double> %90, %wide.load47
  %97 = fadd <2 x double> %91, %wide.load48
  %98 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %73, i64 %offset.idx
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %96, %wide.load49
  %103 = fadd <2 x double> %97, %wide.load50
  %104 = fmul <2 x double> %102, <double 2.000000e-01, double 2.000000e-01>
  %105 = fmul <2 x double> %103, <double 2.000000e-01, double 2.000000e-01>
  %106 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv1323.us, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  store <2 x double> %104, <2 x double>* %107, align 8, !alias.scope !13, !noalias !10
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  store <2 x double> %105, <2 x double>* %109, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %110 = icmp eq i64 %index.next, %n.vec
  br i1 %110, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge22.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv920.us.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv920.us = phi i64 [ %indvars.iv.next10.us, %scalar.ph ], [ %indvars.iv920.us.ph, %scalar.ph.preheader ]
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1323.us, i64 %indvars.iv920.us
  %112 = load double, double* %111, align 8
  %113 = add nsw i64 %indvars.iv920.us, -1
  %114 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1323.us, i64 %113
  %115 = load double, double* %114, align 8
  %116 = fadd double %112, %115
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv920.us, 1
  %117 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1323.us, i64 %indvars.iv.next10.us
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  %120 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %72, i64 %indvars.iv920.us
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %73, i64 %indvars.iv920.us
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  %126 = fmul double %125, 2.000000e-01
  %127 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv1323.us, i64 %indvars.iv920.us
  store double %126, double* %127, align 8
  %exitcond12.us = icmp eq i64 %indvars.iv.next10.us, %wide.trip.count11
  br i1 %exitcond12.us, label %._crit_edge22.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge22.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %middle.block
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1323.us, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next14.us, %8
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond31, label %._crit_edge25.loopexit, label %.preheader.us

._crit_edge25.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.preheader5
  %128 = add nuw nsw i32 %.0326, 1
  %exitcond33 = icmp eq i32 %128, %0
  br i1 %exitcond33, label %._crit_edge27.loopexit, label %.preheader6

._crit_edge27.loopexit:                           ; preds = %._crit_edge25
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.us.preheader, label %._crit_edge8

.preheader.us.preheader:                          ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv26.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %9 = mul nsw i64 %indvars.iv26.us, %7
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %17 ]
  %11 = add nsw i64 %indvars.iv5.us, %9
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
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, %7
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
