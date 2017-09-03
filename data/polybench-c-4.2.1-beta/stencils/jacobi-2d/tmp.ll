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
  br i1 %7, label %8, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %.._crit_edge_crit_edge13

.._crit_edge_crit_edge13:                         ; preds = %8
  br label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [1300 x double]*
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %.._crit_edge_crit_edge13, %.._crit_edge_crit_edge
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  %3 = trunc i64 %indvars.iv20 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv
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
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %7

._crit_edge.us:                                   ; preds = %7
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1300
  br i1 %exitcond23, label %._crit_edge19, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader55.lr.ph:
  br label %.preheader55

.preheader55:                                     ; preds = %._crit_edge62..preheader55_crit_edge, %.preheader55.lr.ph
  %.05263 = phi i32 [ 0, %.preheader55.lr.ph ], [ %118, %._crit_edge62..preheader55_crit_edge ]
  br label %.preheader53.us

.preheader53.us:                                  ; preds = %._crit_edge.us..preheader53.us_crit_edge, %.preheader55
  %indvar100 = phi i64 [ 0, %.preheader55 ], [ %indvar.next101, %._crit_edge.us..preheader53.us_crit_edge ]
  %indvars.iv65 = phi i64 [ 1, %.preheader55 ], [ %indvars.iv.next66, %._crit_edge.us..preheader53.us_crit_edge ]
  %4 = add i64 %indvar100, 1
  %scevgep102 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1
  %scevgep104 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1299
  %scevgep106 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar100, i64 1
  %5 = add i64 %indvar100, 2
  %scevgep108 = getelementptr [1300 x double], [1300 x double]* %2, i64 %5, i64 1299
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %6 = add nsw i64 %indvars.iv65, -1
  %bound0110 = icmp ult double* %scevgep102, %scevgep108
  %bound1111 = icmp ult double* %scevgep106, %scevgep104
  %memcheck.conflict113 = and i1 %bound0110, %bound1111
  br i1 %memcheck.conflict113, label %.preheader53.us.scalar.ph97_crit_edge, label %.preheader53.us.vector.body95_crit_edge

.preheader53.us.vector.body95_crit_edge:          ; preds = %.preheader53.us
  br label %vector.body95

.preheader53.us.scalar.ph97_crit_edge:            ; preds = %.preheader53.us
  br label %scalar.ph97.preheader

vector.body95:                                    ; preds = %vector.body95.vector.body95_crit_edge, %.preheader53.us.vector.body95_crit_edge
  %index116 = phi i64 [ %index.next117, %vector.body95.vector.body95_crit_edge ], [ 0, %.preheader53.us.vector.body95_crit_edge ]
  %offset.idx120 = or i64 %index116, 1
  %7 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %offset.idx120
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = add nsw i64 %offset.idx120, -1
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load125, %wide.load127
  %17 = fadd <2 x double> %wide.load126, %wide.load128
  %18 = add nuw nsw i64 %offset.idx120, 1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %16, %wide.load129
  %24 = fadd <2 x double> %17, %wide.load130
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next66, i64 %offset.idx120
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %23, %wide.load131
  %30 = fadd <2 x double> %24, %wide.load132
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %offset.idx120
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load133
  %36 = fadd <2 x double> %30, %wide.load134
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %offset.idx120
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next117 = add i64 %index116, 4
  %43 = icmp eq i64 %index.next117, 1296
  br i1 %43, label %vector.body95.scalar.ph97_crit_edge, label %vector.body95.vector.body95_crit_edge, !llvm.loop !6

vector.body95.vector.body95_crit_edge:            ; preds = %vector.body95
  br label %vector.body95

vector.body95.scalar.ph97_crit_edge:              ; preds = %vector.body95
  br label %scalar.ph97.preheader

scalar.ph97.preheader:                            ; preds = %vector.body95.scalar.ph97_crit_edge, %.preheader53.us.scalar.ph97_crit_edge
  %indvars.iv.ph = phi i64 [ 1297, %vector.body95.scalar.ph97_crit_edge ], [ 1, %.preheader53.us.scalar.ph97_crit_edge ]
  br label %scalar.ph97

scalar.ph97:                                      ; preds = %scalar.ph97.scalar.ph97_crit_edge, %scalar.ph97.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph97.scalar.ph97_crit_edge ], [ %indvars.iv.ph, %scalar.ph97.preheader ]
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %46
  %48 = load double, double* %47, align 8
  %49 = fadd double %45, %48
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next66, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = fmul double %58, 2.000000e-01
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv
  store double %59, double* %60, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %._crit_edge.us, label %scalar.ph97.scalar.ph97_crit_edge, !llvm.loop !9

