; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]*, [1200 x double]*, double* nocapture) unnamed_addr #2 {
.lr.ph4.preheader:
  br label %.lr.ph4

.preheader.us:                                    ; preds = %.lr.ph4..preheader.us_crit_edge, %._crit_edge.us..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.lr.ph4..preheader.us_crit_edge ]
  %4 = trunc i64 %indvars.iv6 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %27 = icmp slt i64 %indvars.iv.next7, 1000
  br i1 %27, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge2

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4..lr.ph4_crit_edge, %.lr.ph4.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %.lr.ph4..lr.ph4_crit_edge ], [ 0, %.lr.ph4.preheader ]
  %28 = trunc i64 %indvars.iv9 to i32
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  store double %29, double* %30, align 8
  %exitcond12 = icmp eq i64 %indvars.iv9, 499
  br i1 %exitcond12, label %.lr.ph4..preheader.us_crit_edge, label %.lr.ph4..lr.ph4_crit_edge

.lr.ph4..lr.ph4_crit_edge:                        ; preds = %.lr.ph4
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  br label %.lr.ph4

.lr.ph4..preheader.us_crit_edge:                  ; preds = %.lr.ph4
  br label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.preheader6.lr.ph:
  %scevgep148 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  %4 = bitcast double* %scevgep148 to i8*
  %5 = ptrtoint double* %3 to i64
  %6 = bitcast [1200 x double]* %1 to i8*
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12..preheader6_crit_edge, %.preheader6.lr.ph
  %indvars.iv41 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next42, %._crit_edge12..preheader6_crit_edge ]
  %sunkaddr43 = shl i64 %indvars.iv41, 3
  %sunkaddr44 = add i64 %5, %sunkaddr43
  %bc = inttoptr i64 %sunkaddr44 to i8*
  %bc150 = inttoptr i64 %sunkaddr44 to i8*
  %bound0151 = icmp ult i8* %6, %bc150
  %bound1152 = icmp ult i8* %bc, %4
  %memcheck.conflict154 = and i1 %bound0151, %bound1152
  br i1 %memcheck.conflict154, label %.preheader6.scalar.ph145_crit_edge, label %.preheader6.vector.body143_crit_edge

.preheader6.vector.body143_crit_edge:             ; preds = %.preheader6
  %7 = inttoptr i64 %sunkaddr44 to i64*
  br label %vector.body143

.preheader6.scalar.ph145_crit_edge:               ; preds = %.preheader6
  %8 = inttoptr i64 %sunkaddr44 to i64*
  br label %scalar.ph145

vector.body143:                                   ; preds = %vector.body143.vector.body143_crit_edge, %.preheader6.vector.body143_crit_edge
  %index157 = phi i64 [ %index.next158, %vector.body143.vector.body143_crit_edge ], [ 0, %.preheader6.vector.body143_crit_edge ]
  %9 = load i64, i64* %7, align 8, !alias.scope !1
  %10 = insertelement <2 x i64> undef, i64 %9, i32 0
  %11 = shufflevector <2 x i64> %10, <2 x i64> undef, <2 x i32> zeroinitializer
  %12 = insertelement <2 x i64> undef, i64 %9, i32 0
  %13 = shufflevector <2 x i64> %12, <2 x i64> undef, <2 x i32> zeroinitializer
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index157
  %15 = bitcast double* %14 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %15, align 8, !alias.scope !4, !noalias !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x i64>*
  store <2 x i64> %13, <2 x i64>* %17, align 8, !alias.scope !4, !noalias !1
  %index.next158 = add nuw nsw i64 %index157, 4
  %18 = icmp eq i64 %index.next158, 1200
  br i1 %18, label %vector.body143..preheader2.us_crit_edge, label %vector.body143.vector.body143_crit_edge, !llvm.loop !6

vector.body143.vector.body143_crit_edge:          ; preds = %vector.body143
  br label %vector.body143

vector.body143..preheader2.us_crit_edge:          ; preds = %vector.body143
  br label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %vector.body143..preheader2.us_crit_edge, %scalar.ph145..preheader2.us_crit_edge
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us..preheader2.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us..preheader2.us_crit_edge ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us..preheader2.us_crit_edge ], [ 1, %.preheader2.us.preheader ]
  %19 = add i64 %indvar, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %1, i64 %19, i64 0
  %20 = add i64 %indvar, 2
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %1, i64 %20, i64 0
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep121 = getelementptr [1200 x double], [1200 x double]* %2, i64 %20, i64 0
  %21 = add nsw i64 %indvars.iv25, -1
  %bound0123 = icmp ult double* %scevgep115, %scevgep121
  %bound1124 = icmp ult double* %scevgep119, %scevgep117
  %memcheck.conflict126 = and i1 %bound0123, %bound1124
  br i1 %memcheck.conflict126, label %.preheader2.us.scalar.ph112_crit_edge, label %.preheader2.us.vector.body110_crit_edge

