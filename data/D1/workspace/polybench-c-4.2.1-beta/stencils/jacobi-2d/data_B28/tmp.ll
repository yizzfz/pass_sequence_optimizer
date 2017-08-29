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
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.lr.ph, label %._crit_edge1

.preheader.lr.ph:                                 ; preds = %3
  %5 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count4 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %6 = trunc i64 %indvars.iv2 to i32
  %7 = sitofp i32 %6 to double
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %8 ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %7, %11
  %13 = fadd double %12, 2.000000e+00
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  store double %14, double* %15, align 8
  %16 = add nuw nsw i64 %indvars.iv, 3
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fmul double %7, %18
  %20 = fadd double %19, 3.000000e+00
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv2, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, %wide.trip.count4
  br i1 %exitcond5, label %._crit_edge1.loopexit, label %.preheader.us

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader3.lr.ph, label %._crit_edge7

.preheader3.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = icmp sgt i32 %6, 1
  %wide.trip.count10 = zext i32 %6 to i64
  %wide.trip.count = zext i32 %6 to i64
  %wide.trip.count18 = zext i32 %6 to i64
  %wide.trip.count14 = zext i32 %6 to i64
  %9 = add nsw i64 %wide.trip.count14, -1
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  %min.iters.check41 = icmp ult i64 %9, 4
  %n.vec44 = and i64 %9, -4
  %cmp.zero45 = icmp eq i64 %n.vec44, 0
  %ind.end66 = or i64 %n.vec44, 1
  %cmp.n67 = icmp eq i64 %9, %n.vec44
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge6, %.preheader3.lr.ph
  %10 = phi i32 [ 0, %.preheader3.lr.ph ], [ %125, %._crit_edge6 ]
  br i1 %7, label %.preheader1.us.preheader, label %.preheader2

.preheader1.us.preheader:                         ; preds = %.preheader3
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge.us
  %indvar47 = phi i64 [ %indvar.next48, %._crit_edge.us ], [ 0, %.preheader1.us.preheader ]
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge.us ], [ 1, %.preheader1.us.preheader ]
  %11 = add i64 %indvar47, 1
  %scevgep49 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 1
  %scevgep51 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 %wide.trip.count14
  %scevgep53 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar47, i64 1
  %12 = add i64 %indvar47, 2
  %scevgep55 = getelementptr [1300 x double], [1300 x double]* %2, i64 %12, i64 %wide.trip.count14
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %13 = add nsw i64 %indvars.iv8, -1
  br i1 %min.iters.check41, label %scalar.ph40.preheader, label %min.iters.checked42

min.iters.checked42:                              ; preds = %.preheader1.us
  br i1 %cmp.zero45, label %scalar.ph40.preheader, label %vector.memcheck61

vector.memcheck61:                                ; preds = %min.iters.checked42
  %bound057 = icmp ult double* %scevgep49, %scevgep55
  %bound158 = icmp ult double* %scevgep53, %scevgep51
  %memcheck.conflict60 = and i1 %bound057, %bound158
  br i1 %memcheck.conflict60, label %scalar.ph40.preheader, label %vector.body38.preheader

vector.body38.preheader:                          ; preds = %vector.memcheck61
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38.preheader, %vector.body38
  %index63 = phi i64 [ %index.next64, %vector.body38 ], [ 0, %vector.body38.preheader ]
  %offset.idx68 = or i64 %index63, 1
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %offset.idx68
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = add nsw i64 %offset.idx68, -1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %wide.load73, %wide.load75
  %24 = fadd <2 x double> %wide.load74, %wide.load76
  %25 = add nuw nsw i64 %offset.idx68, 1
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %23, %wide.load77
  %31 = fadd <2 x double> %24, %wide.load78
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next9, i64 %offset.idx68
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fadd <2 x double> %30, %wide.load79
  %37 = fadd <2 x double> %31, %wide.load80
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %offset.idx68
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !1
  %42 = fadd <2 x double> %36, %wide.load81
  %43 = fadd <2 x double> %37, %wide.load82
  %44 = fmul <2 x double> %42, <double 2.000000e-01, double 2.000000e-01>
  %45 = fmul <2 x double> %43, <double 2.000000e-01, double 2.000000e-01>
  %46 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv8, i64 %offset.idx68
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> %44, <2 x double>* %47, align 8, !alias.scope !4, !noalias !1
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %45, <2 x double>* %49, align 8, !alias.scope !4, !noalias !1
  %index.next64 = add i64 %index63, 4
  %50 = icmp eq i64 %index.next64, %n.vec44
  br i1 %50, label %middle.block39, label %vector.body38, !llvm.loop !6

