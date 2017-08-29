; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
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
  tail call fastcc void @print_array(i32 2000, double* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
.lr.ph:
  %scevgep = getelementptr double, double* %1, i64 2000
  %scevgep12 = getelementptr double, double* %2, i64 2000
  %bound0 = icmp ugt double* %scevgep12, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.ind14 = phi <2 x i32> [ %vec.ind.next15, %vector.body ], [ <i32 0, i32 1>, %vector.body.preheader ]
  %3 = sitofp <2 x i32> %vec.ind14 to <2 x double>
  %4 = fadd <2 x double> %3, <double 2.000000e+00, double 2.000000e+00>
  %5 = fdiv <2 x double> %4, <double 2.000000e+03, double 2.000000e+03>
  %6 = getelementptr inbounds double, double* %1, i64 %index
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> %5, <2 x double>* %7, align 8, !alias.scope !1, !noalias !4
  %8 = fadd <2 x double> %3, <double 3.000000e+00, double 3.000000e+00>
  %9 = fdiv <2 x double> %8, <double 2.000000e+03, double 2.000000e+03>
  %10 = getelementptr inbounds double, double* %2, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next15 = add <2 x i32> %vec.ind14, <i32 2, i32 2>
  %12 = icmp eq i64 %index.next, 2000
  br i1 %12, label %._crit_edge.loopexit16, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sitofp i32 %13 to double
  %15 = fadd double %14, 2.000000e+00
  %16 = fdiv double %15, 2.000000e+03
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %16, double* %17, align 8
  %18 = fadd double %14, 3.000000e+00
  %19 = fdiv double %18, 2.000000e+03
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %19, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge.loopexit16:                           ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit16, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
.preheader25.us.preheader:
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep39 = getelementptr double, double* %2, i64 1999
  %scevgep41 = getelementptr double, double* %3, i64 2000
  %scevgep55 = getelementptr double, double* %3, i64 1
  %scevgep57 = getelementptr double, double* %3, i64 1999
  %scevgep59 = getelementptr double, double* %2, i64 2000
  %bound061 = icmp ult double* %scevgep55, %scevgep59
  %bound162 = icmp ugt double* %scevgep57, %2
  %memcheck.conflict64 = and i1 %bound061, %bound162
  %bound0 = icmp ult double* %scevgep, %scevgep41
  %bound1 = icmp ugt double* %scevgep39, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %._crit_edge.us, %.preheader25.us.preheader
  %.02429.us = phi i32 [ %24, %._crit_edge.us ], [ 0, %.preheader25.us.preheader ]
  br i1 %memcheck.conflict64, label %scalar.ph52.preheader, label %vector.body50.preheader

vector.body50.preheader:                          ; preds = %.preheader25.us
  br label %vector.body50

scalar.ph52.preheader.loopexit:                   ; preds = %vector.body50
  br label %scalar.ph52.preheader

scalar.ph52.preheader:                            ; preds = %scalar.ph52.preheader.loopexit, %.preheader25.us
  %indvars.iv.ph = phi i64 [ 1, %.preheader25.us ], [ 1997, %scalar.ph52.preheader.loopexit ]
  br label %scalar.ph52

vector.body50:                                    ; preds = %vector.body50.preheader, %vector.body50
  %index67 = phi i64 [ %index.next68, %vector.body50 ], [ 0, %vector.body50.preheader ]
  %4 = shl i64 %index67, 1
  %offset.idx71 = or i64 %4, 1
  %5 = add nsw i64 %offset.idx71, -1
  %6 = getelementptr inbounds double, double* %2, i64 %5
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec75 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !10
  %strided.vec76 = shufflevector <4 x double> %wide.vec75, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec77 = shufflevector <4 x double> %wide.vec75, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %8 = fadd <2 x double> %strided.vec76, %strided.vec77
  %9 = add nuw nsw i64 %offset.idx71, 1
  %10 = getelementptr inbounds double, double* %2, i64 %9
  %11 = getelementptr double, double* %10, i64 -1
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec78 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !10
  %strided.vec80 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %13 = fadd <2 x double> %8, %strided.vec80
  %14 = fmul <2 x double> %13, <double 3.333300e-01, double 3.333300e-01>
  %15 = bitcast double* %10 to <4 x double>*
  %wide.vec81 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !10
  %strided.vec83 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %16 = fadd <4 x double> %wide.vec78, %wide.vec81
  %17 = shufflevector <4 x double> %16, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %18 = fadd <2 x double> %17, %strided.vec83
  %19 = fmul <2 x double> %18, <double 3.333300e-01, double 3.333300e-01>
  %20 = getelementptr inbounds double, double* %3, i64 %9
  %21 = getelementptr double, double* %20, i64 -1
  %22 = bitcast double* %21 to <4 x double>*
  %interleaved.vec84 = shufflevector <2 x double> %14, <2 x double> %19, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec84, <4 x double>* %22, align 8, !alias.scope !13, !noalias !10
  %index.next68 = add i64 %index67, 2
  %23 = icmp eq i64 %index.next68, 998
  br i1 %23, label %scalar.ph52.preheader.loopexit, label %vector.body50, !llvm.loop !15

._crit_edge.us:                                   ; preds = %.lr.ph28.us
  %24 = add nuw nsw i32 %.02429.us, 1
  %exitcond36 = icmp eq i32 %24, 500
  br i1 %exitcond36, label %._crit_edge30, label %.preheader25.us

.lr.ph28.us:                                      ; preds = %.lr.ph28.us.preheader, %.lr.ph28.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %.lr.ph28.us ], [ %indvars.iv32.ph, %.lr.ph28.us.preheader ]
  %25 = add nsw i64 %indvars.iv32, -1
  %26 = getelementptr inbounds double, double* %3, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %3, i64 %indvars.iv32
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %31 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next33
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  %34 = fmul double %33, 3.333300e-01
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv32
  store double %34, double* %35, align 8
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv32
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next33
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next33.1
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = fmul double %43, 3.333300e-01
  %45 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next33
  store double %44, double* %45, align 8
  %exitcond35.1 = icmp eq i64 %indvars.iv.next33.1, 1999
  br i1 %exitcond35.1, label %._crit_edge.us, label %.lr.ph28.us, !llvm.loop !16

