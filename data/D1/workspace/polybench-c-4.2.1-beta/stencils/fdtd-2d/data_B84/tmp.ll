; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph12.preheader:
  br label %.lr.ph12

.preheader.preheader.us:                          ; preds = %.lr.ph12..preheader.preheader.us_crit_edge, %.preheader._crit_edge.us..preheader.preheader.us_crit_edge
  %indvars.iv38.us = phi i64 [ %indvars.iv.next4.us, %.preheader._crit_edge.us..preheader.preheader.us_crit_edge ], [ 0, %.lr.ph12..preheader.preheader.us_crit_edge ]
  %4 = trunc i64 %indvars.iv38.us to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us..preheader.us_crit_edge, %.preheader.preheader.us
  %indvars.iv7.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us..preheader.us_crit_edge ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  %8 = trunc i64 %indvars.iv.next.us to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  %11 = add nuw nsw i64 %indvars.iv7.us, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv7.us, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv7.us, 1199
  br i1 %exitcond, label %.preheader._crit_edge.us, label %.preheader.us..preheader.us_crit_edge

.preheader.us..preheader.us_crit_edge:            ; preds = %.preheader.us
  br label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv38.us, 1
  %27 = icmp slt i64 %indvars.iv.next4.us, 1000
  br i1 %27, label %.preheader._crit_edge.us..preheader.preheader.us_crit_edge, label %._crit_edge

.preheader._crit_edge.us..preheader.preheader.us_crit_edge: ; preds = %.preheader._crit_edge.us
  br label %.preheader.preheader.us

.lr.ph12:                                         ; preds = %.lr.ph12..lr.ph12_crit_edge, %.lr.ph12.preheader
  %indvars.iv510 = phi i64 [ %indvars.iv.next6, %.lr.ph12..lr.ph12_crit_edge ], [ 0, %.lr.ph12.preheader ]
  %28 = trunc i64 %indvars.iv510 to i32
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv510
  store double %29, double* %30, align 8
  %exitcond15 = icmp eq i64 %indvars.iv510, 499
  br i1 %exitcond15, label %.lr.ph12..preheader.preheader.us_crit_edge, label %.lr.ph12..lr.ph12_crit_edge

.lr.ph12..lr.ph12_crit_edge:                      ; preds = %.lr.ph12
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  br label %.lr.ph12

