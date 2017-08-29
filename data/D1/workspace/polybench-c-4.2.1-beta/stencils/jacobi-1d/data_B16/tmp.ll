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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(double* %5, double* %6)
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
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture) unnamed_addr #2 {
vector.memcheck:
  %scevgep = getelementptr double, double* %0, i64 2000
  %scevgep5 = getelementptr double, double* %1, i64 2000
  %bound0 = icmp ugt double* %scevgep5, %0
  %bound1 = icmp ugt double* %scevgep, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge3.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

._crit_edge3.preheader:                           ; preds = %vector.memcheck
  br label %._crit_edge3

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.ind7 = phi <2 x i32> [ %vec.ind.next8, %vector.body ], [ <i32 0, i32 1>, %vector.body.preheader ]
  %2 = sitofp <2 x i32> %vec.ind7 to <2 x double>
  %3 = fadd <2 x double> %2, <double 2.000000e+00, double 2.000000e+00>
  %4 = fdiv <2 x double> %3, <double 2.000000e+03, double 2.000000e+03>
  %5 = getelementptr inbounds double, double* %0, i64 %index
  %6 = bitcast double* %5 to <2 x double>*
  store <2 x double> %4, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %7 = fadd <2 x double> %2, <double 3.000000e+00, double 3.000000e+00>
  %8 = fdiv <2 x double> %7, <double 2.000000e+03, double 2.000000e+03>
  %9 = getelementptr inbounds double, double* %1, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  store <2 x double> %8, <2 x double>* %10, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next8 = add <2 x i32> %vec.ind7, <i32 2, i32 2>
  %11 = icmp eq i64 %index.next, 2000
  br i1 %11, label %._crit_edge.loopexit10, label %vector.body, !llvm.loop !6

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge3
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %._crit_edge3 ], [ 0, %._crit_edge3.preheader ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = fadd double %13, 2.000000e+00
  %15 = fdiv double %14, 2.000000e+03
  %16 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  store double %15, double* %16, align 8
  %17 = fadd double %13, 3.000000e+00
  %18 = fdiv double %17, 2.000000e+03
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge3, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %._crit_edge3
  br label %._crit_edge

._crit_edge.loopexit10:                           ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit10, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double* nocapture, double* nocapture) unnamed_addr #2 {
.preheader3.preheader.us.preheader:
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep32 = getelementptr double, double* %0, i64 1999
  %scevgep34 = getelementptr double, double* %1, i64 2000
  %scevgep48 = getelementptr double, double* %1, i64 1
  %scevgep50 = getelementptr double, double* %1, i64 1999
  %scevgep52 = getelementptr double, double* %0, i64 2000
  %bound054 = icmp ult double* %scevgep48, %scevgep52
  %bound155 = icmp ugt double* %scevgep50, %0
  %memcheck.conflict57 = and i1 %bound054, %bound155
  %bound0 = icmp ult double* %scevgep, %scevgep34
  %bound1 = icmp ugt double* %scevgep32, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck58

vector.memcheck58:                                ; preds = %.preheader._crit_edge.us, %.preheader3.preheader.us.preheader
  %storemerge9.us = phi i32 [ 0, %.preheader3.preheader.us.preheader ], [ %22, %.preheader._crit_edge.us ]
  br i1 %memcheck.conflict57, label %.preheader3.us.preheader, label %vector.body43.preheader

vector.body43.preheader:                          ; preds = %vector.memcheck58
  br label %vector.body43

.preheader3.us.preheader.loopexit:                ; preds = %vector.body43
  br label %.preheader3.us.preheader

.preheader3.us.preheader:                         ; preds = %.preheader3.us.preheader.loopexit, %vector.memcheck58
  %indvars.iv6.us.ph = phi i64 [ 1, %vector.memcheck58 ], [ 1997, %.preheader3.us.preheader.loopexit ]
  br label %.preheader3.us