.preheader2.us.vector.body110_crit_edge:          ; preds = %.preheader2.us
  br label %vector.body110

.preheader2.us.scalar.ph112_crit_edge:            ; preds = %.preheader2.us
  br label %scalar.ph112

vector.body110:                                   ; preds = %vector.body110.vector.body110_crit_edge, %.preheader2.us.vector.body110_crit_edge
  %index129 = phi i64 [ %index.next130, %vector.body110.vector.body110_crit_edge ], [ 0, %.preheader2.us.vector.body110_crit_edge ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %index129
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !9, !noalias !12
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !9, !noalias !12
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %index129
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !12
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !12
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %21, i64 %index129
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load141 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !12
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !12
  %34 = fsub <2 x double> %wide.load139, %wide.load141
  %35 = fsub <2 x double> %wide.load140, %wide.load142
  %36 = fmul <2 x double> %34, <double 5.000000e-01, double 5.000000e-01>
  %37 = fmul <2 x double> %35, <double 5.000000e-01, double 5.000000e-01>
  %38 = fsub <2 x double> %wide.load137, %36
  %39 = fsub <2 x double> %wide.load138, %37
  %40 = bitcast double* %22 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !9, !noalias !12
  %41 = bitcast double* %24 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8, !alias.scope !9, !noalias !12
  %index.next130 = add nuw nsw i64 %index129, 4
  %42 = icmp eq i64 %index.next130, 1200
  br i1 %42, label %vector.body110.._crit_edge.us_crit_edge, label %vector.body110.vector.body110_crit_edge, !llvm.loop !14

vector.body110.vector.body110_crit_edge:          ; preds = %vector.body110
  br label %vector.body110

vector.body110.._crit_edge.us_crit_edge:          ; preds = %vector.body110
  br label %._crit_edge.us

scalar.ph112:                                     ; preds = %scalar.ph112.scalar.ph112_crit_edge, %.preheader2.us.scalar.ph112_crit_edge
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %scalar.ph112.scalar.ph112_crit_edge ], [ 0, %.preheader2.us.scalar.ph112_crit_edge ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv21
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %21, i64 %indvars.iv21
  %48 = load double, double* %47, align 8
  %49 = fsub double %46, %48
  %50 = fmul double %49, 5.000000e-01
  %51 = fsub double %44, %50
  store double %51, double* %43, align 8
  %exitcond24 = icmp eq i64 %indvars.iv21, 1199
  br i1 %exitcond24, label %scalar.ph112.._crit_edge.us_crit_edge, label %scalar.ph112.scalar.ph112_crit_edge, !llvm.loop !15

scalar.ph112.scalar.ph112_crit_edge:              ; preds = %scalar.ph112
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  br label %scalar.ph112

scalar.ph112.._crit_edge.us_crit_edge:            ; preds = %scalar.ph112
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %scalar.ph112.._crit_edge.us_crit_edge, %vector.body110.._crit_edge.us_crit_edge
  %indvars.iv.next26 = add nuw i64 %indvars.iv25, 1
  %52 = icmp slt i64 %indvars.iv.next26, 1000
  br i1 %52, label %._crit_edge.us..preheader2.us_crit_edge, label %._crit_edge.us..preheader1.us_crit_edge

._crit_edge.us..preheader1.us_crit_edge:          ; preds = %._crit_edge.us
  br label %.preheader1.us

._crit_edge.us..preheader2.us_crit_edge:          ; preds = %._crit_edge.us
  %indvar.next = add i64 %indvar, 1
  br label %.preheader2.us

scalar.ph145:                                     ; preds = %scalar.ph145.scalar.ph145_crit_edge, %.preheader6.scalar.ph145_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph145.scalar.ph145_crit_edge ], [ 0, %.preheader6.scalar.ph145_crit_edge ]
  %53 = load i64, i64* %8, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %scalar.ph145..preheader2.us_crit_edge, label %scalar.ph145.scalar.ph145_crit_edge, !llvm.loop !16

scalar.ph145.scalar.ph145_crit_edge:              ; preds = %scalar.ph145
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph145

