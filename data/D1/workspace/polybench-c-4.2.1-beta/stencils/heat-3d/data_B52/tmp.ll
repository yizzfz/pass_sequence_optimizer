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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader19

.preheader19:                                     ; preds = %22, %3
  %indvars.iv26 = phi i64 [ 0, %3 ], [ %indvars.iv.next27, %22 ]
  %4 = add nuw nsw i64 %indvars.iv26, 120
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader19
  %indvars.iv23 = phi i64 [ 0, %.preheader19 ], [ %indvars.iv.next24, %21 ]
  %5 = add nuw nsw i64 %4, %indvars.iv23
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %6 ]
  %7 = sub nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 1.000000e+01
  %11 = fdiv double %10, 1.200000e+02
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv
  store double %11, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = sub nuw nsw i64 %5, %indvars.iv.next
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %18, double* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %21, label %6

; <label>:21:                                     ; preds = %6
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond25, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 120
  br i1 %exitcond28, label %23, label %.preheader19

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader110

.preheader110:                                    ; preds = %139, %4
  %storemerge117 = phi i32 [ 1, %4 ], [ %140, %139 ]
  br label %.preheader108

.preheader108:                                    ; preds = %71, %.preheader110
  %indvar155 = phi i64 [ %indvar.next156, %71 ], [ 0, %.preheader110 ]
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %71 ], [ 1, %.preheader110 ]
  %5 = add nuw nsw i64 %indvar155, 1
  %6 = add nuw nsw i64 %indvar155, 2
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %7 = add nsw i64 %indvars.iv121, -1
  br label %.preheader106

.preheader106:                                    ; preds = %middle.block151, %.preheader108
  %indvar157 = phi i64 [ %indvar.next158, %middle.block151 ], [ 0, %.preheader108 ]
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %middle.block151 ], [ 1, %.preheader108 ]
  %8 = add nuw nsw i64 %indvar157, 1
  %scevgep159 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %8, i64 1
  %scevgep161 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %8, i64 119
  %scevgep163 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar155, i64 %8, i64 1
  %scevgep165 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %8, i64 119
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %9 = add nsw i64 %indvars.iv118, -1
  %bound0167 = icmp ult double* %scevgep159, %scevgep165
  %bound1168 = icmp ult double* %scevgep163, %scevgep161
  %memcheck.conflict170 = and i1 %bound0167, %bound1168
  br i1 %memcheck.conflict170, label %scalar.ph152.preheader, label %vector.body150.preheader

vector.body150.preheader:                         ; preds = %.preheader106
  br label %vector.body150

scalar.ph152.preheader:                           ; preds = %.preheader106
  br label %scalar.ph152

vector.body150:                                   ; preds = %vector.body150.preheader, %vector.body150
  %index173 = phi i64 [ %index.next174, %vector.body150 ], [ 0, %vector.body150.preheader ]
  %offset.idx177 = or i64 %index173, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv.next122, i64 %indvars.iv118, i64 %offset.idx177
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load181 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv118, i64 %offset.idx177
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load182 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load182, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load181, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv118, i64 %offset.idx177
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load183 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load183, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv.next119, i64 %offset.idx177
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load184 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load184, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %9, i64 %offset.idx177
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load185 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load185
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx177, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv118, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load186 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load186, %14
  %32 = add nsw i64 %offset.idx177, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv118, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load187 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load187
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load182, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv121, i64 %indvars.iv118, i64 %offset.idx177
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next174 = add nuw nsw i64 %index173, 2
  %41 = icmp eq i64 %index.next174, 118
  br i1 %41, label %middle.block151.loopexit190, label %vector.body150, !llvm.loop !6

scalar.ph152:                                     ; preds = %scalar.ph152.preheader, %scalar.ph152
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph152 ], [ 1, %scalar.ph152.preheader ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv.next122, i64 %indvars.iv118, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv118, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = fsub double %43, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv118, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  %51 = fmul double %50, 1.250000e-01
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv.next119, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %46
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %9, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 1.250000e-01
  %59 = fadd double %51, %58
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv118, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %46
  %63 = add nsw i64 %indvars.iv, -1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv121, i64 %indvars.iv118, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %62, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %59, %67
  %69 = fadd double %45, %68
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv121, i64 %indvars.iv118, i64 %indvars.iv
  store double %69, double* %70, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %middle.block151.loopexit, label %scalar.ph152, !llvm.loop !9

middle.block151.loopexit:                         ; preds = %scalar.ph152
  br label %middle.block151

middle.block151.loopexit190:                      ; preds = %vector.body150
  br label %middle.block151

middle.block151:                                  ; preds = %middle.block151.loopexit190, %middle.block151.loopexit
  %exitcond120 = icmp eq i64 %indvars.iv.next119, 119
  %indvar.next158 = add nuw nsw i64 %indvar157, 1
  br i1 %exitcond120, label %71, label %.preheader106

; <label>:71:                                     ; preds = %middle.block151
  %exitcond123 = icmp eq i64 %indvars.iv.next122, 119
  %indvar.next156 = add nuw nsw i64 %indvar155, 1
  br i1 %exitcond123, label %.preheader107.preheader, label %.preheader108

.preheader107.preheader:                          ; preds = %71
  br label %.preheader107

.preheader107:                                    ; preds = %.preheader107.preheader, %138
  %indvar = phi i64 [ %indvar.next, %138 ], [ 0, %.preheader107.preheader ]
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %138 ], [ 1, %.preheader107.preheader ]
  %72 = add nuw nsw i64 %indvar, 1
  %73 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %74 = add nsw i64 %indvars.iv130, -1
  br label %.preheader

