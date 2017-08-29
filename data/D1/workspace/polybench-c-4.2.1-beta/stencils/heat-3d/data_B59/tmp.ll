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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader1

.preheader1:                                      ; preds = %21, %2
  %indvars.iv7 = phi i64 [ 0, %2 ], [ %indvars.iv.next8, %21 ]
  %3 = add nuw nsw i64 %indvars.iv7, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader1
  %indvars.iv5 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next6, %20 ]
  %4 = add nuw nsw i64 %3, %indvars.iv5
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = sub nuw nsw i64 %4, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 1.000000e+01
  %10 = fdiv double %9, 1.200000e+02
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv7, i64 %indvars.iv5, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv7, i64 %indvars.iv5, i64 %indvars.iv
  store double %10, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = sub nuw nsw i64 %4, %indvars.iv.next
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, 1.200000e+02
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv7, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv7, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %17, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 120
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 120
  br i1 %exitcond9, label %22, label %.preheader1

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader5

.preheader5:                                      ; preds = %163, %2
  %storemerge12 = phi i32 [ 1, %2 ], [ %164, %163 ]
  br label %.preheader3

.preheader3:                                      ; preds = %82, %.preheader5
  %indvar52 = phi i64 [ %indvar.next53, %82 ], [ 0, %.preheader5 ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %82 ], [ 1, %.preheader5 ]
  %3 = add i64 %indvar52, 1
  %4 = add i64 %indvar52, 2
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %5 = add nsw i64 %indvars.iv16, -1
  br label %.preheader1

.preheader1:                                      ; preds = %middle.block48, %.preheader3
  %indvar54 = phi i64 [ %indvar.next55, %middle.block48 ], [ 0, %.preheader3 ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %middle.block48 ], [ 1, %.preheader3 ]
  %6 = add i64 %indvar54, 1
  %scevgep56 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 1
  %scevgep58 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 119
  %scevgep60 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar52, i64 %6, i64 1
  %scevgep62 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 119
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %7 = add nsw i64 %indvars.iv13, -1
  %bound064 = icmp ult double* %scevgep56, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br i1 %memcheck.conflict67, label %scalar.ph49.preheader, label %vector.body47.preheader

vector.body47.preheader:                          ; preds = %.preheader1
  br label %vector.body47

scalar.ph49.preheader:                            ; preds = %.preheader1
  br label %scalar.ph49

vector.body47:                                    ; preds = %vector.body47.preheader, %vector.body47
  %index70 = phi i64 [ %index.next71, %vector.body47 ], [ 0, %vector.body47.preheader ]
  %offset.idx74 = or i64 %index70, 1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next17, i64 %indvars.iv13, i64 %offset.idx74
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %offset.idx74
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fmul <2 x double> %wide.load79, <double 2.000000e+00, double 2.000000e+00>
  %13 = fsub <2 x double> %wide.load78, %12
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv13, i64 %offset.idx74
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load80, %13
  %17 = fmul <2 x double> %16, <double 1.250000e-01, double 1.250000e-01>
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv.next14, i64 %offset.idx74
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = bitcast double* %10 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fmul <2 x double> %wide.load82, <double 2.000000e+00, double 2.000000e+00>
  %22 = fsub <2 x double> %wide.load81, %21
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %7, i64 %offset.idx74
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %wide.load83, %22
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %17, %26
  %28 = add nuw nsw i64 %offset.idx74, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = bitcast double* %10 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fmul <2 x double> %wide.load85, <double 2.000000e+00, double 2.000000e+00>
  %33 = fsub <2 x double> %wide.load84, %32
  %34 = add nsw i64 %offset.idx74, -1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fadd <2 x double> %wide.load86, %33
  %38 = fmul <2 x double> %37, <double 1.250000e-01, double 1.250000e-01>
  %39 = fadd <2 x double> %27, %38
  %40 = bitcast double* %10 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %wide.load87, %39
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv16, i64 %indvars.iv13, i64 %offset.idx74
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %41, <2 x double>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next71 = add i64 %index70, 2
  %44 = icmp eq i64 %index.next71, 118
  br i1 %44, label %middle.block48.loopexit90, label %vector.body47, !llvm.loop !6

scalar.ph49:                                      ; preds = %scalar.ph49.preheader, %scalar.ph49
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph49 ], [ 1, %scalar.ph49.preheader ]
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next17, i64 %indvars.iv13, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, 2.000000e+00
  %50 = fsub double %46, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv13, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  %54 = fmul double %53, 1.250000e-01
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv.next14, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, 2.000000e+00
  %60 = fsub double %56, %59
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %7, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  %64 = fmul double %63, 1.250000e-01
  %65 = fadd double %54, %64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, 2.000000e+00
  %71 = fsub double %67, %70
  %72 = add nsw i64 %indvars.iv, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %71
  %76 = fmul double %75, 1.250000e-01
  %77 = fadd double %65, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv
  store double %80, double* %81, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %middle.block48.loopexit, label %scalar.ph49, !llvm.loop !9

middle.block48.loopexit:                          ; preds = %scalar.ph49
  br label %middle.block48

middle.block48.loopexit90:                        ; preds = %vector.body47
  br label %middle.block48

middle.block48:                                   ; preds = %middle.block48.loopexit90, %middle.block48.loopexit
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 119
  %indvar.next55 = add i64 %indvar54, 1
  br i1 %exitcond15, label %82, label %.preheader1

