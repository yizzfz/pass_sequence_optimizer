; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %7)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %21

.preheader3.lr.ph:                                ; preds = %3
  %5 = zext i32 %0 to i64
  %6 = sext i32 %0 to i64
  br i1 true, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %7 = sitofp i32 %0 to double
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv36 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 true, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %8 = trunc i64 %indvars.iv36 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %9 = icmp slt i64 %indvars.iv.next37, %6
  br i1 %9, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %10 = trunc i64 %indvars.iv32 to i32
  br label %11

._crit_edge.us.us:                                ; preds = %11
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, %5
  br i1 %exitcond, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:11:                                     ; preds = %11, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %.preheader.us.us ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = sub i32 %0, %12
  %14 = add i32 %13, %8
  %15 = add i32 %14, %10
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, %7
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %18, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next, %5
  br i1 %exitcond39, label %._crit_edge.us.us, label %11

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  br label %21

; <label>:21:                                     ; preds = %._crit_edge10, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %5 = sext i32 %0 to i64
  %6 = add nsw i64 %5, -1
  %7 = zext i32 %4 to i64
  %8 = add nsw i64 %7, -1
  %9 = icmp sgt i64 %6, 2
  %smax = select i1 %9, i64 %6, i64 2
  %10 = add nsw i64 %smax, -1
  %11 = icmp sgt i32 %4, 1
  %min.iters.check19 = icmp ult i64 %10, 2
  %n.vec22 = and i64 %10, -2
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  %ind.end47 = or i64 %10, 1
  %cmp.n48 = icmp eq i64 %10, %n.vec22
  %min.iters.check = icmp ult i64 %8, 2
  %n.vec = and i64 %8, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %8, 1
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge34
  %12 = phi i32 [ 1, %3 ], [ %151, %._crit_edge34 ]
  br i1 %11, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %11, label %.preheader8.preheader, label %._crit_edge34

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvar25 = phi i64 [ %13, %._crit_edge13 ], [ 0, %.preheader9.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66.pre-phi, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  %13 = add i64 %indvar25, 1
  %14 = add i64 %indvar25, 2
  br i1 true, label %.preheader7.lr.ph, label %.preheader9.._crit_edge13_crit_edge

.preheader9.._crit_edge13_crit_edge:              ; preds = %.preheader9
  br label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %15 = add nuw nsw i64 %indvars.iv65, 1
  %16 = add nsw i64 %indvars.iv65, -1
  br i1 true, label %.preheader7.us.preheader, label %.preheader7.lr.ph.._crit_edge13_crit_edge

.preheader7.lr.ph.._crit_edge13_crit_edge:        ; preds = %.preheader7.lr.ph
  br label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvar27 = phi i64 [ %17, %._crit_edge.us ], [ 0, %.preheader7.us.preheader ]
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %17 = add i64 %indvar27, 1
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %17, i64 1
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %17, i64 %smax
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar25, i64 %17, i64 1
  %scevgep36 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %14, i64 %17, i64 %smax
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %18 = add nsw i64 %indvars.iv62, -1
  br i1 %min.iters.check19, label %scalar.ph18.preheader, label %min.iters.checked20

min.iters.checked20:                              ; preds = %.preheader7.us
  br i1 %cmp.zero23, label %scalar.ph18.preheader, label %vector.memcheck42

vector.memcheck42:                                ; preds = %min.iters.checked20
  %bound038 = icmp ult double* %scevgep29, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck42
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index44 = phi i64 [ %index.next45, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx49 = or i64 %index44, 1
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %indvars.iv62, i64 %offset.idx49
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv62, i64 %offset.idx49
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fmul <2 x double> %wide.load54, <double 2.000000e+00, double 2.000000e+00>
  %24 = fsub <2 x double> %wide.load53, %23
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %16, i64 %indvars.iv62, i64 %offset.idx49
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %wide.load55, %24
  %28 = fmul <2 x double> %27, <double 1.250000e-01, double 1.250000e-01>
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv.next63, i64 %offset.idx49
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load56, %23
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %18, i64 %offset.idx49
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %31, %wide.load57
  %35 = fmul <2 x double> %34, <double 1.250000e-01, double 1.250000e-01>
  %36 = fadd <2 x double> %28, %35
  %37 = add nuw nsw i64 %offset.idx49, 1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv62, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fsub <2 x double> %wide.load58, %23
  %41 = add nsw i64 %offset.idx49, -1
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv62, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1
  %44 = fadd <2 x double> %40, %wide.load59
  %45 = fmul <2 x double> %44, <double 1.250000e-01, double 1.250000e-01>
  %46 = fadd <2 x double> %36, %45
  %47 = fadd <2 x double> %wide.load54, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv62, i64 %offset.idx49
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %47, <2 x double>* %49, align 8, !alias.scope !4, !noalias !1
  %index.next45 = add i64 %index44, 2
  %50 = icmp eq i64 %index.next45, %n.vec22
  br i1 %50, label %middle.block17, label %vector.body16, !llvm.loop !6

middle.block17:                                   ; preds = %vector.body16
  br i1 %cmp.n48, label %._crit_edge.us, label %scalar.ph18.preheader

scalar.ph18.preheader:                            ; preds = %middle.block17, %vector.memcheck42, %min.iters.checked20, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck42 ], [ 1, %min.iters.checked20 ], [ 1, %.preheader7.us ], [ %ind.end47, %middle.block17 ]
  br label %scalar.ph18

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ %indvars.iv.ph, %scalar.ph18.preheader ]
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %indvars.iv62, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv62, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, 2.000000e+00
  %56 = fsub double %52, %55
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %16, i64 %indvars.iv62, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  %60 = fmul double %59, 1.250000e-01
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv.next63, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %55
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %18, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %60, %67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv62, i64 %indvars.iv.next
  %70 = load double, double* %69, align 8
  %71 = fsub double %70, %55
  %72 = add nsw i64 %indvars.iv, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv62, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %71, %74
  %76 = fmul double %75, 1.250000e-01
  %77 = fadd double %68, %76
  %78 = fadd double %54, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv62, i64 %indvars.iv
  store double %78, double* %79, align 8
  %80 = icmp slt i64 %indvars.iv.next, %6
  br i1 %80, label %scalar.ph18, label %._crit_edge.us.loopexit, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block17
  %81 = icmp slt i64 %indvars.iv.next63, %6
  br i1 %81, label %.preheader7.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader7.lr.ph.._crit_edge13_crit_edge, %.preheader9.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  %indvars.iv.next66.pre-phi = phi i64 [ %15, %.preheader7.lr.ph.._crit_edge13_crit_edge ], [ undef, %.preheader9.._crit_edge13_crit_edge ], [ %15, %._crit_edge13.loopexit ]
  %82 = icmp slt i64 %indvars.iv.next66.pre-phi, %6
  br i1 %82, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge29
  %indvar = phi i64 [ %83, %._crit_edge29 ], [ 0, %.preheader8.preheader ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74.pre-phi, %._crit_edge29 ], [ 1, %.preheader8.preheader ]
  %83 = add i64 %indvar, 1
  %84 = add i64 %indvar, 2
  br i1 true, label %.preheader.lr.ph, label %.preheader8.._crit_edge29_crit_edge

