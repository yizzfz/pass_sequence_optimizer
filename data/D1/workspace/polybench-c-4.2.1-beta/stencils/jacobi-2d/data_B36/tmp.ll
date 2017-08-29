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
  br i1 %7, label %8, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %8
  br label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %._crit_edge.preheader.lr.ph, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %3
  br label %._crit_edge4

._crit_edge.preheader.lr.ph:                      ; preds = %3
  %5 = sitofp i32 %0 to double
  %wide.trip.count5 = zext i32 %0 to i64
  %wide.trip.count9 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge ], [ 0, %._crit_edge.preheader.lr.ph ]
  %6 = trunc i64 %indvars.iv7 to i32
  %7 = sitofp i32 %6 to double
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.._crit_edge.us_crit_edge, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge.us.._crit_edge.us_crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fmul double %7, %10
  %12 = fadd double %11, 2.000000e+00
  %13 = fdiv double %12, %5
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %indvars.iv, 3
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = fmul double %7, %17
  %19 = fadd double %18, 3.000000e+00
  %20 = fdiv double %19, %5
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next, %wide.trip.count5
  br i1 %exitcond6, label %._crit_edge._crit_edge.us, label %._crit_edge.us.._crit_edge.us_crit_edge

._crit_edge.us.._crit_edge.us_crit_edge:          ; preds = %._crit_edge.us
  br label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %._crit_edge4.loopexit, label %._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge

._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge: ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.preheader.lr.ph, label %.._crit_edge13_crit_edge

.._crit_edge13_crit_edge:                         ; preds = %4
  br label %._crit_edge13

._crit_edge.preheader.lr.ph:                      ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %wide.trip.count18 = zext i32 %6 to i64
  %wide.trip.count14 = zext i32 %6 to i64
  %8 = icmp sgt i32 %6, 1
  %wide.trip.count26 = zext i32 %6 to i64
  %wide.trip.count22 = zext i32 %6 to i64
  %9 = add nsw i64 %wide.trip.count22, -1
  %min.iters.check48 = icmp ult i64 %9, 4
  %n.vec51 = and i64 %9, -4
  %cmp.zero52 = icmp eq i64 %n.vec51, 0
  %ind.end73 = or i64 %n.vec51, 1
  %cmp.n74 = icmp eq i64 %9, %n.vec51
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge5._crit_edge.._crit_edge.preheader_crit_edge, %._crit_edge.preheader.lr.ph
  %.0312 = phi i32 [ 0, %._crit_edge.preheader.lr.ph ], [ %124, %._crit_edge5._crit_edge.._crit_edge.preheader_crit_edge ]
  br i1 %7, label %._crit_edge4.preheader.us.preheader, label %._crit_edge.preheader.._crit_edge5._crit_edge_crit_edge

._crit_edge.preheader.._crit_edge5._crit_edge_crit_edge: ; preds = %._crit_edge.preheader
  br label %._crit_edge5._crit_edge

._crit_edge4.preheader.us.preheader:              ; preds = %._crit_edge.preheader
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4._crit_edge.us.._crit_edge4.preheader.us_crit_edge, %._crit_edge4.preheader.us.preheader
  %indvar54 = phi i64 [ %indvar.next55, %._crit_edge4._crit_edge.us.._crit_edge4.preheader.us_crit_edge ], [ 0, %._crit_edge4.preheader.us.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge4._crit_edge.us.._crit_edge4.preheader.us_crit_edge ], [ 1, %._crit_edge4.preheader.us.preheader ]
  %10 = add i64 %indvar54, 1
  %scevgep56 = getelementptr [1300 x double], [1300 x double]* %3, i64 %10, i64 1
  %scevgep58 = getelementptr [1300 x double], [1300 x double]* %3, i64 %10, i64 %wide.trip.count22
  %scevgep60 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar54, i64 1
  %11 = add i64 %indvar54, 2
  %scevgep62 = getelementptr [1300 x double], [1300 x double]* %2, i64 %11, i64 %wide.trip.count22
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %12 = add nsw i64 %indvars.iv16, -1
  br i1 %min.iters.check48, label %._crit_edge4.preheader.us.._crit_edge4.us.preheader_crit_edge, label %min.iters.checked49

