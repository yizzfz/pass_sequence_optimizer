; ModuleID = 'B.ll'
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
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %5)
  br label %12

; <label>:12:                                     ; preds = %11, %8, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge8

.preheader.preheader:                             ; preds = %3
  %wide.trip.count = zext i32 %0 to i64
  %6 = sitofp i32 %0 to double
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %7 = trunc i64 %indvars.iv26 to i32
  %8 = sitofp i32 %7 to double
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %9 ]
  %10 = add nuw nsw i64 %indvars.iv5, 2
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %8, %12
  %14 = fadd double %13, 2.000000e+00
  %15 = fdiv double %14, %6
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  store double %15, double* %16, align 8
  %17 = add nuw nsw i64 %indvars.iv5, 3
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = fmul double %8, %19
  %21 = fadd double %20, 3.000000e+00
  %22 = fdiv double %21, %6
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv5
  store double %22, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %9

._crit_edge:                                      ; preds = %9
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, %4
  br i1 %exitcond10, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader14.lr.ph, label %._crit_edge27

.preheader14.lr.ph:                               ; preds = %4
  %7 = sext i32 %5 to i64
  %wide.trip.count = zext i32 %5 to i64
  %8 = icmp sgt i32 %5, 1
  %9 = add nsw i64 %wide.trip.count, -1
  %min.iters.check55 = icmp ult i64 %9, 4
  %n.vec58 = and i64 %9, -4
  %cmp.zero59 = icmp eq i64 %n.vec58, 0
  %ind.end80 = or i64 %n.vec58, 1
  %cmp.n81 = icmp eq i64 %9, %n.vec58
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader14

.preheader14:                                     ; preds = %._crit_edge25, %.preheader14.lr.ph
  %.0326 = phi i32 [ 0, %.preheader14.lr.ph ], [ %126, %._crit_edge25 ]
  br i1 %8, label %.preheader12.preheader, label %._crit_edge25

.preheader12.preheader:                           ; preds = %.preheader14
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge, %.preheader12.preheader
  %indvar61 = phi i64 [ %indvar.next62, %._crit_edge ], [ 0, %.preheader12.preheader ]
  %indvars.iv417 = phi i64 [ %12, %._crit_edge ], [ 1, %.preheader12.preheader ]
  %10 = add i64 %indvar61, 1
  %scevgep63 = getelementptr [1300 x double], [1300 x double]* %3, i64 %10, i64 1
  %scevgep65 = getelementptr [1300 x double], [1300 x double]* %3, i64 %10, i64 %wide.trip.count
  %scevgep67 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar61, i64 1
  %11 = add i64 %indvar61, 2
  %scevgep69 = getelementptr [1300 x double], [1300 x double]* %2, i64 %11, i64 %wide.trip.count
  %12 = add nuw nsw i64 %indvars.iv417, 1
  %13 = add nsw i64 %indvars.iv417, -1
  br i1 %min.iters.check55, label %scalar.ph54.preheader, label %min.iters.checked56

min.iters.checked56:                              ; preds = %.preheader12
  br i1 %cmp.zero59, label %scalar.ph54.preheader, label %vector.memcheck75

vector.memcheck75:                                ; preds = %min.iters.checked56
  %bound071 = icmp ult double* %scevgep63, %scevgep69
  %bound172 = icmp ult double* %scevgep67, %scevgep65
  %memcheck.conflict74 = and i1 %bound071, %bound172
  br i1 %memcheck.conflict74, label %scalar.ph54.preheader, label %vector.body52.preheader

vector.body52.preheader:                          ; preds = %vector.memcheck75
  br label %vector.body52

vector.body52:                                    ; preds = %vector.body52, %vector.body52.preheader
  %index77 = phi i64 [ %index.next78, %vector.body52 ], [ 0, %vector.body52.preheader ]
  %offset.idx82 = or i64 %index77, 1
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv417, i64 %offset.idx82
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = add nsw i64 %offset.idx82, -1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv417, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %wide.load87, %wide.load89
  %24 = fadd <2 x double> %wide.load88, %wide.load90
  %25 = add nuw nsw i64 %offset.idx82, 1
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv417, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %23, %wide.load91
  %31 = fadd <2 x double> %24, %wide.load92
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %12, i64 %offset.idx82
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fadd <2 x double> %30, %wide.load93
  %37 = fadd <2 x double> %31, %wide.load94
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %offset.idx82
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !1
  %42 = fadd <2 x double> %36, %wide.load95
  %43 = fadd <2 x double> %37, %wide.load96
  %44 = fmul <2 x double> %42, <double 2.000000e-01, double 2.000000e-01>
  %45 = fmul <2 x double> %43, <double 2.000000e-01, double 2.000000e-01>
  %46 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv417, i64 %offset.idx82
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> %44, <2 x double>* %47, align 8, !alias.scope !4, !noalias !1
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %45, <2 x double>* %49, align 8, !alias.scope !4, !noalias !1
  %index.next78 = add i64 %index77, 4
  %50 = icmp eq i64 %index.next78, %n.vec58
  br i1 %50, label %middle.block53, label %vector.body52, !llvm.loop !6

