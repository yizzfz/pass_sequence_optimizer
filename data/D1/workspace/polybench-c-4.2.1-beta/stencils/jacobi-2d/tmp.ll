; ModuleID = 'B.ll'
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

._crit_edge:                                      ; preds = %13, %10, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1300 x double]*, [1300 x double]*) #2 {
.preheader.lr.ph..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv13 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next14, %.loopexit.us ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %6 ], [ 0, %.preheader.us ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 3
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> %5, double %13, i32 1
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %4, i32 1
  %17 = fmul <2 x double> %16, %14
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, <double 1.300000e+03, double 1.300000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %10, align 8
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  store double %21, double* %22, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1299
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit.us, label %6

.loopexit.us:                                     ; preds = %6
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1300
  br i1 %exitcond15, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32, i32, [1300 x double]*, [1300 x double]*) #2 {
.preheader7.lr.ph:
  br label %.preheader7

.preheader7:                                      ; preds = %.loopexit15, %.preheader7.lr.ph
  %4 = phi i32 [ 0, %.preheader7.lr.ph ], [ %121, %.loopexit15 ]
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.loopexit14.us, %.preheader7
  %indvar70 = phi i64 [ 0, %.preheader7 ], [ %indvar.next71, %.loopexit14.us ]
  %indvars.iv36 = phi i64 [ 1, %.preheader7 ], [ %7, %.loopexit14.us ]
  %5 = add nuw nsw i64 %indvar70, 1
  %scevgep72 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1
  %scevgep74 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1299
  %scevgep76 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar70, i64 1
  %6 = add nuw nsw i64 %indvar70, 2
  %scevgep78 = getelementptr [1300 x double], [1300 x double]* %2, i64 %6, i64 1299
  %7 = add nuw nsw i64 %indvars.iv36, 1
  %8 = add nsw i64 %indvars.iv36, -1
  %bound080 = icmp ult double* %scevgep72, %scevgep78
  %bound181 = icmp ult double* %scevgep76, %scevgep74
  %memcheck.conflict83 = and i1 %bound080, %bound181
  br i1 %memcheck.conflict83, label %._crit_edge32.preheader, label %vector.body65.preheader

vector.body65.preheader:                          ; preds = %.preheader5.us
  br label %vector.body65

vector.body65:                                    ; preds = %vector.body65, %vector.body65.preheader
  %index86 = phi i64 [ %index.next87, %vector.body65 ], [ 0, %vector.body65.preheader ]
  %offset.idx90 = or i64 %index86, 1
  %9 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv36, i64 %offset.idx90
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = add nsw i64 %offset.idx90, -1
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv36, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load95, %wide.load97
  %19 = fadd <2 x double> %wide.load96, %wide.load98
  %20 = add nuw nsw i64 %offset.idx90, 1
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv36, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %18, %wide.load99
  %26 = fadd <2 x double> %19, %wide.load100
  %27 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %offset.idx90
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %25, %wide.load101
  %32 = fadd <2 x double> %26, %wide.load102
  %33 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %8, i64 %offset.idx90
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fadd <2 x double> %31, %wide.load103
  %38 = fadd <2 x double> %32, %wide.load104
  %39 = fmul <2 x double> %37, <double 2.000000e-01, double 2.000000e-01>
  %40 = fmul <2 x double> %38, <double 2.000000e-01, double 2.000000e-01>
  %41 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv36, i64 %offset.idx90
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %39, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %40, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next87 = add nuw nsw i64 %index86, 4
  %45 = icmp eq i64 %index.next87, 1296
  br i1 %45, label %._crit_edge32.preheader.loopexit, label %vector.body65, !llvm.loop !6

._crit_edge32.preheader.loopexit:                 ; preds = %vector.body65
  br label %._crit_edge32.preheader

