; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call void @init_array(i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge1

._crit_edge1:                                     ; preds = %8
  br label %12

; <label>:11:                                     ; preds = %8
  tail call void @print_array(i32 1300, [1300 x double]* %5)
  br label %12

; <label>:12:                                     ; preds = %._crit_edge1, %._crit_edge, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  %3 = trunc i64 %indvars.iv5 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %12 = add nuw nsw i64 %indvars.iv, 3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %6, %16
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, <double 1.300000e+03, double 1.300000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %11, align 8
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %7

._crit_edge.us:                                   ; preds = %7
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1300
  br i1 %exitcond8, label %._crit_edge4, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) #2 {
.preheader6.lr.ph:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge15..preheader6_crit_edge, %.preheader6.lr.ph
  %.0316 = phi i32 [ 0, %.preheader6.lr.ph ], [ %118, %._crit_edge15..preheader6_crit_edge ]
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge.us..preheader4.us_crit_edge, %.preheader6
  %indvar53 = phi i64 [ 0, %.preheader6 ], [ %indvar.next54, %._crit_edge.us..preheader4.us_crit_edge ]
  %indvars.iv18 = phi i64 [ 1, %.preheader6 ], [ %indvars.iv.next19, %._crit_edge.us..preheader4.us_crit_edge ]
  %4 = add i64 %indvar53, 1
  %scevgep55 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1
  %scevgep57 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1299
  %scevgep59 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar53, i64 1
  %5 = add i64 %indvar53, 2
  %scevgep61 = getelementptr [1300 x double], [1300 x double]* %2, i64 %5, i64 1299
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %6 = add nsw i64 %indvars.iv18, -1
  %bound063 = icmp ult double* %scevgep55, %scevgep61
  %bound164 = icmp ult double* %scevgep59, %scevgep57
  %memcheck.conflict66 = and i1 %bound063, %bound164
  br i1 %memcheck.conflict66, label %.preheader4.us.scalar.ph50.preheader_crit_edge, label %vector.body48.preheader

.preheader4.us.scalar.ph50.preheader_crit_edge:   ; preds = %.preheader4.us
  br label %scalar.ph50.preheader

vector.body48.preheader:                          ; preds = %.preheader4.us
  br label %vector.body48

vector.body48:                                    ; preds = %vector.body48.vector.body48_crit_edge, %vector.body48.preheader
  %index69 = phi i64 [ %index.next70, %vector.body48.vector.body48_crit_edge ], [ 0, %vector.body48.preheader ]
  %offset.idx73 = or i64 %index69, 1
  %7 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv18, i64 %offset.idx73
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = add nsw i64 %offset.idx73, -1
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv18, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load78, %wide.load80
  %17 = fadd <2 x double> %wide.load79, %wide.load81
  %18 = add nuw nsw i64 %offset.idx73, 1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv18, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %16, %wide.load82
  %24 = fadd <2 x double> %17, %wide.load83
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next19, i64 %offset.idx73
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %23, %wide.load84
  %30 = fadd <2 x double> %24, %wide.load85
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %offset.idx73
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load86
  %36 = fadd <2 x double> %30, %wide.load87
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv18, i64 %offset.idx73
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next70 = add i64 %index69, 4
  %43 = icmp eq i64 %index.next70, 1296
  br i1 %43, label %scalar.ph50.preheader.loopexit, label %vector.body48.vector.body48_crit_edge, !llvm.loop !6

vector.body48.vector.body48_crit_edge:            ; preds = %vector.body48
  br label %vector.body48

scalar.ph50.preheader.loopexit:                   ; preds = %vector.body48
  br label %scalar.ph50.preheader

scalar.ph50.preheader:                            ; preds = %.preheader4.us.scalar.ph50.preheader_crit_edge, %scalar.ph50.preheader.loopexit
  %indvars.iv.ph = phi i64 [ 1, %.preheader4.us.scalar.ph50.preheader_crit_edge ], [ 1297, %scalar.ph50.preheader.loopexit ]
  br label %scalar.ph50