._crit_edge4.preheader.us.._crit_edge4.us.preheader_crit_edge: ; preds = %._crit_edge4.preheader.us
  br label %._crit_edge4.us.preheader

min.iters.checked49:                              ; preds = %._crit_edge4.preheader.us
  br i1 %cmp.zero52, label %min.iters.checked49.._crit_edge4.us.preheader_crit_edge, label %vector.memcheck68

min.iters.checked49.._crit_edge4.us.preheader_crit_edge: ; preds = %min.iters.checked49
  br label %._crit_edge4.us.preheader

vector.memcheck68:                                ; preds = %min.iters.checked49
  %bound064 = icmp ult double* %scevgep56, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br i1 %memcheck.conflict67, label %vector.memcheck68.._crit_edge4.us.preheader_crit_edge, label %vector.body45.preheader

vector.memcheck68.._crit_edge4.us.preheader_crit_edge: ; preds = %vector.memcheck68
  br label %._crit_edge4.us.preheader

vector.body45.preheader:                          ; preds = %vector.memcheck68
  br label %vector.body45

vector.body45:                                    ; preds = %vector.body45.vector.body45_crit_edge, %vector.body45.preheader
  %index70 = phi i64 [ %index.next71, %vector.body45.vector.body45_crit_edge ], [ 0, %vector.body45.preheader ]
  %offset.idx75 = or i64 %index70, 1
  %13 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %offset.idx75
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = add nsw i64 %offset.idx75, -1
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %wide.load80, %wide.load82
  %23 = fadd <2 x double> %wide.load81, %wide.load83
  %24 = add nuw nsw i64 %offset.idx75, 1
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %22, %wide.load84
  %30 = fadd <2 x double> %23, %wide.load85
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next17, i64 %offset.idx75
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load86
  %36 = fadd <2 x double> %30, %wide.load87
  %37 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %12, i64 %offset.idx75
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %35, %wide.load88
  %42 = fadd <2 x double> %36, %wide.load89
  %43 = fmul <2 x double> %41, <double 2.000000e-01, double 2.000000e-01>
  %44 = fmul <2 x double> %42, <double 2.000000e-01, double 2.000000e-01>
  %45 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %offset.idx75
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %43, <2 x double>* %46, align 8, !alias.scope !4, !noalias !1
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %44, <2 x double>* %48, align 8, !alias.scope !4, !noalias !1
  %index.next71 = add i64 %index70, 4
  %49 = icmp eq i64 %index.next71, %n.vec51
  br i1 %49, label %middle.block46, label %vector.body45.vector.body45_crit_edge, !llvm.loop !6

vector.body45.vector.body45_crit_edge:            ; preds = %vector.body45
  br label %vector.body45

middle.block46:                                   ; preds = %vector.body45
  br i1 %cmp.n74, label %middle.block46.._crit_edge4._crit_edge.us_crit_edge, label %middle.block46.._crit_edge4.us.preheader_crit_edge

middle.block46.._crit_edge4.us.preheader_crit_edge: ; preds = %middle.block46
  br label %._crit_edge4.us.preheader

middle.block46.._crit_edge4._crit_edge.us_crit_edge: ; preds = %middle.block46
  br label %._crit_edge4._crit_edge.us

._crit_edge4.us.preheader:                        ; preds = %middle.block46.._crit_edge4.us.preheader_crit_edge, %vector.memcheck68.._crit_edge4.us.preheader_crit_edge, %min.iters.checked49.._crit_edge4.us.preheader_crit_edge, %._crit_edge4.preheader.us.._crit_edge4.us.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck68.._crit_edge4.us.preheader_crit_edge ], [ 1, %min.iters.checked49.._crit_edge4.us.preheader_crit_edge ], [ 1, %._crit_edge4.preheader.us.._crit_edge4.us.preheader_crit_edge ], [ %ind.end73, %middle.block46.._crit_edge4.us.preheader_crit_edge ]
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.._crit_edge4.us_crit_edge, %._crit_edge4.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge4.us.._crit_edge4.us_crit_edge ], [ %indvars.iv.ph, %._crit_edge4.us.preheader ]
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = add nsw i64 %indvars.iv, -1
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fadd double %51, %54
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next17, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %12, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 2.000000e-01
  %66 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  store double %65, double* %66, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next, %wide.trip.count14
  br i1 %exitcond15, label %._crit_edge4._crit_edge.us.loopexit, label %._crit_edge4.us.._crit_edge4.us_crit_edge, !llvm.loop !9

