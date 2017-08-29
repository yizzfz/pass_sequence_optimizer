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
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [1300 x double]*
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
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
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %3 = trunc i64 %indvars.iv2 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %7 ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
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
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv2, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %7
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1300
  br i1 %exitcond5, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader3.lr.ph:
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge6, %.preheader3.lr.ph
  %4 = phi i32 [ 0, %.preheader3.lr.ph ], [ %117, %._crit_edge6 ]
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader3, %._crit_edge.us
  %indvar43 = phi i64 [ 0, %.preheader3 ], [ %5, %._crit_edge.us ]
  %indvars.iv8 = phi i64 [ 1, %.preheader3 ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = add nuw nsw i64 %indvar43, 1
  %scevgep45 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1
  %scevgep47 = getelementptr [1300 x double], [1300 x double]* %3, i64 %5, i64 1299
  %scevgep49 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar43, i64 1
  %6 = add nuw nsw i64 %indvar43, 2
  %scevgep51 = getelementptr [1300 x double], [1300 x double]* %2, i64 %6, i64 1299
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %7 = add nsw i64 %indvars.iv8, -1
  %bound053 = icmp ult double* %scevgep45, %scevgep51
  %bound154 = icmp ult double* %scevgep49, %scevgep47
  %memcheck.conflict56 = and i1 %bound053, %bound154
  br i1 %memcheck.conflict56, label %scalar.ph40.preheader, label %vector.body38.preheader

vector.body38.preheader:                          ; preds = %.preheader1.us
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38.preheader, %vector.body38
  %index59 = phi i64 [ %index.next60, %vector.body38 ], [ 0, %vector.body38.preheader ]
  %offset.idx63 = or i64 %index59, 1
  %8 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %offset.idx63
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = add nsw i64 %offset.idx63, -1
  %13 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %12
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load68, %wide.load70
  %18 = fadd <2 x double> %wide.load69, %wide.load71
  %19 = add nuw nsw i64 %offset.idx63, 1
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %19
  %21 = getelementptr double, double* %20, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %17, %wide.load71
  %24 = fadd <2 x double> %18, %wide.load73
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next9, i64 %offset.idx63
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %23, %wide.load74
  %30 = fadd <2 x double> %24, %wide.load75
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %offset.idx63
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load76
  %36 = fadd <2 x double> %30, %wide.load77
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv8, i64 %offset.idx63
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next60 = add nuw nsw i64 %index59, 4
  %43 = icmp eq i64 %index.next60, 1296
  br i1 %43, label %scalar.ph40.preheader.loopexit, label %vector.body38, !llvm.loop !6

scalar.ph40.preheader.loopexit:                   ; preds = %vector.body38
  br label %scalar.ph40.preheader

scalar.ph40.preheader:                            ; preds = %scalar.ph40.preheader.loopexit, %.preheader1.us
  %indvars.iv.ph = phi i64 [ 1, %.preheader1.us ], [ 1297, %scalar.ph40.preheader.loopexit ]
  br label %scalar.ph40

scalar.ph40:                                      ; preds = %scalar.ph40.preheader, %scalar.ph40
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph40 ], [ %indvars.iv.ph, %scalar.ph40.preheader ]
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %46
  %48 = load double, double* %47, align 8
  %49 = fadd double %45, %48
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next9, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = fmul double %58, 2.000000e-01
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  store double %59, double* %60, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %._crit_edge.us, label %scalar.ph40, !llvm.loop !9

._crit_edge.us:                                   ; preds = %scalar.ph40
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 1299
  br i1 %exitcond11, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge5.us
  %indvar = phi i64 [ %61, %._crit_edge5.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge5.us ], [ 1, %.preheader.us.preheader ]
  %61 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1
  %scevgep22 = getelementptr [1300 x double], [1300 x double]* %2, i64 %61, i64 1299
  %scevgep24 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %62 = add nuw nsw i64 %indvar, 2
  %scevgep26 = getelementptr [1300 x double], [1300 x double]* %3, i64 %62, i64 1299
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %63 = add nsw i64 %indvars.iv16, -1
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep26
  %bound1 = icmp ult double* %scevgep24, %scevgep22
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = add nsw i64 %offset.idx, -1
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %wide.load, %wide.load30
  %74 = fadd <2 x double> %wide.load29, %wide.load31
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %75
  %77 = getelementptr double, double* %76, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fadd <2 x double> %73, %wide.load31
  %80 = fadd <2 x double> %74, %wide.load33
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next17, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %79, %wide.load34
  %86 = fadd <2 x double> %80, %wide.load35
  %87 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %85, %wide.load36
  %92 = fadd <2 x double> %86, %wide.load37
  %93 = fmul <2 x double> %91, <double 2.000000e-01, double 2.000000e-01>
  %94 = fmul <2 x double> %92, <double 2.000000e-01, double 2.000000e-01>
  %95 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  store <2 x double> %93, <2 x double>* %96, align 8, !alias.scope !13, !noalias !10
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  store <2 x double> %94, <2 x double>* %98, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %99 = icmp eq i64 %index.next, 1296
  br i1 %99, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 false, label %._crit_edge5.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ 1297, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %scalar.ph ], [ %indvars.iv12.ph, %scalar.ph.preheader ]
  %100 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv12
  %101 = load double, double* %100, align 8
  %102 = add nsw i64 %indvars.iv12, -1
  %103 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fadd double %101, %104
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %106 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv.next13
  %107 = load double, double* %106, align 8
  %108 = fadd double %105, %107
  %109 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next17, i64 %indvars.iv12
  %110 = load double, double* %109, align 8
  %111 = fadd double %108, %110
  %112 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %63, i64 %indvars.iv12
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  %115 = fmul double %114, 2.000000e-01
  %116 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv12
  store double %115, double* %116, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 1299
  br i1 %exitcond15, label %._crit_edge5.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge5.us.loopexit:                         ; preds = %scalar.ph
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1299
  br i1 %exitcond19, label %._crit_edge6, label %.preheader.us

._crit_edge6:                                     ; preds = %._crit_edge5.us
  %117 = add nuw nsw i32 %4, 1
  %exitcond20 = icmp eq i32 %117, 500
  br i1 %exitcond20, label %._crit_edge7, label %.preheader3

._crit_edge7:                                     ; preds = %._crit_edge6
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
  %indvars.iv2 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next3, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv2, 1300
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1300
  br i1 %exitcond5, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
