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
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(double* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %3

; <label>:3:                                      ; preds = %3, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv1 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %9 = fadd <2 x double> %8, <double 2.000000e+00, double 3.000000e+00>
  %10 = fdiv <2 x double> %9, <double 2.000000e+03, double 2.000000e+03>
  %11 = bitcast double* %6 to <2 x double>*
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %13 = bitcast double* %12 to <2 x double>*
  %indvars.iv.next = or i64 %indvars.iv1, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fadd <2 x double> %17, <double 2.000000e+00, double 3.000000e+00>
  %19 = fdiv <2 x double> %18, <double 2.000000e+03, double 2.000000e+03>
  %20 = shufflevector <2 x double> %10, <2 x double> %19, <2 x i32> <i32 0, i32 2>
  store <2 x double> %20, <2 x double>* %11, align 8
  %21 = shufflevector <2 x double> %10, <2 x double> %19, <2 x i32> <i32 1, i32 3>
  store <2 x double> %21, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %22, label %3

; <label>:22:                                     ; preds = %3
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
  %.019 = phi i32 [ 0, %2 ], [ %85, %.loopexit ]
  br i1 %memcheck.conflict27, label %.preheader2.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %vector.memcheck28
  br label %vector.body13

vector.body13:                                    ; preds = %vector.body13.preheader, %vector.body13
  %index30 = phi i64 [ %index.next31, %vector.body13 ], [ 0, %vector.body13.preheader ]
  %3 = shl i64 %index30, 1
  %offset.idx34 = or i64 %3, 1
  %4 = add nsw i64 %offset.idx34, -1
  %5 = getelementptr inbounds double, double* %0, i64 %4
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec38 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !1
  %strided.vec39 = shufflevector <4 x double> %wide.vec38, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec40 = shufflevector <4 x double> %wide.vec38, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %7 = fadd <2 x double> %strided.vec39, %strided.vec40
  %8 = add nuw nsw i64 %offset.idx34, 1
  %9 = getelementptr inbounds double, double* %0, i64 %8
  %10 = getelementptr double, double* %9, i64 -1
  %11 = bitcast double* %10 to <4 x double>*
  %wide.vec41 = load <4 x double>, <4 x double>* %11, align 8, !alias.scope !1
  %strided.vec43 = shufflevector <4 x double> %wide.vec41, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %12 = fadd <2 x double> %7, %strided.vec43
  %13 = fmul <2 x double> %12, <double 3.333300e-01, double 3.333300e-01>
  %14 = bitcast double* %9 to <4 x double>*
  %wide.vec44 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !1
  %strided.vec46 = shufflevector <4 x double> %wide.vec44, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = fadd <4 x double> %wide.vec41, %wide.vec44
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %17 = fadd <2 x double> %16, %strided.vec46
  %18 = fmul <2 x double> %17, <double 3.333300e-01, double 3.333300e-01>
  %19 = getelementptr inbounds double, double* %1, i64 %8
  %20 = getelementptr double, double* %19, i64 -1
  %21 = bitcast double* %20 to <4 x double>*
  %interleaved.vec47 = shufflevector <2 x double> %13, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec47, <4 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next31 = add i64 %index30, 2
  %22 = icmp eq i64 %index.next31, 998
  br i1 %22, label %.preheader2.preheader.loopexit, label %vector.body13, !llvm.loop !6

.preheader2.preheader.loopexit:                   ; preds = %vector.body13
  br label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader2.preheader.loopexit, %vector.memcheck28
  %indvars.iv7.ph = phi i64 [ 1, %vector.memcheck28 ], [ 1997, %.preheader2.preheader.loopexit ]
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %.preheader2
  %indvars.iv7 = phi i64 [ %indvars.iv.next.1, %.preheader2 ], [ %indvars.iv7.ph, %.preheader2.preheader ]
  %23 = add nsw i64 %indvars.iv7, -1
  %24 = getelementptr inbounds double, double* %0, i64 %23
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %0, i64 %indvars.iv7
  %27 = load double, double* %26, align 8
  %28 = fadd double %25, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %29 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fadd double %28, %30
  %32 = fmul double %31, 3.333300e-01
  %33 = getelementptr inbounds double, double* %1, i64 %indvars.iv7
  store double %32, double* %33, align 8
  %34 = getelementptr inbounds double, double* %0, i64 %indvars.iv7
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %indvars.iv.next.1 = add nsw i64 %indvars.iv7, 2
  %39 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  %42 = fmul double %41, 3.333300e-01
  %43 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %.preheader2, !llvm.loop !9

vector.memcheck:                                  ; preds = %.preheader2
  br i1 %memcheck.conflict, label %.preheader.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %44 = shl i64 %index, 1
  %offset.idx = or i64 %44, 1
  %45 = add nsw i64 %offset.idx, -1
  %46 = getelementptr inbounds double, double* %1, i64 %45
  %47 = bitcast double* %46 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %47, align 8, !alias.scope !10
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec6 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %48 = fadd <2 x double> %strided.vec, %strided.vec6
  %49 = add nuw nsw i64 %offset.idx, 1
  %50 = getelementptr inbounds double, double* %1, i64 %49
  %51 = getelementptr double, double* %50, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec7 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !10
  %strided.vec9 = shufflevector <4 x double> %wide.vec7, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fadd <2 x double> %48, %strided.vec9
  %54 = fmul <2 x double> %53, <double 3.333300e-01, double 3.333300e-01>
  %55 = bitcast double* %50 to <4 x double>*
  %wide.vec10 = load <4 x double>, <4 x double>* %55, align 8, !alias.scope !10
  %strided.vec12 = shufflevector <4 x double> %wide.vec10, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %56 = fadd <4 x double> %wide.vec7, %wide.vec10
  %57 = shufflevector <4 x double> %56, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %58 = fadd <2 x double> %57, %strided.vec12
  %59 = fmul <2 x double> %58, <double 3.333300e-01, double 3.333300e-01>
  %60 = getelementptr inbounds double, double* %0, i64 %49
  %61 = getelementptr double, double* %60, i64 -1
  %62 = bitcast double* %61 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %54, <2 x double> %59, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %62, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %63 = icmp eq i64 %index.next, 998
  br i1 %63, label %.preheader.preheader.loopexit, label %vector.body, !llvm.loop !15

.preheader.preheader.loopexit:                    ; preds = %vector.body
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %vector.memcheck
  %indvars.iv38.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.preheader.preheader.loopexit ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next4.1, %.preheader ], [ %indvars.iv38.ph, %.preheader.preheader ]
  %64 = add nsw i64 %indvars.iv38, -1
  %65 = getelementptr inbounds double, double* %1, i64 %64
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv38, 1
  %70 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  %73 = fmul double %72, 3.333300e-01
  %74 = getelementptr inbounds double, double* %0, i64 %indvars.iv38
  store double %73, double* %74, align 8
  %75 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4
  %78 = load double, double* %77, align 8
  %79 = fadd double %76, %78
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv38, 2
  %80 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4.1
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  %83 = fmul double %82, 3.333300e-01
  %84 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next4
  store double %83, double* %84, align 8
  %exitcond5.1 = icmp eq i64 %indvars.iv.next4.1, 1999
  br i1 %exitcond5.1, label %.loopexit, label %.preheader, !llvm.loop !16

.loopexit:                                        ; preds = %.preheader
  %85 = add nuw nsw i32 %.019, 1
  %exitcond6 = icmp eq i32 %85, 500
  br i1 %exitcond6, label %86, label %vector.memcheck28

; <label>:86:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %6

; <label>:6:                                      ; preds = %1, %12
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv1 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %6, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