; <label>:82:                                     ; preds = %middle.block48
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 119
  %indvar.next53 = add i64 %indvar52, 1
  br i1 %exitcond18, label %.preheader2.preheader, label %.preheader3

.preheader2.preheader:                            ; preds = %82
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %162
  %indvar = phi i64 [ %indvar.next, %162 ], [ 0, %.preheader2.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %162 ], [ 1, %.preheader2.preheader ]
  %83 = add i64 %indvar, 1
  %84 = add i64 %indvar, 2
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %85 = add nsw i64 %indvars.iv25, -1
  br label %.preheader

.preheader:                                       ; preds = %middle.block, %.preheader2
  %indvar29 = phi i64 [ %indvar.next30, %middle.block ], [ 0, %.preheader2 ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %middle.block ], [ 1, %.preheader2 ]
  %86 = add i64 %indvar29, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %83, i64 %86, i64 1
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %83, i64 %86, i64 119
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %86, i64 1
  %scevgep36 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %86, i64 119
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %87 = add nsw i64 %indvars.iv22, -1
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next26, i64 %indvars.iv22, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fmul <2 x double> %wide.load38, <double 2.000000e+00, double 2.000000e+00>
  %93 = fsub <2 x double> %wide.load, %92
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %indvars.iv22, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fadd <2 x double> %wide.load39, %93
  %97 = fmul <2 x double> %96, <double 1.250000e-01, double 1.250000e-01>
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv.next23, i64 %offset.idx
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = bitcast double* %90 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fmul <2 x double> %wide.load41, <double 2.000000e+00, double 2.000000e+00>
  %102 = fsub <2 x double> %wide.load40, %101
  %103 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %87, i64 %offset.idx
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !10
  %105 = fadd <2 x double> %wide.load42, %102
  %106 = fmul <2 x double> %105, <double 1.250000e-01, double 1.250000e-01>
  %107 = fadd <2 x double> %97, %106
  %108 = add nuw nsw i64 %offset.idx, 1
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %108
  %110 = bitcast double* %109 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !10
  %111 = bitcast double* %90 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fmul <2 x double> %wide.load44, <double 2.000000e+00, double 2.000000e+00>
  %113 = fsub <2 x double> %wide.load43, %112
  %114 = add nsw i64 %offset.idx, -1
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %114
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !10
  %117 = fadd <2 x double> %wide.load45, %113
  %118 = fmul <2 x double> %117, <double 1.250000e-01, double 1.250000e-01>
  %119 = fadd <2 x double> %107, %118
  %120 = bitcast double* %90 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !10
  %121 = fadd <2 x double> %wide.load46, %119
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv25, i64 %indvars.iv22, i64 %offset.idx
  %123 = bitcast double* %122 to <2 x double>*
  store <2 x double> %121, <2 x double>* %123, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %124 = icmp eq i64 %index.next, 118
  br i1 %124, label %middle.block.loopexit89, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next26, i64 %indvars.iv22, i64 %indvars.iv19
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %indvars.iv19
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, 2.000000e+00
  %130 = fsub double %126, %129
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %indvars.iv22, i64 %indvars.iv19
  %132 = load double, double* %131, align 8
  %133 = fadd double %132, %130
  %134 = fmul double %133, 1.250000e-01
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv.next23, i64 %indvars.iv19
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %indvars.iv19
  %138 = load double, double* %137, align 8
  %139 = fmul double %138, 2.000000e+00
  %140 = fsub double %136, %139
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %87, i64 %indvars.iv19
  %142 = load double, double* %141, align 8
  %143 = fadd double %142, %140
  %144 = fmul double %143, 1.250000e-01
  %145 = fadd double %134, %144
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %indvars.iv.next20
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %indvars.iv19
  %149 = load double, double* %148, align 8
  %150 = fmul double %149, 2.000000e+00
  %151 = fsub double %147, %150
  %152 = add nsw i64 %indvars.iv19, -1
  %153 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %152
  %154 = load double, double* %153, align 8
  %155 = fadd double %154, %151
  %156 = fmul double %155, 1.250000e-01
  %157 = fadd double %145, %156
  %158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv22, i64 %indvars.iv19
  %159 = load double, double* %158, align 8
  %160 = fadd double %159, %157
  %161 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv25, i64 %indvars.iv22, i64 %indvars.iv19
  store double %160, double* %161, align 8
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 119
  br i1 %exitcond21, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit89:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit89, %middle.block.loopexit
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 119
  %indvar.next30 = add i64 %indvar29, 1
  br i1 %exitcond24, label %162, label %.preheader

; <label>:162:                                    ; preds = %middle.block
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond27, label %163, label %.preheader2

; <label>:163:                                    ; preds = %162
  %164 = add nuw nsw i32 %storemerge12, 1
  %exitcond28 = icmp eq i32 %164, 501
  br i1 %exitcond28, label %165, label %.preheader5

; <label>:165:                                    ; preds = %163
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader1

.preheader1:                                      ; preds = %22, %1
  %indvars.iv8 = phi i64 [ 0, %1 ], [ %indvars.iv.next9, %22 ]
  %6 = mul nuw nsw i64 %indvars.iv8, 120
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader1
  %indvars.iv5 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next6, %21 ]
  %7 = add nuw nsw i64 %indvars.iv5, %6
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

; <label>:16:                                     ; preds = %9, %14
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv8, i64 %indvars.iv5, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 120
  br i1 %exitcond7, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond10, label %23, label %.preheader1

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