scalar.ph145..preheader2.us_crit_edge:            ; preds = %scalar.ph145
  br label %.preheader2.us.preheader

.preheader1.us:                                   ; preds = %._crit_edge9.us..preheader1.us_crit_edge, %._crit_edge.us..preheader1.us_crit_edge
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge9.us..preheader1.us_crit_edge ], [ 0, %._crit_edge.us..preheader1.us_crit_edge ]
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 1
  %56 = add i64 %indvars.iv32, 1
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %0, i64 %56, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %2, i64 %56, i64 0
  %bound090 = icmp ult double* %scevgep82, %scevgep88
  %bound191 = icmp ult double* %scevgep86, %scevgep84
  %memcheck.conflict93 = and i1 %bound090, %bound191
  br i1 %memcheck.conflict93, label %.preheader1.us.scalar.ph79_crit_edge, label %.preheader1.us.vector.body77_crit_edge

.preheader1.us.vector.body77_crit_edge:           ; preds = %.preheader1.us
  br label %vector.body77

.preheader1.us.scalar.ph79_crit_edge:             ; preds = %.preheader1.us
  br label %scalar.ph79.preheader

vector.body77:                                    ; preds = %vector.body77.vector.body77_crit_edge, %.preheader1.us.vector.body77_crit_edge
  %index96 = phi i64 [ %index.next97, %vector.body77.vector.body77_crit_edge ], [ 0, %.preheader1.us.vector.body77_crit_edge ]
  %offset.idx = or i64 %index96, 1
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %offset.idx
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !17, !noalias !20
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !17, !noalias !20
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !20
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !20
  %65 = add nsw i64 %offset.idx, -1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %65
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !20
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !20
  %70 = fsub <2 x double> %wide.load106, %wide.load108
  %71 = fsub <2 x double> %wide.load107, %wide.load109
  %72 = fmul <2 x double> %70, <double 5.000000e-01, double 5.000000e-01>
  %73 = fmul <2 x double> %71, <double 5.000000e-01, double 5.000000e-01>
  %74 = fsub <2 x double> %wide.load104, %72
  %75 = fsub <2 x double> %wide.load105, %73
  %76 = bitcast double* %57 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !17, !noalias !20
  %77 = bitcast double* %59 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !17, !noalias !20
  %index.next97 = add nuw nsw i64 %index96, 4
  %78 = icmp eq i64 %index.next97, 1196
  br i1 %78, label %vector.body77.scalar.ph79_crit_edge, label %vector.body77.vector.body77_crit_edge, !llvm.loop !22

vector.body77.vector.body77_crit_edge:            ; preds = %vector.body77
  br label %vector.body77

vector.body77.scalar.ph79_crit_edge:              ; preds = %vector.body77
  br label %scalar.ph79.preheader

scalar.ph79.preheader:                            ; preds = %.preheader1.us.scalar.ph79_crit_edge, %vector.body77.scalar.ph79_crit_edge
  %indvars.iv28.ph = phi i64 [ 1197, %vector.body77.scalar.ph79_crit_edge ], [ 1, %.preheader1.us.scalar.ph79_crit_edge ]
  br label %scalar.ph79

