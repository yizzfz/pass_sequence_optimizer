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
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader19

.preheader19:                                     ; preds = %2, %21
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %21 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %.preheader19, %20
  %indvars.iv1 = phi i64 [ 0, %.preheader19 ], [ %indvars.iv.next2, %20 ]
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
  %exitcond = icmp ne i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %.preheader, label %21

; <label>:21:                                     ; preds = %20
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %.preheader19, label %22

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader104

.preheader104:                                    ; preds = %137, %2
  %storemerge111 = phi i32 [ 1, %2 ], [ %138, %137 ]
  br label %.preheader102

.preheader102:                                    ; preds = %.preheader104, %69
  %indvars.iv60 = phi i64 [ 1, %.preheader104 ], [ %indvars.iv.next61, %69 ]
  %indvar21 = phi i64 [ 0, %.preheader104 ], [ %indvar.next22, %69 ]
  %3 = add nuw nsw i64 %indvar21, 1
  %4 = add nuw nsw i64 %indvar21, 2
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %5 = add nsw i64 %indvars.iv60, -1
  br label %.preheader100

.preheader100:                                    ; preds = %.preheader102, %middle.block17
  %indvars.iv57 = phi i64 [ 1, %.preheader102 ], [ %indvars.iv.next58, %middle.block17 ]
  %indvar23 = phi i64 [ 0, %.preheader102 ], [ %indvar.next24, %middle.block17 ]
  %6 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %6, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 119
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %7 = add nsw i64 %indvars.iv57, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %.preheader100
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %.preheader100
  br label %scalar.ph18

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next61, i64 %indvars.iv57, i64 %offset.idx43
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %offset.idx43
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %13 = fsub <2 x double> %wide.load47, %12
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv57, i64 %offset.idx43
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load49, %13
  %17 = fmul <2 x double> %16, <double 1.250000e-01, double 1.250000e-01>
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv.next58, i64 %offset.idx43
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fsub <2 x double> %wide.load50, %12
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %7, i64 %offset.idx43
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %20, %wide.load51
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = fadd <2 x double> %17, %24
  %26 = add nuw nsw i64 %offset.idx43, 1
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fsub <2 x double> %wide.load52, %12
  %30 = add nsw i64 %offset.idx43, -1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %29, %wide.load53
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %25, %34
  %36 = fadd <2 x double> %wide.load48, %35
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv60, i64 %indvars.iv57, i64 %offset.idx43
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 2
  %39 = icmp eq i64 %index.next40, 118
  br i1 %39, label %middle.block17.loopexit56, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next61, i64 %indvars.iv57, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, 2.000000e+00
  %45 = fsub double %41, %44
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv57, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  %49 = fmul double %48, 1.250000e-01
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv.next58, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %44
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %7, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = fmul double %55, 1.250000e-01
  %57 = fadd double %49, %56
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %44
  %61 = add nsw i64 %indvars.iv, -1
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %61
  %63 = load double, double* %62, align 8
  %64 = fadd double %60, %63
  %65 = fmul double %64, 1.250000e-01
  %66 = fadd double %57, %65
  %67 = fadd double %43, %66
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv60, i64 %indvars.iv57, i64 %indvars.iv
  store double %67, double* %68, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %middle.block17.loopexit, label %scalar.ph18, !llvm.loop !9

middle.block17.loopexit:                          ; preds = %scalar.ph18
  br label %middle.block17

middle.block17.loopexit56:                        ; preds = %vector.body16
  br label %middle.block17

middle.block17:                                   ; preds = %middle.block17.loopexit56, %middle.block17.loopexit
  %indvar.next24 = add nuw nsw i64 %indvar23, 1
  %exitcond59 = icmp ne i64 %indvar.next24, 118
  br i1 %exitcond59, label %.preheader100, label %69

; <label>:69:                                     ; preds = %middle.block17
  %indvar.next22 = add nuw nsw i64 %indvar21, 1
  %exitcond62 = icmp ne i64 %indvar.next22, 118
  br i1 %exitcond62, label %.preheader102, label %.preheader101.preheader

.preheader101.preheader:                          ; preds = %69
  br label %.preheader101

