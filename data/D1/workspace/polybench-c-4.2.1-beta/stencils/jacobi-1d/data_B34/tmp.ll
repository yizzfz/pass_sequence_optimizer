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
  %.cast = bitcast i8* %3 to double*
  %5 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(double* %.cast, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %3 to double*
  %7 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(double* %6, double* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(double* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %2, %12
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double*, double*) unnamed_addr #2 {
.lr.ph:
  br label %2

; <label>:2:                                      ; preds = %.lr.ph, %2
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %2 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %16, %2 ]
  %3 = sitofp i32 %storemerge1 to double
  %4 = sext i32 %storemerge1 to i64
  %5 = getelementptr inbounds double, double* %0, i64 %4
  %6 = trunc i64 %indvars.iv to i32
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fadd <2 x double> %9, <double 2.000000e+00, double 3.000000e+00>
  %11 = fdiv <2 x double> %10, <double 2.000000e+03, double 2.000000e+03>
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  store double %12, double* %5, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %13, double* %14, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  %16 = trunc i64 %indvars.iv.next to i32
  br i1 %15, label %2, label %17

; <label>:17:                                     ; preds = %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double*, double*) unnamed_addr #2 {
._crit_edge.us.preheader:
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep38 = getelementptr double, double* %0, i64 1999
  %scevgep40 = getelementptr double, double* %1, i64 2000
  %scevgep53 = getelementptr double, double* %1, i64 1
  %scevgep55 = getelementptr double, double* %1, i64 1999
  %scevgep57 = getelementptr double, double* %0, i64 2000
  %bound059 = icmp ult double* %scevgep53, %scevgep57
  %bound160 = icmp ugt double* %scevgep55, %0
  %memcheck.conflict62 = and i1 %bound059, %bound160
  %bound0 = icmp ult double* %scevgep, %scevgep40
  %bound1 = icmp ugt double* %scevgep38, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck63

vector.memcheck63:                                ; preds = %._crit_edge.us.preheader, %._crit_edge7.us
  %2 = phi i32 [ %28, %._crit_edge7.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 %memcheck.conflict62, label %scalar.ph50.preheader, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %vector.memcheck63
  br label %vector.body48

scalar.ph50.preheader.loopexit:                   ; preds = %vector.body48
  br label %scalar.ph50.preheader

scalar.ph50.preheader:                            ; preds = %scalar.ph50.preheader.loopexit, %vector.memcheck63
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck63 ], [ 1997, %scalar.ph50.preheader.loopexit ]
  br label %scalar.ph50

vector.body48:                                    ; preds = %vector.body48.preheader, %vector.body48
  %index65 = phi i64 [ %index.next66, %vector.body48 ], [ 0, %vector.body48.preheader ]
  %offset.idx69 = or i64 %index65, 1
  %3 = add nsw i64 %offset.idx69, -1
  %4 = getelementptr inbounds double, double* %0, i64 %3
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds double, double* %0, i64 %offset.idx69
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load74, %wide.load76
  %13 = fadd <2 x double> %wide.load75, %wide.load77
  %14 = add nuw nsw i64 %offset.idx69, 1
  %15 = getelementptr inbounds double, double* %0, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %12, %wide.load78
  %20 = fadd <2 x double> %13, %wide.load79
  %21 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = getelementptr inbounds double, double* %1, i64 %offset.idx69
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> %21, <2 x double>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %22, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next66 = add i64 %index65, 4
  %27 = icmp eq i64 %index.next66, 1996
  br i1 %27, label %scalar.ph50.preheader.loopexit, label %vector.body48, !llvm.loop !6

._crit_edge7.us:                                  ; preds = %.lr.ph6.us
  %28 = add nsw i32 %2, 1
  %29 = icmp slt i32 %28, 500
  br i1 %29, label %vector.memcheck63, label %81

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %36, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader ]
  %30 = add nsw i64 %indvars.iv29, -1
  %31 = getelementptr inbounds double, double* %1, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %36 = add nuw nsw i64 %indvars.iv29, 1
  %37 = getelementptr inbounds double, double* %1, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fadd double %35, %38
  %40 = fmul double %39, 3.333300e-01
  %41 = getelementptr inbounds double, double* %0, i64 %indvars.iv29
  store double %40, double* %41, align 8
  %42 = icmp slt i64 %36, 1999
  br i1 %42, label %.lr.ph6.us, label %._crit_edge7.us, !llvm.loop !9

scalar.ph50:                                      ; preds = %scalar.ph50.preheader, %scalar.ph50
  %indvars.iv = phi i64 [ %49, %scalar.ph50 ], [ %indvars.iv.ph, %scalar.ph50.preheader ]
  %43 = add nsw i64 %indvars.iv, -1
  %44 = getelementptr inbounds double, double* %0, i64 %43
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds double, double* %0, i64 %49
  %51 = load double, double* %50, align 8
  %52 = fadd double %48, %51
  %53 = fmul double %52, 3.333300e-01
  %54 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %53, double* %54, align 8
  %55 = icmp slt i64 %49, 1999
  br i1 %55, label %scalar.ph50, label %vector.memcheck, !llvm.loop !10

vector.memcheck:                                  ; preds = %scalar.ph50
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.lr.ph6.us.preheader.loopexit:                    ; preds = %vector.body
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %vector.memcheck
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.lr.ph6.us.preheader.loopexit ]
  br label %.lr.ph6.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %56 = add nsw i64 %offset.idx, -1
  %57 = getelementptr inbounds double, double* %1, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !11
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !11
  %61 = getelementptr inbounds double, double* %1, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !11
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !11
  %65 = fadd <2 x double> %wide.load, %wide.load44
  %66 = fadd <2 x double> %wide.load43, %wide.load45
  %67 = add nuw nsw i64 %offset.idx, 1
  %68 = getelementptr inbounds double, double* %1, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !11
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !11
  %72 = fadd <2 x double> %65, %wide.load46
  %73 = fadd <2 x double> %66, %wide.load47
  %74 = fmul <2 x double> %72, <double 3.333300e-01, double 3.333300e-01>
  %75 = fmul <2 x double> %73, <double 3.333300e-01, double 3.333300e-01>
  %76 = getelementptr inbounds double, double* %0, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %74, <2 x double>* %77, align 8, !alias.scope !14, !noalias !11
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %75, <2 x double>* %79, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, 1996
  br i1 %80, label %.lr.ph6.us.preheader.loopexit, label %vector.body, !llvm.loop !16

; <label>:81:                                     ; preds = %._crit_edge7.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %5

; <label>:5:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %15, %._crit_edge ]
  %6 = srem i32 %storemerge1, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %14 = icmp slt i64 %indvars.iv.next, 2000
  %15 = trunc i64 %indvars.iv.next to i32
  br i1 %14, label %5, label %16

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
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