.lr.ph12..preheader.preheader.us_crit_edge:       ; preds = %.lr.ph12
  br label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader6.preheader.lr.ph:
  %scevgep144 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader3._crit_edge..preheader6.preheader_crit_edge, %.preheader6.preheader.lr.ph
  %indvars.iv1934 = phi i64 [ 0, %.preheader6.preheader.lr.ph ], [ %indvars.iv.next20, %.preheader3._crit_edge..preheader6.preheader_crit_edge ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv1934
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0147 = icmp ugt [1200 x double]* %5, %1
  %bound1148 = icmp ult double* %4, %scevgep144
  %memcheck.conflict150 = and i1 %bound0147, %bound1148
  br i1 %memcheck.conflict150, label %.preheader6.preheader..preheader6_crit_edge, label %.preheader6.preheader.vector.body139_crit_edge

.preheader6.preheader.vector.body139_crit_edge:   ; preds = %.preheader6.preheader
  %6 = bitcast double* %4 to i64*
  br label %vector.body139

.preheader6.preheader..preheader6_crit_edge:      ; preds = %.preheader6.preheader
  %7 = bitcast double* %4 to i64*
  br label %.preheader6

vector.body139:                                   ; preds = %vector.body139.vector.body139_crit_edge, %.preheader6.preheader.vector.body139_crit_edge
  %index153 = phi i64 [ %index.next154, %vector.body139.vector.body139_crit_edge ], [ 0, %.preheader6.preheader.vector.body139_crit_edge ]
  %8 = load i64, i64* %6, align 8, !alias.scope !1
  %9 = insertelement <2 x i64> undef, i64 %8, i32 0
  %10 = shufflevector <2 x i64> %9, <2 x i64> undef, <2 x i32> zeroinitializer
  %11 = insertelement <2 x i64> undef, i64 %8, i32 0
  %12 = shufflevector <2 x i64> %11, <2 x i64> undef, <2 x i32> zeroinitializer
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index153
  %14 = bitcast double* %13 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %14, align 8, !alias.scope !4, !noalias !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x i64>*
  store <2 x i64> %12, <2 x i64>* %16, align 8, !alias.scope !4, !noalias !1
  %index.next154 = add nuw nsw i64 %index153, 4
  %17 = icmp eq i64 %index.next154, 1200
  br i1 %17, label %vector.body139..preheader2.preheader.us_crit_edge, label %vector.body139.vector.body139_crit_edge, !llvm.loop !6

vector.body139.vector.body139_crit_edge:          ; preds = %vector.body139
  br label %vector.body139

vector.body139..preheader2.preheader.us_crit_edge: ; preds = %vector.body139
  br label %.preheader2.preheader.us.preheader

.preheader2.preheader.us.preheader:               ; preds = %vector.body139..preheader2.preheader.us_crit_edge, %.preheader6..preheader2.preheader.us_crit_edge
  br label %.preheader2.preheader.us

.preheader2.preheader.us:                         ; preds = %.preheader2.preheader.us.preheader, %.preheader2._crit_edge.us..preheader2.preheader.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %.preheader2._crit_edge.us..preheader2.preheader.us_crit_edge ], [ 0, %.preheader2.preheader.us.preheader ]
  %indvars.iv924.us = phi i64 [ %indvars.iv.next10.us, %.preheader2._crit_edge.us..preheader2.preheader.us_crit_edge ], [ 1, %.preheader2.preheader.us.preheader ]
  %18 = add nuw nsw i64 %indvar, 1
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %1, i64 %18, i64 0
  %19 = add nuw nsw i64 %indvar, 2
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %1, i64 %19, i64 0
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %2, i64 %19, i64 0
  %20 = add nsw i64 %indvars.iv924.us, -1
  %bound0119 = icmp ult double* %scevgep111, %scevgep117
  %bound1120 = icmp ult double* %scevgep115, %scevgep113
  %memcheck.conflict122 = and i1 %bound0119, %bound1120
  br i1 %memcheck.conflict122, label %.preheader2.preheader.us..preheader2.us_crit_edge, label %.preheader2.preheader.us.vector.body106_crit_edge

.preheader2.preheader.us.vector.body106_crit_edge: ; preds = %.preheader2.preheader.us
  br label %vector.body106

.preheader2.preheader.us..preheader2.us_crit_edge: ; preds = %.preheader2.preheader.us
  br label %.preheader2.us

