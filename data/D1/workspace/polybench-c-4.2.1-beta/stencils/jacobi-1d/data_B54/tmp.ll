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
  tail call fastcc void @print_array(double* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph:
  br label %2

; <label>:2:                                      ; preds = %2, %.lr.ph
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next3, %2 ]
  %3 = trunc i64 %indvars.iv2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %0, i64 %indvars.iv2
  %6 = insertelement <2 x double> undef, double %4, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 3.000000e+00>
  %9 = fdiv <2 x double> %8, <double 2.000000e+03, double 2.000000e+03>
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  store double %10, double* %5, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv2
  store double %11, double* %12, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %13, label %2

; <label>:13:                                     ; preds = %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double*, double*) unnamed_addr #2 {
._crit_edge.us.preheader:
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep40 = getelementptr double, double* %0, i64 1999
  %scevgep42 = getelementptr double, double* %1, i64 2000
  %scevgep55 = getelementptr double, double* %1, i64 1
  %scevgep57 = getelementptr double, double* %1, i64 1999
  %scevgep59 = getelementptr double, double* %0, i64 2000
  %bound061 = icmp ult double* %scevgep55, %scevgep59
  %bound162 = icmp ugt double* %scevgep57, %0
  %memcheck.conflict64 = and i1 %bound061, %bound162
  %bound0 = icmp ult double* %scevgep, %scevgep42
  %bound1 = icmp ugt double* %scevgep40, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck65

vector.memcheck65:                                ; preds = %._crit_edge7.us, %._crit_edge.us.preheader
  %2 = phi i32 [ %27, %._crit_edge7.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 %memcheck.conflict64, label %scalar.ph52.preheader, label %vector.body50.preheader

vector.body50.preheader:                          ; preds = %vector.memcheck65
  br label %vector.body50

scalar.ph52.preheader.loopexit:                   ; preds = %vector.body50
  br label %scalar.ph52.preheader

scalar.ph52.preheader:                            ; preds = %scalar.ph52.preheader.loopexit, %vector.memcheck65
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck65 ], [ 1997, %scalar.ph52.preheader.loopexit ]
  br label %scalar.ph52

vector.body50:                                    ; preds = %vector.body50.preheader, %vector.body50
  %index67 = phi i64 [ %index.next68, %vector.body50 ], [ 0, %vector.body50.preheader ]
  %offset.idx71 = or i64 %index67, 1
  %3 = add nsw i64 %offset.idx71, -1
  %4 = getelementptr inbounds double, double* %0, i64 %3
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds double, double* %0, i64 %offset.idx71
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load76, %wide.load78
  %13 = fadd <2 x double> %wide.load77, %wide.load79
  %14 = add nuw nsw i64 %offset.idx71, 1
  %15 = getelementptr inbounds double, double* %0, i64 %14
  %16 = getelementptr double, double* %15, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %12, %wide.load77
  %19 = fadd <2 x double> %13, %wide.load81
  %20 = fmul <2 x double> %18, <double 3.333300e-01, double 3.333300e-01>
  %21 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %22 = getelementptr inbounds double, double* %1, i64 %offset.idx71
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> %20, <2 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %21, <2 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %index.next68 = add nuw nsw i64 %index67, 4
  %26 = icmp eq i64 %index.next68, 1996
  br i1 %26, label %scalar.ph52.preheader.loopexit, label %vector.body50, !llvm.loop !6

._crit_edge7.us:                                  ; preds = %.lr.ph6.us
  %27 = add nuw nsw i32 %2, 1
  %exitcond = icmp eq i32 %27, 500
  br i1 %exitcond, label %76, label %vector.memcheck65

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader ]
  %28 = add nsw i64 %indvars.iv29, -1
  %29 = getelementptr inbounds double, double* %1, i64 %28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %34 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next30
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  %37 = fmul double %36, 3.333300e-01
  %38 = getelementptr inbounds double, double* %0, i64 %indvars.iv29
  store double %37, double* %38, align 8
  %39 = icmp slt i64 %indvars.iv.next30, 1999
  br i1 %39, label %.lr.ph6.us, label %._crit_edge7.us, !llvm.loop !9

scalar.ph52:                                      ; preds = %scalar.ph52.preheader, %scalar.ph52
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph52 ], [ %indvars.iv.ph, %scalar.ph52.preheader ]
  %40 = add nsw i64 %indvars.iv, -1
  %41 = getelementptr inbounds double, double* %0, i64 %40
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = fmul double %48, 3.333300e-01
  %50 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %49, double* %50, align 8
  %51 = icmp slt i64 %indvars.iv.next, 1999
  br i1 %51, label %scalar.ph52, label %vector.memcheck, !llvm.loop !10

vector.memcheck:                                  ; preds = %scalar.ph52
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
  %52 = add nsw i64 %offset.idx, -1
  %53 = getelementptr inbounds double, double* %1, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !11
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !11
  %57 = getelementptr inbounds double, double* %1, i64 %offset.idx
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !11
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !11
  %61 = fadd <2 x double> %wide.load, %wide.load46
  %62 = fadd <2 x double> %wide.load45, %wide.load47
  %63 = add nuw nsw i64 %offset.idx, 1
  %64 = getelementptr inbounds double, double* %1, i64 %63
  %65 = getelementptr double, double* %64, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !11
  %67 = fadd <2 x double> %61, %wide.load45
  %68 = fadd <2 x double> %62, %wide.load49
  %69 = fmul <2 x double> %67, <double 3.333300e-01, double 3.333300e-01>
  %70 = fmul <2 x double> %68, <double 3.333300e-01, double 3.333300e-01>
  %71 = getelementptr inbounds double, double* %0, i64 %offset.idx
  %72 = bitcast double* %71 to <2 x double>*
  store <2 x double> %69, <2 x double>* %72, align 8, !alias.scope !14, !noalias !11
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  store <2 x double> %70, <2 x double>* %74, align 8, !alias.scope !14, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %75 = icmp eq i64 %index.next, 1996
  br i1 %75, label %.lr.ph6.us.preheader.loopexit, label %vector.body, !llvm.loop !16

; <label>:76:                                     ; preds = %._crit_edge7.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %14, %._crit_edge ]
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %5

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