vector.body43:                                    ; preds = %vector.body43.preheader, %vector.body43
  %index60 = phi i64 [ %index.next61, %vector.body43 ], [ 0, %vector.body43.preheader ]
  %2 = shl i64 %index60, 1
  %offset.idx64 = or i64 %2, 1
  %3 = add nsw i64 %offset.idx64, -1
  %4 = getelementptr inbounds double, double* %0, i64 %3
  %5 = bitcast double* %4 to <4 x double>*
  %wide.vec68 = load <4 x double>, <4 x double>* %5, align 8, !alias.scope !10
  %strided.vec69 = shufflevector <4 x double> %wide.vec68, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec70 = shufflevector <4 x double> %wide.vec68, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %6 = fadd <2 x double> %strided.vec69, %strided.vec70
  %7 = add nuw nsw i64 %offset.idx64, 1
  %8 = getelementptr inbounds double, double* %0, i64 %7
  %9 = getelementptr double, double* %8, i64 -1
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec71 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !10
  %strided.vec73 = shufflevector <4 x double> %wide.vec71, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = fadd <2 x double> %6, %strided.vec73
  %12 = fmul <2 x double> %11, <double 3.333300e-01, double 3.333300e-01>
  %13 = bitcast double* %8 to <4 x double>*
  %wide.vec74 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !10
  %strided.vec76 = shufflevector <4 x double> %wide.vec74, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = fadd <4 x double> %wide.vec71, %wide.vec74
  %15 = shufflevector <4 x double> %14, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %16 = fadd <2 x double> %15, %strided.vec76
  %17 = fmul <2 x double> %16, <double 3.333300e-01, double 3.333300e-01>
  %18 = getelementptr inbounds double, double* %1, i64 %7
  %19 = getelementptr double, double* %18, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec77 = shufflevector <2 x double> %12, <2 x double> %17, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec77, <4 x double>* %20, align 8, !alias.scope !13, !noalias !10
  %index.next61 = add i64 %index60, 2
  %21 = icmp eq i64 %index.next61, 998
  br i1 %21, label %.preheader3.us.preheader.loopexit, label %vector.body43, !llvm.loop !15

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %22 = add nuw nsw i32 %storemerge9.us, 1
  %exitcond25 = icmp eq i32 %22, 500
  br i1 %exitcond25, label %._crit_edge, label %vector.memcheck58

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv47.us = phi i64 [ %indvars.iv.next5.us.1, %.preheader.us ], [ %indvars.iv47.us.ph, %.preheader.us.preheader ]
  %23 = add nsw i64 %indvars.iv47.us, -1
  %24 = getelementptr inbounds double, double* %1, i64 %23
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv47.us
  %27 = load double, double* %26, align 8
  %28 = fadd double %25, %27
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv47.us, 1
  %29 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next5.us
  %30 = load double, double* %29, align 8
  %31 = fadd double %28, %30
  %32 = fmul double %31, 3.333300e-01
  %33 = getelementptr inbounds double, double* %0, i64 %indvars.iv47.us
  store double %32, double* %33, align 8
  %34 = getelementptr inbounds double, double* %1, i64 %indvars.iv47.us
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next5.us
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %indvars.iv.next5.us.1 = add nsw i64 %indvars.iv47.us, 2
  %39 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next5.us.1
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  %42 = fmul double %41, 3.333300e-01
  %43 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next5.us
  store double %42, double* %43, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next5.us.1, 1999
  br i1 %exitcond24.1, label %.preheader._crit_edge.us, label %.preheader.us, !llvm.loop !16

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %.preheader3.us
  %indvars.iv6.us = phi i64 [ %indvars.iv.next.us.1, %.preheader3.us ], [ %indvars.iv6.us.ph, %.preheader3.us.preheader ]
  %44 = add nsw i64 %indvars.iv6.us, -1
  %45 = getelementptr inbounds double, double* %0, i64 %44
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds double, double* %0, i64 %indvars.iv6.us
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %50 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.us
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = fmul double %52, 3.333300e-01
  %54 = getelementptr inbounds double, double* %1, i64 %indvars.iv6.us
  store double %53, double* %54, align 8
  %55 = getelementptr inbounds double, double* %0, i64 %indvars.iv6.us
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.us
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv6.us, 2
  %60 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.us.1
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %63 = fmul double %62, 3.333300e-01
  %64 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.us
  store double %63, double* %64, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %.preheader3.us, !llvm.loop !17

vector.memcheck:                                  ; preds = %.preheader3.us
  br i1 %memcheck.conflict, label %.preheader.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.preheader.us.preheader.loopexit:                 ; preds = %vector.body
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %vector.memcheck
  %indvars.iv47.us.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.preheader.us.preheader.loopexit ]
  br label %.preheader.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %65 = shl i64 %index, 1
  %offset.idx = or i64 %65, 1
  %66 = add nsw i64 %offset.idx, -1
  %67 = getelementptr inbounds double, double* %1, i64 %66
  %68 = bitcast double* %67 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %68, align 8, !alias.scope !18
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec36 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %69 = fadd <2 x double> %strided.vec, %strided.vec36
  %70 = add nuw nsw i64 %offset.idx, 1
  %71 = getelementptr inbounds double, double* %1, i64 %70
  %72 = getelementptr double, double* %71, i64 -1
  %73 = bitcast double* %72 to <4 x double>*
  %wide.vec37 = load <4 x double>, <4 x double>* %73, align 8, !alias.scope !18
  %strided.vec39 = shufflevector <4 x double> %wide.vec37, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %74 = fadd <2 x double> %69, %strided.vec39
  %75 = fmul <2 x double> %74, <double 3.333300e-01, double 3.333300e-01>
  %76 = bitcast double* %71 to <4 x double>*
  %wide.vec40 = load <4 x double>, <4 x double>* %76, align 8, !alias.scope !18
  %strided.vec42 = shufflevector <4 x double> %wide.vec40, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %77 = fadd <4 x double> %wide.vec37, %wide.vec40
  %78 = shufflevector <4 x double> %77, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %79 = fadd <2 x double> %78, %strided.vec42
  %80 = fmul <2 x double> %79, <double 3.333300e-01, double 3.333300e-01>
  %81 = getelementptr inbounds double, double* %0, i64 %70
  %82 = getelementptr double, double* %81, i64 -1
  %83 = bitcast double* %82 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %75, <2 x double> %80, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %83, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 2
  %84 = icmp eq i64 %index.next, 998
  br i1 %84, label %.preheader.us.preheader.loopexit, label %vector.body, !llvm.loop !23

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %5 = trunc i64 %indvars.iv1 to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
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
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
