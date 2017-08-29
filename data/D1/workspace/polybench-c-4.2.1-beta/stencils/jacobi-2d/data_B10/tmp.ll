; ModuleID = 'A.ll'
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [1300 x double]*
  %8 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %7, [1300 x double]* %8)
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
  %14 = bitcast i8* %3 to [1300 x double]*
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]*, [1300 x double]*) unnamed_addr #2 {
  br i1 true, label %.preheader.lr.ph, label %._crit_edge16

.preheader.lr.ph:                                 ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %4 = trunc i64 %indvars.iv17 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %8 ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %13 = add nuw nsw i64 %indvars.iv, 3
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %11, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %7, %17
  %19 = fadd <2 x double> %18, <double 2.000000e+00, double 3.000000e+00>
  %20 = fdiv <2 x double> %19, <double 1.300000e+03, double 1.300000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %12, align 8
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  store double %22, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 1300
  br i1 %exitcond20, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]*, [1300 x double]*) unnamed_addr #2 {
  br i1 true, label %.preheader51.lr.ph, label %._crit_edge60

.preheader51.lr.ph:                               ; preds = %4
  br label %.preheader51

.preheader51:                                     ; preds = %._crit_edge58, %.preheader51.lr.ph
  %storemerge59 = phi i32 [ 0, %.preheader51.lr.ph ], [ %119, %._crit_edge58 ]
  br i1 true, label %.preheader49.us.preheader, label %._crit_edge58

.preheader49.us.preheader:                        ; preds = %.preheader51
  br label %.preheader49.us

.preheader49.us:                                  ; preds = %.preheader49.us.preheader, %._crit_edge.us
  %indvar101 = phi i64 [ %indvar.next102, %._crit_edge.us ], [ 0, %.preheader49.us.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us ], [ 1, %.preheader49.us.preheader ]
  %5 = add i64 %indvar101, 1
  %scevgep103 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1
  %scevgep105 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1299
  %scevgep107 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar101, i64 1
  %6 = add i64 %indvar101, 2
  %scevgep109 = getelementptr [1300 x double], [1300 x double]* %2, i64 %6, i64 1299
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %7 = add nsw i64 %indvars.iv61, -1
  br i1 false, label %scalar.ph94.preheader, label %min.iters.checked96

min.iters.checked96:                              ; preds = %.preheader49.us
  br i1 false, label %scalar.ph94.preheader, label %vector.memcheck115

vector.memcheck115:                               ; preds = %min.iters.checked96
  %bound0111 = icmp ult double* %scevgep103, %scevgep109
  %bound1112 = icmp ult double* %scevgep107, %scevgep105
  %memcheck.conflict114 = and i1 %bound0111, %bound1112
  br i1 %memcheck.conflict114, label %scalar.ph94.preheader, label %vector.body92.preheader

vector.body92.preheader:                          ; preds = %vector.memcheck115
  br label %vector.body92

vector.body92:                                    ; preds = %vector.body92.preheader, %vector.body92
  %index117 = phi i64 [ %index.next118, %vector.body92 ], [ 0, %vector.body92.preheader ]
  %offset.idx122 = or i64 %index117, 1
  %8 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv61, i64 %offset.idx122
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = add nsw i64 %offset.idx122, -1
  %13 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv61, i64 %12
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load127, %wide.load129
  %18 = fadd <2 x double> %wide.load128, %wide.load130
  %19 = add nuw nsw i64 %offset.idx122, 1
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv61, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %17, %wide.load131
  %25 = fadd <2 x double> %18, %wide.load132
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next62, i64 %offset.idx122
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %24, %wide.load133
  %31 = fadd <2 x double> %25, %wide.load134
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %offset.idx122
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fadd <2 x double> %30, %wide.load135
  %37 = fadd <2 x double> %31, %wide.load136
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = fmul <2 x double> %37, <double 2.000000e-01, double 2.000000e-01>
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv61, i64 %offset.idx122
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %38, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %39, <2 x double>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next118 = add i64 %index117, 4
  %44 = icmp eq i64 %index.next118, 1296
  br i1 %44, label %middle.block93, label %vector.body92, !llvm.loop !6

middle.block93:                                   ; preds = %vector.body92
  br i1 false, label %._crit_edge.us, label %scalar.ph94.preheader

