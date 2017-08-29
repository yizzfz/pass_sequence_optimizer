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
  tail call fastcc void @init_array([1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d([1300 x double]* %5, [1300 x double]* %6)
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
  tail call fastcc void @print_array([1300 x double]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %23, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %23 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %7 ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
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
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %23, label %7

; <label>:23:                                     ; preds = %7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1300
  br i1 %exitcond3, label %24, label %.preheader

; <label>:24:                                     ; preds = %23
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d([1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %118, %2
  %3 = phi i32 [ 0, %2 ], [ %119, %118 ]
  br label %.preheader1

.preheader1:                                      ; preds = %.loopexit71, %.preheader3
  %indvar36 = phi i64 [ %indvar.next37, %.loopexit71 ], [ 0, %.preheader3 ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %.loopexit71 ], [ 1, %.preheader3 ]
  %4 = add i64 %indvar36, 1
  %scevgep38 = getelementptr [1300 x double], [1300 x double]* %1, i64 %4, i64 1
  %scevgep40 = getelementptr [1300 x double], [1300 x double]* %1, i64 %4, i64 1299
  %scevgep42 = getelementptr [1300 x double], [1300 x double]* %0, i64 %indvar36, i64 1
  %5 = add i64 %indvar36, 2
  %scevgep44 = getelementptr [1300 x double], [1300 x double]* %0, i64 %5, i64 1299
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %6 = add nsw i64 %indvars.iv4, -1
  %bound046 = icmp ult double* %scevgep38, %scevgep44
  %bound147 = icmp ult double* %scevgep42, %scevgep40
  %memcheck.conflict49 = and i1 %bound046, %bound147
  br i1 %memcheck.conflict49, label %scalar.ph33.preheader, label %vector.body31.preheader

vector.body31.preheader:                          ; preds = %.preheader1
  br label %vector.body31

vector.body31:                                    ; preds = %vector.body31.preheader, %vector.body31
  %index52 = phi i64 [ %index.next53, %vector.body31 ], [ 0, %vector.body31.preheader ]
  %offset.idx56 = or i64 %index52, 1
  %7 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv4, i64 %offset.idx56
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = add nsw i64 %offset.idx56, -1
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv4, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load61, %wide.load63
  %17 = fadd <2 x double> %wide.load62, %wide.load64
  %18 = add nuw nsw i64 %offset.idx56, 1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv4, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %16, %wide.load65
  %24 = fadd <2 x double> %17, %wide.load66
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv.next5, i64 %offset.idx56
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %23, %wide.load67
  %30 = fadd <2 x double> %24, %wide.load68
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %6, i64 %offset.idx56
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load69
  %36 = fadd <2 x double> %30, %wide.load70
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv4, i64 %offset.idx56
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next53 = add i64 %index52, 4
  %43 = icmp eq i64 %index.next53, 1296
  br i1 %43, label %scalar.ph33.preheader.loopexit, label %vector.body31, !llvm.loop !6

scalar.ph33.preheader.loopexit:                   ; preds = %vector.body31
  br label %scalar.ph33.preheader

scalar.ph33.preheader:                            ; preds = %scalar.ph33.preheader.loopexit, %.preheader1
  %indvars.iv.ph = phi i64 [ 1, %.preheader1 ], [ 1297, %scalar.ph33.preheader.loopexit ]
  br label %scalar.ph33

scalar.ph33:                                      ; preds = %scalar.ph33.preheader, %scalar.ph33
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph33 ], [ %indvars.iv.ph, %scalar.ph33.preheader ]
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv4, i64 %46
  %48 = load double, double* %47, align 8
  %49 = fadd double %45, %48
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %6, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = fmul double %58, 2.000000e-01
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  store double %59, double* %60, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %.loopexit71, label %scalar.ph33, !llvm.loop !9

.loopexit71:                                      ; preds = %scalar.ph33
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1299
  %indvar.next37 = add i64 %indvar36, 1
  br i1 %exitcond6, label %.preheader.preheader, label %.preheader1

.preheader.preheader:                             ; preds = %.loopexit71
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvar = phi i64 [ %indvar.next, %.loopexit ], [ 0, %.preheader.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %.loopexit ], [ 1, %.preheader.preheader ]
  %61 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %0, i64 %61, i64 1
  %scevgep15 = getelementptr [1300 x double], [1300 x double]* %0, i64 %61, i64 1299
  %scevgep17 = getelementptr [1300 x double], [1300 x double]* %1, i64 %indvar, i64 1
  %62 = add i64 %indvar, 2
  %scevgep19 = getelementptr [1300 x double], [1300 x double]* %1, i64 %62, i64 1299
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %63 = add nsw i64 %indvars.iv10, -1
  %bound0 = icmp ult double* %scevgep, %scevgep19
  %bound1 = icmp ult double* %scevgep17, %scevgep15
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv10, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = add nsw i64 %offset.idx, -1
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv10, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %wide.load, %wide.load23
  %74 = fadd <2 x double> %wide.load22, %wide.load24
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv10, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %73, %wide.load25
  %81 = fadd <2 x double> %74, %wide.load26
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv.next11, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %80, %wide.load27
  %87 = fadd <2 x double> %81, %wide.load28
  %88 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %63, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %86, %wide.load29
  %93 = fadd <2 x double> %87, %wide.load30
  %94 = fmul <2 x double> %92, <double 2.000000e-01, double 2.000000e-01>
  %95 = fmul <2 x double> %93, <double 2.000000e-01, double 2.000000e-01>
  %96 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv10, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  store <2 x double> %94, <2 x double>* %97, align 8, !alias.scope !13, !noalias !10
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  store <2 x double> %95, <2 x double>* %99, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %100 = icmp eq i64 %index.next, 1296
  br i1 %100, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !15

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader
  %indvars.iv7.ph = phi i64 [ 1, %.preheader ], [ 1297, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %scalar.ph ], [ %indvars.iv7.ph, %scalar.ph.preheader ]
  %101 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv7
  %102 = load double, double* %101, align 8
  %103 = add nsw i64 %indvars.iv7, -1
  %104 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv10, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fadd double %102, %105
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %107 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv.next8
  %108 = load double, double* %107, align 8
  %109 = fadd double %106, %108
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv7
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %63, i64 %indvars.iv7
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = fmul double %115, 2.000000e-01
  %117 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv7
  store double %116, double* %117, align 8
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1299
  br i1 %exitcond9, label %.loopexit, label %scalar.ph, !llvm.loop !16

.loopexit:                                        ; preds = %scalar.ph
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond12, label %118, label %.preheader

; <label>:118:                                    ; preds = %.loopexit
  %119 = add nuw nsw i32 %3, 1
  %exitcond13 = icmp eq i32 %119, 500
  br i1 %exitcond13, label %120, label %.preheader3

; <label>:120:                                    ; preds = %118
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1300 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1300
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1300
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
