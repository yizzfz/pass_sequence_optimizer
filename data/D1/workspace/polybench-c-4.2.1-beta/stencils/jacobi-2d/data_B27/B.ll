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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32, [1300 x double]*, [1300 x double]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.lr.ph, label %._crit_edge19

.preheader.lr.ph:                                 ; preds = %3
  %5 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count22 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %6 = trunc i64 %indvars.iv20 to i32
  %7 = sitofp i32 %6 to double
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %8 ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %7, %11
  %13 = fadd double %12, 2.000000e+00
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv
  store double %14, double* %15, align 8
  %16 = add nuw nsw i64 %indvars.iv, 3
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fmul double %7, %18
  %20 = fadd double %19, 3.000000e+00
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %._crit_edge19.loopexit, label %.preheader.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]*, [1300 x double]*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader55.lr.ph, label %._crit_edge64

.preheader55.lr.ph:                               ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %wide.trip.count67 = zext i32 %6 to i64
  %wide.trip.count = zext i32 %6 to i64
  %8 = icmp sgt i32 %6, 1
  %wide.trip.count75 = zext i32 %6 to i64
  %wide.trip.count71 = zext i32 %6 to i64
  %9 = add nsw i64 %wide.trip.count71, -1
  %min.iters.check98 = icmp ult i64 %9, 4
  %n.vec101 = and i64 %9, -4
  %cmp.zero102 = icmp eq i64 %n.vec101, 0
  %ind.end123 = or i64 %n.vec101, 1
  %cmp.n124 = icmp eq i64 %9, %n.vec101
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader55

.preheader55:                                     ; preds = %._crit_edge62, %.preheader55.lr.ph
  %.05263 = phi i32 [ 0, %.preheader55.lr.ph ], [ %124, %._crit_edge62 ]
  br i1 %7, label %.preheader53.us.preheader, label %._crit_edge62

.preheader53.us.preheader:                        ; preds = %.preheader55
  br label %.preheader53.us

.preheader53.us:                                  ; preds = %.preheader53.us.preheader, %._crit_edge.us
  %indvar104 = phi i64 [ %indvar.next105, %._crit_edge.us ], [ 0, %.preheader53.us.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge.us ], [ 1, %.preheader53.us.preheader ]
  %10 = add i64 %indvar104, 1
  %scevgep106 = getelementptr [1300 x double], [1300 x double]* %3, i64 %10, i64 1
  %scevgep108 = getelementptr [1300 x double], [1300 x double]* %3, i64 %10, i64 %wide.trip.count71
  %scevgep110 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar104, i64 1
  %11 = add i64 %indvar104, 2
  %scevgep112 = getelementptr [1300 x double], [1300 x double]* %2, i64 %11, i64 %wide.trip.count71
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %12 = add nsw i64 %indvars.iv65, -1
  br i1 %min.iters.check98, label %scalar.ph97.preheader, label %min.iters.checked99

min.iters.checked99:                              ; preds = %.preheader53.us
  br i1 %cmp.zero102, label %scalar.ph97.preheader, label %vector.memcheck118

vector.memcheck118:                               ; preds = %min.iters.checked99
  %bound0114 = icmp ult double* %scevgep106, %scevgep112
  %bound1115 = icmp ult double* %scevgep110, %scevgep108
  %memcheck.conflict117 = and i1 %bound0114, %bound1115
  br i1 %memcheck.conflict117, label %scalar.ph97.preheader, label %vector.body95.preheader

vector.body95.preheader:                          ; preds = %vector.memcheck118
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95.preheader, %vector.body95
  %index120 = phi i64 [ %index.next121, %vector.body95 ], [ 0, %vector.body95.preheader ]
  %offset.idx125 = or i64 %index120, 1
  %13 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %offset.idx125
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = add nsw i64 %offset.idx125, -1
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %wide.load130, %wide.load132
  %23 = fadd <2 x double> %wide.load131, %wide.load133
  %24 = add nuw nsw i64 %offset.idx125, 1
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %22, %wide.load134
  %30 = fadd <2 x double> %23, %wide.load135
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next66, i64 %offset.idx125
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load136
  %36 = fadd <2 x double> %30, %wide.load137
  %37 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %12, i64 %offset.idx125
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %35, %wide.load138
  %42 = fadd <2 x double> %36, %wide.load139
  %43 = fmul <2 x double> %41, <double 2.000000e-01, double 2.000000e-01>
  %44 = fmul <2 x double> %42, <double 2.000000e-01, double 2.000000e-01>
  %45 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %offset.idx125
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %43, <2 x double>* %46, align 8, !alias.scope !4, !noalias !1
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %44, <2 x double>* %48, align 8, !alias.scope !4, !noalias !1
  %index.next121 = add i64 %index120, 4
  %49 = icmp eq i64 %index.next121, %n.vec101
  br i1 %49, label %middle.block96, label %vector.body95, !llvm.loop !6

