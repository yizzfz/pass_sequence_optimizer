; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %3 = trunc i64 %indvars.iv21 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %5 ]
  %6 = add nuw nsw i64 %indvars.iv, 2
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %4, %8
  %10 = fadd double %9, 2.000000e+00
  %11 = fdiv double %10, 1.300000e+03
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = add nuw nsw i64 %indvars.iv, 3
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %4, %15
  %17 = fadd double %16, 3.000000e+00
  %18 = fdiv double %17, 1.300000e+03
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %5

._crit_edge.us:                                   ; preds = %5
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 1300
  br i1 %exitcond24, label %._crit_edge20, label %.preheader.us

._crit_edge20:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader55.lr.ph:
  br label %.preheader55

.preheader55:                                     ; preds = %._crit_edge62, %.preheader55.lr.ph
  %.05263 = phi i32 [ 0, %.preheader55.lr.ph ], [ %116, %._crit_edge62 ]
  br label %.preheader53.us

.preheader53.us:                                  ; preds = %.preheader55, %._crit_edge.us
  %indvar100 = phi i64 [ 0, %.preheader55 ], [ %4, %._crit_edge.us ]
  %indvars.iv65 = phi i64 [ 1, %.preheader55 ], [ %indvars.iv.next66, %._crit_edge.us ]
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
  br i1 %memcheck.conflict113, label %scalar.ph97.preheader, label %vector.body95.preheader

vector.body95.preheader:                          ; preds = %.preheader53.us
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95.preheader, %vector.body95
  %index116 = phi i64 [ %index.next117, %vector.body95 ], [ 0, %vector.body95.preheader ]
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
  %20 = getelementptr double, double* %19, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %16, %wide.load128
  %23 = fadd <2 x double> %17, %wide.load130
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next66, i64 %offset.idx120
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %22, %wide.load131
  %29 = fadd <2 x double> %23, %wide.load132
  %30 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %offset.idx120
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %28, %wide.load133
  %35 = fadd <2 x double> %29, %wide.load134
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %offset.idx120
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %36, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %37, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %index.next117 = add i64 %index116, 4
  %42 = icmp eq i64 %index.next117, 1296
  br i1 %42, label %scalar.ph97.preheader.loopexit, label %vector.body95, !llvm.loop !6

scalar.ph97.preheader.loopexit:                   ; preds = %vector.body95
  br label %scalar.ph97.preheader

scalar.ph97.preheader:                            ; preds = %scalar.ph97.preheader.loopexit, %.preheader53.us
  %indvars.iv.ph = phi i64 [ 1, %.preheader53.us ], [ 1297, %scalar.ph97.preheader.loopexit ]
  br label %scalar.ph97

scalar.ph97:                                      ; preds = %scalar.ph97.preheader, %scalar.ph97
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph97 ], [ %indvars.iv.ph, %scalar.ph97.preheader ]
  %43 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = add nsw i64 %indvars.iv, -1
  %46 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %45
  %47 = load double, double* %46, align 8
  %48 = fadd double %44, %47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next66, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 2.000000e-01
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv
  store double %58, double* %59, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %._crit_edge.us, label %scalar.ph97, !llvm.loop !9

._crit_edge.us:                                   ; preds = %scalar.ph97
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 1299
  br i1 %exitcond68, label %.preheader.us.preheader, label %.preheader53.us

.preheader.us.preheader:                          ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge60.us
  %indvar = phi i64 [ %60, %._crit_edge60.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge60.us ], [ 1, %.preheader.us.preheader ]
  %60 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %60, i64 1
  %scevgep79 = getelementptr [1300 x double], [1300 x double]* %2, i64 %60, i64 1299
  %scevgep81 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %61 = add i64 %indvar, 2
  %scevgep83 = getelementptr [1300 x double], [1300 x double]* %3, i64 %61, i64 1299
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %62 = add nsw i64 %indvars.iv73, -1
  %bound0 = icmp ult double* %scevgep, %scevgep83
  %bound1 = icmp ult double* %scevgep81, %scevgep79
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %63 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = add nsw i64 %offset.idx, -1
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fadd <2 x double> %wide.load, %wide.load87
  %73 = fadd <2 x double> %wide.load86, %wide.load88
  %74 = add nuw nsw i64 %offset.idx, 1
  %75 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %74
  %76 = getelementptr double, double* %75, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %72, %wide.load88
  %79 = fadd <2 x double> %73, %wide.load90
  %80 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next74, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fadd <2 x double> %78, %wide.load91
  %85 = fadd <2 x double> %79, %wide.load92
  %86 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %62, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %84, %wide.load93
  %91 = fadd <2 x double> %85, %wide.load94
  %92 = fmul <2 x double> %90, <double 2.000000e-01, double 2.000000e-01>
  %93 = fmul <2 x double> %91, <double 2.000000e-01, double 2.000000e-01>
  %94 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv73, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  store <2 x double> %92, <2 x double>* %95, align 8, !alias.scope !13, !noalias !10
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x double>*
  store <2 x double> %93, <2 x double>* %97, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %98 = icmp eq i64 %index.next, 1296
  br i1 %98, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !15

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv69.ph = phi i64 [ 1, %.preheader.us ], [ 1297, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %scalar.ph ], [ %indvars.iv69.ph, %scalar.ph.preheader ]
  %99 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv69
  %100 = load double, double* %99, align 8
  %101 = add nsw i64 %indvars.iv69, -1
  %102 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fadd double %100, %103
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %105 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv.next70
  %106 = load double, double* %105, align 8
  %107 = fadd double %104, %106
  %108 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next74, i64 %indvars.iv69
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %62, i64 %indvars.iv69
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  %114 = fmul double %113, 2.000000e-01
  %115 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv69
  store double %114, double* %115, align 8
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1299
  br i1 %exitcond72, label %._crit_edge60.us, label %scalar.ph, !llvm.loop !16

._crit_edge60.us:                                 ; preds = %scalar.ph
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1299
  br i1 %exitcond76, label %._crit_edge62, label %.preheader.us

._crit_edge62:                                    ; preds = %._crit_edge60.us
  %116 = add nuw nsw i32 %.05263, 1
  %exitcond77 = icmp eq i32 %116, 500
  br i1 %exitcond77, label %._crit_edge64, label %.preheader55

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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv15, 1300
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nsw i64 %indvars.iv, %6
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
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1300
  br i1 %exitcond18, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
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