._crit_edge32.preheader:                          ; preds = %._crit_edge32.preheader.loopexit, %.preheader5.us
  %indvars.iv.ph = phi i64 [ 1, %.preheader5.us ], [ 1297, %._crit_edge32.preheader.loopexit ]
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32, %._crit_edge32.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge32 ], [ %indvars.iv.ph, %._crit_edge32.preheader ]
  %46 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = add nsw i64 %indvars.iv, -1
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv36, i64 %48
  %50 = load double, double* %49, align 8
  %51 = fadd double %47, %50
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %8, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %61 = fmul double %60, 2.000000e-01
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv
  store double %61, double* %62, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %.loopexit14.us, label %._crit_edge32, !llvm.loop !9

.loopexit14.us:                                   ; preds = %._crit_edge32
  %exitcond44 = icmp eq i64 %7, 1299
  %indvar.next71 = add nuw nsw i64 %indvar70, 1
  br i1 %exitcond44, label %.preheader.us.preheader, label %.preheader5.us

.preheader.us.preheader:                          ; preds = %.loopexit14.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv40 = phi i64 [ %65, %.loopexit.us ], [ 1, %.preheader.us.preheader ]
  %63 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %63, i64 1
  %scevgep49 = getelementptr [1300 x double], [1300 x double]* %2, i64 %63, i64 1299
  %scevgep51 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %64 = add nuw nsw i64 %indvar, 2
  %scevgep53 = getelementptr [1300 x double], [1300 x double]* %3, i64 %64, i64 1299
  %65 = add nuw nsw i64 %indvars.iv40, 1
  %66 = add nsw i64 %indvars.iv40, -1
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge33.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv40, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = add nsw i64 %offset.idx, -1
  %72 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv40, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = fadd <2 x double> %wide.load, %wide.load57
  %77 = fadd <2 x double> %wide.load56, %wide.load58
  %78 = add nuw nsw i64 %offset.idx, 1
  %79 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv40, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fadd <2 x double> %76, %wide.load59
  %84 = fadd <2 x double> %77, %wide.load60
  %85 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %65, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %83, %wide.load61
  %90 = fadd <2 x double> %84, %wide.load62
  %91 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %66, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %89, %wide.load63
  %96 = fadd <2 x double> %90, %wide.load64
  %97 = fmul <2 x double> %95, <double 2.000000e-01, double 2.000000e-01>
  %98 = fmul <2 x double> %96, <double 2.000000e-01, double 2.000000e-01>
  %99 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv40, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  store <2 x double> %97, <2 x double>* %100, align 8, !alias.scope !13, !noalias !10
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  store <2 x double> %98, <2 x double>* %102, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %103 = icmp eq i64 %index.next, 1296
  br i1 %103, label %._crit_edge33.preheader.loopexit, label %vector.body, !llvm.loop !15

._crit_edge33.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge33.preheader

._crit_edge33.preheader:                          ; preds = %._crit_edge33.preheader.loopexit, %.preheader.us
  %indvars.iv38.ph = phi i64 [ 1, %.preheader.us ], [ 1297, %._crit_edge33.preheader.loopexit ]
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33, %._crit_edge33.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge33 ], [ %indvars.iv38.ph, %._crit_edge33.preheader ]
  %104 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv38
  %105 = load double, double* %104, align 8
  %106 = add nsw i64 %indvars.iv38, -1
  %107 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv40, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fadd double %105, %108
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv.next39
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %65, i64 %indvars.iv38
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %66, i64 %indvars.iv38
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  %119 = fmul double %118, 2.000000e-01
  %120 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv38
  store double %119, double* %120, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next39, 1299
  br i1 %exitcond45, label %.loopexit.us, label %._crit_edge33, !llvm.loop !16

.loopexit.us:                                     ; preds = %._crit_edge33
  %exitcond46 = icmp eq i64 %65, 1299
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond46, label %.loopexit15, label %.preheader.us

.loopexit15:                                      ; preds = %.loopexit.us
  %121 = add nuw nsw i32 %4, 1
  %exitcond47 = icmp eq i32 %121, 500
  br i1 %exitcond47, label %._crit_edge, label %.preheader7

._crit_edge:                                      ; preds = %.loopexit15
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1300 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %6 = mul nuw nsw i64 %indvars.iv14, 1300
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %11, %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1300
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
