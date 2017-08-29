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
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call void @init_array(i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [1300 x double]*
  %8 = bitcast i8* %4 to [1300 x double]*
  tail call void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %7, [1300 x double]* %8)
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
  %14 = bitcast i8* %3 to [1300 x double]*
  tail call void @print_array(i32 1300, [1300 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1300 x double]*, [1300 x double]*) #2 {
  br label %.preheader

.preheader:                                       ; preds = %23, %3
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %23 ], [ 0, %3 ]
  %4 = trunc i64 %indvars.iv15 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %12 = add nuw nsw i64 %indvars.iv, 3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %7, %16
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, <double 1.300000e+03, double 1.300000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %11, align 8
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1300
  br i1 %exitcond17, label %24, label %.preheader

; <label>:24:                                     ; preds = %23
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32, i32, [1300 x double]*, [1300 x double]*) #2 {
  br label %.preheader51

.preheader51:                                     ; preds = %119, %4
  %storemerge56 = phi i32 [ 0, %4 ], [ %120, %119 ]
  br label %.preheader49

.preheader49:                                     ; preds = %.loopexit125, %.preheader51
  %indvar90 = phi i64 [ %indvar.next91, %.loopexit125 ], [ 0, %.preheader51 ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %.loopexit125 ], [ 1, %.preheader51 ]
  %5 = add i64 %indvar90, 1
  %scevgep92 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1
  %scevgep94 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1299
  %scevgep96 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar90, i64 1
  %6 = add i64 %indvar90, 2
  %scevgep98 = getelementptr [1300 x double], [1300 x double]* %2, i64 %6, i64 1299
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %7 = add nsw i64 %indvars.iv58, -1
  %bound0100 = icmp ult double* %scevgep92, %scevgep98
  %bound1101 = icmp ult double* %scevgep96, %scevgep94
  %memcheck.conflict103 = and i1 %bound0100, %bound1101
  br i1 %memcheck.conflict103, label %._crit_edge.preheader, label %vector.body85.preheader

vector.body85.preheader:                          ; preds = %.preheader49
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85.preheader, %vector.body85
  %index106 = phi i64 [ %index.next107, %vector.body85 ], [ 0, %vector.body85.preheader ]
  %offset.idx110 = or i64 %index106, 1
  %8 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv58, i64 %offset.idx110
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = add nsw i64 %offset.idx110, -1
  %13 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv58, i64 %12
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load115, %wide.load117
  %18 = fadd <2 x double> %wide.load116, %wide.load118
  %19 = add nuw nsw i64 %offset.idx110, 1
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv58, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %17, %wide.load119
  %25 = fadd <2 x double> %18, %wide.load120
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next59, i64 %offset.idx110
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %24, %wide.load121
  %31 = fadd <2 x double> %25, %wide.load122
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %offset.idx110
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fadd <2 x double> %30, %wide.load123
  %37 = fadd <2 x double> %31, %wide.load124
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = fmul <2 x double> %37, <double 2.000000e-01, double 2.000000e-01>
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv58, i64 %offset.idx110
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %38, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %39, <2 x double>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next107 = add i64 %index106, 4
  %44 = icmp eq i64 %index.next107, 1296
  br i1 %44, label %._crit_edge.preheader.loopexit, label %vector.body85, !llvm.loop !6

._crit_edge.preheader.loopexit:                   ; preds = %vector.body85
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.loopexit, %.preheader49
  %indvars.iv.ph = phi i64 [ 1, %.preheader49 ], [ 1297, %._crit_edge.preheader.loopexit ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %45 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv58, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = add nsw i64 %indvars.iv, -1
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv58, i64 %47
  %49 = load double, double* %48, align 8
  %50 = fadd double %46, %49
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv58, i64 %indvars.iv.next
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next59, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = fmul double %59, 2.000000e-01
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv
  store double %60, double* %61, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %.loopexit125, label %._crit_edge, !llvm.loop !9

.loopexit125:                                     ; preds = %._crit_edge
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 1299
  %indvar.next91 = add i64 %indvar90, 1
  br i1 %exitcond60, label %.preheader.preheader, label %.preheader49

.preheader.preheader:                             ; preds = %.loopexit125
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvar = phi i64 [ %indvar.next, %.loopexit ], [ 0, %.preheader.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %.loopexit ], [ 1, %.preheader.preheader ]
  %62 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %62, i64 1
  %scevgep69 = getelementptr [1300 x double], [1300 x double]* %2, i64 %62, i64 1299
  %scevgep71 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %63 = add i64 %indvar, 2
  %scevgep73 = getelementptr [1300 x double], [1300 x double]* %3, i64 %63, i64 1299
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %64 = add nsw i64 %indvars.iv64, -1
  %bound0 = icmp ult double* %scevgep, %scevgep73
  %bound1 = icmp ult double* %scevgep71, %scevgep69
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge57.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %65 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv64, i64 %offset.idx
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = add nsw i64 %offset.idx, -1
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv64, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %wide.load, %wide.load77
  %75 = fadd <2 x double> %wide.load76, %wide.load78
  %76 = add nuw nsw i64 %offset.idx, 1
  %77 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv64, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fadd <2 x double> %74, %wide.load79
  %82 = fadd <2 x double> %75, %wide.load80
  %83 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next65, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fadd <2 x double> %81, %wide.load81
  %88 = fadd <2 x double> %82, %wide.load82
  %89 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %64, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fadd <2 x double> %87, %wide.load83
  %94 = fadd <2 x double> %88, %wide.load84
  %95 = fmul <2 x double> %93, <double 2.000000e-01, double 2.000000e-01>
  %96 = fmul <2 x double> %94, <double 2.000000e-01, double 2.000000e-01>
  %97 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv64, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  store <2 x double> %95, <2 x double>* %98, align 8, !alias.scope !13, !noalias !10
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  store <2 x double> %96, <2 x double>* %100, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %101 = icmp eq i64 %index.next, 1296
  br i1 %101, label %._crit_edge57.preheader.loopexit, label %vector.body, !llvm.loop !15

._crit_edge57.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge57.preheader

._crit_edge57.preheader:                          ; preds = %._crit_edge57.preheader.loopexit, %.preheader
  %indvars.iv61.ph = phi i64 [ 1, %.preheader ], [ 1297, %._crit_edge57.preheader.loopexit ]
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57.preheader, %._crit_edge57
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge57 ], [ %indvars.iv61.ph, %._crit_edge57.preheader ]
  %102 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv61
  %103 = load double, double* %102, align 8
  %104 = add nsw i64 %indvars.iv61, -1
  %105 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv64, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fadd double %103, %106
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %108 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv.next62
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next65, i64 %indvars.iv61
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  %114 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %64, i64 %indvars.iv61
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = fmul double %116, 2.000000e-01
  %118 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv64, i64 %indvars.iv61
  store double %117, double* %118, align 8
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 1299
  br i1 %exitcond63, label %.loopexit, label %._crit_edge57, !llvm.loop !16

.loopexit:                                        ; preds = %._crit_edge57
  %exitcond66 = icmp eq i64 %indvars.iv.next65, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond66, label %119, label %.preheader

; <label>:119:                                    ; preds = %.loopexit
  %120 = add nuw nsw i32 %storemerge56, 1
  %exitcond67 = icmp eq i32 %120, 500
  br i1 %exitcond67, label %121, label %.preheader51

; <label>:121:                                    ; preds = %119
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1300 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %18 ], [ 0, %2 ]
  %7 = mul nuw nsw i64 %indvars.iv12, 1300
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %18, label %._crit_edge11

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1300
  br i1 %exitcond14, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