scalar.ph97.scalar.ph97_crit_edge:                ; preds = %scalar.ph97
  br label %scalar.ph97

._crit_edge.us:                                   ; preds = %scalar.ph97
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 1299
  br i1 %exitcond68, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge.us..preheader53.us_crit_edge

._crit_edge.us..preheader53.us_crit_edge:         ; preds = %._crit_edge.us
  %indvar.next101 = add i64 %indvar100, 1
  br label %.preheader53.us

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge60.us..preheader.us_crit_edge, %._crit_edge.us..preheader.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge60.us..preheader.us_crit_edge ], [ 0, %._crit_edge.us..preheader.us_crit_edge ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge60.us..preheader.us_crit_edge ], [ 1, %._crit_edge.us..preheader.us_crit_edge ]
  %61 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1
  %scevgep79 = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1299
  %scevgep81 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %62 = add i64 %indvar, 2
  %scevgep83 = getelementptr [1300 x double], [1300 x double]* %3, i64 %62, i64 1299
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %63 = add nsw i64 %indvars.iv73, -1
  %bound0 = icmp ult double* %scevgep, %scevgep83
  %bound1 = icmp ult double* %scevgep81, %scevgep79
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader.us.scalar.ph_crit_edge, label %.preheader.us.vector.body_crit_edge

.preheader.us.vector.body_crit_edge:              ; preds = %.preheader.us
  br label %vector.body

.preheader.us.scalar.ph_crit_edge:                ; preds = %.preheader.us
  br label %scalar.ph.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %.preheader.us.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %.preheader.us.vector.body_crit_edge ]
  %offset.idx = or i64 %index, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = add nsw i64 %offset.idx, -1
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %wide.load, %wide.load87
  %74 = fadd <2 x double> %wide.load86, %wide.load88
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %73, %wide.load89
  %81 = fadd <2 x double> %74, %wide.load90
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next74, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %80, %wide.load91
  %87 = fadd <2 x double> %81, %wide.load92
  %88 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %86, %wide.load93
  %93 = fadd <2 x double> %87, %wide.load94
  %94 = fmul <2 x double> %92, <double 2.000000e-01, double 2.000000e-01>
  %95 = fmul <2 x double> %93, <double 2.000000e-01, double 2.000000e-01>
  %96 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv73, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  store <2 x double> %94, <2 x double>* %97, align 8, !alias.scope !13, !noalias !10
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  store <2 x double> %95, <2 x double>* %99, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %100 = icmp eq i64 %index.next, 1296
  br i1 %100, label %vector.body.scalar.ph_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body.scalar.ph_crit_edge:                  ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %vector.body.scalar.ph_crit_edge, %.preheader.us.scalar.ph_crit_edge
  %indvars.iv69.ph = phi i64 [ 1297, %vector.body.scalar.ph_crit_edge ], [ 1, %.preheader.us.scalar.ph_crit_edge ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv69.ph, %scalar.ph.preheader ]
  %101 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv69
  %102 = load double, double* %101, align 8
  %103 = add nsw i64 %indvars.iv69, -1
  %104 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fadd double %102, %105
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %107 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv.next70
  %108 = load double, double* %107, align 8
  %109 = fadd double %106, %108
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next74, i64 %indvars.iv69
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %indvars.iv69
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = fmul double %115, 2.000000e-01
  %117 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv69
  store double %116, double* %117, align 8
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1299
  br i1 %exitcond72, label %._crit_edge60.us, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !16

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge60.us:                                 ; preds = %scalar.ph
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1299
  br i1 %exitcond76, label %._crit_edge62, label %._crit_edge60.us..preheader.us_crit_edge

._crit_edge60.us..preheader.us_crit_edge:         ; preds = %._crit_edge60.us
  %indvar.next = add i64 %indvar, 1
  br label %.preheader.us

._crit_edge62:                                    ; preds = %._crit_edge60.us
  %118 = add nuw nsw i32 %.05263, 1
  %exitcond77 = icmp eq i32 %118, 500
  br i1 %exitcond77, label %._crit_edge64, label %._crit_edge62..preheader55_crit_edge

._crit_edge62..preheader55_crit_edge:             ; preds = %._crit_edge62
  br label %.preheader55

._crit_edge64:                                    ; preds = %._crit_edge62
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us..preheader.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv15, 1300
  br label %7

; <label>:7:                                      ; preds = %._crit_edge.us._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %7
  br label %._crit_edge.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %12, %.._crit_edge.us_crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge12.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %7

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1300
  br i1 %exitcond18, label %._crit_edge14, label %._crit_edge12.us..preheader.us_crit_edge

._crit_edge12.us..preheader.us_crit_edge:         ; preds = %._crit_edge12.us
  br label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
