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

; <label>:2:                                      ; preds = %2, %.lr.ph
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next3, %2 ]
  %3 = trunc i64 %indvars.iv2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %0, i64 %indvars.iv2
  %6 = trunc i64 %indvars.iv2 to i32
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %4, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fadd <2 x double> %9, <double 2.000000e+00, double 3.000000e+00>
  %11 = fdiv <2 x double> %10, <double 2.000000e+03, double 2.000000e+03>
  %12 = extractelement <2 x double> %11, i32 0
  %13 = extractelement <2 x double> %11, i32 1
  store double %12, double* %5, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv2
  store double %13, double* %14, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %.loopexit, label %2

.loopexit:                                        ; preds = %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double*, double*) unnamed_addr #2 {
._crit_edge.lr.ph:
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep42 = getelementptr double, double* %0, i64 1999
  %scevgep44 = getelementptr double, double* %1, i64 2000
  %scevgep62 = getelementptr double, double* %1, i64 1
  %scevgep65 = getelementptr double, double* %1, i64 1999
  %scevgep67 = getelementptr double, double* %0, i64 2000
  %bound069 = icmp ult double* %scevgep62, %scevgep67
  %bound170 = icmp ugt double* %scevgep65, %0
  %memcheck.conflict72 = and i1 %bound069, %bound170
  %bound0 = icmp ult double* %scevgep, %scevgep44
  %bound1 = icmp ugt double* %scevgep42, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge7.us, %._crit_edge.lr.ph
  %2 = phi i32 [ %28, %._crit_edge7.us ], [ 0, %._crit_edge.lr.ph ]
  br i1 %memcheck.conflict72, label %scalar.ph54.preheader, label %vector.body52.preheader

vector.body52.preheader:                          ; preds = %._crit_edge.us
  br label %vector.body52

scalar.ph54.preheader.loopexit:                   ; preds = %vector.body52
  br label %scalar.ph54.preheader

scalar.ph54.preheader:                            ; preds = %scalar.ph54.preheader.loopexit, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %._crit_edge.us ], [ 1997, %scalar.ph54.preheader.loopexit ]
  br label %scalar.ph54

vector.body52:                                    ; preds = %vector.body52.preheader, %vector.body52
  %index75 = phi i64 [ %index.next76, %vector.body52 ], [ 0, %vector.body52.preheader ]
  %offset.idx80 = or i64 %index75, 1
  %3 = add nsw i64 %offset.idx80, -1
  %4 = getelementptr inbounds double, double* %0, i64 %3
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds double, double* %0, i64 %offset.idx80
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load85, %wide.load87
  %13 = fadd <2 x double> %wide.load86, %wide.load88
  %14 = add nuw nsw i64 %offset.idx80, 1
  %15 = getelementptr inbounds double, double* %0, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %12, %wide.load89
  %20 = fadd <2 x double> %13, %wide.load90
  %21 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = getelementptr inbounds double, double* %1, i64 %offset.idx80
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> %21, <2 x double>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %22, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next76 = add nuw nsw i64 %index75, 4
  %27 = icmp eq i64 %index.next76, 1996
  br i1 %27, label %scalar.ph54.preheader.loopexit, label %vector.body52, !llvm.loop !6

._crit_edge7.us:                                  ; preds = %.lr.ph6.us
  %28 = add nuw nsw i32 %2, 1
  %exitcond = icmp eq i32 %28, 500
  br i1 %exitcond, label %.loopexit, label %._crit_edge.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %35, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader ]
  %29 = add nsw i64 %indvars.iv29, -1
  %30 = getelementptr inbounds double, double* %1, i64 %29
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  %33 = load double, double* %32, align 8
  %34 = fadd double %31, %33
  %35 = add nuw nsw i64 %indvars.iv29, 1
  %36 = getelementptr inbounds double, double* %1, i64 %35
  %37 = load double, double* %36, align 8
  %38 = fadd double %34, %37
  %39 = fmul double %38, 3.333300e-01
  %40 = getelementptr inbounds double, double* %0, i64 %indvars.iv29
  store double %39, double* %40, align 8
  %41 = icmp slt i64 %35, 1999
  br i1 %41, label %.lr.ph6.us, label %._crit_edge7.us, !llvm.loop !9

scalar.ph54:                                      ; preds = %scalar.ph54.preheader, %scalar.ph54
  %indvars.iv = phi i64 [ %48, %scalar.ph54 ], [ %indvars.iv.ph, %scalar.ph54.preheader ]
  %42 = add nsw i64 %indvars.iv, -1
  %43 = getelementptr inbounds double, double* %0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  %48 = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds double, double* %0, i64 %48
  %50 = load double, double* %49, align 8
  %51 = fadd double %47, %50
  %52 = fmul double %51, 3.333300e-01
  %53 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %52, double* %53, align 8
  %54 = icmp slt i64 %48, 1999
  br i1 %54, label %scalar.ph54, label %vector.memcheck, !llvm.loop !10

vector.memcheck:                                  ; preds = %scalar.ph54
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
  %55 = add nsw i64 %offset.idx, -1
  %56 = getelementptr inbounds double, double* %1, i64 %55
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !11
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !11
  %60 = getelementptr inbounds double, double* %1, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !11
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !11
  %64 = fadd <2 x double> %wide.load, %wide.load48
  %65 = fadd <2 x double> %wide.load47, %wide.load49
  %66 = add nuw nsw i64 %offset.idx, 1
  %67 = getelementptr inbounds double, double* %1, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !11
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !11
  %71 = fadd <2 x double> %64, %wide.load50
  %72 = fadd <2 x double> %65, %wide.load51
  %73 = fmul <2 x double> %71, <double 3.333300e-01, double 3.333300e-01>
  %74 = fmul <2 x double> %72, <double 3.333300e-01, double 3.333300e-01>
  %75 = getelementptr inbounds double, double* %0, i64 %offset.idx
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> %73, <2 x double>* %76, align 8, !alias.scope !14, !noalias !11
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %74, <2 x double>* %78, align 8, !alias.scope !14, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %79 = icmp eq i64 %index.next, 1996
  br i1 %79, label %.lr.ph6.us.preheader.loopexit, label %vector.body, !llvm.loop !16

.loopexit:                                        ; preds = %._crit_edge7.us
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
  br i1 %exitcond, label %.loopexit, label %5

.loopexit:                                        ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
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