.preheader101:                                    ; preds = %.preheader101.preheader, %136
  %indvars.iv66 = phi i64 [ 1, %.preheader101.preheader ], [ %indvars.iv.next67, %136 ]
  %indvar = phi i64 [ %indvar.next, %136 ], [ 0, %.preheader101.preheader ]
  %70 = add nuw nsw i64 %indvar, 1
  %71 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %72 = add nsw i64 %indvars.iv66, -1
  br label %.preheader

.preheader:                                       ; preds = %.preheader101, %middle.block
  %indvars.iv63 = phi i64 [ 1, %.preheader101 ], [ %indvars.iv.next64, %middle.block ]
  %indvar1 = phi i64 [ 0, %.preheader101 ], [ %indvar.next2, %middle.block ]
  %73 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %70, i64 %73, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %70, i64 %73, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %73, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %73, i64 119
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %74 = add nsw i64 %indvars.iv63, -1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next67, i64 %indvars.iv63, i64 %offset.idx
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %80 = fsub <2 x double> %wide.load, %79
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %72, i64 %indvars.iv63, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fadd <2 x double> %wide.load11, %80
  %84 = fmul <2 x double> %83, <double 1.250000e-01, double 1.250000e-01>
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fsub <2 x double> %wide.load12, %79
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %74, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %87, %wide.load13
  %91 = fmul <2 x double> %90, <double 1.250000e-01, double 1.250000e-01>
  %92 = fadd <2 x double> %84, %91
  %93 = add nuw nsw i64 %offset.idx, 1
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %93
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fsub <2 x double> %wide.load14, %79
  %97 = add nsw i64 %offset.idx, -1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %97
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fadd <2 x double> %96, %wide.load15
  %101 = fmul <2 x double> %100, <double 1.250000e-01, double 1.250000e-01>
  %102 = fadd <2 x double> %92, %101
  %103 = fadd <2 x double> %wide.load10, %102
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv63, i64 %offset.idx
  %105 = bitcast double* %104 to <2 x double>*
  store <2 x double> %103, <2 x double>* %105, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %106 = icmp eq i64 %index.next, 118
  br i1 %106, label %middle.block.loopexit55, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next67, i64 %indvars.iv63, i64 %indvars.iv112
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv112
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, 2.000000e+00
  %112 = fsub double %108, %111
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %72, i64 %indvars.iv63, i64 %indvars.iv112
  %114 = load double, double* %113, align 8
  %115 = fadd double %114, %112
  %116 = fmul double %115, 1.250000e-01
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %indvars.iv112
  %118 = load double, double* %117, align 8
  %119 = fsub double %118, %111
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %74, i64 %indvars.iv112
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = fmul double %122, 1.250000e-01
  %124 = fadd double %116, %123
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv.next113
  %126 = load double, double* %125, align 8
  %127 = fsub double %126, %111
  %128 = add nsw i64 %indvars.iv112, -1
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %128
  %130 = load double, double* %129, align 8
  %131 = fadd double %127, %130
  %132 = fmul double %131, 1.250000e-01
  %133 = fadd double %124, %132
  %134 = fadd double %110, %133
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv112
  store double %134, double* %135, align 8
  %exitcond114 = icmp eq i64 %indvars.iv.next113, 119
  br i1 %exitcond114, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit55:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit55, %middle.block.loopexit
  %indvar.next2 = add nuw nsw i64 %indvar1, 1
  %exitcond65 = icmp ne i64 %indvar.next2, 118
  br i1 %exitcond65, label %.preheader, label %136

; <label>:136:                                    ; preds = %middle.block
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond68 = icmp ne i64 %indvar.next, 118
  br i1 %exitcond68, label %.preheader101, label %137

; <label>:137:                                    ; preds = %136
  %138 = add nuw nsw i32 %storemerge111, 1
  %exitcond115 = icmp eq i32 %138, 501
  br i1 %exitcond115, label %139, label %.preheader104

; <label>:139:                                    ; preds = %137
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader15

.preheader15:                                     ; preds = %1, %21
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %21 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %.preheader15, %20
  %indvars.iv1 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next2, %20 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 120
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp ne i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %.preheader, label %21

; <label>:21:                                     ; preds = %20
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %.preheader15, label %22

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