vector.body106:                                   ; preds = %vector.body106.vector.body106_crit_edge, %.preheader2.preheader.us.vector.body106_crit_edge
  %index125 = phi i64 [ %index.next126, %vector.body106.vector.body106_crit_edge ], [ 0, %.preheader2.preheader.us.vector.body106_crit_edge ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv924.us, i64 %index125
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !9, !noalias !12
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !9, !noalias !12
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv924.us, i64 %index125
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !12
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !12
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %20, i64 %index125
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !12
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !12
  %33 = fsub <2 x double> %wide.load135, %wide.load137
  %34 = fsub <2 x double> %wide.load136, %wide.load138
  %35 = fmul <2 x double> %33, <double 5.000000e-01, double 5.000000e-01>
  %36 = fmul <2 x double> %34, <double 5.000000e-01, double 5.000000e-01>
  %37 = fsub <2 x double> %wide.load133, %35
  %38 = fsub <2 x double> %wide.load134, %36
  %39 = bitcast double* %21 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !9, !noalias !12
  %40 = bitcast double* %23 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !9, !noalias !12
  %index.next126 = add nuw nsw i64 %index125, 4
  %41 = icmp eq i64 %index.next126, 1200
  br i1 %41, label %vector.body106..preheader2._crit_edge.us_crit_edge, label %vector.body106.vector.body106_crit_edge, !llvm.loop !14

vector.body106.vector.body106_crit_edge:          ; preds = %vector.body106
  br label %vector.body106

vector.body106..preheader2._crit_edge.us_crit_edge: ; preds = %vector.body106
  br label %.preheader2._crit_edge.us

.preheader2.us:                                   ; preds = %.preheader2.us..preheader2.us_crit_edge, %.preheader2.preheader.us..preheader2.us_crit_edge
  %indvars.iv722.us = phi i64 [ %indvars.iv.next8.us, %.preheader2.us..preheader2.us_crit_edge ], [ 0, %.preheader2.preheader.us..preheader2.us_crit_edge ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv924.us, i64 %indvars.iv722.us
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv924.us, i64 %indvars.iv722.us
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %20, i64 %indvars.iv722.us
  %47 = load double, double* %46, align 8
  %48 = fsub double %45, %47
  %49 = fmul double %48, 5.000000e-01
  %50 = fsub double %43, %49
  store double %50, double* %42, align 8
  %exitcond39 = icmp eq i64 %indvars.iv722.us, 1199
  br i1 %exitcond39, label %.preheader2.us..preheader2._crit_edge.us_crit_edge, label %.preheader2.us..preheader2.us_crit_edge, !llvm.loop !15

.preheader2.us..preheader2.us_crit_edge:          ; preds = %.preheader2.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv722.us, 1
  br label %.preheader2.us

.preheader2.us..preheader2._crit_edge.us_crit_edge: ; preds = %.preheader2.us
  br label %.preheader2._crit_edge.us

.preheader2._crit_edge.us:                        ; preds = %.preheader2.us..preheader2._crit_edge.us_crit_edge, %vector.body106..preheader2._crit_edge.us_crit_edge
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv924.us, 1
  %51 = icmp slt i64 %indvars.iv.next10.us, 1000
  br i1 %51, label %.preheader2._crit_edge.us..preheader2.preheader.us_crit_edge, label %.preheader2._crit_edge.us..preheader1.preheader.us_crit_edge

.preheader2._crit_edge.us..preheader1.preheader.us_crit_edge: ; preds = %.preheader2._crit_edge.us
  br label %.preheader1.preheader.us

.preheader2._crit_edge.us..preheader2.preheader.us_crit_edge: ; preds = %.preheader2._crit_edge.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %.preheader2.preheader.us

.preheader6:                                      ; preds = %.preheader6..preheader6_crit_edge, %.preheader6.preheader..preheader6_crit_edge
  %indvars.iv21 = phi i64 [ %indvars.iv.next, %.preheader6..preheader6_crit_edge ], [ 0, %.preheader6.preheader..preheader6_crit_edge ]
  %52 = load i64, i64* %7, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv21
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %exitcond = icmp eq i64 %indvars.iv21, 1199
  br i1 %exitcond, label %.preheader6..preheader2.preheader.us_crit_edge, label %.preheader6..preheader6_crit_edge, !llvm.loop !16

.preheader6..preheader6_crit_edge:                ; preds = %.preheader6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  br label %.preheader6

.preheader6..preheader2.preheader.us_crit_edge:   ; preds = %.preheader6
  br label %.preheader2.preheader.us.preheader

.preheader1.preheader.us:                         ; preds = %.preheader1._crit_edge.us..preheader1.preheader.us_crit_edge, %.preheader2._crit_edge.us..preheader1.preheader.us_crit_edge
  %indvars.iv1328.us = phi i64 [ %indvars.iv.next14.us, %.preheader1._crit_edge.us..preheader1.preheader.us_crit_edge ], [ 0, %.preheader2._crit_edge.us..preheader1.preheader.us_crit_edge ]
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 1
  %55 = add nuw nsw i64 %indvars.iv1328.us, 1
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %0, i64 %55, i64 0
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 0
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %2, i64 %55, i64 0
  %bound086 = icmp ult double* %scevgep78, %scevgep84
  %bound187 = icmp ult double* %scevgep82, %scevgep80
  %memcheck.conflict89 = and i1 %bound086, %bound187
  br i1 %memcheck.conflict89, label %.preheader1.preheader.us..preheader1.us_crit_edge, label %.preheader1.preheader.us.vector.body73_crit_edge

.preheader1.preheader.us.vector.body73_crit_edge: ; preds = %.preheader1.preheader.us
  br label %vector.body73

.preheader1.preheader.us..preheader1.us_crit_edge: ; preds = %.preheader1.preheader.us
  br label %.preheader1.us.preheader

vector.body73:                                    ; preds = %vector.body73.vector.body73_crit_edge, %.preheader1.preheader.us.vector.body73_crit_edge
  %index92 = phi i64 [ %index.next93, %vector.body73.vector.body73_crit_edge ], [ 0, %.preheader1.preheader.us.vector.body73_crit_edge ]
  %offset.idx = or i64 %index92, 1
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !17, !noalias !20
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !17, !noalias !20
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !20
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !20
  %64 = add nsw i64 %offset.idx, -1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %64
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !20
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !20
  %69 = fsub <2 x double> %wide.load102, %wide.load104
  %70 = fsub <2 x double> %wide.load103, %wide.load105
  %71 = fmul <2 x double> %69, <double 5.000000e-01, double 5.000000e-01>
  %72 = fmul <2 x double> %70, <double 5.000000e-01, double 5.000000e-01>
  %73 = fsub <2 x double> %wide.load100, %71
  %74 = fsub <2 x double> %wide.load101, %72
  %75 = bitcast double* %56 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !17, !noalias !20
  %76 = bitcast double* %58 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !17, !noalias !20
  %index.next93 = add nuw nsw i64 %index92, 4
  %77 = icmp eq i64 %index.next93, 1196
  br i1 %77, label %vector.body73..preheader1.us_crit_edge, label %vector.body73.vector.body73_crit_edge, !llvm.loop !22

vector.body73.vector.body73_crit_edge:            ; preds = %vector.body73
  br label %vector.body73

vector.body73..preheader1.us_crit_edge:           ; preds = %vector.body73
  br label %.preheader1.us.preheader

.preheader1.us.preheader:                         ; preds = %.preheader1.preheader.us..preheader1.us_crit_edge, %vector.body73..preheader1.us_crit_edge
  %indvars.iv1126.us.ph = phi i64 [ 1197, %vector.body73..preheader1.us_crit_edge ], [ 1, %.preheader1.preheader.us..preheader1.us_crit_edge ]
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %.preheader1.us..preheader1.us_crit_edge
  %indvars.iv1126.us = phi i64 [ %indvars.iv.next12.us, %.preheader1.us..preheader1.us_crit_edge ], [ %indvars.iv1126.us.ph, %.preheader1.us.preheader ]
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 %indvars.iv1126.us
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %indvars.iv1126.us
  %81 = load double, double* %80, align 8
  %82 = add nsw i64 %indvars.iv1126.us, -1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %82
  %84 = load double, double* %83, align 8
  %85 = fsub double %81, %84
  %86 = fmul double %85, 5.000000e-01
  %87 = fsub double %79, %86
  store double %87, double* %78, align 8
  %exitcond41 = icmp eq i64 %indvars.iv1126.us, 1199
  br i1 %exitcond41, label %.preheader1._crit_edge.us, label %.preheader1.us..preheader1.us_crit_edge, !llvm.loop !23

.preheader1.us..preheader1.us_crit_edge:          ; preds = %.preheader1.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1126.us, 1
  br label %.preheader1.us

.preheader1._crit_edge.us:                        ; preds = %.preheader1.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1328.us, 1
  %88 = icmp slt i64 %indvars.iv.next14.us, 1000
  br i1 %88, label %.preheader1._crit_edge.us..preheader1.preheader.us_crit_edge, label %.preheader1._crit_edge.us..preheader.preheader.us_crit_edge

.preheader1._crit_edge.us..preheader.preheader.us_crit_edge: ; preds = %.preheader1._crit_edge.us
  br label %.preheader.preheader.us

.preheader1._crit_edge.us..preheader1.preheader.us_crit_edge: ; preds = %.preheader1._crit_edge.us
  br label %.preheader1.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us..preheader.preheader.us_crit_edge, %.preheader1._crit_edge.us..preheader.preheader.us_crit_edge
  %indvars.iv1732.us = phi i64 [ %90, %.preheader._crit_edge.us..preheader.preheader.us_crit_edge ], [ 0, %.preheader1._crit_edge.us..preheader.preheader.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 0
  %scevgep50 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 1199
  %scevgep52 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 0
  %89 = add nuw nsw i64 %indvars.iv1732.us, 1
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %0, i64 %89, i64 0
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv1732.us, i64 0
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %1, i64 %89, i64 1199
  %90 = add nuw nsw i64 %indvars.iv1732.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep54
  %bound1 = icmp ult double* %scevgep52, %scevgep50
  %found.conflict = and i1 %bound0, %bound1
  %bound060 = icmp ult double* %scevgep, %scevgep58
  %bound161 = icmp ult double* %scevgep56, %scevgep50
  %found.conflict62 = and i1 %bound060, %bound161
  %conflict.rdx = or i1 %found.conflict, %found.conflict62
  br i1 %conflict.rdx, label %.preheader.preheader.us..preheader.us_crit_edge, label %.preheader.preheader.us.vector.body_crit_edge

.preheader.preheader.us.vector.body_crit_edge:    ; preds = %.preheader.preheader.us
  br label %vector.body

.preheader.preheader.us..preheader.us_crit_edge:  ; preds = %.preheader.preheader.us
  br label %.preheader.us.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %.preheader.preheader.us.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %.preheader.preheader.us.vector.body_crit_edge ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !24, !noalias !27
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !24, !noalias !27
  %95 = or i64 %index, 1
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %95
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !30
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !30
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %index
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !30
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !30
  %104 = fsub <2 x double> %wide.load65, %wide.load67
  %105 = fsub <2 x double> %wide.load66, %wide.load68
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %90, i64 %index
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !31
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !31
  %110 = fadd <2 x double> %104, %wide.load69
  %111 = fadd <2 x double> %105, %wide.load70
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1732.us, i64 %index
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !31
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !31
  %116 = fsub <2 x double> %110, %wide.load71
  %117 = fsub <2 x double> %111, %wide.load72
  %118 = fmul <2 x double> %116, <double 7.000000e-01, double 7.000000e-01>
  %119 = fmul <2 x double> %117, <double 7.000000e-01, double 7.000000e-01>
  %120 = fsub <2 x double> %wide.load, %118
  %121 = fsub <2 x double> %wide.load64, %119
  %122 = bitcast double* %91 to <2 x double>*
  store <2 x double> %120, <2 x double>* %122, align 8, !alias.scope !24, !noalias !27
  %123 = bitcast double* %93 to <2 x double>*
  store <2 x double> %121, <2 x double>* %123, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %124 = icmp eq i64 %index.next, 1196
  br i1 %124, label %vector.body..preheader.us_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !32

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body..preheader.us_crit_edge:              ; preds = %vector.body
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.preheader.us..preheader.us_crit_edge, %vector.body..preheader.us_crit_edge
  %indvars.iv1530.us.ph = phi i64 [ 1196, %vector.body..preheader.us_crit_edge ], [ 0, %.preheader.preheader.us..preheader.us_crit_edge ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us..preheader.us_crit_edge
  %indvars.iv1530.us = phi i64 [ %indvars.iv.next16.us, %.preheader.us..preheader.us_crit_edge ], [ %indvars.iv1530.us.ph, %.preheader.us.preheader ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 %indvars.iv1530.us
  %126 = load double, double* %125, align 8
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1530.us, 1
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %indvars.iv.next16.us
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %indvars.iv1530.us
  %130 = load double, double* %129, align 8
  %131 = fsub double %128, %130
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %90, i64 %indvars.iv1530.us
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1732.us, i64 %indvars.iv1530.us
  %136 = load double, double* %135, align 8
  %137 = fsub double %134, %136
  %138 = fmul double %137, 7.000000e-01
  %139 = fsub double %126, %138
  store double %139, double* %125, align 8
  %140 = icmp slt i64 %indvars.iv.next16.us, 1199
  br i1 %140, label %.preheader.us..preheader.us_crit_edge, label %.preheader._crit_edge.us, !llvm.loop !33

.preheader.us..preheader.us_crit_edge:            ; preds = %.preheader.us
  br label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %141 = icmp slt i64 %90, 999
  br i1 %141, label %.preheader._crit_edge.us..preheader.preheader.us_crit_edge, label %.preheader3._crit_edge

.preheader._crit_edge.us..preheader.preheader.us_crit_edge: ; preds = %.preheader._crit_edge.us
  br label %.preheader.preheader.us

.preheader3._crit_edge:                           ; preds = %.preheader._crit_edge.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1934, 1
  %142 = icmp slt i64 %indvars.iv.next20, 500
  br i1 %142, label %.preheader3._crit_edge..preheader6.preheader_crit_edge, label %._crit_edge

.preheader3._crit_edge..preheader6.preheader_crit_edge: ; preds = %.preheader3._crit_edge
  br label %.preheader6.preheader

._crit_edge:                                      ; preds = %.preheader3._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader8.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader8.preheader.us

.preheader8.preheader.us:                         ; preds = %.preheader8._crit_edge.us..preheader8.preheader.us_crit_edge, %.preheader8.preheader.us.preheader
  %indvars.iv1729.us = phi i64 [ %indvars.iv.next18.us, %.preheader8._crit_edge.us..preheader8.preheader.us_crit_edge ], [ 0, %.preheader8.preheader.us.preheader ]
  %7 = mul nsw i64 %indvars.iv1729.us, 1000
  br label %.preheader8.us._crit_edge

.preheader8.us._crit_edge:                        ; preds = %.preheader8.us..preheader8.us._crit_edge_crit_edge, %.preheader8.preheader.us
  %indvars.iv1527.us = phi i64 [ 0, %.preheader8.preheader.us ], [ %indvars.iv.next16.us, %.preheader8.us..preheader8.us._crit_edge_crit_edge ]
  %8 = add nsw i64 %indvars.iv1527.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader8.us._crit_edge..preheader8.us_crit_edge

.preheader8.us._crit_edge..preheader8.us_crit_edge: ; preds = %.preheader8.us._crit_edge
  br label %.preheader8.us

; <label>:12:                                     ; preds = %.preheader8.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us._crit_edge..preheader8.us_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1729.us, i64 %indvars.iv1527.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1527.us, 1
  %18 = icmp slt i64 %indvars.iv.next16.us, 1200
  br i1 %18, label %.preheader8.us..preheader8.us._crit_edge_crit_edge, label %.preheader8._crit_edge.us

.preheader8.us..preheader8.us._crit_edge_crit_edge: ; preds = %.preheader8.us
  br label %.preheader8.us._crit_edge

.preheader8._crit_edge.us:                        ; preds = %.preheader8.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1729.us, 1
  %19 = icmp slt i64 %indvars.iv.next18.us, 1000
  br i1 %19, label %.preheader8._crit_edge.us..preheader8.preheader.us_crit_edge, label %._crit_edge31

.preheader8._crit_edge.us..preheader8.preheader.us_crit_edge: ; preds = %.preheader8._crit_edge.us
  br label %.preheader8.preheader.us

._crit_edge31:                                    ; preds = %.preheader8._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader7.preheader.us

.preheader7.preheader.us:                         ; preds = %.preheader7._crit_edge.us..preheader7.preheader.us_crit_edge, %._crit_edge31
  %indvars.iv1324.us = phi i64 [ %indvars.iv.next14.us, %.preheader7._crit_edge.us..preheader7.preheader.us_crit_edge ], [ 0, %._crit_edge31 ]
  %26 = mul nsw i64 %indvars.iv1324.us, 1000
  br label %.preheader7.us._crit_edge

.preheader7.us._crit_edge:                        ; preds = %.preheader7.us..preheader7.us._crit_edge_crit_edge, %.preheader7.preheader.us
  %indvars.iv1122.us = phi i64 [ 0, %.preheader7.preheader.us ], [ %indvars.iv.next12.us, %.preheader7.us..preheader7.us._crit_edge_crit_edge ]
  %27 = add nsw i64 %indvars.iv1122.us, %26
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %.preheader7.us._crit_edge..preheader7.us_crit_edge

.preheader7.us._crit_edge..preheader7.us_crit_edge: ; preds = %.preheader7.us._crit_edge
  br label %.preheader7.us

; <label>:31:                                     ; preds = %.preheader7.us._crit_edge
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #4
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us._crit_edge..preheader7.us_crit_edge, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1324.us, i64 %indvars.iv1122.us
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #5
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  %37 = icmp slt i64 %indvars.iv.next12.us, 1200
  br i1 %37, label %.preheader7.us..preheader7.us._crit_edge_crit_edge, label %.preheader7._crit_edge.us

.preheader7.us..preheader7.us._crit_edge_crit_edge: ; preds = %.preheader7.us
  br label %.preheader7.us._crit_edge

.preheader7._crit_edge.us:                        ; preds = %.preheader7.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  %38 = icmp slt i64 %indvars.iv.next14.us, 1000
  br i1 %38, label %.preheader7._crit_edge.us..preheader7.preheader.us_crit_edge, label %._crit_edge26

.preheader7._crit_edge.us..preheader7.preheader.us_crit_edge: ; preds = %.preheader7._crit_edge.us
  br label %.preheader7.preheader.us

._crit_edge26:                                    ; preds = %.preheader7._crit_edge.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us..preheader.preheader.us_crit_edge, %._crit_edge26
  %indvars.iv920.us = phi i64 [ %indvars.iv.next10.us, %.preheader._crit_edge.us..preheader.preheader.us_crit_edge ], [ 0, %._crit_edge26 ]
  %43 = mul nsw i64 %indvars.iv920.us, 1000
  br label %.preheader.us._crit_edge

.preheader.us._crit_edge:                         ; preds = %.preheader.us..preheader.us._crit_edge_crit_edge, %.preheader.preheader.us
  %indvars.iv19.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us..preheader.us._crit_edge_crit_edge ]
  %44 = add nsw i64 %indvars.iv19.us, %43
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, 20
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %.preheader.us._crit_edge..preheader.us_crit_edge

.preheader.us._crit_edge..preheader.us_crit_edge: ; preds = %.preheader.us._crit_edge
  br label %.preheader.us

; <label>:48:                                     ; preds = %.preheader.us._crit_edge
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %49) #4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us._crit_edge..preheader.us_crit_edge, %48
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv920.us, i64 %indvars.iv19.us
  %52 = load double, double* %51, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %52) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %54 = icmp slt i64 %indvars.iv.next.us, 1200
  br i1 %54, label %.preheader.us..preheader.us._crit_edge_crit_edge, label %.preheader._crit_edge.us

.preheader.us..preheader.us._crit_edge_crit_edge: ; preds = %.preheader.us
  br label %.preheader.us._crit_edge

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv920.us, 1
  %55 = icmp slt i64 %indvars.iv.next10.us, 1000
  br i1 %55, label %.preheader._crit_edge.us..preheader.preheader.us_crit_edge, label %._crit_edge

.preheader._crit_edge.us..preheader.preheader.us_crit_edge: ; preds = %.preheader._crit_edge.us
  br label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !7, !8}
!33 = distinct !{!33, !7, !8}