._crit_edge4.us.._crit_edge4.us_crit_edge:        ; preds = %._crit_edge4.us
  br label %._crit_edge4.us

._crit_edge4._crit_edge.us.loopexit:              ; preds = %._crit_edge4.us
  br label %._crit_edge4._crit_edge.us

._crit_edge4._crit_edge.us:                       ; preds = %middle.block46.._crit_edge4._crit_edge.us_crit_edge, %._crit_edge4._crit_edge.us.loopexit
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge5.preheader, label %._crit_edge4._crit_edge.us.._crit_edge4.preheader.us_crit_edge

._crit_edge4._crit_edge.us.._crit_edge4.preheader.us_crit_edge: ; preds = %._crit_edge4._crit_edge.us
  %indvar.next55 = add i64 %indvar54, 1
  br label %._crit_edge4.preheader.us

._crit_edge5.preheader:                           ; preds = %._crit_edge4._crit_edge.us
  br i1 %8, label %._crit_edge6.preheader.us.preheader, label %._crit_edge5.preheader.._crit_edge5._crit_edge_crit_edge

._crit_edge5.preheader.._crit_edge5._crit_edge_crit_edge: ; preds = %._crit_edge5.preheader
  br label %._crit_edge5._crit_edge

._crit_edge6.preheader.us.preheader:              ; preds = %._crit_edge5.preheader
  br label %._crit_edge6.preheader.us

._crit_edge6.preheader.us:                        ; preds = %._crit_edge6._crit_edge.us.._crit_edge6.preheader.us_crit_edge, %._crit_edge6.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge6._crit_edge.us.._crit_edge6.preheader.us_crit_edge ], [ 0, %._crit_edge6.preheader.us.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge6._crit_edge.us.._crit_edge6.preheader.us_crit_edge ], [ 1, %._crit_edge6.preheader.us.preheader ]
  %67 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %67, i64 1
  %scevgep29 = getelementptr [1300 x double], [1300 x double]* %2, i64 %67, i64 %wide.trip.count22
  %scevgep31 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %68 = add i64 %indvar, 2
  %scevgep33 = getelementptr [1300 x double], [1300 x double]* %3, i64 %68, i64 %wide.trip.count22
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %69 = add nsw i64 %indvars.iv24, -1
  br i1 %min.iters.check, label %._crit_edge6.preheader.us.._crit_edge6.us.preheader_crit_edge, label %min.iters.checked

._crit_edge6.preheader.us.._crit_edge6.us.preheader_crit_edge: ; preds = %._crit_edge6.preheader.us
  br label %._crit_edge6.us.preheader

min.iters.checked:                                ; preds = %._crit_edge6.preheader.us
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge6.us.preheader_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge6.us.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge6.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep33
  %bound1 = icmp ult double* %scevgep31, %scevgep29
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.._crit_edge6.us.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.._crit_edge6.us.preheader_crit_edge: ; preds = %vector.memcheck
  br label %._crit_edge6.us.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = add nsw i64 %offset.idx, -1
  %75 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fadd <2 x double> %wide.load, %wide.load37
  %80 = fadd <2 x double> %wide.load36, %wide.load38
  %81 = add nuw nsw i64 %offset.idx, 1
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %81
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %79, %wide.load39
  %87 = fadd <2 x double> %80, %wide.load40
  %88 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next25, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %86, %wide.load41
  %93 = fadd <2 x double> %87, %wide.load42
  %94 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %69, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fadd <2 x double> %92, %wide.load43
  %99 = fadd <2 x double> %93, %wide.load44
  %100 = fmul <2 x double> %98, <double 2.000000e-01, double 2.000000e-01>
  %101 = fmul <2 x double> %99, <double 2.000000e-01, double 2.000000e-01>
  %102 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv24, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  store <2 x double> %100, <2 x double>* %103, align 8, !alias.scope !13, !noalias !10
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  store <2 x double> %101, <2 x double>* %105, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %106 = icmp eq i64 %index.next, %n.vec
  br i1 %106, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge6._crit_edge.us_crit_edge, label %middle.block.._crit_edge6.us.preheader_crit_edge

