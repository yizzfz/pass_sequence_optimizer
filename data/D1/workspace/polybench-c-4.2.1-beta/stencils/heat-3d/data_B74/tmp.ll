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
  tail call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %21, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %21 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader23
  %indvars.iv1 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next2, %20 ]
  %4 = add nuw nsw i64 %3, %indvars.iv1
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = sub nuw nsw i64 %4, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 1.000000e+01
  %10 = fdiv double %9, 1.200000e+02
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = sub nuw nsw i64 %4, %indvars.iv.next
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, 1.200000e+02
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %17, double* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %22, label %.preheader23

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge131, %2
  %.0111132 = phi i32 [ 1, %2 ], [ %161, %._crit_edge131 ]
  br label %.preheader114

.preheader114:                                    ; preds = %._crit_edge120, %.preheader116
  %indvar36 = phi i64 [ 0, %.preheader116 ], [ %indvar.next37, %._crit_edge120 ]
  %indvars.iv4 = phi i64 [ 1, %.preheader116 ], [ %indvars.iv.next5, %._crit_edge120 ]
  %3 = add i64 %indvar36, 1
  %4 = add i64 %indvar36, 2
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %5 = add nsw i64 %indvars.iv4, -1
  br label %.preheader112

.preheader112:                                    ; preds = %._crit_edge, %.preheader114
  %indvar38 = phi i64 [ 0, %.preheader114 ], [ %indvar.next39, %._crit_edge ]
  %indvars.iv1 = phi i64 [ 1, %.preheader114 ], [ %indvars.iv.next2, %._crit_edge ]
  %6 = add i64 %indvar38, 1
  %scevgep40 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 1
  %scevgep42 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 119
  %scevgep44 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar36, i64 %6, i64 1
  %scevgep46 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 119
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %7 = add nsw i64 %indvars.iv1, -1
  %bound048 = icmp ult double* %scevgep40, %scevgep46
  %bound149 = icmp ult double* %scevgep44, %scevgep42
  %memcheck.conflict51 = and i1 %bound048, %bound149
  br i1 %memcheck.conflict51, label %scalar.ph33.preheader, label %vector.body31.preheader

vector.body31.preheader:                          ; preds = %.preheader112
  br label %vector.body31

scalar.ph33.preheader:                            ; preds = %.preheader112
  br label %scalar.ph33

vector.body31:                                    ; preds = %vector.body31.preheader, %vector.body31
  %index54 = phi i64 [ %index.next55, %vector.body31 ], [ 0, %vector.body31.preheader ]
  %offset.idx58 = or i64 %index54, 1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next5, i64 %indvars.iv1, i64 %offset.idx58
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %offset.idx58
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fmul <2 x double> %wide.load63, <double 2.000000e+00, double 2.000000e+00>
  %13 = fsub <2 x double> %wide.load62, %12
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv1, i64 %offset.idx58
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load64, %13
  %17 = fmul <2 x double> %16, <double 1.250000e-01, double 1.250000e-01>
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv.next2, i64 %offset.idx58
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = bitcast double* %10 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fmul <2 x double> %wide.load66, <double 2.000000e+00, double 2.000000e+00>
  %22 = fsub <2 x double> %wide.load65, %21
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %7, i64 %offset.idx58
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %wide.load67, %22
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %17, %26
  %28 = add nuw nsw i64 %offset.idx58, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = bitcast double* %10 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fmul <2 x double> %wide.load69, <double 2.000000e+00, double 2.000000e+00>
  %33 = fsub <2 x double> %wide.load68, %32
  %34 = add nsw i64 %offset.idx58, -1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fadd <2 x double> %wide.load70, %33
  %38 = fmul <2 x double> %37, <double 1.250000e-01, double 1.250000e-01>
  %39 = fadd <2 x double> %27, %38
  %40 = bitcast double* %10 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %wide.load71, %39
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv1, i64 %offset.idx58
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %41, <2 x double>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next55 = add i64 %index54, 2
  %44 = icmp eq i64 %index.next55, 118
  br i1 %44, label %._crit_edge.loopexit73, label %vector.body31, !llvm.loop !6

scalar.ph33:                                      ; preds = %scalar.ph33.preheader, %scalar.ph33
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph33 ], [ 1, %scalar.ph33.preheader ]
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next5, i64 %indvars.iv1, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, 2.000000e+00
  %50 = fsub double %46, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv1, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  %54 = fmul double %53, 1.250000e-01
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv.next2, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, 2.000000e+00
  %60 = fsub double %56, %59
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %7, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  %64 = fmul double %63, 1.250000e-01
  %65 = fadd double %54, %64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, 2.000000e+00
  %71 = fsub double %67, %70
  %72 = add nsw i64 %indvars.iv, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %71
  %76 = fmul double %75, 1.250000e-01
  %77 = fadd double %65, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  store double %80, double* %81, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph33, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph33
  br label %._crit_edge

._crit_edge.loopexit73:                           ; preds = %vector.body31
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit73, %._crit_edge.loopexit
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 119
  %indvar.next39 = add i64 %indvar38, 1
  br i1 %exitcond3, label %._crit_edge120, label %.preheader112

