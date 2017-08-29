; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %7, double* %8)
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
  %14 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = insertelement <2 x double> %7, double %5, i32 1
  br label %9

; <label>:9:                                      ; preds = %9, %.lr.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %9 ], [ 0, %.lr.ph ]
  %10 = trunc i64 %indvars.iv4 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv4
  %13 = trunc i64 %indvars.iv4 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 3.000000e+00>
  %18 = fdiv <2 x double> %17, %8
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  store double %19, double* %12, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv4
  store double %20, double* %21, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, %6
  br i1 %exitcond, label %.loopexit.loopexit, label %9

.loopexit.loopexit:                               ; preds = %9
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %._crit_edge.lr.ph.split

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %._crit_edge.lr.ph.._crit_edge.us_crit_edge, label %._crit_edge.lr.ph.split

._crit_edge.lr.ph.._crit_edge.us_crit_edge:       ; preds = %._crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax41 = select i1 %12, i64 %9, i64 2
  %scevgep42 = getelementptr double, double* %2, i64 %smax41
  %13 = add nuw nsw i64 %smax41, 1
  %scevgep44 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax55 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax55, -1
  %scevgep62 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax64 = select i1 %16, i64 %9, i64 2
  %scevgep65 = getelementptr double, double* %3, i64 %smax64
  %17 = add nuw nsw i64 %smax64, 1
  %scevgep67 = getelementptr double, double* %2, i64 %17
  %min.iters.check56 = icmp ult i64 %15, 4
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep44
  %bound1 = icmp ugt double* %scevgep42, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %n.vec59 = and i64 %15, -4
  %cmp.zero60 = icmp eq i64 %n.vec59, 0
  %bound069 = icmp ult double* %scevgep62, %scevgep67
  %bound170 = icmp ugt double* %scevgep65, %2
  %memcheck.conflict72 = and i1 %bound069, %bound170
  %ind.end78 = or i64 %n.vec59, 1
  %cmp.n79 = icmp eq i64 %15, %n.vec59
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge7.us, %._crit_edge.lr.ph.._crit_edge.us_crit_edge
  %18 = phi i32 [ %44, %._crit_edge7.us ], [ 0, %._crit_edge.lr.ph.._crit_edge.us_crit_edge ]
  br i1 %min.iters.check56, label %scalar.ph54.preheader, label %min.iters.checked57

scalar.ph54.preheader:                            ; preds = %middle.block53, %vector.memcheck73, %min.iters.checked57, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck73 ], [ 1, %min.iters.checked57 ], [ 1, %._crit_edge.us ], [ %ind.end78, %middle.block53 ]
  br label %scalar.ph54

min.iters.checked57:                              ; preds = %._crit_edge.us
  br i1 %cmp.zero60, label %scalar.ph54.preheader, label %vector.memcheck73

vector.memcheck73:                                ; preds = %min.iters.checked57
  br i1 %memcheck.conflict72, label %scalar.ph54.preheader, label %vector.body52.preheader

vector.body52.preheader:                          ; preds = %vector.memcheck73
  br label %vector.body52

vector.body52:                                    ; preds = %vector.body52.preheader, %vector.body52
  %index75 = phi i64 [ %index.next76, %vector.body52 ], [ 0, %vector.body52.preheader ]
  %offset.idx80 = or i64 %index75, 1
  %19 = add nsw i64 %offset.idx80, -1
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds double, double* %2, i64 %offset.idx80
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load85, %wide.load87
  %29 = fadd <2 x double> %wide.load86, %wide.load88
  %30 = add nuw nsw i64 %offset.idx80, 1
  %31 = getelementptr inbounds double, double* %2, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %28, %wide.load89
  %36 = fadd <2 x double> %29, %wide.load90
  %37 = fmul <2 x double> %35, <double 3.333300e-01, double 3.333300e-01>
  %38 = fmul <2 x double> %36, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %3, i64 %offset.idx80
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next76 = add i64 %index75, 4
  %43 = icmp eq i64 %index.next76, %n.vec59
  br i1 %43, label %middle.block53, label %vector.body52, !llvm.loop !6

middle.block53:                                   ; preds = %vector.body52
  br i1 %cmp.n79, label %.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge, label %scalar.ph54.preheader

._crit_edge7.us.loopexit:                         ; preds = %.lr.ph6.us
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %middle.block
  %44 = add nuw nsw i32 %18, 1
  %exitcond = icmp eq i32 %44, %0
  br i1 %exitcond, label %._crit_edge.lr.ph.split.loopexit, label %._crit_edge.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader ]
  %45 = add nsw i64 %indvars.iv29, -1
  %46 = getelementptr inbounds double, double* %3, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next30
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  %54 = fmul double %53, 3.333300e-01
  %55 = getelementptr inbounds double, double* %2, i64 %indvars.iv29
  store double %54, double* %55, align 8
  %56 = icmp slt i64 %indvars.iv.next30, %9
  br i1 %56, label %.lr.ph6.us, label %._crit_edge7.us.loopexit, !llvm.loop !9

scalar.ph54:                                      ; preds = %scalar.ph54.preheader, %scalar.ph54
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph54 ], [ %indvars.iv.ph, %scalar.ph54.preheader ]
  %57 = add nsw i64 %indvars.iv, -1
  %58 = getelementptr inbounds double, double* %2, i64 %57
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = fmul double %65, 3.333300e-01
  %67 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %66, double* %67, align 8
  %68 = icmp slt i64 %indvars.iv.next, %9
  br i1 %68, label %scalar.ph54, label %.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge.loopexit, !llvm.loop !10

.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge.loopexit: ; preds = %scalar.ph54
  br label %.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge

.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge:  ; preds = %.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge.loopexit, %middle.block53
  br i1 %min.iters.check, label %.lr.ph6.us.preheader, label %min.iters.checked

.lr.ph6.us.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge ], [ %ind.end, %middle.block ]
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.._crit_edge3_crit_edge.us..lr.ph6.us_crit_edge
  br i1 %cmp.zero, label %.lr.ph6.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %69 = add nsw i64 %offset.idx, -1
  %70 = getelementptr inbounds double, double* %3, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !11
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !11
  %74 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !11
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !11
  %78 = fadd <2 x double> %wide.load, %wide.load48
  %79 = fadd <2 x double> %wide.load47, %wide.load49
  %80 = add nuw nsw i64 %offset.idx, 1
  %81 = getelementptr inbounds double, double* %3, i64 %80
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !11
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !11
  %85 = fadd <2 x double> %78, %wide.load50
  %86 = fadd <2 x double> %79, %wide.load51
  %87 = fmul <2 x double> %85, <double 3.333300e-01, double 3.333300e-01>
  %88 = fmul <2 x double> %86, <double 3.333300e-01, double 3.333300e-01>
  %89 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  store <2 x double> %87, <2 x double>* %90, align 8, !alias.scope !14, !noalias !11
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  store <2 x double> %88, <2 x double>* %92, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %93 = icmp eq i64 %index.next, %n.vec
  br i1 %93, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge7.us, label %.lr.ph6.us.preheader

._crit_edge.lr.ph.split.loopexit:                 ; preds = %._crit_edge7.us
  br label %._crit_edge.lr.ph.split

._crit_edge.lr.ph.split:                          ; preds = %._crit_edge.lr.ph.split.loopexit, %._crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %18, %._crit_edge ]
  %10 = srem i32 %storemerge1, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond, label %.loopexit.loopexit, label %9

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