scalar.ph79:                                      ; preds = %scalar.ph79.preheader, %scalar.ph79.scalar.ph79_crit_edge
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %scalar.ph79.scalar.ph79_crit_edge ], [ %indvars.iv28.ph, %scalar.ph79.preheader ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28
  %82 = load double, double* %81, align 8
  %83 = add nsw i64 %indvars.iv28, -1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fsub double %82, %85
  %87 = fmul double %86, 5.000000e-01
  %88 = fsub double %80, %87
  store double %88, double* %79, align 8
  %exitcond31 = icmp eq i64 %indvars.iv28, 1199
  br i1 %exitcond31, label %._crit_edge9.us, label %scalar.ph79.scalar.ph79_crit_edge, !llvm.loop !23

scalar.ph79.scalar.ph79_crit_edge:                ; preds = %scalar.ph79
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  br label %scalar.ph79

._crit_edge9.us:                                  ; preds = %scalar.ph79
  %indvars.iv.next33 = add nuw i64 %indvars.iv32, 1
  %89 = icmp slt i64 %indvars.iv.next33, 1000
  br i1 %89, label %._crit_edge9.us..preheader1.us_crit_edge, label %._crit_edge9.us..preheader.us_crit_edge

._crit_edge9.us..preheader.us_crit_edge:          ; preds = %._crit_edge9.us
  br label %.preheader.us

._crit_edge9.us..preheader1.us_crit_edge:         ; preds = %._crit_edge9.us
  br label %.preheader1.us

.preheader.us:                                    ; preds = %._crit_edge11.us..preheader.us_crit_edge, %._crit_edge9.us..preheader.us_crit_edge
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge11.us..preheader.us_crit_edge ], [ 0, %._crit_edge9.us..preheader.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 0
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 1199
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 0
  %90 = add nuw nsw i64 %indvars.iv39, 1
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %0, i64 %90, i64 0
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %1, i64 %90, i64 1199
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound0 = icmp ult double* %scevgep, %scevgep58
  %bound1 = icmp ult double* %scevgep56, %scevgep54
  %found.conflict = and i1 %bound0, %bound1
  %bound064 = icmp ult double* %scevgep, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep54
  %found.conflict66 = and i1 %bound064, %bound165
  %conflict.rdx = or i1 %found.conflict, %found.conflict66
  br i1 %conflict.rdx, label %.preheader.us.._crit_edge19_crit_edge, label %.preheader.us.vector.body_crit_edge

.preheader.us.vector.body_crit_edge:              ; preds = %.preheader.us
  br label %vector.body

.preheader.us.._crit_edge19_crit_edge:            ; preds = %.preheader.us
  br label %._crit_edge19.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %.preheader.us.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %.preheader.us.vector.body_crit_edge ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !24, !noalias !27
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !24, !noalias !27
  %95 = or i64 %index, 1
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %95
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !30
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !30
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %index
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !30
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !30
  %104 = fsub <2 x double> %wide.load69, %wide.load71
  %105 = fsub <2 x double> %wide.load70, %wide.load72
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next40, i64 %index
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !31
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !31
  %110 = fadd <2 x double> %104, %wide.load73
  %111 = fadd <2 x double> %105, %wide.load74
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %index
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !31
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !31
  %116 = fsub <2 x double> %110, %wide.load75
  %117 = fsub <2 x double> %111, %wide.load76
  %118 = fmul <2 x double> %116, <double 7.000000e-01, double 7.000000e-01>
  %119 = fmul <2 x double> %117, <double 7.000000e-01, double 7.000000e-01>
  %120 = fsub <2 x double> %wide.load, %118
  %121 = fsub <2 x double> %wide.load68, %119
  %122 = bitcast double* %91 to <2 x double>*
  store <2 x double> %120, <2 x double>* %122, align 8, !alias.scope !24, !noalias !27
  %123 = bitcast double* %93 to <2 x double>*
  store <2 x double> %121, <2 x double>* %123, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %124 = icmp eq i64 %index.next, 1196
  br i1 %124, label %vector.body.._crit_edge19_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !32

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body.._crit_edge19_crit_edge:              ; preds = %vector.body
  br label %._crit_edge19.preheader

._crit_edge19.preheader:                          ; preds = %.preheader.us.._crit_edge19_crit_edge, %vector.body.._crit_edge19_crit_edge
  %indvars.iv35.ph = phi i64 [ 1196, %vector.body.._crit_edge19_crit_edge ], [ 0, %.preheader.us.._crit_edge19_crit_edge ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.preheader, %._crit_edge19.._crit_edge19_crit_edge
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge19.._crit_edge19_crit_edge ], [ %indvars.iv35.ph, %._crit_edge19.preheader ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  %126 = load double, double* %125, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next36
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv35
  %130 = load double, double* %129, align 8
  %131 = fsub double %128, %130
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next40, i64 %indvars.iv35
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv35
  %136 = load double, double* %135, align 8
  %137 = fsub double %134, %136
  %138 = fmul double %137, 7.000000e-01
  %139 = fsub double %126, %138
  store double %139, double* %125, align 8
  %exitcond38 = icmp eq i64 %indvars.iv35, 1198
  br i1 %exitcond38, label %._crit_edge11.us, label %._crit_edge19.._crit_edge19_crit_edge, !llvm.loop !33

._crit_edge19.._crit_edge19_crit_edge:            ; preds = %._crit_edge19
  br label %._crit_edge19

._crit_edge11.us:                                 ; preds = %._crit_edge19
  %140 = icmp slt i64 %indvars.iv.next40, 999
  br i1 %140, label %._crit_edge11.us..preheader.us_crit_edge, label %._crit_edge12

._crit_edge11.us..preheader.us_crit_edge:         ; preds = %._crit_edge11.us
  br label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next42 = add nuw i64 %indvars.iv41, 1
  %141 = icmp slt i64 %indvars.iv.next42, 500
  br i1 %141, label %._crit_edge12..preheader6_crit_edge, label %._crit_edge13

._crit_edge12..preheader6_crit_edge:              ; preds = %._crit_edge12
  br label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader8.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us..preheader8.us_crit_edge, %.preheader8.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next34, %._crit_edge14.us..preheader8.us_crit_edge ]
  %7 = mul nsw i64 %indvars.iv33, 1000
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge.._crit_edge19_crit_edge, %.preheader8.us
  %indvars.iv31 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next32, %._crit_edge.._crit_edge19_crit_edge ]
  %8 = add nsw i64 %indvars.iv31, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge19.._crit_edge_crit_edge