middle.block96:                                   ; preds = %vector.body95
  br i1 %cmp.n124, label %._crit_edge.us, label %scalar.ph97.preheader

scalar.ph97.preheader:                            ; preds = %middle.block96, %vector.memcheck118, %min.iters.checked99, %.preheader53.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck118 ], [ 1, %min.iters.checked99 ], [ 1, %.preheader53.us ], [ %ind.end123, %middle.block96 ]
  br label %scalar.ph97

scalar.ph97:                                      ; preds = %scalar.ph97.preheader, %scalar.ph97
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph97 ], [ %indvars.iv.ph, %scalar.ph97.preheader ]
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = add nsw i64 %indvars.iv, -1
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fadd double %51, %54
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.next
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next66, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %12, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 2.000000e-01
  %66 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv
  store double %65, double* %66, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph97, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph97
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block96
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  %indvar.next105 = add i64 %indvar104, 1
  br i1 %exitcond68, label %.preheader54, label %.preheader53.us

.preheader54:                                     ; preds = %._crit_edge.us
  br i1 %8, label %.preheader.us.preheader, label %._crit_edge62

.preheader.us.preheader:                          ; preds = %.preheader54
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge60.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge60.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge60.us ], [ 1, %.preheader.us.preheader ]
  %67 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %67, i64 1
  %scevgep79 = getelementptr [1300 x double], [1300 x double]* %2, i64 %67, i64 %wide.trip.count71
  %scevgep81 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %68 = add i64 %indvar, 2
  %scevgep83 = getelementptr [1300 x double], [1300 x double]* %3, i64 %68, i64 %wide.trip.count71
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %69 = add nsw i64 %indvars.iv73, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep83
  %bound1 = icmp ult double* %scevgep81, %scevgep79
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = add nsw i64 %offset.idx, -1
  %75 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fadd <2 x double> %wide.load, %wide.load87
  %80 = fadd <2 x double> %wide.load86, %wide.load88
  %81 = add nuw nsw i64 %offset.idx, 1
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %81
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %79, %wide.load89
  %87 = fadd <2 x double> %80, %wide.load90
  %88 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next74, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %86, %wide.load91
  %93 = fadd <2 x double> %87, %wide.load92
  %94 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %69, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fadd <2 x double> %92, %wide.load93
  %99 = fadd <2 x double> %93, %wide.load94
  %100 = fmul <2 x double> %98, <double 2.000000e-01, double 2.000000e-01>
  %101 = fmul <2 x double> %99, <double 2.000000e-01, double 2.000000e-01>
  %102 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv73, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  store <2 x double> %100, <2 x double>* %103, align 8, !alias.scope !13, !noalias !10
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  store <2 x double> %101, <2 x double>* %105, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %106 = icmp eq i64 %index.next, %n.vec
  br i1 %106, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge60.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv69.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %scalar.ph ], [ %indvars.iv69.ph, %scalar.ph.preheader ]
  %107 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv69
  %108 = load double, double* %107, align 8
  %109 = add nsw i64 %indvars.iv69, -1
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %109
  %111 = load double, double* %110, align 8
  %112 = fadd double %108, %111
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv.next70
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next74, i64 %indvars.iv69
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  %119 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %69, i64 %indvars.iv69
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = fmul double %121, 2.000000e-01
  %123 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv69
  store double %122, double* %123, align 8
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge60.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge60.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us.loopexit, %middle.block
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond76, label %._crit_edge62.loopexit, label %.preheader.us

._crit_edge62.loopexit:                           ; preds = %._crit_edge60.us
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge62.loopexit, %.preheader55, %.preheader54
  %124 = add nuw nsw i32 %.05263, 1
  %exitcond77 = icmp eq i32 %124, %0
  br i1 %exitcond77, label %._crit_edge64.loopexit, label %.preheader55

._crit_edge64.loopexit:                           ; preds = %._crit_edge62
  br label %._crit_edge64

._crit_edge64:                                    ; preds = %._crit_edge64.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