._crit_edge120:                                   ; preds = %._crit_edge
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 119
  %indvar.next37 = add i64 %indvar36, 1
  br i1 %exitcond6, label %.preheader113.preheader, label %.preheader114

.preheader113.preheader:                          ; preds = %._crit_edge120
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge128
  %indvar = phi i64 [ %indvar.next, %._crit_edge128 ], [ 0, %.preheader113.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge128 ], [ 1, %.preheader113.preheader ]
  %82 = add i64 %indvar, 1
  %83 = add i64 %indvar, 2
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %84 = add nsw i64 %indvars.iv10, -1
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge125, %.preheader113
  %indvar13 = phi i64 [ 0, %.preheader113 ], [ %indvar.next14, %._crit_edge125 ]
  %indvars.iv7 = phi i64 [ 1, %.preheader113 ], [ %indvars.iv.next8, %._crit_edge125 ]
  %85 = add i64 %indvar13, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %82, i64 %85, i64 1
  %scevgep16 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %82, i64 %85, i64 119
  %scevgep18 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %85, i64 1
  %scevgep20 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %83, i64 %85, i64 119
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %86 = add nsw i64 %indvars.iv7, -1
  %bound0 = icmp ult double* %scevgep, %scevgep20
  %bound1 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next11, i64 %indvars.iv7, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fmul <2 x double> %wide.load22, <double 2.000000e+00, double 2.000000e+00>
  %92 = fsub <2 x double> %wide.load, %91
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %indvars.iv7, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %wide.load23, %92
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv.next8, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = bitcast double* %89 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fmul <2 x double> %wide.load25, <double 2.000000e+00, double 2.000000e+00>
  %101 = fsub <2 x double> %wide.load24, %100
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %86, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fadd <2 x double> %wide.load26, %101
  %105 = fmul <2 x double> %104, <double 1.250000e-01, double 1.250000e-01>
  %106 = fadd <2 x double> %96, %105
  %107 = add nuw nsw i64 %offset.idx, 1
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %107
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = bitcast double* %89 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !10
  %111 = fmul <2 x double> %wide.load28, <double 2.000000e+00, double 2.000000e+00>
  %112 = fsub <2 x double> %wide.load27, %111
  %113 = add nsw i64 %offset.idx, -1
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %113
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = fadd <2 x double> %wide.load29, %112
  %117 = fmul <2 x double> %116, <double 1.250000e-01, double 1.250000e-01>
  %118 = fadd <2 x double> %106, %117
  %119 = bitcast double* %89 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !10
  %120 = fadd <2 x double> %wide.load30, %118
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv7, i64 %offset.idx
  %122 = bitcast double* %121 to <2 x double>*
  store <2 x double> %120, <2 x double>* %122, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %123 = icmp eq i64 %index.next, 118
  br i1 %123, label %._crit_edge125.loopexit72, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next11, i64 %indvars.iv7, i64 %indvars.iv133
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv133
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, 2.000000e+00
  %129 = fsub double %125, %128
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %indvars.iv7, i64 %indvars.iv133
  %131 = load double, double* %130, align 8
  %132 = fadd double %131, %129
  %133 = fmul double %132, 1.250000e-01
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv.next8, i64 %indvars.iv133
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv133
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, 2.000000e+00
  %139 = fsub double %135, %138
  %140 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %86, i64 %indvars.iv133
  %141 = load double, double* %140, align 8
  %142 = fadd double %141, %139
  %143 = fmul double %142, 1.250000e-01
  %144 = fadd double %133, %143
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv.next134
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv133
  %148 = load double, double* %147, align 8
  %149 = fmul double %148, 2.000000e+00
  %150 = fsub double %146, %149
  %151 = add nsw i64 %indvars.iv133, -1
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %151
  %153 = load double, double* %152, align 8
  %154 = fadd double %153, %150
  %155 = fmul double %154, 1.250000e-01
  %156 = fadd double %144, %155
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv133
  %158 = load double, double* %157, align 8
  %159 = fadd double %158, %156
  %160 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv133
  store double %159, double* %160, align 8
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond135, label %._crit_edge125.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge125.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge125

._crit_edge125.loopexit72:                        ; preds = %vector.body
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit72, %._crit_edge125.loopexit
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 119
  %indvar.next14 = add i64 %indvar13, 1
  br i1 %exitcond9, label %._crit_edge128, label %.preheader

._crit_edge128:                                   ; preds = %._crit_edge125
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond12, label %._crit_edge131, label %.preheader113

._crit_edge131:                                   ; preds = %._crit_edge128
  %161 = add nuw nsw i32 %.0111132, 1
  %exitcond136 = icmp eq i32 %161, 501
  br i1 %exitcond136, label %162, label %.preheader116

; <label>:162:                                    ; preds = %._crit_edge131
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader20

.preheader20:                                     ; preds = %22, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %22 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader20
  %indvars.iv1 = phi i64 [ 0, %.preheader20 ], [ %indvars.iv.next2, %21 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 120
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %23, label %.preheader20

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