scalar.ph94.preheader:                            ; preds = %middle.block93, %vector.memcheck115, %min.iters.checked96, %.preheader49.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck115 ], [ 1, %min.iters.checked96 ], [ 1, %.preheader49.us ], [ 1297, %middle.block93 ]
  br label %scalar.ph94

scalar.ph94:                                      ; preds = %scalar.ph94.preheader, %scalar.ph94
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph94 ], [ %indvars.iv.ph, %scalar.ph94.preheader ]
  %45 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv61, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = add nsw i64 %indvars.iv, -1
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv61, i64 %47
  %49 = load double, double* %48, align 8
  %50 = fadd double %46, %49
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv61, i64 %indvars.iv.next
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next62, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = fmul double %59, 2.000000e-01
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv61, i64 %indvars.iv
  store double %60, double* %61, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph94, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph94
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block93
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 1299
  %indvar.next102 = add i64 %indvar101, 1
  br i1 %exitcond64, label %.preheader50, label %.preheader49.us

.preheader50:                                     ; preds = %._crit_edge.us
  br i1 true, label %.preheader.us.preheader, label %._crit_edge58

.preheader.us.preheader:                          ; preds = %.preheader50
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge56.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge56.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge56.us ], [ 1, %.preheader.us.preheader ]
  %62 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %62, i64 1
  %scevgep76 = getelementptr [1300 x double], [1300 x double]* %2, i64 %62, i64 1299
  %scevgep78 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %63 = add i64 %indvar, 2
  %scevgep80 = getelementptr [1300 x double], [1300 x double]* %3, i64 %63, i64 1299
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %64 = add nsw i64 %indvars.iv69, -1
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep80
  %bound1 = icmp ult double* %scevgep78, %scevgep76
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %65 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv69, i64 %offset.idx
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = add nsw i64 %offset.idx, -1
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv69, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %wide.load, %wide.load84
  %75 = fadd <2 x double> %wide.load83, %wide.load85
  %76 = add nuw nsw i64 %offset.idx, 1
  %77 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv69, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fadd <2 x double> %74, %wide.load86
  %82 = fadd <2 x double> %75, %wide.load87
  %83 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next70, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fadd <2 x double> %81, %wide.load88
  %88 = fadd <2 x double> %82, %wide.load89
  %89 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %64, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fadd <2 x double> %87, %wide.load90
  %94 = fadd <2 x double> %88, %wide.load91
  %95 = fmul <2 x double> %93, <double 2.000000e-01, double 2.000000e-01>
  %96 = fmul <2 x double> %94, <double 2.000000e-01, double 2.000000e-01>
  %97 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv69, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  store <2 x double> %95, <2 x double>* %98, align 8, !alias.scope !13, !noalias !10
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  store <2 x double> %96, <2 x double>* %100, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %101 = icmp eq i64 %index.next, 1296
  br i1 %101, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 false, label %._crit_edge56.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv65.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ 1297, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %scalar.ph ], [ %indvars.iv65.ph, %scalar.ph.preheader ]
  %102 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv69, i64 %indvars.iv65
  %103 = load double, double* %102, align 8
  %104 = add nsw i64 %indvars.iv65, -1
  %105 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv69, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fadd double %103, %106
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %108 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv69, i64 %indvars.iv.next66
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next70, i64 %indvars.iv65
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  %114 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %64, i64 %indvars.iv65
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = fmul double %116, 2.000000e-01
  %118 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv69, i64 %indvars.iv65
  store double %117, double* %118, align 8
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 1299
  br i1 %exitcond68, label %._crit_edge56.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge56.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge56.us

._crit_edge56.us:                                 ; preds = %._crit_edge56.us.loopexit, %middle.block
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond72, label %._crit_edge58.loopexit, label %.preheader.us

._crit_edge58.loopexit:                           ; preds = %._crit_edge56.us
  br label %._crit_edge58

._crit_edge58:                                    ; preds = %._crit_edge58.loopexit, %.preheader50, %.preheader51
  %119 = add nuw nsw i32 %storemerge59, 1
  %exitcond73 = icmp eq i32 %119, 500
  br i1 %exitcond73, label %._crit_edge60.loopexit, label %.preheader51

._crit_edge60.loopexit:                           ; preds = %._crit_edge58
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %._crit_edge60.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv13, 1300
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1300
  br i1 %exitcond16, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