middle.block53:                                   ; preds = %vector.body52
  br i1 %cmp.n81, label %._crit_edge, label %scalar.ph54.preheader

scalar.ph54.preheader:                            ; preds = %middle.block53, %vector.memcheck75, %min.iters.checked56, %.preheader12
  %indvars.iv16.ph = phi i64 [ 1, %vector.memcheck75 ], [ 1, %min.iters.checked56 ], [ 1, %.preheader12 ], [ %ind.end80, %middle.block53 ]
  br label %scalar.ph54

scalar.ph54:                                      ; preds = %scalar.ph54, %scalar.ph54.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next, %scalar.ph54 ], [ %indvars.iv16.ph, %scalar.ph54.preheader ]
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv417, i64 %indvars.iv16
  %52 = load double, double* %51, align 8
  %53 = add nsw i64 %indvars.iv16, -1
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv417, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %52, %55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv16, 1
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv417, i64 %indvars.iv.next
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %12, i64 %indvars.iv16
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %63 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %indvars.iv16
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = fmul double %65, 2.000000e-01
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv417, i64 %indvars.iv16
  store double %66, double* %67, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph54, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph54
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block53
  %exitcond30 = icmp eq i64 %12, %7
  %indvar.next62 = add i64 %indvar61, 1
  br i1 %exitcond30, label %.preheader.preheader, label %.preheader12

.preheader.preheader:                             ; preds = %._crit_edge
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge22, %.preheader.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge22 ], [ 0, %.preheader.preheader ]
  %indvars.iv1023 = phi i64 [ %70, %._crit_edge22 ], [ 1, %.preheader.preheader ]
  %68 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %68, i64 1
  %scevgep36 = getelementptr [1300 x double], [1300 x double]* %2, i64 %68, i64 %wide.trip.count
  %scevgep38 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %69 = add i64 %indvar, 2
  %scevgep40 = getelementptr [1300 x double], [1300 x double]* %3, i64 %69, i64 %wide.trip.count
  %70 = add nuw nsw i64 %indvars.iv1023, 1
  %71 = add nsw i64 %indvars.iv1023, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep40
  %bound1 = icmp ult double* %scevgep38, %scevgep36
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %72 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1023, i64 %offset.idx
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = add nsw i64 %offset.idx, -1
  %77 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1023, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fadd <2 x double> %wide.load, %wide.load44
  %82 = fadd <2 x double> %wide.load43, %wide.load45
  %83 = add nuw nsw i64 %offset.idx, 1
  %84 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1023, i64 %83
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = fadd <2 x double> %81, %wide.load46
  %89 = fadd <2 x double> %82, %wide.load47
  %90 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %70, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fadd <2 x double> %88, %wide.load48
  %95 = fadd <2 x double> %89, %wide.load49
  %96 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %71, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fadd <2 x double> %94, %wide.load50
  %101 = fadd <2 x double> %95, %wide.load51
  %102 = fmul <2 x double> %100, <double 2.000000e-01, double 2.000000e-01>
  %103 = fmul <2 x double> %101, <double 2.000000e-01, double 2.000000e-01>
  %104 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv1023, i64 %offset.idx
  %105 = bitcast double* %104 to <2 x double>*
  store <2 x double> %102, <2 x double>* %105, align 8, !alias.scope !13, !noalias !10
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  store <2 x double> %103, <2 x double>* %107, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %108 = icmp eq i64 %index.next, %n.vec
  br i1 %108, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge22, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv620.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv620 = phi i64 [ %indvars.iv.next7, %scalar.ph ], [ %indvars.iv620.ph, %scalar.ph.preheader ]
  %109 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1023, i64 %indvars.iv620
  %110 = load double, double* %109, align 8
  %111 = add nsw i64 %indvars.iv620, -1
  %112 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1023, i64 %111
  %113 = load double, double* %112, align 8
  %114 = fadd double %110, %113
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv620, 1
  %115 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1023, i64 %indvars.iv.next7
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  %118 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %70, i64 %indvars.iv620
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  %121 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %71, i64 %indvars.iv620
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = fmul double %123, 2.000000e-01
  %125 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv1023, i64 %indvars.iv620
  store double %124, double* %125, align 8
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count
  br i1 %exitcond9, label %._crit_edge22.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge22.loopexit:                           ; preds = %scalar.ph
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %middle.block
  %exitcond32 = icmp eq i64 %70, %7
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond32, label %._crit_edge25.loopexit, label %.preheader

._crit_edge25.loopexit:                           ; preds = %._crit_edge22
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.preheader14
  %126 = add nuw nsw i32 %.0326, 1
  %exitcond34 = icmp eq i32 %126, %0
  br i1 %exitcond34, label %._crit_edge27.loopexit, label %.preheader14

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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.preheader, label %._crit_edge8

.preheader.preheader:                             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %9 = mul nsw i64 %indvars.iv26, %7
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv5, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %17
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond10, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
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
