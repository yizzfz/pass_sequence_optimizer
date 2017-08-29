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
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = zext i32 %0 to i64
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %3
  %7 = sitofp i32 %0 to double
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %8 = trunc i64 %indvars.iv27 to i32
  %9 = sitofp i32 %8 to double
  br label %10

; <label>:10:                                     ; preds = %.preheader, %10
  %indvars.iv6 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %10 ]
  %11 = add nuw nsw i64 %indvars.iv6, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %9, %13
  %15 = fadd double %14, 2.000000e+00
  %16 = fdiv double %15, %7
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv6
  store double %16, double* %17, align 8
  %18 = add nuw nsw i64 %indvars.iv6, 3
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %9, %20
  %22 = fadd double %21, 3.000000e+00
  %23 = fdiv double %22, %7
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv6
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, %5
  br i1 %exitcond4, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %10
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, %4
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.preheader

._crit_edge9.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = zext i32 %5 to i64
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader14.lr.ph, label %._crit_edge28

.preheader14.lr.ph:                               ; preds = %4
  %8 = sext i32 %5 to i64
  %9 = icmp sgt i32 %5, 1
  %10 = add nsw i64 %6, -1
  %min.iters.check56 = icmp ult i64 %10, 4
  %n.vec59 = and i64 %10, -4
  %cmp.zero60 = icmp eq i64 %n.vec59, 0
  %ind.end81 = or i64 %n.vec59, 1
  %cmp.n82 = icmp eq i64 %10, %n.vec59
  %min.iters.check = icmp ult i64 %10, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %10, %n.vec
  br label %.preheader14

.preheader14:                                     ; preds = %._crit_edge26, %.preheader14.lr.ph
  %.0327 = phi i32 [ 0, %.preheader14.lr.ph ], [ %129, %._crit_edge26 ]
  br i1 %9, label %.preheader12.preheader, label %._crit_edge26

.preheader12.preheader:                           ; preds = %.preheader14
  br label %.preheader12

.preheader13:                                     ; preds = %._crit_edge
  br i1 %9, label %.preheader.preheader, label %._crit_edge26

.preheader.preheader:                             ; preds = %.preheader13
  br label %.preheader

.preheader12:                                     ; preds = %.preheader12.preheader, %._crit_edge
  %indvar62 = phi i64 [ %indvar.next63, %._crit_edge ], [ 0, %.preheader12.preheader ]
  %indvars.iv418 = phi i64 [ %13, %._crit_edge ], [ 1, %.preheader12.preheader ]
  %11 = add i64 %indvar62, 1
  %scevgep64 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 1
  %scevgep66 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 %6
  %scevgep68 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar62, i64 1
  %12 = add i64 %indvar62, 2
  %scevgep70 = getelementptr [1300 x double], [1300 x double]* %2, i64 %12, i64 %6
  %13 = add nuw nsw i64 %indvars.iv418, 1
  %14 = add nsw i64 %indvars.iv418, -1
  br i1 %min.iters.check56, label %scalar.ph55.preheader, label %min.iters.checked57

min.iters.checked57:                              ; preds = %.preheader12
  br i1 %cmp.zero60, label %scalar.ph55.preheader, label %vector.memcheck76

vector.memcheck76:                                ; preds = %min.iters.checked57
  %bound072 = icmp ult double* %scevgep64, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep66
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %scalar.ph55.preheader, label %vector.body53.preheader

vector.body53.preheader:                          ; preds = %vector.memcheck76
  br label %vector.body53

vector.body53:                                    ; preds = %vector.body53.preheader, %vector.body53
  %index78 = phi i64 [ %index.next79, %vector.body53 ], [ 0, %vector.body53.preheader ]
  %offset.idx83 = or i64 %index78, 1
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv418, i64 %offset.idx83
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = add nsw i64 %offset.idx83, -1
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv418, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %wide.load88, %wide.load90
  %25 = fadd <2 x double> %wide.load89, %wide.load91
  %26 = add nuw nsw i64 %offset.idx83, 1
  %27 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv418, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %24, %wide.load92
  %32 = fadd <2 x double> %25, %wide.load93
  %33 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %offset.idx83
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fadd <2 x double> %31, %wide.load94
  %38 = fadd <2 x double> %32, %wide.load95
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %14, i64 %offset.idx83
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !1
  %43 = fadd <2 x double> %37, %wide.load96
  %44 = fadd <2 x double> %38, %wide.load97
  %45 = fmul <2 x double> %43, <double 2.000000e-01, double 2.000000e-01>
  %46 = fmul <2 x double> %44, <double 2.000000e-01, double 2.000000e-01>
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv418, i64 %offset.idx83
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %45, <2 x double>* %48, align 8, !alias.scope !4, !noalias !1
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %46, <2 x double>* %50, align 8, !alias.scope !4, !noalias !1
  %index.next79 = add i64 %index78, 4
  %51 = icmp eq i64 %index.next79, %n.vec59
  br i1 %51, label %middle.block54, label %vector.body53, !llvm.loop !6

middle.block54:                                   ; preds = %vector.body53
  br i1 %cmp.n82, label %._crit_edge, label %scalar.ph55.preheader