._crit_edge19.._crit_edge_crit_edge:              ; preds = %._crit_edge19
  br label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge19
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19.._crit_edge_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv31
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next32 = add nuw i64 %indvars.iv31, 1
  %18 = icmp slt i64 %indvars.iv.next32, 1200
  br i1 %18, label %._crit_edge.._crit_edge19_crit_edge, label %._crit_edge14.us

._crit_edge.._crit_edge19_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge19

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next34 = add nuw i64 %indvars.iv33, 1
  %19 = icmp slt i64 %indvars.iv.next34, 1000
  br i1 %19, label %._crit_edge14.us..preheader8.us_crit_edge, label %._crit_edge15

._crit_edge14.us..preheader8.us_crit_edge:        ; preds = %._crit_edge14.us
  br label %.preheader8.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us..preheader7.us_crit_edge, %._crit_edge15
  %indvars.iv28 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next29, %._crit_edge11.us..preheader7.us_crit_edge ]
  %26 = mul nsw i64 %indvars.iv28, 1000
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge20.._crit_edge21_crit_edge, %.preheader7.us
  %indvars.iv26 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next27, %._crit_edge20.._crit_edge21_crit_edge ]
  %27 = add nsw i64 %indvars.iv26, %26
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge21.._crit_edge20_crit_edge

._crit_edge21.._crit_edge20_crit_edge:            ; preds = %._crit_edge21
  br label %._crit_edge20

; <label>:31:                                     ; preds = %._crit_edge21
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = call i32 @fputc(i32 10, %struct._IO_FILE* %32) #5
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge21.._crit_edge20_crit_edge, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv26
  %35 = load double, double* %34, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #6
  %indvars.iv.next27 = add nuw i64 %indvars.iv26, 1
  %37 = icmp slt i64 %indvars.iv.next27, 1200
  br i1 %37, label %._crit_edge20.._crit_edge21_crit_edge, label %._crit_edge11.us

._crit_edge20.._crit_edge21_crit_edge:            ; preds = %._crit_edge20
  br label %._crit_edge21

._crit_edge11.us:                                 ; preds = %._crit_edge20
  %indvars.iv.next29 = add nuw i64 %indvars.iv28, 1
  %38 = icmp slt i64 %indvars.iv.next29, 1000
  br i1 %38, label %._crit_edge11.us..preheader7.us_crit_edge, label %._crit_edge12

._crit_edge11.us..preheader7.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %._crit_edge12
  %indvars.iv24 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next25, %._crit_edge.us..preheader.us_crit_edge ]
  %43 = mul nsw i64 %indvars.iv24, 1000
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge22.._crit_edge23_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge22.._crit_edge23_crit_edge ]
  %44 = add nsw i64 %indvars.iv, %43
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, 20
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %._crit_edge23.._crit_edge22_crit_edge

._crit_edge23.._crit_edge22_crit_edge:            ; preds = %._crit_edge23
  br label %._crit_edge22

; <label>:48:                                     ; preds = %._crit_edge23
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %49) #5
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge23.._crit_edge22_crit_edge, %48
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %52) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %54 = icmp slt i64 %indvars.iv.next, 1200
  br i1 %54, label %._crit_edge22.._crit_edge23_crit_edge, label %._crit_edge.us

._crit_edge22.._crit_edge23_crit_edge:            ; preds = %._crit_edge22
  br label %._crit_edge23

._crit_edge.us:                                   ; preds = %._crit_edge22
  %indvars.iv.next25 = add nuw i64 %indvars.iv24, 1
  %55 = icmp slt i64 %indvars.iv.next25, 1000
  br i1 %55, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge9

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