middle.block39:                                   ; preds = %vector.body38
  br i1 %cmp.n67, label %._crit_edge.us, label %scalar.ph40.preheader

scalar.ph40.preheader:                            ; preds = %middle.block39, %vector.memcheck61, %min.iters.checked42, %.preheader1.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck61 ], [ 1, %min.iters.checked42 ], [ 1, %.preheader1.us ], [ %ind.end66, %middle.block39 ]
  br label %scalar.ph40

scalar.ph40:                                      ; preds = %scalar.ph40.preheader, %scalar.ph40
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph40 ], [ %indvars.iv.ph, %scalar.ph40.preheader ]
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = add nsw i64 %indvars.iv, -1
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %52, %55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv.next
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next9, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %63 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = fmul double %65, 2.000000e-01
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  store double %66, double* %67, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph40, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph40
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block39
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  %indvar.next48 = add i64 %indvar47, 1
  br i1 %exitcond11, label %.preheader2.loopexit, label %.preheader1.us

.preheader2.loopexit:                             ; preds = %._crit_edge.us
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.preheader3
  br i1 %8, label %.preheader.us.preheader, label %._crit_edge6

.preheader.us.preheader:                          ; preds = %.preheader2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge5.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge5.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge5.us ], [ 1, %.preheader.us.preheader ]
  %68 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %68, i64 1
  %scevgep22 = getelementptr [1300 x double], [1300 x double]* %2, i64 %68, i64 %wide.trip.count14
  %scevgep24 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %69 = add i64 %indvar, 2
  %scevgep26 = getelementptr [1300 x double], [1300 x double]* %3, i64 %69, i64 %wide.trip.count14
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %70 = add nsw i64 %indvars.iv16, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep26
  %bound1 = icmp ult double* %scevgep24, %scevgep22
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %71 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %offset.idx
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = add nsw i64 %offset.idx, -1
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %wide.load, %wide.load30
  %81 = fadd <2 x double> %wide.load29, %wide.load31
  %82 = add nuw nsw i64 %offset.idx, 1
  %83 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %82
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fadd <2 x double> %80, %wide.load32
  %88 = fadd <2 x double> %81, %wide.load33
  %89 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next17, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fadd <2 x double> %87, %wide.load34
  %94 = fadd <2 x double> %88, %wide.load35
  %95 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %70, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fadd <2 x double> %93, %wide.load36
  %100 = fadd <2 x double> %94, %wide.load37
  %101 = fmul <2 x double> %99, <double 2.000000e-01, double 2.000000e-01>
  %102 = fmul <2 x double> %100, <double 2.000000e-01, double 2.000000e-01>
  %103 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %104 = bitcast double* %103 to <2 x double>*
  store <2 x double> %101, <2 x double>* %104, align 8, !alias.scope !13, !noalias !10
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x double>*
  store <2 x double> %102, <2 x double>* %106, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %107 = icmp eq i64 %index.next, %n.vec
  br i1 %107, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge5.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %scalar.ph ], [ %indvars.iv12.ph, %scalar.ph.preheader ]
  %108 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv12
  %109 = load double, double* %108, align 8
  %110 = add nsw i64 %indvars.iv12, -1
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %110
  %112 = load double, double* %111, align 8
  %113 = fadd double %109, %112
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %114 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv.next13
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next17, i64 %indvars.iv12
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  %120 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %70, i64 %indvars.iv12
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = fmul double %122, 2.000000e-01
  %124 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv12
  store double %123, double* %124, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  br i1 %exitcond15, label %._crit_edge5.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge5.us.loopexit:                         ; preds = %scalar.ph
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond19, label %._crit_edge6.loopexit, label %.preheader.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader2
  %125 = add nuw nsw i32 %10, 1
  %exitcond20 = icmp eq i32 %125, %0
  br i1 %exitcond20, label %._crit_edge7.loopexit, label %.preheader3

._crit_edge7.loopexit:                            ; preds = %._crit_edge6
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %4
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge1

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count4 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv2 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next3, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv2, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
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
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, %wide.trip.count4
  br i1 %exitcond5, label %._crit_edge1.loopexit, label %.preheader.us

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
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