middle.block.._crit_edge6.us.preheader_crit_edge: ; preds = %middle.block
  br label %._crit_edge6.us.preheader

middle.block.._crit_edge6._crit_edge.us_crit_edge: ; preds = %middle.block
  br label %._crit_edge6._crit_edge.us

._crit_edge6.us.preheader:                        ; preds = %middle.block.._crit_edge6.us.preheader_crit_edge, %vector.memcheck.._crit_edge6.us.preheader_crit_edge, %min.iters.checked.._crit_edge6.us.preheader_crit_edge, %._crit_edge6.preheader.us.._crit_edge6.us.preheader_crit_edge
  %indvars.iv20.ph = phi i64 [ 1, %vector.memcheck.._crit_edge6.us.preheader_crit_edge ], [ 1, %min.iters.checked.._crit_edge6.us.preheader_crit_edge ], [ 1, %._crit_edge6.preheader.us.._crit_edge6.us.preheader_crit_edge ], [ %ind.end, %middle.block.._crit_edge6.us.preheader_crit_edge ]
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.._crit_edge6.us_crit_edge, %._crit_edge6.us.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge6.us.._crit_edge6.us_crit_edge ], [ %indvars.iv20.ph, %._crit_edge6.us.preheader ]
  %107 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv20
  %108 = load double, double* %107, align 8
  %109 = add nsw i64 %indvars.iv20, -1
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %109
  %111 = load double, double* %110, align 8
  %112 = fadd double %108, %111
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv.next21
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next25, i64 %indvars.iv20
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  %119 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %69, i64 %indvars.iv20
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = fmul double %121, 2.000000e-01
  %123 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv20
  store double %122, double* %123, align 8
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %._crit_edge6._crit_edge.us.loopexit, label %._crit_edge6.us.._crit_edge6.us_crit_edge, !llvm.loop !16

._crit_edge6.us.._crit_edge6.us_crit_edge:        ; preds = %._crit_edge6.us
  br label %._crit_edge6.us

._crit_edge6._crit_edge.us.loopexit:              ; preds = %._crit_edge6.us
  br label %._crit_edge6._crit_edge.us

._crit_edge6._crit_edge.us:                       ; preds = %middle.block.._crit_edge6._crit_edge.us_crit_edge, %._crit_edge6._crit_edge.us.loopexit
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %._crit_edge5._crit_edge.loopexit, label %._crit_edge6._crit_edge.us.._crit_edge6.preheader.us_crit_edge

._crit_edge6._crit_edge.us.._crit_edge6.preheader.us_crit_edge: ; preds = %._crit_edge6._crit_edge.us
  %indvar.next = add i64 %indvar, 1
  br label %._crit_edge6.preheader.us

._crit_edge5._crit_edge.loopexit:                 ; preds = %._crit_edge6._crit_edge.us
  br label %._crit_edge5._crit_edge

._crit_edge5._crit_edge:                          ; preds = %._crit_edge5.preheader.._crit_edge5._crit_edge_crit_edge, %._crit_edge.preheader.._crit_edge5._crit_edge_crit_edge, %._crit_edge5._crit_edge.loopexit
  %124 = add nuw nsw i32 %.0312, 1
  %exitcond = icmp eq i32 %124, %0
  br i1 %exitcond, label %._crit_edge13.loopexit, label %._crit_edge5._crit_edge.._crit_edge.preheader_crit_edge

._crit_edge5._crit_edge.._crit_edge.preheader_crit_edge: ; preds = %._crit_edge5._crit_edge
  br label %._crit_edge.preheader

._crit_edge13.loopexit:                           ; preds = %._crit_edge5._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.preheader.us.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count5 = zext i32 %0 to i64
  %wide.trip.count9 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge, %._crit_edge.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv7, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us._crit_edge, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us._crit_edge ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.._crit_edge2.us_crit_edge

.._crit_edge2.us_crit_edge:                       ; preds = %10
  br label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %.._crit_edge2.us_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next, %wide.trip.count5
  br i1 %exitcond6, label %._crit_edge._crit_edge.us, label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us
  br label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %._crit_edge.loopexit, label %._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge

._crit_edge._crit_edge.us.._crit_edge.preheader.us_crit_edge: ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