.preheader8.._crit_edge29_crit_edge:              ; preds = %.preheader8
  br label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %.preheader8
  %85 = add nuw nsw i64 %indvars.iv73, 1
  %86 = add nsw i64 %indvars.iv73, -1
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge29_crit_edge

.preheader.lr.ph.._crit_edge29_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge26.us
  %indvar1 = phi i64 [ %87, %._crit_edge26.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge26.us ], [ 1, %.preheader.us.preheader ]
  %87 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %83, i64 %87, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %83, i64 %87, i64 %7
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %87, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %84, i64 %87, i64 %7
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %88 = add nsw i64 %indvars.iv69, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %85, i64 %indvars.iv69, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv69, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %94 = fsub <2 x double> %wide.load, %93
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %86, i64 %indvars.iv69, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fadd <2 x double> %wide.load11, %94
  %98 = fmul <2 x double> %97, <double 1.250000e-01, double 1.250000e-01>
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv.next70, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fsub <2 x double> %wide.load12, %93
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %88, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fadd <2 x double> %101, %wide.load13
  %105 = fmul <2 x double> %104, <double 1.250000e-01, double 1.250000e-01>
  %106 = fadd <2 x double> %98, %105
  %107 = add nuw nsw i64 %offset.idx, 1
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv69, i64 %107
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = fsub <2 x double> %wide.load14, %93
  %111 = add nsw i64 %offset.idx, -1
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv69, i64 %111
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !10
  %114 = fadd <2 x double> %110, %wide.load15
  %115 = fmul <2 x double> %114, <double 1.250000e-01, double 1.250000e-01>
  %116 = fadd <2 x double> %106, %115
  %117 = fadd <2 x double> %wide.load10, %116
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv69, i64 %offset.idx
  %119 = bitcast double* %118 to <2 x double>*
  store <2 x double> %117, <2 x double>* %119, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %120 = icmp eq i64 %index.next, %n.vec
  br i1 %120, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge26.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv67.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %scalar.ph ], [ %indvars.iv67.ph, %scalar.ph.preheader ]
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %85, i64 %indvars.iv69, i64 %indvars.iv67
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv67
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, 2.000000e+00
  %126 = fsub double %122, %125
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %86, i64 %indvars.iv69, i64 %indvars.iv67
  %128 = load double, double* %127, align 8
  %129 = fadd double %128, %126
  %130 = fmul double %129, 1.250000e-01
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv.next70, i64 %indvars.iv67
  %132 = load double, double* %131, align 8
  %133 = fsub double %132, %125
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %88, i64 %indvars.iv67
  %135 = load double, double* %134, align 8
  %136 = fadd double %133, %135
  %137 = fmul double %136, 1.250000e-01
  %138 = fadd double %130, %137
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next68
  %140 = load double, double* %139, align 8
  %141 = fsub double %140, %125
  %142 = add nsw i64 %indvars.iv67, -1
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv69, i64 %142
  %144 = load double, double* %143, align 8
  %145 = fadd double %141, %144
  %146 = fmul double %145, 1.250000e-01
  %147 = fadd double %138, %146
  %148 = fadd double %124, %147
  %149 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv67
  store double %148, double* %149, align 8
  %exitcond78 = icmp eq i64 %indvars.iv.next68, %7
  br i1 %exitcond78, label %._crit_edge26.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge26.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %middle.block
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %7
  br i1 %exitcond72, label %._crit_edge29.loopexit, label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %.preheader.lr.ph.._crit_edge29_crit_edge, %.preheader8.._crit_edge29_crit_edge, %._crit_edge29.loopexit
  %indvars.iv.next74.pre-phi = phi i64 [ %85, %.preheader.lr.ph.._crit_edge29_crit_edge ], [ undef, %.preheader8.._crit_edge29_crit_edge ], [ %85, %._crit_edge29.loopexit ]
  %150 = icmp slt i64 %indvars.iv.next74.pre-phi, %6
  br i1 %150, label %.preheader8, label %._crit_edge34.loopexit

._crit_edge34.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader10
  %151 = add nsw i32 %12, 1
  %152 = icmp slt i32 %151, 501
  br i1 %152, label %.preheader11, label %153

; <label>:153:                                    ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %29

.preheader3.lr.ph:                                ; preds = %2
  %8 = zext i32 %0 to i64
  %9 = sext i32 %0 to i64
  br i1 true, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv36 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 true, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %10 = mul nsw i64 %indvars.iv36, %9
  %11 = trunc i64 %10 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %12 = icmp slt i64 %indvars.iv.next37, %9
  br i1 %12, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %13 = trunc i64 %indvars.iv32 to i32
  %14 = add i32 %11, %13
  %15 = mul i32 %14, %0
  %16 = zext i32 %15 to i64
  br label %17

._crit_edge.us.us:                                ; preds = %24
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, %8
  br i1 %exitcond, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:17:                                     ; preds = %24, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %24 ], [ 0, %.preheader.us.us ]
  %18 = add i64 %16, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 20
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %17
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %23) #5
  br label %24

; <label>:24:                                     ; preds = %22, %17
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond39, label %._crit_edge.us.us, label %17

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  br label %29

; <label>:29:                                     ; preds = %._crit_edge10, %2
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #5
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