scalar.ph52:                                      ; preds = %scalar.ph52.preheader, %scalar.ph52
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %scalar.ph52 ], [ %indvars.iv.ph, %scalar.ph52.preheader ]
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds double, double* %2, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = fmul double %54, 3.333300e-01
  %56 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %55, double* %56, align 8
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %62 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 3.333300e-01
  %66 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %65, double* %66, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %scalar.ph52, !llvm.loop !17

vector.memcheck:                                  ; preds = %scalar.ph52
  br i1 %memcheck.conflict, label %.lr.ph28.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.lr.ph28.us.preheader.loopexit:                   ; preds = %vector.body
  br label %.lr.ph28.us.preheader

.lr.ph28.us.preheader:                            ; preds = %.lr.ph28.us.preheader.loopexit, %vector.memcheck
  %indvars.iv32.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.lr.ph28.us.preheader.loopexit ]
  br label %.lr.ph28.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %67 = shl i64 %index, 1
  %offset.idx = or i64 %67, 1
  %68 = add nsw i64 %offset.idx, -1
  %69 = getelementptr inbounds double, double* %3, i64 %68
  %70 = bitcast double* %69 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %70, align 8, !alias.scope !18
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec43 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %71 = fadd <2 x double> %strided.vec, %strided.vec43
  %72 = add nuw nsw i64 %offset.idx, 1
  %73 = getelementptr inbounds double, double* %3, i64 %72
  %74 = getelementptr double, double* %73, i64 -1
  %75 = bitcast double* %74 to <4 x double>*
  %wide.vec44 = load <4 x double>, <4 x double>* %75, align 8, !alias.scope !18
  %strided.vec46 = shufflevector <4 x double> %wide.vec44, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %76 = fadd <2 x double> %71, %strided.vec46
  %77 = fmul <2 x double> %76, <double 3.333300e-01, double 3.333300e-01>
  %78 = bitcast double* %73 to <4 x double>*
  %wide.vec47 = load <4 x double>, <4 x double>* %78, align 8, !alias.scope !18
  %strided.vec49 = shufflevector <4 x double> %wide.vec47, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %79 = fadd <4 x double> %wide.vec44, %wide.vec47
  %80 = shufflevector <4 x double> %79, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %81 = fadd <2 x double> %80, %strided.vec49
  %82 = fmul <2 x double> %81, <double 3.333300e-01, double 3.333300e-01>
  %83 = getelementptr inbounds double, double* %2, i64 %72
  %84 = getelementptr double, double* %83, i64 -1
  %85 = bitcast double* %84 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %77, <2 x double> %82, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %85, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 2
  %86 = icmp eq i64 %index.next, 998
  br i1 %86, label %.lr.ph28.us.preheader.loopexit, label %vector.body, !llvm.loop !23

._crit_edge30:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %11, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %11 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %11

; <label>:11:                                     ; preds = %.lr.ph, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
