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
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %8, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %3 = trunc i64 %indvars.iv5 to i32
  %4 = sitofp i32 %3 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %4, %7
  %9 = fadd double %8, 2.000000e+00
  %10 = fdiv double %9, 1.300000e+03
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = add nuw nsw i64 %indvars.iv, 3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %4, %14
  %16 = fadd double %15, 3.000000e+00
  %17 = fdiv double %16, 1.300000e+03
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1300
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader4.us.preheader

.preheader4.us.preheader:                         ; preds = %._crit_edge13, %.preheader6.lr.ph
  %.0314 = phi i32 [ 0, %.preheader6.lr.ph ], [ %118, %._crit_edge13 ]
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvar49 = phi i64 [ %indvar.next50, %._crit_edge.us..preheader4.us_crit_edge ], [ 0, %.preheader4.us.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us..preheader4.us_crit_edge ], [ 1, %.preheader4.us.preheader ]
  %4 = add i64 %indvar49, 1
  %scevgep51 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1
  %scevgep53 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1299
  %scevgep55 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar49, i64 1
  %5 = add i64 %indvar49, 2
  %scevgep57 = getelementptr [1300 x double], [1300 x double]* %2, i64 %5, i64 1299
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %6 = add nsw i64 %indvars.iv16, -1
  %bound059 = icmp ult double* %scevgep51, %scevgep57
  %bound160 = icmp ult double* %scevgep55, %scevgep53
  %memcheck.conflict62 = and i1 %bound059, %bound160
  br i1 %memcheck.conflict62, label %._crit_edge.preheader, label %vector.body44.preheader

vector.body44.preheader:                          ; preds = %.preheader4.us
  br label %vector.body44

vector.body44:                                    ; preds = %vector.body44, %vector.body44.preheader
  %index65 = phi i64 [ %index.next66, %vector.body44 ], [ 0, %vector.body44.preheader ]
  %offset.idx69 = or i64 %index65, 1
  %7 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %offset.idx69
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = add nsw i64 %offset.idx69, -1
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load74, %wide.load76
  %17 = fadd <2 x double> %wide.load75, %wide.load77
  %18 = add nuw nsw i64 %offset.idx69, 1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %16, %wide.load78
  %24 = fadd <2 x double> %17, %wide.load79
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next17, i64 %offset.idx69
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %23, %wide.load80
  %30 = fadd <2 x double> %24, %wide.load81
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %offset.idx69
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load82
  %36 = fadd <2 x double> %30, %wide.load83
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %offset.idx69
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next66 = add i64 %index65, 4
  %43 = icmp eq i64 %index.next66, 1296
  br i1 %43, label %._crit_edge.preheader.loopexit, label %vector.body44, !llvm.loop !6

._crit_edge.preheader.loopexit:                   ; preds = %vector.body44
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.loopexit, %.preheader4.us
  %indvars.iv.ph = phi i64 [ 1, %.preheader4.us ], [ 1297, %._crit_edge.preheader.loopexit ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %46
  %48 = load double, double* %47, align 8
  %49 = fadd double %45, %48
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next17, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = fmul double %58, 2.000000e-01
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  store double %59, double* %60, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge, !llvm.loop !9

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1299
  br i1 %exitcond18, label %.preheader.us.preheader, label %._crit_edge.us..preheader4.us_crit_edge

.preheader.us.preheader:                          ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.us..preheader4.us_crit_edge:          ; preds = %._crit_edge.us
  %indvar.next50 = add i64 %indvar49, 1
  br label %.preheader4.us

.preheader.us:                                    ; preds = %._crit_edge11.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge11.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge11.us..preheader.us_crit_edge ], [ 1, %.preheader.us.preheader ]
  %61 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1
  %scevgep28 = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1299
  %scevgep30 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %62 = add i64 %indvar, 2
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %3, i64 %62, i64 1299
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %63 = add nsw i64 %indvars.iv22, -1
  %bound0 = icmp ult double* %scevgep, %scevgep32
  %bound1 = icmp ult double* %scevgep30, %scevgep28
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge26.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv22, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = add nsw i64 %offset.idx, -1
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv22, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %wide.load, %wide.load36
  %74 = fadd <2 x double> %wide.load35, %wide.load37
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv22, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %73, %wide.load38
  %81 = fadd <2 x double> %74, %wide.load39
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next23, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %80, %wide.load40
  %87 = fadd <2 x double> %81, %wide.load41
  %88 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %86, %wide.load42
  %93 = fadd <2 x double> %87, %wide.load43
  %94 = fmul <2 x double> %92, <double 2.000000e-01, double 2.000000e-01>
  %95 = fmul <2 x double> %93, <double 2.000000e-01, double 2.000000e-01>
  %96 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv22, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  store <2 x double> %94, <2 x double>* %97, align 8, !alias.scope !13, !noalias !10
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  store <2 x double> %95, <2 x double>* %99, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %100 = icmp eq i64 %index.next, 1296
  br i1 %100, label %._crit_edge26.preheader.loopexit, label %vector.body, !llvm.loop !15

._crit_edge26.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge26.preheader

._crit_edge26.preheader:                          ; preds = %._crit_edge26.preheader.loopexit, %.preheader.us
  %indvars.iv19.ph = phi i64 [ 1, %.preheader.us ], [ 1297, %._crit_edge26.preheader.loopexit ]
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26, %._crit_edge26.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge26 ], [ %indvars.iv19.ph, %._crit_edge26.preheader ]
  %101 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv19
  %102 = load double, double* %101, align 8
  %103 = add nsw i64 %indvars.iv19, -1
  %104 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv22, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fadd double %102, %105
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %107 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv.next20
  %108 = load double, double* %107, align 8
  %109 = fadd double %106, %108
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv19
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %indvars.iv19
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = fmul double %115, 2.000000e-01
  %117 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv19
  store double %116, double* %117, align 8
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1299
  br i1 %exitcond21, label %._crit_edge11.us, label %._crit_edge26, !llvm.loop !16

._crit_edge11.us:                                 ; preds = %._crit_edge26
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1299
  br i1 %exitcond24, label %._crit_edge13, label %._crit_edge11.us..preheader.us_crit_edge

._crit_edge11.us..preheader.us_crit_edge:         ; preds = %._crit_edge11.us
  %indvar.next = add i64 %indvar, 1
  br label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %118 = add nuw nsw i32 %.0314, 1
  %exitcond25 = icmp eq i32 %118, 500
  br i1 %exitcond25, label %._crit_edge15, label %.preheader4.us.preheader

._crit_edge15:                                    ; preds = %._crit_edge13
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1300
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %._crit_edge8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge8

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1300
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
