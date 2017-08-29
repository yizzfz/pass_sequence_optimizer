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
  %scevgep2 = getelementptr double, double* %1, i64 2000
  %bound0 = icmp ugt double* %scevgep2, %0
  %bound1 = icmp ugt double* %scevgep, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.ind4 = phi <2 x i32> [ %vec.ind.next5, %vector.body ], [ <i32 0, i32 1>, %vector.body.preheader ]
  %2 = sitofp <2 x i32> %vec.ind4 to <2 x double>
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
  %vec.ind.next5 = add <2 x i32> %vec.ind4, <i32 2, i32 2>
  %11 = icmp eq i64 %index.next, 2000
  br i1 %11, label %middle.block.loopexit6, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %scalar.ph ], [ 0, %scalar.ph.preheader ]
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
  br i1 %exitcond, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !9

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit6:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit6, %middle.block.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double* nocapture, double* nocapture) unnamed_addr #2 {
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep2 = getelementptr double, double* %0, i64 1999
  %scevgep4 = getelementptr double, double* %1, i64 2000
  %scevgep18 = getelementptr double, double* %1, i64 1
  %scevgep20 = getelementptr double, double* %1, i64 1999
  %scevgep22 = getelementptr double, double* %0, i64 2000
  %bound024 = icmp ult double* %scevgep18, %scevgep22
  %bound125 = icmp ugt double* %scevgep20, %0
  %memcheck.conflict27 = and i1 %bound024, %bound125
  %bound0 = icmp ult double* %scevgep, %scevgep4
  %bound1 = icmp ugt double* %scevgep2, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck28

vector.memcheck28:                                ; preds = %2, %.loopexit
  %3 = phi i32 [ 0, %2 ], [ %86, %.loopexit ]
  br i1 %memcheck.conflict27, label %.preheader1.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %vector.memcheck28
  br label %vector.body13

vector.body13:                                    ; preds = %vector.body13.preheader, %vector.body13
  %index30 = phi i64 [ %index.next31, %vector.body13 ], [ 0, %vector.body13.preheader ]
  %4 = shl i64 %index30, 1
  %offset.idx34 = or i64 %4, 1
  %5 = add nsw i64 %offset.idx34, -1
  %6 = getelementptr inbounds double, double* %0, i64 %5
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec38 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !10
  %strided.vec39 = shufflevector <4 x double> %wide.vec38, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec40 = shufflevector <4 x double> %wide.vec38, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %8 = fadd <2 x double> %strided.vec39, %strided.vec40
  %9 = add nuw nsw i64 %offset.idx34, 1
  %10 = getelementptr inbounds double, double* %0, i64 %9
  %11 = getelementptr double, double* %10, i64 -1
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec41 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !10
  %strided.vec43 = shufflevector <4 x double> %wide.vec41, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %13 = fadd <2 x double> %8, %strided.vec43
  %14 = fmul <2 x double> %13, <double 3.333300e-01, double 3.333300e-01>
  %15 = bitcast double* %10 to <4 x double>*
  %wide.vec44 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !10
  %strided.vec46 = shufflevector <4 x double> %wide.vec44, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %16 = fadd <4 x double> %wide.vec41, %wide.vec44
  %17 = shufflevector <4 x double> %16, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %18 = fadd <2 x double> %17, %strided.vec46
  %19 = fmul <2 x double> %18, <double 3.333300e-01, double 3.333300e-01>
  %20 = getelementptr inbounds double, double* %1, i64 %9
  %21 = getelementptr double, double* %20, i64 -1
  %22 = bitcast double* %21 to <4 x double>*
  %interleaved.vec47 = shufflevector <2 x double> %14, <2 x double> %19, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec47, <4 x double>* %22, align 8, !alias.scope !13, !noalias !10
  %index.next31 = add i64 %index30, 2
  %23 = icmp eq i64 %index.next31, 998
  br i1 %23, label %.preheader1.preheader.loopexit, label %vector.body13, !llvm.loop !15

