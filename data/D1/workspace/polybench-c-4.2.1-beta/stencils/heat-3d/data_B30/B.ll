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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %20, %3
  %indvars.iv9 = phi i64 [ 0, %3 ], [ %indvars.iv.next10, %20 ]
  %4 = add nuw nsw i64 %indvars.iv9, 120
  br label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %5 = add nuw nsw i64 %4, %indvars.iv7
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %._crit_edge3.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge3.preheader ], [ %indvars.iv.next.1, %._crit_edge3 ]
  %6 = sub nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 1.000000e+01
  %10 = fdiv double %9, 1.200000e+02
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv
  store double %10, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = sub nuw nsw i64 %5, %indvars.iv.next
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, 1.200000e+02
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv.next
  store double %17, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge, label %._crit_edge3

._crit_edge:                                      ; preds = %._crit_edge3
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 120
  br i1 %exitcond, label %20, label %._crit_edge3.preheader

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 120
  br i1 %exitcond11, label %21, label %._crit_edge.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge7._crit_edge, %4
  %.0518 = phi i32 [ 1, %4 ], [ %137, %._crit_edge7._crit_edge ]
  br label %._crit_edge6.preheader

._crit_edge6.preheader:                           ; preds = %._crit_edge, %._crit_edge.preheader
  %indvar55 = phi i64 [ %5, %._crit_edge ], [ 0, %._crit_edge.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge ], [ 1, %._crit_edge.preheader ]
  %5 = add i64 %indvar55, 1
  %6 = add i64 %indvar55, 2
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %7 = add nsw i64 %indvars.iv22, -1
  br label %._crit_edge8.preheader.us

._crit_edge8.preheader.us:                        ; preds = %._crit_edge8._crit_edge.us, %._crit_edge6.preheader
  %indvar57 = phi i64 [ %8, %._crit_edge8._crit_edge.us ], [ 0, %._crit_edge6.preheader ]
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge8._crit_edge.us ], [ 1, %._crit_edge6.preheader ]
  %8 = add i64 %indvar57, 1
  %scevgep59 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %8, i64 1
  %scevgep61 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %8, i64 119
  %scevgep63 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar55, i64 %8, i64 1
  %scevgep65 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %8, i64 119
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %9 = add nsw i64 %indvars.iv19, -1
  %bound067 = icmp ult double* %scevgep59, %scevgep65
  %bound168 = icmp ult double* %scevgep63, %scevgep61
  %memcheck.conflict70 = and i1 %bound067, %bound168
  br i1 %memcheck.conflict70, label %._crit_edge8.us.preheader, label %vector.body50.preheader

vector.body50.preheader:                          ; preds = %._crit_edge8.preheader.us
  br label %vector.body50

._crit_edge8.us.preheader:                        ; preds = %._crit_edge8.preheader.us
  br label %._crit_edge8.us

vector.body50:                                    ; preds = %vector.body50.preheader, %vector.body50
  %index73 = phi i64 [ %index.next74, %vector.body50 ], [ 0, %vector.body50.preheader ]
  %offset.idx77 = or i64 %index73, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv.next23, i64 %indvars.iv19, i64 %offset.idx77
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv19, i64 %offset.idx77
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load82, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load81, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv19, i64 %offset.idx77
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load83, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv.next20, i64 %offset.idx77
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load84, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %9, i64 %offset.idx77
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load85
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx77, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv19, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load86, %14
  %32 = add nsw i64 %offset.idx77, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv19, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load87
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load82, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv22, i64 %indvars.iv19, i64 %offset.idx77
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next74 = add i64 %index73, 2
  %41 = icmp eq i64 %index.next74, 118
  br i1 %41, label %._crit_edge8._crit_edge.us.loopexit89, label %vector.body50, !llvm.loop !6

._crit_edge8.us:                                  ; preds = %._crit_edge8.us.preheader, %._crit_edge8.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge8.us ], [ 1, %._crit_edge8.us.preheader ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv.next23, i64 %indvars.iv19, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv19, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = fsub double %43, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv19, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  %51 = fmul double %50, 1.250000e-01
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv.next20, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %46
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %9, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 1.250000e-01
  %59 = fadd double %51, %58
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv19, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %46
  %63 = add nsw i64 %indvars.iv, -1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv19, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %62, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %59, %67
  %69 = fadd double %45, %68
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv22, i64 %indvars.iv19, i64 %indvars.iv
  store double %69, double* %70, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge8._crit_edge.us.loopexit, label %._crit_edge8.us, !llvm.loop !9

._crit_edge8._crit_edge.us.loopexit:              ; preds = %._crit_edge8.us
  br label %._crit_edge8._crit_edge.us

._crit_edge8._crit_edge.us.loopexit89:            ; preds = %vector.body50
  br label %._crit_edge8._crit_edge.us

._crit_edge8._crit_edge.us:                       ; preds = %._crit_edge8._crit_edge.us.loopexit89, %._crit_edge8._crit_edge.us.loopexit
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 119
  br i1 %exitcond21, label %._crit_edge, label %._crit_edge8.preheader.us

._crit_edge:                                      ; preds = %._crit_edge8._crit_edge.us
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 119
  br i1 %exitcond24, label %._crit_edge9.preheader.preheader, label %._crit_edge6.preheader

._crit_edge9.preheader.preheader:                 ; preds = %._crit_edge
  br label %._crit_edge9.preheader

._crit_edge9.preheader:                           ; preds = %._crit_edge9.preheader.preheader, %._crit_edge7
  %indvar = phi i64 [ %71, %._crit_edge7 ], [ 0, %._crit_edge9.preheader.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge7 ], [ 1, %._crit_edge9.preheader.preheader ]
  %71 = add i64 %indvar, 1
  %72 = add i64 %indvar, 2
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %73 = add nsw i64 %indvars.iv31, -1
  br label %._crit_edge10.preheader.us

._crit_edge10.preheader.us:                       ; preds = %._crit_edge10._crit_edge.us, %._crit_edge9.preheader
  %indvar35 = phi i64 [ %74, %._crit_edge10._crit_edge.us ], [ 0, %._crit_edge9.preheader ]
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge10._crit_edge.us ], [ 1, %._crit_edge9.preheader ]
  %74 = add i64 %indvar35, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %71, i64 %74, i64 1
  %scevgep38 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %71, i64 %74, i64 119
  %scevgep40 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %74, i64 1
  %scevgep42 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %72, i64 %74, i64 119
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %75 = add nsw i64 %indvars.iv28, -1
  %bound0 = icmp ult double* %scevgep, %scevgep42
  %bound1 = icmp ult double* %scevgep40, %scevgep38
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge10.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge10.preheader.us
  br label %vector.body

