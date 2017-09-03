; ModuleID = 'B.ll'
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
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
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
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %8, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %4

; <label>:4:                                      ; preds = %4, %3
  %indvars.iv = phi i64 [ 0, %3 ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %8 = insertelement <2 x double> undef, double %6, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = fadd <2 x double> %9, <double 2.000000e+00, double 3.000000e+00>
  %11 = fdiv <2 x double> %10, <double 2.000000e+03, double 2.000000e+03>
  %12 = bitcast double* %7 to <2 x double>*
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %14 = bitcast double* %13 to <2 x double>*
  %15 = trunc i64 %indvars.iv to i32
  %16 = or i32 %15, 1
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = fadd <2 x double> %19, <double 2.000000e+00, double 3.000000e+00>
  %21 = fdiv <2 x double> %20, <double 2.000000e+03, double 2.000000e+03>
  %22 = shufflevector <2 x double> %11, <2 x double> %21, <2 x i32> <i32 0, i32 2>
  store <2 x double> %22, <2 x double>* %12, align 8
  %23 = shufflevector <2 x double> %11, <2 x double> %21, <2 x i32> <i32 1, i32 3>
  store <2 x double> %23, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %24, label %4

; <label>:24:                                     ; preds = %4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep11 = getelementptr double, double* %2, i64 1999
  %scevgep13 = getelementptr double, double* %3, i64 2000
  %scevgep27 = getelementptr double, double* %3, i64 1
  %scevgep29 = getelementptr double, double* %3, i64 1999
  %scevgep31 = getelementptr double, double* %2, i64 2000
  %bound033 = icmp ult double* %scevgep27, %scevgep31
  %bound134 = icmp ugt double* %scevgep29, %2
  %memcheck.conflict36 = and i1 %bound033, %bound134
  %bound0 = icmp ult double* %scevgep, %scevgep13
  %bound1 = icmp ugt double* %scevgep11, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.loopexit, %4
  %.015 = phi i32 [ 0, %4 ], [ %83, %.loopexit ]
  br i1 %memcheck.conflict36, label %._crit_edge.preheader57, label %vector.body22.preheader

vector.body22.preheader:                          ; preds = %._crit_edge.preheader
  br label %vector.body22

vector.body22:                                    ; preds = %vector.body22, %vector.body22.preheader
  %index39 = phi i64 [ %index.next40, %vector.body22 ], [ 0, %vector.body22.preheader ]
  %5 = shl i64 %index39, 1
  %offset.idx43 = or i64 %5, 1
  %6 = add nsw i64 %offset.idx43, -1
  %7 = getelementptr inbounds double, double* %2, i64 %6
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec47 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !1
  %strided.vec48 = shufflevector <4 x double> %wide.vec47, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec49 = shufflevector <4 x double> %wide.vec47, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = fadd <2 x double> %strided.vec48, %strided.vec49
  %10 = add nuw nsw i64 %offset.idx43, 1
  %11 = getelementptr inbounds double, double* %2, i64 %10
  %12 = getelementptr double, double* %11, i64 -1
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec50 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !1
  %strided.vec52 = shufflevector <4 x double> %wide.vec50, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = fadd <2 x double> %9, %strided.vec52
  %15 = fmul <2 x double> %14, <double 3.333300e-01, double 3.333300e-01>
  %16 = bitcast double* %11 to <4 x double>*
  %wide.vec53 = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !1
  %strided.vec55 = shufflevector <4 x double> %wide.vec53, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fadd <4 x double> %wide.vec50, %wide.vec53
  %18 = shufflevector <4 x double> %17, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %19 = fadd <2 x double> %18, %strided.vec55
  %20 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %21 = getelementptr inbounds double, double* %3, i64 %10
  %22 = getelementptr double, double* %21, i64 -1
  %23 = bitcast double* %22 to <4 x double>*
  %interleaved.vec56 = shufflevector <2 x double> %15, <2 x double> %20, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec56, <4 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %24 = icmp eq i64 %index.next40, 998
  br i1 %24, label %._crit_edge.preheader57.loopexit, label %vector.body22, !llvm.loop !6

._crit_edge.preheader57.loopexit:                 ; preds = %vector.body22
  br label %._crit_edge.preheader57

._crit_edge.preheader57:                          ; preds = %._crit_edge.preheader57.loopexit, %._crit_edge.preheader
  %indvars.iv.ph = phi i64 [ 1, %._crit_edge.preheader ], [ 1997, %._crit_edge.preheader57.loopexit ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader57
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader57 ]
  %25 = add nsw i64 %indvars.iv, -1
  %26 = getelementptr inbounds double, double* %2, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  %34 = fmul double %33, 3.333300e-01
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %34, double* %35, align 8
  %36 = load double, double* %28, align 8
  %37 = load double, double* %31, align 8
  %38 = fadd double %36, %37
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  %42 = fmul double %41, 3.333300e-01
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %._crit_edge, !llvm.loop !9

vector.memcheck:                                  ; preds = %._crit_edge
  br i1 %memcheck.conflict, label %._crit_edge2.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %44 = shl i64 %index, 1
  %offset.idx = or i64 %44, 1
  %45 = add nsw i64 %offset.idx, -1
  %46 = getelementptr inbounds double, double* %3, i64 %45
  %47 = bitcast double* %46 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %47, align 8, !alias.scope !10
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec15 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %48 = fadd <2 x double> %strided.vec, %strided.vec15
  %49 = add nuw nsw i64 %offset.idx, 1
  %50 = getelementptr inbounds double, double* %3, i64 %49
  %51 = getelementptr double, double* %50, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec16 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !10
  %strided.vec18 = shufflevector <4 x double> %wide.vec16, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fadd <2 x double> %48, %strided.vec18
  %54 = fmul <2 x double> %53, <double 3.333300e-01, double 3.333300e-01>
  %55 = bitcast double* %50 to <4 x double>*
  %wide.vec19 = load <4 x double>, <4 x double>* %55, align 8, !alias.scope !10
  %strided.vec21 = shufflevector <4 x double> %wide.vec19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %56 = fadd <4 x double> %wide.vec16, %wide.vec19
  %57 = shufflevector <4 x double> %56, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %58 = fadd <2 x double> %57, %strided.vec21
  %59 = fmul <2 x double> %58, <double 3.333300e-01, double 3.333300e-01>
  %60 = getelementptr inbounds double, double* %2, i64 %49
  %61 = getelementptr double, double* %60, i64 -1
  %62 = bitcast double* %61 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %54, <2 x double> %59, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %62, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %63 = icmp eq i64 %index.next, 998
  br i1 %63, label %._crit_edge2.preheader.loopexit, label %vector.body, !llvm.loop !15

._crit_edge2.preheader.loopexit:                  ; preds = %vector.body
  br label %._crit_edge2.preheader

._crit_edge2.preheader:                           ; preds = %._crit_edge2.preheader.loopexit, %vector.memcheck
  %indvars.iv6.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %._crit_edge2.preheader.loopexit ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %._crit_edge2.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7.1, %._crit_edge2 ], [ %indvars.iv6.ph, %._crit_edge2.preheader ]
  %64 = add nsw i64 %indvars.iv6, -1
  %65 = getelementptr inbounds double, double* %3, i64 %64
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %3, i64 %indvars.iv6
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next7
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  %73 = fmul double %72, 3.333300e-01
  %74 = getelementptr inbounds double, double* %2, i64 %indvars.iv6
  store double %73, double* %74, align 8
  %75 = load double, double* %67, align 8
  %76 = load double, double* %70, align 8
  %77 = fadd double %75, %76
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, 2
  %78 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next7.1
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  %81 = fmul double %80, 3.333300e-01
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next7
  store double %81, double* %82, align 8
  %exitcond8.1 = icmp eq i64 %indvars.iv.next7.1, 1999
  br i1 %exitcond8.1, label %.loopexit, label %._crit_edge2, !llvm.loop !16

.loopexit:                                        ; preds = %._crit_edge2
  %83 = add nuw nsw i32 %.015, 1
  %exitcond9 = icmp eq i32 %83, 500
  br i1 %exitcond9, label %84, label %._crit_edge.preheader

; <label>:84:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %7

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