scalar.ph50:                                      ; preds = %scalar.ph50.scalar.ph50_crit_edge, %scalar.ph50.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph50.scalar.ph50_crit_edge ], [ %indvars.iv.ph, %scalar.ph50.preheader ]
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv18, i64 %46
  %48 = load double, double* %47, align 8
  %49 = fadd double %45, %48
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next19, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = fmul double %58, 2.000000e-01
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv18, i64 %indvars.iv
  store double %59, double* %60, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %._crit_edge.us, label %scalar.ph50.scalar.ph50_crit_edge, !llvm.loop !9

scalar.ph50.scalar.ph50_crit_edge:                ; preds = %scalar.ph50
  br label %scalar.ph50

._crit_edge.us:                                   ; preds = %scalar.ph50
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 1299
  %indvar.next54 = add i64 %indvar53, 1
  br i1 %exitcond21, label %.preheader.us.preheader, label %._crit_edge.us..preheader4.us_crit_edge

._crit_edge.us..preheader4.us_crit_edge:          ; preds = %._crit_edge.us
  br label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge12.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge12.us..preheader.us_crit_edge ], [ 1, %.preheader.us.preheader ]
  %61 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1299
  %scevgep34 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %62 = add i64 %indvar, 2
  %scevgep36 = getelementptr [1300 x double], [1300 x double]* %3, i64 %62, i64 1299
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %63 = add nsw i64 %indvars.iv26, -1
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader.us.scalar.ph.preheader_crit_edge, label %vector.body.preheader

.preheader.us.scalar.ph.preheader_crit_edge:      ; preds = %.preheader.us
  br label %scalar.ph.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv26, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = add nsw i64 %offset.idx, -1
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv26, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %wide.load, %wide.load40
  %74 = fadd <2 x double> %wide.load39, %wide.load41
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv26, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %73, %wide.load42
  %81 = fadd <2 x double> %74, %wide.load43
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next27, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %80, %wide.load44
  %87 = fadd <2 x double> %81, %wide.load45
  %88 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %86, %wide.load46
  %93 = fadd <2 x double> %87, %wide.load47
  %94 = fmul <2 x double> %92, <double 2.000000e-01, double 2.000000e-01>
  %95 = fmul <2 x double> %93, <double 2.000000e-01, double 2.000000e-01>
  %96 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv26, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  store <2 x double> %94, <2 x double>* %97, align 8, !alias.scope !13, !noalias !10
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  store <2 x double> %95, <2 x double>* %99, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %100 = icmp eq i64 %index.next, 1296
  br i1 %100, label %scalar.ph.preheader.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us.scalar.ph.preheader_crit_edge, %scalar.ph.preheader.loopexit
  %indvars.iv22.ph = phi i64 [ 1, %.preheader.us.scalar.ph.preheader_crit_edge ], [ 1297, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv22.ph, %scalar.ph.preheader ]
  %101 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv22
  %102 = load double, double* %101, align 8
  %103 = add nsw i64 %indvars.iv22, -1
  %104 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv26, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fadd double %102, %105
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %107 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv.next23
  %108 = load double, double* %107, align 8
  %109 = fadd double %106, %108
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next27, i64 %indvars.iv22
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %indvars.iv22
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = fmul double %115, 2.000000e-01
  %117 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv22
  store double %116, double* %117, align 8
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1299
  br i1 %exitcond25, label %._crit_edge12.us, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !16

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge12.us:                                 ; preds = %scalar.ph
  %exitcond29 = icmp eq i64 %indvars.iv.next27, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond29, label %._crit_edge15, label %._crit_edge12.us..preheader.us_crit_edge

._crit_edge12.us..preheader.us_crit_edge:         ; preds = %._crit_edge12.us
  br label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge12.us
  %118 = add nuw nsw i32 %.0316, 1
  %exitcond30 = icmp eq i32 %118, 500
  br i1 %exitcond30, label %._crit_edge17, label %._crit_edge15..preheader6_crit_edge

._crit_edge15..preheader6_crit_edge:              ; preds = %._crit_edge15
  br label %.preheader6

._crit_edge17:                                    ; preds = %._crit_edge15
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1300 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv6, 1300
  br label %7

; <label>:7:                                      ; preds = %._crit_edge10, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge10 ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge10

._crit_edge10:                                    ; preds = %14
  br label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1300
  br i1 %exitcond9, label %._crit_edge5, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