.preheader:                                       ; preds = %middle.block, %.preheader107
  %indvar135 = phi i64 [ %indvar.next136, %middle.block ], [ 0, %.preheader107 ]
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %middle.block ], [ 1, %.preheader107 ]
  %75 = add nuw nsw i64 %indvar135, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %75, i64 1
  %scevgep138 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %75, i64 119
  %scevgep140 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %75, i64 1
  %scevgep142 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %73, i64 %75, i64 119
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %76 = add nsw i64 %indvars.iv127, -1
  %bound0 = icmp ult double* %scevgep, %scevgep142
  %bound1 = icmp ult double* %scevgep140, %scevgep138
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv.next131, i64 %indvars.iv127, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv127, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load144 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fmul <2 x double> %wide.load144, <double 2.000000e+00, double 2.000000e+00>
  %82 = fsub <2 x double> %wide.load, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %indvars.iv127, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %wide.load145, %82
  %86 = fmul <2 x double> %85, <double 1.250000e-01, double 1.250000e-01>
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv.next128, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fsub <2 x double> %wide.load146, %81
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %76, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %89, %wide.load147
  %93 = fmul <2 x double> %92, <double 1.250000e-01, double 1.250000e-01>
  %94 = fadd <2 x double> %86, %93
  %95 = add nuw nsw i64 %offset.idx, 1
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv127, i64 %95
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fsub <2 x double> %wide.load148, %81
  %99 = add nsw i64 %offset.idx, -1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv127, i64 %99
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %98, %wide.load149
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %94, %103
  %105 = fadd <2 x double> %wide.load144, %104
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv127, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %108 = icmp eq i64 %index.next, 118
  br i1 %108, label %middle.block.loopexit189, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv.next131, i64 %indvars.iv127, i64 %indvars.iv124
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv127, i64 %indvars.iv124
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 2.000000e+00
  %114 = fsub double %110, %113
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %indvars.iv127, i64 %indvars.iv124
  %116 = load double, double* %115, align 8
  %117 = fadd double %116, %114
  %118 = fmul double %117, 1.250000e-01
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv.next128, i64 %indvars.iv124
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %113
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %76, i64 %indvars.iv124
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = fmul double %124, 1.250000e-01
  %126 = fadd double %118, %125
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv127, i64 %indvars.iv.next125
  %128 = load double, double* %127, align 8
  %129 = fsub double %128, %113
  %130 = add nsw i64 %indvars.iv124, -1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv127, i64 %130
  %132 = load double, double* %131, align 8
  %133 = fadd double %129, %132
  %134 = fmul double %133, 1.250000e-01
  %135 = fadd double %126, %134
  %136 = fadd double %112, %135
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv127, i64 %indvars.iv124
  store double %136, double* %137, align 8
  %exitcond126 = icmp eq i64 %indvars.iv.next125, 119
  br i1 %exitcond126, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit189:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit189, %middle.block.loopexit
  %exitcond129 = icmp eq i64 %indvars.iv.next128, 119
  %indvar.next136 = add nuw nsw i64 %indvar135, 1
  br i1 %exitcond129, label %138, label %.preheader

; <label>:138:                                    ; preds = %middle.block
  %exitcond132 = icmp eq i64 %indvars.iv.next131, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond132, label %139, label %.preheader107

; <label>:139:                                    ; preds = %138
  %140 = add nuw nsw i32 %storemerge117, 1
  %exitcond133 = icmp eq i32 %140, 501
  br i1 %exitcond133, label %141, label %.preheader110

; <label>:141:                                    ; preds = %139
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader15

.preheader15:                                     ; preds = %22, %2
  %indvars.iv22 = phi i64 [ 0, %2 ], [ %indvars.iv.next23, %22 ]
  %7 = mul nuw nsw i64 %indvars.iv22, 120
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader15
  %indvars.iv19 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next20, %21 ]
  %8 = add nuw nsw i64 %indvars.iv19, %7
  %9 = mul nuw nsw i64 %8, 120
  br label %10

; <label>:10:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %11 = add nuw nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv19, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %21, label %10

; <label>:21:                                     ; preds = %._crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 120
  br i1 %exitcond21, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond24, label %23, label %.preheader15

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