._crit_edge10.us.preheader:                       ; preds = %._crit_edge10.preheader.us
  br label %._crit_edge10.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv.next32, i64 %indvars.iv28, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv28, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fmul <2 x double> %wide.load44, <double 2.000000e+00, double 2.000000e+00>
  %81 = fsub <2 x double> %wide.load, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %73, i64 %indvars.iv28, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fadd <2 x double> %wide.load45, %81
  %85 = fmul <2 x double> %84, <double 1.250000e-01, double 1.250000e-01>
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv.next29, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = fsub <2 x double> %wide.load46, %80
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %75, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %88, %wide.load47
  %92 = fmul <2 x double> %91, <double 1.250000e-01, double 1.250000e-01>
  %93 = fadd <2 x double> %85, %92
  %94 = add nuw nsw i64 %offset.idx, 1
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv28, i64 %94
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fsub <2 x double> %wide.load48, %80
  %98 = add nsw i64 %offset.idx, -1
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv28, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fadd <2 x double> %97, %wide.load49
  %102 = fmul <2 x double> %101, <double 1.250000e-01, double 1.250000e-01>
  %103 = fadd <2 x double> %93, %102
  %104 = fadd <2 x double> %wide.load44, %103
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv31, i64 %indvars.iv28, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  store <2 x double> %104, <2 x double>* %106, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %107 = icmp eq i64 %index.next, 118
  br i1 %107, label %._crit_edge10._crit_edge.us.loopexit88, label %vector.body, !llvm.loop !15

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.preheader, %._crit_edge10.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge10.us ], [ 1, %._crit_edge10.us.preheader ]
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv.next32, i64 %indvars.iv28, i64 %indvars.iv25
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv28, i64 %indvars.iv25
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, 2.000000e+00
  %113 = fsub double %109, %112
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %73, i64 %indvars.iv28, i64 %indvars.iv25
  %115 = load double, double* %114, align 8
  %116 = fadd double %115, %113
  %117 = fmul double %116, 1.250000e-01
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv.next29, i64 %indvars.iv25
  %119 = load double, double* %118, align 8
  %120 = fsub double %119, %112
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %75, i64 %indvars.iv25
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = fmul double %123, 1.250000e-01
  %125 = fadd double %117, %124
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv28, i64 %indvars.iv.next26
  %127 = load double, double* %126, align 8
  %128 = fsub double %127, %112
  %129 = add nsw i64 %indvars.iv25, -1
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv31, i64 %indvars.iv28, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fadd double %128, %131
  %133 = fmul double %132, 1.250000e-01
  %134 = fadd double %125, %133
  %135 = fadd double %111, %134
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv31, i64 %indvars.iv28, i64 %indvars.iv25
  store double %135, double* %136, align 8
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 119
  br i1 %exitcond27, label %._crit_edge10._crit_edge.us.loopexit, label %._crit_edge10.us, !llvm.loop !16

._crit_edge10._crit_edge.us.loopexit:             ; preds = %._crit_edge10.us
  br label %._crit_edge10._crit_edge.us

._crit_edge10._crit_edge.us.loopexit88:           ; preds = %vector.body
  br label %._crit_edge10._crit_edge.us

._crit_edge10._crit_edge.us:                      ; preds = %._crit_edge10._crit_edge.us.loopexit88, %._crit_edge10._crit_edge.us.loopexit
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 119
  br i1 %exitcond30, label %._crit_edge7, label %._crit_edge10.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge10._crit_edge.us
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 119
  br i1 %exitcond33, label %._crit_edge7._crit_edge, label %._crit_edge9.preheader

._crit_edge7._crit_edge:                          ; preds = %._crit_edge7
  %137 = add nuw nsw i32 %.0518, 1
  %exitcond34 = icmp eq i32 %137, 501
  br i1 %exitcond34, label %138, label %._crit_edge.preheader

; <label>:138:                                    ; preds = %._crit_edge7._crit_edge
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
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %21, %2
  %indvars.iv11 = phi i64 [ 0, %2 ], [ %indvars.iv.next12, %21 ]
  %7 = mul nuw nsw i64 %indvars.iv11, 120
  br label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv8 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next9, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv8, %7
  %9 = mul nuw nsw i64 %8, 120
  br label %10

; <label>:10:                                     ; preds = %._crit_edge4, %._crit_edge3.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge3.preheader ], [ %indvars.iv.next, %._crit_edge4 ]
  %11 = add nuw nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge4

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv11, i64 %indvars.iv8, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %._crit_edge4
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond10, label %21, label %._crit_edge3.preheader

; <label>:21:                                     ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 120
  br i1 %exitcond13, label %22, label %._crit_edge.preheader

; <label>:22:                                     ; preds = %21
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