.preheader1.preheader.loopexit:                   ; preds = %vector.body13
  br label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.preheader1.preheader.loopexit, %vector.memcheck28
  %indvars.iv7.ph = phi i64 [ 1, %vector.memcheck28 ], [ 1997, %.preheader1.preheader.loopexit ]
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.preheader, %.preheader1
  %indvars.iv7 = phi i64 [ %indvars.iv.next.1, %.preheader1 ], [ %indvars.iv7.ph, %.preheader1.preheader ]
  %24 = add nsw i64 %indvars.iv7, -1
  %25 = getelementptr inbounds double, double* %0, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %0, i64 %indvars.iv7
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %30 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fadd double %29, %31
  %33 = fmul double %32, 3.333300e-01
  %34 = getelementptr inbounds double, double* %1, i64 %indvars.iv7
  store double %33, double* %34, align 8
  %35 = getelementptr inbounds double, double* %0, i64 %indvars.iv7
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fadd double %36, %38
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv7, 2
  %40 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.1
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = fmul double %42, 3.333300e-01
  %44 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %43, double* %44, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %.preheader1, !llvm.loop !16

vector.memcheck:                                  ; preds = %.preheader1
  br i1 %memcheck.conflict, label %.preheader.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %45 = shl i64 %index, 1
  %offset.idx = or i64 %45, 1
  %46 = add nsw i64 %offset.idx, -1
  %47 = getelementptr inbounds double, double* %1, i64 %46
  %48 = bitcast double* %47 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %48, align 8, !alias.scope !17
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec6 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = fadd <2 x double> %strided.vec, %strided.vec6
  %50 = add nuw nsw i64 %offset.idx, 1
  %51 = getelementptr inbounds double, double* %1, i64 %50
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec7 = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !17
  %strided.vec9 = shufflevector <4 x double> %wide.vec7, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %54 = fadd <2 x double> %49, %strided.vec9
  %55 = fmul <2 x double> %54, <double 3.333300e-01, double 3.333300e-01>
  %56 = bitcast double* %51 to <4 x double>*
  %wide.vec10 = load <4 x double>, <4 x double>* %56, align 8, !alias.scope !17
  %strided.vec12 = shufflevector <4 x double> %wide.vec10, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %57 = fadd <4 x double> %wide.vec7, %wide.vec10
  %58 = shufflevector <4 x double> %57, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %59 = fadd <2 x double> %58, %strided.vec12
  %60 = fmul <2 x double> %59, <double 3.333300e-01, double 3.333300e-01>
  %61 = getelementptr inbounds double, double* %0, i64 %50
  %62 = getelementptr double, double* %61, i64 -1
  %63 = bitcast double* %62 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %55, <2 x double> %60, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %63, align 8, !alias.scope !20, !noalias !17
  %index.next = add i64 %index, 2
  %64 = icmp eq i64 %index.next, 998
  br i1 %64, label %.preheader.preheader.loopexit, label %vector.body, !llvm.loop !22

.preheader.preheader.loopexit:                    ; preds = %vector.body
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %vector.memcheck
  %indvars.iv38.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.preheader.preheader.loopexit ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next4.1, %.preheader ], [ %indvars.iv38.ph, %.preheader.preheader ]
  %65 = add nsw i64 %indvars.iv38, -1
  %66 = getelementptr inbounds double, double* %1, i64 %65
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv38, 1
  %71 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %74 = fmul double %73, 3.333300e-01
  %75 = getelementptr inbounds double, double* %0, i64 %indvars.iv38
  store double %74, double* %75, align 8
  %76 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv38, 2
  %81 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4.1
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  %84 = fmul double %83, 3.333300e-01
  %85 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next4
  store double %84, double* %85, align 8
  %exitcond5.1 = icmp eq i64 %indvars.iv.next4.1, 1999
  br i1 %exitcond5.1, label %.loopexit, label %.preheader, !llvm.loop !23

.loopexit:                                        ; preds = %.preheader
  %86 = add nuw nsw i32 %3, 1
  %exitcond6 = icmp eq i32 %86, 500
  br i1 %exitcond6, label %87, label %vector.memcheck28

; <label>:87:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %6

; <label>:6:                                      ; preds = %1, %._crit_edge
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv1 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %6

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