scalar.ph55.preheader:                            ; preds = %middle.block54, %vector.memcheck76, %min.iters.checked57, %.preheader12
  %indvars.iv17.ph = phi i64 [ 1, %vector.memcheck76 ], [ 1, %min.iters.checked57 ], [ 1, %.preheader12 ], [ %ind.end81, %middle.block54 ]
  br label %scalar.ph55

scalar.ph55:                                      ; preds = %scalar.ph55.preheader, %scalar.ph55
  %indvars.iv17 = phi i64 [ %58, %scalar.ph55 ], [ %indvars.iv17.ph, %scalar.ph55.preheader ]
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv418, i64 %indvars.iv17
  %53 = load double, double* %52, align 8
  %54 = add nsw i64 %indvars.iv17, -1
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv418, i64 %54
  %56 = load double, double* %55, align 8
  %57 = fadd double %53, %56
  %58 = add nuw nsw i64 %indvars.iv17, 1
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv418, i64 %58
  %60 = load double, double* %59, align 8
  %61 = fadd double %57, %60
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %indvars.iv17
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %14, i64 %indvars.iv17
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = fmul double %67, 2.000000e-01
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv418, i64 %indvars.iv17
  store double %68, double* %69, align 8
  %exitcond15 = icmp eq i64 %58, %6
  br i1 %exitcond15, label %._crit_edge.loopexit, label %scalar.ph55, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph55
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block54
  %exitcond31 = icmp eq i64 %13, %8
  %indvar.next63 = add i64 %indvar62, 1
  br i1 %exitcond31, label %.preheader13, label %.preheader12

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge23
  %indvar = phi i64 [ %indvar.next, %._crit_edge23 ], [ 0, %.preheader.preheader ]
  %indvars.iv1024 = phi i64 [ %72, %._crit_edge23 ], [ 1, %.preheader.preheader ]
  %70 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %70, i64 1
  %scevgep37 = getelementptr [1300 x double], [1300 x double]* %2, i64 %70, i64 %6
  %scevgep39 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %71 = add i64 %indvar, 2
  %scevgep41 = getelementptr [1300 x double], [1300 x double]* %3, i64 %71, i64 %6
  %72 = add nuw nsw i64 %indvars.iv1024, 1
  %73 = add nsw i64 %indvars.iv1024, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep41
  %bound1 = icmp ult double* %scevgep39, %scevgep37
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1024, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = add nsw i64 %offset.idx, -1
  %79 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1024, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fadd <2 x double> %wide.load, %wide.load45
  %84 = fadd <2 x double> %wide.load44, %wide.load46
  %85 = add nuw nsw i64 %offset.idx, 1
  %86 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1024, i64 %85
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %83, %wide.load47
  %91 = fadd <2 x double> %84, %wide.load48
  %92 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %72, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fadd <2 x double> %90, %wide.load49
  %97 = fadd <2 x double> %91, %wide.load50
  %98 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %73, i64 %offset.idx
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %96, %wide.load51
  %103 = fadd <2 x double> %97, %wide.load52
  %104 = fmul <2 x double> %102, <double 2.000000e-01, double 2.000000e-01>
  %105 = fmul <2 x double> %103, <double 2.000000e-01, double 2.000000e-01>
  %106 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv1024, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  store <2 x double> %104, <2 x double>* %107, align 8, !alias.scope !13, !noalias !10
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  store <2 x double> %105, <2 x double>* %109, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %110 = icmp eq i64 %index.next, %n.vec
  br i1 %110, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge23, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv621.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv621 = phi i64 [ %117, %scalar.ph ], [ %indvars.iv621.ph, %scalar.ph.preheader ]
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1024, i64 %indvars.iv621
  %112 = load double, double* %111, align 8
  %113 = add nsw i64 %indvars.iv621, -1
  %114 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1024, i64 %113
  %115 = load double, double* %114, align 8
  %116 = fadd double %112, %115
  %117 = add nuw nsw i64 %indvars.iv621, 1
  %118 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv1024, i64 %117
  %119 = load double, double* %118, align 8
  %120 = fadd double %116, %119
  %121 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %72, i64 %indvars.iv621
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %73, i64 %indvars.iv621
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  %127 = fmul double %126, 2.000000e-01
  %128 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv1024, i64 %indvars.iv621
  store double %127, double* %128, align 8
  %exitcond = icmp eq i64 %117, %6
  br i1 %exitcond, label %._crit_edge23.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge23.loopexit:                           ; preds = %scalar.ph
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %middle.block
  %exitcond33 = icmp eq i64 %72, %8
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond33, label %._crit_edge26.loopexit, label %.preheader

._crit_edge26.loopexit:                           ; preds = %._crit_edge23
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader14, %.preheader13
  %129 = add nuw nsw i32 %.0327, 1
  %exitcond35 = icmp eq i32 %129, %0
  br i1 %exitcond35, label %._crit_edge28.loopexit, label %.preheader14

._crit_edge28.loopexit:                           ; preds = %._crit_edge26
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = zext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %10 = mul nsw i64 %indvars.iv27, %7
  br label %11

; <label>:11:                                     ; preds = %.preheader, %18
  %indvars.iv6 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %18 ]
  %12 = add nsw i64 %indvars.iv6, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %11, %16
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv6
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond4, label %._crit_edge, label %11

._crit_edge:                                      ; preds = %18
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.preheader

._crit_edge9.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
